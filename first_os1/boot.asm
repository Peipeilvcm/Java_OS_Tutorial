org  0x7c00     ;org 后面的7c00 是物理内存地址

;初始化工作
jmp  entry      ;跳转,长度占3字节
db   0x90       ;memory[0x7c00+3] = 0x90,1字节
DB   "OSKERNEL" ;strcpy(memory + 0x7c00 + 3 + 1, “OSKERNEL”)
DW   512        ;512>256,2字节才能存
DB   1          ;
DW   1
DB   2
DW   224
DW   2880
DB   0xf0
DW   9
DW   18
DW   2
DD   0
DD   2880
DB   0,0,0x29   ;三个字节
DD   0xFFFFFFFF ;存储到4个字节中
DB   "MYFIRSTOS  "
DB   "FAT12   "
RESB  18        ;接下来的18字节都赋值为0

entry:
    mov  ax, 0  ; ax两字节，相当于java中的char
    mov  ss, ax ; 相当于char ss = ax
    mov  ds, ax
    mov  es, ax
    mov  si, msg    ;msg地址放入si,char *si=msg

putloop:
    mov  al, [si]   ;char al = *si,取地址的一字节长度,直到读到0
    add  si, 1      ;地址加1字节
    cmp  al, 0      ; 判断是否为0
    je   fin
    mov  ah, 0x0e   ;ah为0e,输出字符ascii值放入al,bh为0,字符颜色用bl值定
    mov  bx, 15
    int  0x10       ;打印中断，相当于函数调用，库函数都放到一个数组里，取第0x10个函数
    jmp  putloop

fin:
    HLT     ;CPU休眠,进入死循环
    jmp  fin

;定义一段内存
msg:
    DB    0x0a,  0x0a
    db    "hello, world"
    db    0x0a
    db    0