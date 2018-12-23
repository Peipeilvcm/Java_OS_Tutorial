%include "pm.inc"

org   0x9000

jmp   LABEL_BEGIN

[SECTION .gdt]
; 段基址          段界限                属性
LABEL_GDT:          Descriptor        0,            0,                   0
LABEL_DESC_CODE32:  Descriptor        0,      SegCode32Len - 1,       DA_C + DA_32
LABEL_DESC_VIDEO:   Descriptor        0B8000h,         0ffffh,            DA_DRW
; 设置C语言在4G内存都可读写
LABEL_DESC_VRAM:    Descriptor        0,         0ffffffffh,            DA_DRW
; 起始地址是LABEL_STACK,512字节,堆栈大小,局部变量不能超过
LABEL_DESC_STACK:   Descriptor        0,             TopOfStack,        DA_DRWA+DA_32

GdtLen     equ    $ - LABEL_GDT
GdtPtr     dw     GdtLen - 1
           dd     0

SelectorCode32    equ   LABEL_DESC_CODE32 -  LABEL_GDT
SelectorVideo     equ   LABEL_DESC_VIDEO  -  LABEL_GDT
SelectorStack     equ   LABEL_DESC_STACK  -  LABEL_GDT
SelectorVram      equ   LABEL_DESC_VRAM   -  LABEL_GDT


[SECTION  .s16]
[BITS  16]
LABEL_BEGIN:
    mov   ax, cs
    mov   ds, ax
    mov   es, ax
    mov   ss, ax
    mov   sp, 0100h

    ; al 的值决定了要设置显卡的色彩模式
    ; 0x13, VGA图形模式, 320 * 200 * 8位彩色模式，调色板模式
    mov   al, 0x13
    mov   ah, 0
    int   0x10

    xor   eax, eax
    mov   ax,  cs
    shl   eax, 4
    add   eax, LABEL_SEG_CODE32
    mov   word [LABEL_DESC_CODE32 + 2], ax
    shr   eax, 16
    mov   byte [LABEL_DESC_CODE32 + 4], al
    mov   byte [LABEL_DESC_CODE32 + 7], ah

    ; set stack for C language
    xor   eax, eax
    mov   ax,  cs
    shl   eax, 4
    add   eax, LABEL_STACK
    mov   word [LABEL_DESC_STACK + 2], ax
    shr   eax, 16
    mov   byte [LABEL_DESC_STACK + 4], al
    mov   byte [LABEL_DESC_STACK + 7], ah

    xor   eax, eax
    mov   ax, ds
    shl   eax, 4
    add   eax,  LABEL_GDT
    mov   dword  [GdtPtr + 2], eax

    lgdt  [GdtPtr]

    cli          ; 关中断

    in    al,  92h
    or    al,  00000010b
    out   92h, al

    mov   eax, cr0
    or    eax , 1
    mov   cr0, eax

    jmp   dword  SelectorCode32: 0

    [SECTION .s32]
    [BITS  32]
    LABEL_SEG_CODE32:
    ; initialize stack for c code
    mov  ax, SelectorStack
    mov  ss, ax
    mov  esp, TopOfStack

    mov  ax, SelectorVram
    mov  ds,  ax

; 要开发的程序是write_vga.c
C_CODE_ENTRY:
     %include "write_vga.asm"


io_hlt:      ; void io_hlt(void);系统休眠
    HLT
    RET

SegCode32Len   equ  $ - LABEL_SEG_CODE32

[SECTION .gs]
ALIGN 32
[BITS 32]
LABEL_STACK:
    times 512  db 0
TopOfStack  equ  $ - LABEL_STACK