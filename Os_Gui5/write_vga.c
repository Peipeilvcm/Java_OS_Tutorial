// 调色板模式,一个像素点256种颜色

// gcc -m32 -fno-asynchronous-unwind-tables -s -c -o write_vga.o write_vga.c
// 反汇编 objconv -fnasm write_vga.o -o write_vga.asm

void CMain(void)
{
    int i;
    char *p = 0;

    for (i = 0xa0000; i <= 0xaffff; i++)
    {
        //0xa0000是vga显存地址，直到0xaffff，64k
        p = i;
        *p = i & 0x0f;
    }

    for (;;)
    {
        io_hlt();
    }
}

/*反汇编后如下
* 去掉以section 开始的指令，这些指令会影响我们把当前汇编结合入内核kerne.asm
* 同时去掉开头的两句：
* global CMain: function 
* extern io_hlt
两个汇编文件结合成一个
nasm -o kernel.bat kernel.asm
boot.asm中 mov AL,  2; 表明序运读取两个扇区才能把内核完全加载入内存 
*/