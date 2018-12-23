; 内核加载器boot放到第一扇区,小于512字节
; 加载器载入内存后,再将内核从软盘加载到系统内存,跳转到内核加载地址
; 把编译好的内核代码写入软盘第一柱面，第二扇区
; 让内核突破512字节
; nasm boot.asm -o boot.bat

org  0x7c00;

LOAD_ADDR  EQU  0X8000

entry:
    mov  ax, 0
    mov  ss, ax
    mov  ds, ax
    mov  es, ax
    mov  si, ax

; 从软盘的1柱面，2扇区，将内核读取到系统内存的0x8000处
; 一个jmp 跳转到内核的加载地址，将机器的控制权转交给内核
readFloppy:
    mov CH, 1        ;CH 用来存储柱面号
    mov DH, 0        ;DH 用来存储磁头号
    mov CL, 2        ;CL 用来存储扇区号

    mov BX, LOAD_ADDR ; ES:BX 数据存储缓冲区

    mov AH, 0x02      ;  AH = 02 表示要做的是读盘操作
    mov AL,  1        ; AL 表示要练习读取几个扇区
    mov DL, 0         ;驱动器编号，一般只有一个软盘驱动器，写死为0
    INT 0x13          ;调用BIOS中断实现磁盘读取功能

    JC fin

    jmp  LOAD_ADDR

fin:
    HLT
    jmp  fin