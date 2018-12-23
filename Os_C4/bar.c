// 程序入口在foo.asm中

void foo_print(char *a, int len); //声明,实现在asm中

int bar_func(int a, int b) 
{
    if (a > b)
    {   //foo_print在foo.asm中
        foo_print("the 1st one\n", 13);
    }
    else
    {
        foo_print("the 2nd one\n", 13);
    }

    return 0;
}