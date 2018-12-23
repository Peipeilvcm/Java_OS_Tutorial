; 之前内核加载到内存后,会打印出一条语句，而语句与内核代码都存储在同一个扇区中，
; 这一次，我们将要打印的语句存储在第一柱面的第二扇区，内核加载如内存后，
; 通过BIOS调用将要打印的语句从指定位置读出，然后再显示到屏幕
; readFloppy将要打印的字符串从磁盘中读出来，放入到缓冲区msg中
; nasm Floppy.asm -o boot.bat

org  0x7c00;

jmp  entry
db   0x90
DB   "OSKERNEL"
DW   512
DB   1
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
DB   0,0,0x29
DD   0xFFFFFFFF
DB   "MYFIRSTOS  "
DB   "FAT12   "
RESB  18

entry:
    mov  ax, 0
    mov  ss, ax
    mov  ds, ax
    mov  es, ax
    mov  si, msg


readFloppy:
    mov DH, 0        ;DH 用来存储磁头号
    mov CH, 1        ;CH 用来存储柱面号
    mov CL, 2        ;CL 用来存储扇区号

    mov BX, msg       ; ES:BX 数据存储缓冲区

    mov AH, 0x02      ;  AH = 02 表示要做的是读盘操作
    mov AL, 1        ; AL 表示要练习读取几个扇区
    mov DL, 0         ;驱动器编号，一般只有一个软盘驱动器，所以写死为0
    INT 0x13          ;调用BIOS中断实现磁盘读取功能

    jc error

putloop:
    mov  al, [si]
    add  si, 1
    cmp  al, 0
    je   fin
    mov  ah, 0x0e
    mov  bx, 15
    int  0x10
    jmp  putloop

fin:
    HLT
    jmp  fin

error:
    mov si, errmsg   ;出现错误打印error
    jmp   putloop

msg:
    RESB   64
errmsg:
    DB "error"