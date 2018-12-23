#define COL8_000000 0 //调色板下标
#define COL8_FF0000 1
#define COL8_00FF00 2
#define COL8_FFFF00 3
#define COL8_0000FF 4
#define COL8_FF00FF 5
#define COL8_00FFFF 6
#define COL8_FFFFFF 7
#define COL8_C6C6C6 8
#define COL8_840000 9
#define COL8_008400 10
#define COL8_848400 11
#define COL8_000084 12
#define COL8_840084 13
#define COL8_008484 14
#define COL8_848484 15

#define PORT_KEYDAT 0x0060 //键盘端口
#define PIC_OCW2 0x20      //8259A端口

//汇编接口调用
void io_hlt(void);
void io_cli(void);
void io_sti(void);
void io_out(int port, int data);
int io_load_eflags(void);
void io_store_eflags(int eflags);

//函数接口调用
void show_char(void);
void init_palette(void);
void set_palette(int start, int end, unsigned char *rgb);
void boxfill8(unsigned char *vram, int xsize, unsigned char c, int x, int y,
              int x0, int y0);

struct BOOTINFO
{
    char *vgaRam;           //显存地址
    short screenX, screenY; //屏幕位置
};

void initBootInfo(struct BOOTINFO *pBootInfo); //初始化背景函数声明

static char fontA[16] = {0x00, 0x18, 0x18, 0x18, 0x18, 0x24, 0x24, 0x24,
                         0x24, 0x7e, 0x42, 0x42, 0x42, 0xe7, 0x00, 0x00}; //内核字体

extern char systemFont[16]; //外部调用字符

void showFont8(char *vram, int xsize, int x, int y, char c, char *font); //显示背景的函数声明

void showString(char *vram, int xsize, int x, int y, char color, unsigned char *s); //显示字符的函数声明

void putblock(char *vram, int vxsize, int pxsize,
              int pysize, int px0, int py0, char *buf, int bxsize); //显示背景模块的函数声明

void init_mouse_cursor(char *mouse, char bc); //初始化鼠标的函数声明
void intHandlerFromC(char *esp);              //键盘的中断处理函数声明

static char mcursor[256]; //鼠标的图形
static struct BOOTINFO bootInfo;

static char keyval[5] = {'0', 'X', 0, 0, 0}; //键盘中断的键值
struct KEYBUF
{ //键盘缓冲区
    unsigned char key_buf[32];
    int next_r, next_w, len;
};

static struct KEYBUF keybuf;

char charToHexVal(char c);
char *charToHexStr(unsigned char c);

void init_keyboard(void); //键盘初始化函数声明
void enable_mouse(void);  //鼠标的使能函数声明

//***************************主函数开始****************************************************
void CMain(void)
{
    //*初始化背景内存地址
    initBootInfo(&bootInfo);
    char *vram = bootInfo.vgaRam;
    int xsize = bootInfo.screenX, ysize = bootInfo.screenY;

    init_palette();  //初始化调色板
    init_keyboard(); //*初始化键盘

    boxfill8(vram, xsize, COL8_008484, 0, 0, xsize - 1, ysize - 29);
    boxfill8(vram, xsize, COL8_C6C6C6, 0, ysize - 28, xsize - 1, ysize - 28);
    boxfill8(vram, xsize, COL8_FFFFFF, 0, ysize - 27, xsize - 1, ysize - 27);
    boxfill8(vram, xsize, COL8_C6C6C6, 0, ysize - 26, xsize - 1, ysize - 1);

    boxfill8(vram, xsize, COL8_FFFFFF, 3, ysize - 24, 59, ysize - 24);
    boxfill8(vram, xsize, COL8_FFFFFF, 2, ysize - 24, 2, ysize - 4);
    boxfill8(vram, xsize, COL8_848484, 3, ysize - 4, 59, ysize - 4);
    boxfill8(vram, xsize, COL8_848484, 59, ysize - 23, 59, ysize - 5);
    boxfill8(vram, xsize, COL8_000000, 2, ysize - 3, 59, ysize - 3);
    boxfill8(vram, xsize, COL8_000000, 60, ysize - 24, 60, ysize - 3);

    boxfill8(vram, xsize, COL8_848484, xsize - 47, ysize - 24, xsize - 4, ysize - 24);
    boxfill8(vram, xsize, COL8_848484, xsize - 47, ysize - 23, xsize - 47, ysize - 4);
    boxfill8(vram, xsize, COL8_FFFFFF, xsize - 47, ysize - 3, xsize - 4, ysize - 3);
    boxfill8(vram, xsize, COL8_FFFFFF, xsize - 3, ysize - 24, xsize - 3, ysize - 3);

    init_mouse_cursor(mcursor, COL8_008484);            //二维数组绘制鼠标的形状颜色
    putblock(vram, xsize, 16, 16, 80, 80, mcursor, 16); //把形状颜色绘制进显存

    io_sti();       //开中断
    enable_mouse(); //使能鼠标

    int data = 0;
    //*内核键盘的中断机制：键盘发送的扫描码和断码数值缓存起来，然后把控制器交换给原来任务，等到CPU稍微空闲时再处理键盘事件
    for (;;)
    {
        io_cli(); //关中断
        if (keybuf.len == 0)
        {
            io_stihlt(); //睡眠
        }
        else
        {
            data = keybuf.key_buf[keybuf.next_r];
            keybuf.next_r = (keybuf.next_r + 1) % 32;
            io_sti(); //*从缓冲区读到数据的时候就打开中断
            keybuf.len--;

            char *pStr = charToHexStr(data);
            static int showPos = 0;
            showString(vram, xsize, showPos, 0, COL8_FFFFFF, pStr);
            showPos += 32;
        }
    }
}
//**************************主函数结束*************************************

void initBootInfo(struct BOOTINFO *pBootInfo)
{
    pBootInfo->vgaRam = (char *)0xa0000;
    pBootInfo->screenX = 320;
    pBootInfo->screenY = 200;
}

void init_palette(void)
{
    static unsigned char table_rgb[16 * 3] =
        {
            0x00,
            0x00,
            0x00,
            0xff,
            0x00,
            0x00,
            0x00,
            0xff,
            0x00,
            0xff,
            0xff,
            0x00,
            0x00,
            0x00,
            0xff,
            0xff,
            0x00,
            0xff,
            0x00,
            0xff,
            0xff,
            0xff,
            0xff,
            0xff,
            0xc6,
            0xc6,
            0xc6,
            0x84,
            0x00,
            0x00,
            0x00,
            0x84,
            0x00,
            0x84,
            0x84,
            0x00,
            0x00,
            0x00,
            0x84,
            0x84,
            0x00,
            0x84,
            0x00,
            0x84,
            0x84,
            0x84,
            0x84,
            0x84,
        };

    set_palette(0, 15, table_rgb);
    return;
}

void set_palette(int start, int end, unsigned char *rgb)
{
    int i, eflags;
    eflags = io_load_eflags();
    io_cli();
    io_out8(0x03c8, start); //set  palette number
    for (i = start; i <= end; i++)
    {
        io_out8(0x03c9, rgb[0] / 4);
        io_out8(0x03c9, rgb[1] / 4);
        io_out8(0x03c9, rgb[2] / 4);

        rgb += 3;
    }

    io_store_eflags(eflags);
    return;
}

void showString(char *vram, int xsize, int x, int y, char color, unsigned char *s)
{
    for (; *s != 0x00; s++)
    {
        showFont8(vram, xsize, x, y, color, systemFont + *s * 16);
        x += 8;
    }
}

void boxfill8(unsigned char *vram, int xsize, unsigned char c,
              int x0, int y0, int x1, int y1)
{
    int x, y;
    for (y = y0; y <= y1; y++)
        for (x = x0; x <= x1; x++)
        {
            vram[y * xsize + x] = c;
        }
}
void showFont8(char *vram, int xsize, int x, int y, char c, char *font)
{
    int i;
    char d;

    for (i = 0; i < 16; i++)
    {
        d = font[i];
        if ((d & 0x80) != 0)
        {
            vram[(y + i) * xsize + x + 0] = c;
        }
        if ((d & 0x40) != 0)
        {
            vram[(y + i) * xsize + x + 1] = c;
        }
        if ((d & 0x20) != 0)
        {
            vram[(y + i) * xsize + x + 2] = c;
        }
        if ((d & 0x10) != 0)
        {
            vram[(y + i) * xsize + x + 3] = c;
        }
        if ((d & 0x08) != 0)
        {
            vram[(y + i) * xsize + x + 4] = c;
        }
        if ((d & 0x04) != 0)
        {
            vram[(y + i) * xsize + x + 5] = c;
        }
        if ((d & 0x02) != 0)
        {
            vram[(y + i) * xsize + x + 6] = c;
        }
        if ((d & 0x01) != 0)
        {
            vram[(y + i) * xsize + x + 7] = c;
        }
    }
}

void init_mouse_cursor(char *mouse, char bc)
{
    static char cursor[16][16] = {
        "**************..",
        "*OOOOOOOOOOO*...",
        "*OOOOOOOOOO*....",
        "*OOOOOOOOO*.....",
        "*OOOOOOOO*......",
        "*OOOOOOO*.......",
        "*OOOOOOO*.......",
        "*OOOOOOOO*......",
        "*OOOO**OOO*.....",
        "*OOO*..*OOO*....",
        "*OO*....*OOO*...",
        "*O*......*OOO*..",
        "**........*OOO*.",
        "*..........*OOO*",
        "............*OO*",
        ".............***"};

    int x, y;
    for (y = 0; y < 16; y++)
    {
        for (x = 0; x < 16; x++)
        {
            if (cursor[y][x] == '*')
            {
                mouse[y * 16 + x] = COL8_000000;
            }
            if (cursor[y][x] == 'O')
            {
                mouse[y * 16 + x] = COL8_FFFFFF;
            }
            if (cursor[y][x] == '.')
            {
                mouse[y * 16 + x] = bc;
            }
        }
    }
}

void putblock(char *vram, int vxsize, int pxsize,
              int pysize, int px0, int py0, char *buf, int bxsize)
{
    int x, y;
    for (y = 0; y < pysize; y++)
        for (x = 0; x < pxsize; x++)
        {
            vram[(py0 + y) * vxsize + (px0 + x)] = buf[y * bxsize + x];
        }
}

void intHandlerFromC(char *esp) //*键盘的中断处理函数
{
    char *vram = bootInfo.vgaRam;
    int xsize = bootInfo.screenX, ysize = bootInfo.screenY;
    io_out8(PIC_OCW2, 0x21);
    unsigned char data = 0;
    data = io_in8(PORT_KEYDAT);
    if (keybuf.len < 32) //*向键盘缓冲区写入键值
    {
        keybuf.key_buf[keybuf.next_w] = data;
        keybuf.len++;
        keybuf.next_w = (keybuf.next_w + 1) % 32;
    }
    //    char* pStr = charToHexStr(data);
    //    static int showPos = 0;
    //    showString(vram, xsize, showPos, 0, COL8_FFFFFF, pStr);
    //    showPos += 32;
}

char charToHexVal(char c)
{
    if (c >= 10)
    {
        return 'A' + c - 10;
    }

    return '0' + c;
}

char *charToHexStr(unsigned char c)
{
    int i = 0;
    char mod = c % 16;
    keyval[3] = charToHexVal(mod);
    c = c / 16;
    keyval[2] = charToHexVal(c);

    return keyval;
}

#define PORT_KEYDAT 0x0060 //键盘的数据读写端口
#define PORT_KEYSTA 0x0064 //键盘的状态控制端口和鼠标的端口在一起
#define PORT_KEYCMD 0x0064
#define KEYSTA_SEND_NOTREADY 0x02
#define KEYCMD_WRITE_MODE 0x60
#define KBC_MODE 0x47

void wait_KBC_sendready()
{
    for (;;)
    {
        //*cpu从键盘的状态的端口读取数据，如果读取的字节第二个bit位是0，表示鼠标电路可以接收来自内核的数据
        if ((io_in8(PORT_KEYSTA) & KEYSTA_SEND_NOTREADY) == 0)
        {
            break;
        }
    }
}

void init_keyboard(void)
{
    wait_KBC_sendready();                    //*等待鼠标可以接收数据的信号
    io_out8(PORT_KEYCMD, KEYCMD_WRITE_MODE); //*发送命令让键盘开始接收数据
    wait_KBC_sendready();
    io_out8(PORT_KEYDAT, KBC_MODE); //*键盘会激活链接在同一块电路板的鼠标电路
    return;
}

//*当我们想向鼠标发送数据时，先向端口发送一个字节的数据，改数据的值是0xd4,完成这一步后，任何向端口0x60写入的数据都会被传送给鼠标*/
#define KEYCMD_SENDTO_MOUSE 0xd4
#define MOUSECMD_ENABLE 0xf4

void enable_mouse(void)
{
    wait_KBC_sendready();
    io_out8(PORT_KEYCMD, KEYCMD_SENDTO_MOUSE); //*向键盘电路发送0xd4后向这个端口的数据都会发送给鼠标
    wait_KBC_sendready();
    io_out8(PORT_KEYDAT, MOUSECMD_ENABLE); //*鼠标进入工作状态，鼠标进入到工作状态后会立马给内核发送一个中断信号
    return;
}

//*内核接收到鼠标的中断信号后会在界面打印一个字符
void intHandlerForMouse(char *esp)
{
    char *vram = bootInfo.vgaRam;
    int xsize = bootInfo.screenX, ysize = bootInfo.screenY;
    showString(vram, xsize, 0, 0, COL8_FFFFFF, "PS/2 Mouse Handler");
    for (;;)
    {
        io_hlt();
    }
}