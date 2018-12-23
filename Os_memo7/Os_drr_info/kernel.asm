; 描述符的数据机构头文件
%include "pm.inc"

org   0x9000                  ; 开始读取的内存地址

VRAM_ADDRESS  equ  0x000a0000 ; 显存地址

jmp   LABEL_BEGIN

[SECTION .gdt]                ; GDT全局描述符表（告诉cpu如何读取内存的数据结构）
                              ; 段基址          段界限                属性
LABEL_GDT:          Descriptor        0,            0,                   0
LABEL_DESC_CODE32:  Descriptor        0,      SegCode32Len - 1,       DA_C + DA_32
LABEL_DESC_VIDEO:   Descriptor        0B8000h,         0ffffh,            DA_DRW
LABEL_DESC_VRAM:    Descriptor        0,         0ffffffffh,            DA_DRW
LABEL_DESC_STACK:   Descriptor        0,             TopOfStack,        DA_DRWA+DA_32

GdtLen     equ    $ - LABEL_GDT
GdtPtr     dw     GdtLen - 1
           dd     0

SelectorCode32    equ   LABEL_DESC_CODE32 -  LABEL_GDT
SelectorVideo     equ   LABEL_DESC_VIDEO  -  LABEL_GDT
SelectorStack     equ   LABEL_DESC_STACK  -  LABEL_GDT
SelectorVram      equ   LABEL_DESC_VRAM   -  LABEL_GDT

LABEL_IDT:                    ; 中断描述符表
                              ; 初始化33个中断描述符
%rep 33
    Gate SelectorCode32, SpuriousHandler,0, DA_386IGate
%endrep

.021h:                        ; 0x21对应的键盘-8259A主IRQ1
    Gate SelectorCode32,keyBoardHandler,0,DA_386IGate
%rep  10
    Gate  SelectorCode32, SpuriousHandler,0, DA_386IGate
%endrep

.2CH:
    Gate SelectorCode32, mouseHandler,0, DA_386IGate

IdtLen  equ $ - LABEL_IDT
IdtPtr  dw  IdtLen - 1
        dd  0

        ; 进入实模式
[SECTION  .s16]
[BITS  16]
LABEL_BEGIN:
    mov   ax, cs
    mov   ds, ax
    mov   es, ax
    mov   ss, ax
    mov   sp, 0100h

    ; 内存检测
computeMemory:
    mov ebx,0
    mov di, MemChkBuf         ; 内存的起始地址
.loop:
    mov eax,0E820h            ; 规定
    mov ecx,20                ; BIOS每次填充内存的大小
    mov edx, 0534D4150h       ; "SMAP"
    int 15h                   ; BIOS系统调用，会像MemChkBuf填充20字节的内存数据
    jc LABEL_MEM_CHK_FAIL     ; 填充失败
    add di,20                 ; 每次BIOS都会向di为首地址的内存填充20字节，所有首地址不断偏移
    inc dword [dwMCRNumber]   ; dwMCRNumber是地址描述符数据结构的数量,每次填充成功+1个地址描述符
    cmp ebx,0                 ; 如果ebx的值为0，表明查询结束，如果不为0，则继续调用15h获取有关内存的信息
    jne .loop
    jmp LABEL_MEM_CHK_OK      ; 跳转到正式启动的内核代码
LABEL_MEM_CHK_FAIL:
    mov    dword [dwMCRNumber], 0



LABEL_MEM_CHK_OK:             ; 内核启动代码
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

    xor   eax, eax
    mov   ax, ds
    shl   eax, 4
    add   eax,  LABEL_GDT
    mov   dword  [GdtPtr + 2], eax


    lgdt  [GdtPtr]

    cli                       ; 关中断

    call init8259A            ; 初始化8259A

                              ; prepare for loading IDT 内核加载中断描述符表
    xor   eax, eax
    mov   ax,  ds
    shl   eax, 4
    add   eax, LABEL_IDT
    mov   dword [IdtPtr + 2], eax
    lidt  [IdtPtr]

    in    al,  92h
    or    al,  00000010b
    out   92h, al

    mov   eax, cr0
    or    eax , 1
    mov   cr0, eax            ; 进入32位的保护模式



    jmp   dword  SelectorCode32: 0

init8259A:
    mov  al, 011h
    out  020h, al
    call io_delay

    out 0A0h, al
    call io_delay

    mov al, 020h
    out 021h, al
    call io_delay

    mov  al, 028h
    out  0A1h, al
    call io_delay

    mov  al, 004h
    out  021h, al
    call io_delay

    mov  al, 002h
    out  0A1h, al
    call io_delay

    mov  al, 001h
    out  021h, al
    call io_delay

    out  0A1h, al
    call io_delay

    mov  al, 11111001b        ; 允许键盘中断
    out  021h, al
    call io_delay

    mov  al, 11101111b        ; 允许鼠标中断
    out  0A1h, al
    call io_delay

    ret

io_delay:
    nop
    nop
    nop
    nop
    ret

    ; 进入保护模式
    [SECTION .s32]
    [BITS  32]
    LABEL_SEG_CODE32:
    ; initialize stack for c code 为c语言的调用初始化栈
    mov  ax, SelectorStack
    mov  ss, ax
    mov  esp, TopOfStack

    mov  ax, SelectorVram
    mov  ds,  ax

    mov  ax, SelectorVideo
    mov  gs, ax




    sti


    %include "ddr_detail.asm"

    jmp  $

_SpuriousHandler:
SpuriousHandler  equ _SpuriousHandler - $$
    iretd

    ; 键盘中断处理函数
_KeyboardHandler:
keyBoardHandler equ _KeyboardHandler - $$
    ; 在调用函数的时候需要先保存当前寄存器的值，回来继续执行的时候在恢复（进程上下文？）
    push es
    push ds
    pushad
    mov eax,esp
    push eax

    call intHandlerFromC      ; 调用c函数

    pop eax
    mov esp,eax
    popad
    pop ds
    pop es
    iretd

_mouseHandler:                ; 鼠标的中断处理函数
mouseHandler equ _mouseHandler - $$
    push es
    push ds
    pushad
    mov  eax, esp
    push eax

    call intHandlerForMouse


    pop  eax
    mov  esp, eax
    popad
    pop  ds
    pop  es
    iretd


    ; 汇编的一些接口函数
    io_hlt:                   ; void io_hlt(void);
    HLT
    RET

io_cli:
    CLI
    RET

io_sti:
    STI
    RET
io_stihlt:
    STI
    HLT
    RET

io_in8:
    mov  edx, [esp + 4]
    mov  eax, 0
    in   al, dx
    ret

io_in16:
    mov  edx, [esp + 4]
    mov  eax, 0
    in   ax, dx
    ret

io_in32:
    mov edx, [esp + 4]
    in  eax, dx
    ret

io_out8:
    mov edx, [esp + 4]
    mov al, [esp + 8]
    out dx, al
    ret

io_out16:
    mov edx, [esp + 4]
    mov eax, [esp + 8]
    out dx, ax
    ret

io_out32:
    mov edx, [esp + 4]
    mov eax, [esp + 8]
    out dx, eax
    ret

io_load_eflags:
    pushfd
    pop  eax
    ret

io_store_eflags:
    mov eax, [esp + 4]
    push eax
    popfd
    ret

get_memory_block_count:       ; 导出一个接口给c语言来接收一共填充了多少个内存快（20字节大小）
    mov eax,[dwMCRNumber]
    ret

get_adr_buffer:
    mov eax,MemChkBuf         ; 把填充好的数据块的缓冲首地址导出给c程序
    ret

%include "fontData.inc"

SegCode32Len   equ  $ - LABEL_SEG_CODE32

MemChkBuf: times 256 db 0     ; 内存的起始填充地址
dwMCRNumber:   dd 0           ; 内存数据结构的数量

[SECTION .gs]                 ; 汇编语言是以section为单位来组织源文件的。 Section是相对独立的，具有特定名称，不可分割的指令，或数据序列
ALIGN 32                      ; 伪指令的作用是：告诉汇编程序，本伪指令下面的内存变量必须从下一个能被Num整除的地址开始分配。
[BITS 32]                     ; 'BITS'指令指定NASM产生的代码是被设计运行在16位模式的处理器上还是运行在32位模式的处理器上。
LABEL_STACK:
times 512  db 0
TopOfStack  equ  $ - LABEL_STACK