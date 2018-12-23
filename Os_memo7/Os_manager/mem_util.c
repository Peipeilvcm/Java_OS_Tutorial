#include "mem_util.h"

// 初始化内存管理器结构体
void memman_init(struct MEMMAN *man)
{
    man->frees = 0;
    man->maxfrees = 0;
    man->lostsize = 0;
    man->losts = 0;
}

// 计算一个内存管理区存储着多少可用的内存
unsigned int memman_total(struct MEMMAN *man)
{
    unsigned int i, t = 0;
    for (i = 0; i < man->frees; i++)
    {
        t += man->free[i].size;
    }

    return t;
}

// 指定的内存管理器对象中获取可用内存
unsigned int memman_alloc(struct MEMMAN *man, unsigned int size)
{
    unsigned int i, a;
    for (i = 0; i < man->frees; i++)
    {
        if (man->free[i].size >= size)
        {
            a = man->free[i].addr;
            man->free[i].addr += size; //pzx添加，可能解决bug
            man->free[i].size -= size;
            if (man->free[i].size == 0)
            {//这里有bug吧还有该free数组
                man->frees--;
            }

            return a;
        }
    }

    return 0;
}

// 释放不再需要的内存片,考虑释放的内存地址与前面或后面的地址合并的情况，有4种情况
int memman_free(struct MEMMAN *man, unsigned int addr, unsigned int size)
{
    int i, j;
    for (i = 0; i < man->frees; i++)
    {
        if (man->free[i].addr > addr)
        {
            break;
        }
    }

    // 三块合1
    if (i > 0)
    {
        if (man->free[i - 1].addr + man->free[i - 1].size == addr)
        {
            man->free[i - 1].size += size;
            if (i < man->frees)
            {
                if (addr + size == man->free[i].addr)
                {
                    man->free[i - 1].size += man->free[i].size;
                    man->frees--;
                }
            }

            return 0;
        }
    }

    // 没有合并，独自加一块，插在中间
    if (i < man->frees)
    {
        if (addr + size == man->free[i].addr)
        {
            man->free[i].addr = addr;
            man->free[i].size += size;
            return 0;
        }
    }

    // 所有可用内存的起始地址都大于要释放的内存块。插在最前面
    if (man->frees < MEMMAN_FREES)
    {
        for (j = man->frees; j > i; j--)
        {
            man->free[j] = man->free[j - 1];
        }

        man->frees++;
        if (man->maxfrees < man->frees)
        {
            man->maxfrees = man->frees;
        }

        man->free[i].addr = addr;
        man->free[i].size = size;
        return 0;
    }

    // 如果上面都不满足，则直接丢弃

    man->losts++;
    man->lostsize += size;
    return -1;
}

// gcc -m32 -fno-asynchronous-unwind-tables -s -c -o mem_util.o mem_util.c
// gcc -m32 -fno-asynchronous-unwind-tables -s -c -o write_vga_desktop.o write_vga_desktop.c
// ld -m elf_i386 -r write_vga_desktop.o mem_util.o -o ckernel.o
// ./objconv -fnasm ckernel.o ckernel.asm