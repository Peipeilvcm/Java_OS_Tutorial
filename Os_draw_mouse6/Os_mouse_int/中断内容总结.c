void init_mouse_cursor(char *mouse, char bc)
{
    // 二维数组鼠标形状
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
            {// 黑
                mouse[y * 16 + x] = COL8_000000; //循环鼠标数组，遇到*显示黑色
            }
            if (cursor[y][x] == 'O')
            {// 白
                mouse[y * 16 + x] = COL8_FFFFFF;
            }
            if (cursor[y][x] == '.')
            {// 透明
                mouse[y * 16 + x] = bc;
            }
        }
    }
}

// 16*16 转换为256字节写入显存
void putblock(char *vram, int vxsize /*(屏幕的宽320)*/, int pxsize /*(数组的宽)*/,
              int pysize /*(数组的高)*/, int px0, int py0 /*(px0和py0是决定鼠标的左上角)*/, char *buf /*像素的颜色数组*/, int bxsize)
{
    int x, y;
    for (y = 0; y < pysize; y++)
        for (x = 0; x < pxsize; x++)
        {
            vram[(py0 + y) * vxsize + (px0 + x)] = buf[y * bxsize + x];
        }
}

// 现在不能动,需要设置中断处理....
void CMain()
{
    init_mouse_cursor(mcursor, COL8_008484);
    putblock(vram, xsize, 16, 16, 80, 80, mcursor, 16);
    for (;;)
    {
        io_hlt();
    }
}