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
#define PIC1_OCW2 0xA0     //8259A主端口

//汇编接口调用
void io_hlt(void);
void io_cli(void);
void io_sti(void);
void io_stihlt(void);
void io_out(int port, int data);
int io_load_eflags(void);
void io_store_eflags(int eflags);
int get_memory_block_count(void); //*汇编的内存检测接口，汇编通过这个接口把检测到的内存数据发送给c

static int mx = 0, my = 0;
static int xsize = 0, ysize = 0;

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

struct FIFO8 //*设置鼠标/键盘的缓冲区
{
    unsigned char *buf;          //*给鼠标一个动态的buf，根据输入的参数来
    int p, q, size, free, flags; //*p,q表示数据的写入和读出的下标，free表示剩余空间，size表示缓冲区的大小，flags表示当前的状态
};
static char mousebuf[128];
static char keybuf[32];
static struct FIFO8 keyinfo;   //键盘的fifo
static struct FIFO8 mouseinfo; //鼠标的fifo

char charToHexVal(char c);
char *charToHexStr(unsigned char c);
char *intToHexStr(unsigned int d); //*把整形数据装换成字符串

void init_keyboard(void);   //键盘初始化函数声明
void enable_mouse(void);    //鼠标的使能函数声明
void show_mouse_info(void); //绘制鼠标中断字符串
//*****缓冲区对应的函数
void fifo8_init(struct FIFO8 *fifo, int size, unsigned char *buf); //初始化缓冲区
int fifo8_put(struct FIFO8 *fifo, unsigned char data);             //写入数据到鼠标的缓冲区
int fifo8_get(struct FIFO8 *fifo);                                 //从鼠标的缓冲区读取数据
int fifo8_status(struct FIFO8 *fifo);                              //鼠标fifo中剩下的数据

//***************************主函数开始****************************************************
void CMain(void)
{
    //*初始化背景内存地址
    initBootInfo(&bootInfo);
    char *vram = bootInfo.vgaRam;
    int xsize = bootInfo.screenX, ysize = bootInfo.screenY;

    //*fifo的初始化(鼠标/键盘)
    fifo8_init(&mouseinfo, 128, mousebuf);
    fifo8_init(&keyinfo, 32, keybuf);

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

    mx = (xsize - 16) / 2;
    my = (ysize - 28 - 16) / 2;
    init_mouse_cursor(mcursor, COL8_008484);            //二维数组绘制鼠标的形状颜色
    putblock(vram, xsize, 16, 16, mx, my, mcursor, 16); //把形状颜色绘制进显存

    //*打印系统物理内存
    int memCnt = get_memory_block_count();
    char *pStr = intToHexStr(memCnt);
    showString(vram, xsize, 0, 0, COL8_FFFFFF, pStr);

    io_sti();       //开中断
    enable_mouse(); //使能鼠标

    char data;
    //*内核键盘的中断机制：键盘发送的扫描码和断码数值缓存起来，然后把控制器交换给原来任务，等到CPU稍微空闲时再处理键盘事件
    for (;;)
    {
        io_cli(); //关中断
        if (fifo8_status(&keyinfo) + fifo8_status(&mouseinfo) == 0)
        {
            io_stihlt(); //键盘和鼠标缓冲区都没有数据进入睡眠
        }
        else if (fifo8_status(&keyinfo) != 0) //键盘缓冲区有数据
        {
            io_sti();                        //打开中断
            data = fifo8_get(&keyinfo);      //接收数据
            char *pStr = charToHexStr(data); //转换成字符串
            static int showPos = 0;
            showString(vram, xsize, showPos, 0, COL8_FFFFFF, pStr); //显示字符串
            showPos += 32;
        }
        else if (fifo8_status(&mouseinfo) != 0)
        {
            show_mouse_info();
        }
    }
}
//**************************主函数结束*************************************

void show_mouse_info()
{
    char *vram = bootInfo.vgaRam;
    int xsize = bootInfo.screenX, ysize = bootInfo.screenY;
    unsigned char data = 0;

    io_sti();
    data = fifo8_get(&mouseinfo);
    char *pStr = charToHexStr(data);
    static int mousePos = 16;
    if (mousePos <= 256)
    {
        showString(vram, xsize, mousePos, 16, COL8_FFFFFF, pStr);
        mousePos += 32;
    }
}

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
    io_out8(PIC_OCW2, 0x20);
    unsigned char data = 0;
    data = io_in8(PORT_KEYDAT); //*从键盘端口读取数据
    fifo8_put(&keyinfo, data);  //*把从键盘端口读取到的数据写入缓冲区

    return;
    //    char* pStr = charToHexStr(data);
    //    static int showPos = 0;
    //    showString(vram, xsize, showPos, 0, COL8_FFFFFF, pStr);
    //    showPos += 32;
}

//**一些内核数据转换函数
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
char *intToHexStr(unsigned int d)
{
    static char str[11];
    str[0] = '0';
    str[1] = 'X';
    str[10] = 0;

    int i = 2;
    for (; i < 10; i++)
    {
        str[i] = '0';
    }

    int p = 9;
    while (p > 1 && d > 0)
    {
        int e = d % 16;
        d /= 16;
        if (e >= 10)
        {
            str[p] = 'A' + e - 10;
        }
        else
        {
            str[p] = '0' + e;
        }
    }

    return str;
}

//*****end of 内核数据转换函数

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

//*内核接收到鼠标的中断信号后会继续给8259A发送中断信号，因为移动一下鼠标会产生很多的中断，为了持续处理外面到来的中断
void intHandlerForMouse(char *esp)
{
    unsigned char data;
    io_out8(PIC1_OCW2, 0x20);
    io_out8(PIC_OCW2, 0x20);

    data = io_in8(PORT_KEYDAT);
    fifo8_put(&mouseinfo, data);
}

//fifo的初始化，也就是位fifo中的成员赋值
void fifo8_init(struct FIFO8 *fifo, int size, unsigned char *buf)
{
    fifo->size = size;
    fifo->buf = buf;
    fifo->free = size;
    fifo->flags = 0;
    fifo->p = 0;
    fifo->q = 0;
    return;
}

#define FLAGS_OVERRUN 0x0001
int fifo8_put(struct FIFO8 *fifo, unsigned char data) //向fifo中写入数据
{
    if (fifo->free == 0)
    {
        fifo->flags |= FLAGS_OVERRUN;
        return -1;
    }

    fifo->buf[fifo->p] = data;
    fifo->p++;
    if (fifo->p == fifo->size)
    {
        fifo->p = 0;
    }

    fifo->free--;
    return 0;
}

int fifo8_get(struct FIFO8 *fifo) //从fifo中读出数据
{
    int data;
    if (fifo->free == fifo->size)
    {
        return -1;
    }

    data = fifo->buf[fifo->q];
    fifo->q++;
    if (fifo->q == fifo->size)
    {
        fifo->q = 0;
    }

    fifo->free++;
    return data;
}

//fifo中还剩多少数据
int fifo8_status(struct FIFO8 *fifo)
{
    return fifo->size - fifo->free;
}