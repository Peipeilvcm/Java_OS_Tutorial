; nasm -f elf32 -o foo.o foo.asm
; gcc -m32 -c -o bar.o bar.c
; ld -m elf_i386 -o foobar foo.o bar.o 将两个模块连接起来
; 生成可执行文件./foobar
; 这样生成elf文件, 不能讲内核加载到内存
; 可以.c编译后的.o反汇编，反汇编代码贴到foo.asm里,形成单一文件
; gcc -m32 -fno-asynchronous-unwind-tables -s -c -o bar.o bar.c
; 反汇编工具objconv, https://github.com/vertis/objconv.git
; 进入objconv目录，编译该工具, g++ -o objconv -O2 src/*cpp
; 反汇编 objconv -fnasm bar.o -o bar.asm
; 打开foo.asm, 将里面的_start, 修改成main, 后面编译系统内核不用，这里是想编译成linux可执行文件
; 在foo.asm末尾，通过语句：%include “bar.asm” 将第五步反汇编的C模块代码引入foo.asm
; nasm -f elf32 foo.asm
; gcc -m32 foo.o -o foo //可以运行./foo

; 需要调用另一个模块的函数，所以开始先要使用extern 声明
extern bar_func;

[section .data]
arg1  dd 3
arg2  dd 4

; _start导出作为整个可执行程序的入口，要用global关键字声明
; foo_print要导出给其他接口使用，需要用global声明
[section .text]
global _start
global foo_print

; bar程序入口,bar_func实现在bar.c中,bar_func又调用foo.asm中函数,两个模块交互
_start:
; 传入bar_func参数,C语言传参通过堆栈,右边参数先入栈
; 相当于barc(arg2,arg1)
mov   eax, dword[arg1]
push  eax
mov   eax, dword [arg2]
push  eax
call  bar_func
add   esp, 8    ; 堆栈回收,arg1,arg2共8字节,从堆栈中删除了

mov   ebx,0
mov   eax, 1
int   0x80

foo_print:
mov   edx, [esp + 8]    ; 对应第2个参数int
mov   ecx, [esp + 4]    ; 对应第1个参数char*
mov   ebx, 1
mov   eax, 4
int   0x80  ;实现一个系统调用,将ecx寄存器中指向的内存地址中的字符信息打印到屏幕上
ret

; %include "bar.asm"