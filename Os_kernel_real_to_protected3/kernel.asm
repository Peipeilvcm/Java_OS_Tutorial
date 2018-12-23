; nasm kernel.asm -o kernel.bat
; Dos实模式,windows保护模式
; 保护模式:寻址空间从时模式的1M(20位地址)增强到4G(32位地址),不同的代码拥有不同的优先级，
;   优先级高的能够执行特殊指令，优先级低的，某些重要指令就无法执行
; GDT为全局描述符

%include "pm.inc"

org   0x9000

jmp   LABEL_BEGIN

[SECTION .gdt]
;                                   段基址          段界限                属性
LABEL_GDT:          Descriptor        0,            0,                   0  
LABEL_DESC_CODE32:  Descriptor        0,      SegCode32Len - 1,       DA_C + DA_32
LABEL_DESC_VIDEO:   Descriptor     0B8000h,         0ffffh,            DA_DRW

GdtLen     equ    $ - LABEL_GDT
GdtPtr     dw     GdtLen - 1
           dd     0

SelectorCode32    equ   LABEL_DESC_CODE32 -  LABEL_GDT
SelectorVideo     equ   LABEL_DESC_VIDEO  -  LABEL_GDT

[SECTION  .s16]
[BITS  16]
LABEL_BEGIN:
     mov   ax, cs
     mov   ds, ax
     mov   es, ax
     mov   ss, ax
     mov   sp, 0100h

     ; LABEL_SEG_CODE32是一段代码的起始地址,下面是将这个起始地址写入到byte2,3,4,7
     xor   eax, eax
     mov   ax,  cs
     shl   eax, 4
     add   eax, LABEL_SEG_CODE32
     mov   word [LABEL_DESC_CODE32 + 2], ax
     shr   eax, 16
     mov   byte [LABEL_DESC_CODE32 + 4], al
     mov   byte [LABEL_DESC_CODE32 + 7], ah

     xor   eax, eax
     mov   ax, ds
     shl   eax, 4
     add   eax,  LABEL_GDT
     mov   dword  [GdtPtr + 2], eax

     lgdt  [GdtPtr]

     cli   ;关中断

     in    al,  92h
     or    al,  00000010b
     out   92h, al

     mov   eax, cr0
     or    eax , 1
     mov   cr0, eax

     jmp   dword  SelectorCode32: 0

     [SECTION .s32]
     [BITS  32]

; 这里开始就在保护模式下,用于显示一串字符
LABEL_SEG_CODE32:
    mov   ax, SelectorVideo
    mov   gs, ax    ;gs寄存器,指向显存,信息写入gs指向内存后,会显示到屏幕上
    mov   si, msg
    mov   ebx, 10
    mov   ecx, 2
; 显存地址从0XB800h开始,每两个字节用来在屏幕上显示一个字符
; 这两个字节中，第一个字节字符的颜色，第二个字节字符的ASCII值，屏幕一行能显示80个字符
showChar:
    mov   edi, (80*11)  ;从第11行开始显示字符
    add   edi, ebx  ;exb为10,表明从第11行的第10列开始显示
    mov   eax, edi
    mul   ecx   ;ecx是2,表明显示一个字符需要两个字节
    ; 上面几句作用是eax = ((80*11) + 10) * 2, eax指向11行10列所在显存位置
    mov   edi, eax
    mov   ah, 0ch   ;对第一个字节设置颜色为0ch
    mov   al, [si]  ; si指向的字符ascii写入第二个字节
    cmp   al, 0
    je    end
    add   ebx,1
    add   si, 1
    mov   [gs:edi], ax
    jmp    showChar
end: 
    jmp   $
msg:
    DB     "Pzx Protect Mode Show", 0

SegCode32Len   equ  $ - LABEL_SEG_CODE32