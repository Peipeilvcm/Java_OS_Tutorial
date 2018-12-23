; Disassembly of file: ckernel.o
; Wed Nov  7 18:54:01 2018
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386


; global CMain: function
; global init_screen8: function
; global computeMousePosition: function
; global show_mouse_info: function
; global initBootInfo: function
; global showString: function
; global init_palette: function
; global set_palette: function
; global boxfill8: function
; global showFont8: function
; global init_mouse_cursor: function
; global putblock: function
; global intHandlerFromC: function
; global charToHexVal: function
; global charToHexStr: function
; global intToHexStr: function
; global wait_KBC_sendready: function
; global init_keyboard: function
; global enable_mouse: function
; global intHandlerForMouse: function
; global fifo8_init: function
; global fifo8_put: function
; global fifo8_get: function
; global fifo8_status: function
; global mouse_decode: function
; global showMemoryInfo: function
; global memman_init: function
; global memman_total: function
; global memman_alloc: function
; global memman_free: function
; global memman_allock_4k: function
; global memman_free_4k: function
; global shtctl_init: function
; global sheet_alloc: function
; global sheet_setbuf: function
; global sheet_updown: function
; global sheet_refresh: function
; global sheet_slide: function
; global sheet_refreshsub: function
; global memman

; extern get_memory_block_count                           ; near
; extern io_out8                                          ; near
; extern io_sti                                           ; near
; extern io_store_eflags                                  ; near
; extern io_stihlt                                        ; near
; extern get_adr_buffer                                   ; near
; extern io_cli                                           ; near
; extern io_in8                                           ; near
; extern systemFont                                       ; byte
; extern memman_alloc_4k                                  ; near
; extern io_load_eflags                                   ; near


; SECTION .text   align=1 execute                         ; section number 1, code

CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    ebx                                     ; 0003 _ 53
        sub     esp, 68                                 ; 0004 _ 83. EC, 44
        mov     dword [esp], bootInfo                   ; 0007 _ C7. 04 24, 00000000(d)
        call    initBootInfo                            ; 000E _ E8, FFFFFFFC(rel)
        mov     eax, dword [bootInfo]                   ; 0013 _ A1, 00000000(d)
        mov     dword [ebp-24H], eax                    ; 0018 _ 89. 45, DC
        movzx   eax, word [?_128]                       ; 001B _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0022 _ 98
        mov     dword [xsize], eax                      ; 0023 _ A3, 000000F8(d)
        movzx   eax, word [?_129]                       ; 0028 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 002F _ 98
        mov     dword [ysize], eax                      ; 0030 _ A3, 000000FC(d)
        mov     dword [ebp-20H], 0                      ; 0035 _ C7. 45, E0, 00000000
        mov     dword [ebp-1CH], 0                      ; 003C _ C7. 45, E4, 00000000
        mov     dword [esp+8H], keybuf                  ; 0043 _ C7. 44 24, 08, 00000040(d)
        mov     dword [esp+4H], 32                      ; 004B _ C7. 44 24, 04, 00000020
        mov     dword [esp], keyinfo                    ; 0053 _ C7. 04 24, 00000008(d)
        call    fifo8_init                              ; 005A _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], mousebuf                ; 005F _ C7. 44 24, 08, 00000060(d)
        mov     dword [esp+4H], 128                     ; 0067 _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 006F _ C7. 04 24, 00000020(d)
        call    fifo8_init                              ; 0076 _ E8, FFFFFFFC(rel)
        call    init_palette                            ; 007B _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 0080 _ E8, FFFFFFFC(rel)
        call    get_memory_block_count                  ; 0085 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 008A _ 89. 45, E8
        call    get_adr_buffer                          ; 008D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0092 _ 89. 45, EC
        mov     eax, dword [memman]                     ; 0095 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 009A _ 89. 04 24
        call    memman_init                             ; 009D _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 00A2 _ A1, 00000000(d)
        mov     dword [esp+8H], 1072594944              ; 00A7 _ C7. 44 24, 08, 3FEE8000
        mov     dword [esp+4H], 16809984                ; 00AF _ C7. 44 24, 04, 01008000
        mov     dword [esp], eax                        ; 00B7 _ 89. 04 24
        call    memman_free                             ; 00BA _ E8, FFFFFFFC(rel)
        mov     ecx, dword [ysize]                      ; 00BF _ 8B. 0D, 000000FC(d)
        mov     edx, dword [xsize]                      ; 00C5 _ 8B. 15, 000000F8(d)
        mov     eax, dword [memman]                     ; 00CB _ A1, 00000000(d)
        mov     dword [esp+0CH], ecx                    ; 00D0 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 00D4 _ 89. 54 24, 08
        mov     edx, dword [ebp-24H]                    ; 00D8 _ 8B. 55, DC
        mov     dword [esp+4H], edx                     ; 00DB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 00DF _ 89. 04 24
        call    shtctl_init                             ; 00E2 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 00E7 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 00EA _ 8B. 45, F0
        mov     dword [esp], eax                        ; 00ED _ 89. 04 24
        call    sheet_alloc                             ; 00F0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 00F5 _ 89. 45, E0
        mov     eax, dword [ebp-10H]                    ; 00F8 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 00FB _ 89. 04 24
        call    sheet_alloc                             ; 00FE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 0103 _ 89. 45, E4
        mov     edx, dword [xsize]                      ; 0106 _ 8B. 15, 000000F8(d)
        mov     eax, dword [ysize]                      ; 010C _ A1, 000000FC(d)
        imul    eax, edx                                ; 0111 _ 0F AF. C2
        mov     edx, eax                                ; 0114 _ 89. C2
        mov     eax, dword [memman]                     ; 0116 _ A1, 00000000(d)
        mov     dword [esp+4H], edx                     ; 011B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 011F _ 89. 04 24
        call    memman_allock_4k                        ; 0122 _ E8, FFFFFFFC(rel)
        mov     dword [buf_back], eax                   ; 0127 _ A3, 00000100(d)
        mov     ecx, dword [ysize]                      ; 012C _ 8B. 0D, 000000FC(d)
        mov     edx, dword [xsize]                      ; 0132 _ 8B. 15, 000000F8(d)
        mov     eax, dword [buf_back]                   ; 0138 _ A1, 00000100(d)
        mov     dword [esp+10H], 99                     ; 013D _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], ecx                    ; 0145 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 0149 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 014D _ 89. 44 24, 04
        mov     eax, dword [ebp-20H]                    ; 0151 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 0154 _ 89. 04 24
        call    sheet_setbuf                            ; 0157 _ E8, FFFFFFFC(rel)
        mov     dword [esp+10H], 99                     ; 015C _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 16                     ; 0164 _ C7. 44 24, 0C, 00000010
        mov     dword [esp+8H], 16                      ; 016C _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], buf_mouse               ; 0174 _ C7. 44 24, 04, 00000120(d)
        mov     eax, dword [ebp-1CH]                    ; 017C _ 8B. 45, E4
        mov     dword [esp], eax                        ; 017F _ 89. 04 24
        call    sheet_setbuf                            ; 0182 _ E8, FFFFFFFC(rel)
        mov     ecx, dword [ysize]                      ; 0187 _ 8B. 0D, 000000FC(d)
        mov     edx, dword [xsize]                      ; 018D _ 8B. 15, 000000F8(d)
        mov     eax, dword [buf_back]                   ; 0193 _ A1, 00000100(d)
        mov     dword [esp+8H], ecx                     ; 0198 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 019C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 01A0 _ 89. 04 24
        call    init_screen8                            ; 01A3 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 99                      ; 01A8 _ C7. 44 24, 04, 00000063
        mov     dword [esp], buf_mouse                  ; 01B0 _ C7. 04 24, 00000120(d)
        call    init_mouse_cursor                       ; 01B7 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 01BC _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 01C4 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-20H]                    ; 01CC _ 8B. 45, E0
        mov     dword [esp+4H], eax                     ; 01CF _ 89. 44 24, 04
        mov     eax, dword [ebp-10H]                    ; 01D3 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 01D6 _ 89. 04 24
        call    sheet_slide                             ; 01D9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [xsize]                      ; 01DE _ A1, 000000F8(d)
        sub     eax, 16                                 ; 01E3 _ 83. E8, 10
        mov     edx, eax                                ; 01E6 _ 89. C2
        shr     edx, 31                                 ; 01E8 _ C1. EA, 1F
        add     eax, edx                                ; 01EB _ 01. D0
        sar     eax, 1                                  ; 01ED _ D1. F8
        mov     dword [mx], eax                         ; 01EF _ A3, 000000F0(d)
        mov     eax, dword [ysize]                      ; 01F4 _ A1, 000000FC(d)
        sub     eax, 44                                 ; 01F9 _ 83. E8, 2C
        mov     edx, eax                                ; 01FC _ 89. C2
        shr     edx, 31                                 ; 01FE _ C1. EA, 1F
        add     eax, edx                                ; 0201 _ 01. D0
        sar     eax, 1                                  ; 0203 _ D1. F8
        mov     dword [my], eax                         ; 0205 _ A3, 000000F4(d)
        mov     edx, dword [my]                         ; 020A _ 8B. 15, 000000F4(d)
        mov     eax, dword [mx]                         ; 0210 _ A1, 000000F0(d)
        mov     dword [esp+0CH], edx                    ; 0215 _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 0219 _ 89. 44 24, 08
        mov     eax, dword [ebp-1CH]                    ; 021D _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 0220 _ 89. 44 24, 04
        mov     eax, dword [ebp-10H]                    ; 0224 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 0227 _ 89. 04 24
        call    sheet_slide                             ; 022A _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 0                       ; 022F _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-20H]                    ; 0237 _ 8B. 45, E0
        mov     dword [esp+4H], eax                     ; 023A _ 89. 44 24, 04
        mov     eax, dword [ebp-10H]                    ; 023E _ 8B. 45, F0
        mov     dword [esp], eax                        ; 0241 _ 89. 04 24
        call    sheet_updown                            ; 0244 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 1                       ; 0249 _ C7. 44 24, 08, 00000001
        mov     eax, dword [ebp-1CH]                    ; 0251 _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 0254 _ 89. 44 24, 04
        mov     eax, dword [ebp-10H]                    ; 0258 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 025B _ 89. 04 24
        call    sheet_updown                            ; 025E _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 0263 _ E8, FFFFFFFC(rel)
        mov     dword [esp], mdec                       ; 0268 _ C7. 04 24, 000000E0(d)
        call    enable_mouse                            ; 026F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 0                      ; 0274 _ C7. 45, F4, 00000000
        mov     dword [ebp-28H], 0                      ; 027B _ C7. 45, D8, 00000000
?_001:  call    io_cli                                  ; 0282 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 0287 _ C7. 04 24, 00000008(d)
        call    fifo8_status                            ; 028E _ E8, FFFFFFFC(rel)
        mov     ebx, eax                                ; 0293 _ 89. C3
        mov     dword [esp], mouseinfo                  ; 0295 _ C7. 04 24, 00000020(d)
        call    fifo8_status                            ; 029C _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 02A1 _ 01. D8
        test    eax, eax                                ; 02A3 _ 85. C0
        jnz     ?_002                                   ; 02A5 _ 75, 0A
        call    io_stihlt                               ; 02A7 _ E8, FFFFFFFC(rel)
        jmp     ?_004                                   ; 02AC _ E9, 000000C5

?_002:  mov     dword [esp], keyinfo                    ; 02B1 _ C7. 04 24, 00000008(d)
        call    fifo8_status                            ; 02B8 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 02BD _ 85. C0
        je      ?_003                                   ; 02BF _ 0F 84, 00000083
        call    io_sti                                  ; 02C5 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 02CA _ C7. 04 24, 00000008(d)
        call    fifo8_get                               ; 02D1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 02D6 _ 89. 45, F4
        cmp     dword [ebp-0CH], 28                     ; 02D9 _ 83. 7D, F4, 1C
        jne     ?_004                                   ; 02DD _ 0F 85, 00000093
        mov     ebx, dword [xsize]                      ; 02E3 _ 8B. 1D, 000000F8(d)
        mov     ecx, dword [buf_back]                   ; 02E9 _ 8B. 0D, 00000100(d)
        mov     edx, dword [ebp-28H]                    ; 02EF _ 8B. 55, D8
        mov     eax, edx                                ; 02F2 _ 89. D0
        shl     eax, 2                                  ; 02F4 _ C1. E0, 02
        add     eax, edx                                ; 02F7 _ 01. D0
        shl     eax, 2                                  ; 02F9 _ C1. E0, 02
        mov     edx, eax                                ; 02FC _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 02FE _ 8B. 45, EC
        add     edx, eax                                ; 0301 _ 01. C2
        mov     dword [esp+18H], 7                      ; 0303 _ C7. 44 24, 18, 00000007
        mov     dword [esp+14H], ebx                    ; 030B _ 89. 5C 24, 14
        mov     eax, dword [ebp-28H]                    ; 030F _ 8B. 45, D8
        mov     dword [esp+10H], eax                    ; 0312 _ 89. 44 24, 10
        mov     dword [esp+0CH], ecx                    ; 0316 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 031A _ 89. 54 24, 08
        mov     eax, dword [ebp-20H]                    ; 031E _ 8B. 45, E0
        mov     dword [esp+4H], eax                     ; 0321 _ 89. 44 24, 04
        mov     eax, dword [ebp-10H]                    ; 0325 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 0328 _ 89. 04 24
        call    showMemoryInfo                          ; 032B _ E8, FFFFFFFC(rel)
        add     dword [ebp-28H], 1                      ; 0330 _ 83. 45, D8, 01
        mov     eax, dword [ebp-28H]                    ; 0334 _ 8B. 45, D8
        cmp     eax, dword [ebp-18H]                    ; 0337 _ 3B. 45, E8
        jge     ?_004                                   ; 033A _ 7D, 3A
        mov     dword [ebp-28H], 0                      ; 033C _ C7. 45, D8, 00000000
        jmp     ?_001                                   ; 0343 _ E9, FFFFFF3A

?_003:  mov     dword [esp], mouseinfo                  ; 0348 _ C7. 04 24, 00000020(d)
        call    fifo8_status                            ; 034F _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0354 _ 85. C0
        jz      ?_004                                   ; 0356 _ 74, 1E
        mov     eax, dword [ebp-1CH]                    ; 0358 _ 8B. 45, E4
        mov     dword [esp+8H], eax                     ; 035B _ 89. 44 24, 08
        mov     eax, dword [ebp-20H]                    ; 035F _ 8B. 45, E0
        mov     dword [esp+4H], eax                     ; 0362 _ 89. 44 24, 04
        mov     eax, dword [ebp-10H]                    ; 0366 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 0369 _ 89. 04 24
        call    show_mouse_info                         ; 036C _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0371 _ E9, FFFFFF0C

?_004:  jmp     ?_001                                   ; 0376 _ E9, FFFFFF07
; CMain End of function

init_screen8:; Function begin
        push    ebp                                     ; 037B _ 55
        mov     ebp, esp                                ; 037C _ 89. E5
        push    ebx                                     ; 037E _ 53
        sub     esp, 36                                 ; 037F _ 83. EC, 24
        mov     eax, dword [ebp+10H]                    ; 0382 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 0385 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 0388 _ 8B. 45, 0C
        sub     eax, 1                                  ; 038B _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 038E _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 0392 _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 0396 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 039E _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 14                      ; 03A6 _ C7. 44 24, 08, 0000000E
        mov     eax, dword [ebp+0CH]                    ; 03AE _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 03B1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 03B5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 03B8 _ 89. 04 24
        call    boxfill8                                ; 03BB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 03C0 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 03C3 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 03C6 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 03C9 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 03CC _ 8B. 45, 10
        sub     eax, 28                                 ; 03CF _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 03D2 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 03D6 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 03DA _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 03DE _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 03E6 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 03EE _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 03F1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 03F5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 03F8 _ 89. 04 24
        call    boxfill8                                ; 03FB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0400 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 0403 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 0406 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0409 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 040C _ 8B. 45, 10
        sub     eax, 27                                 ; 040F _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 0412 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0416 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 041A _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 041E _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 0426 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 042E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0431 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0435 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0438 _ 89. 04 24
        call    boxfill8                                ; 043B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0440 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 0443 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 0446 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0449 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 044C _ 8B. 45, 10
        sub     eax, 26                                 ; 044F _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 0452 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0456 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 045A _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 045E _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0466 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 046E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0471 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0475 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0478 _ 89. 04 24
        call    boxfill8                                ; 047B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0480 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0483 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 0486 _ 8B. 45, 10
        sub     eax, 24                                 ; 0489 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 048C _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0490 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0498 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 049C _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 04A4 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 04AC _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 04AF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 04B3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 04B6 _ 89. 04 24
        call    boxfill8                                ; 04B9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 04BE _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 04C1 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 04C4 _ 8B. 45, 10
        sub     eax, 24                                 ; 04C7 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 04CA _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 04CE _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 04D6 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 04DA _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 04E2 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 04EA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 04ED _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 04F1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 04F4 _ 89. 04 24
        call    boxfill8                                ; 04F7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 04FC _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 04FF _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0502 _ 8B. 45, 10
        sub     eax, 4                                  ; 0505 _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 0508 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 050C _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0514 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0518 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 15                      ; 0520 _ C7. 44 24, 08, 0000000F
        mov     eax, dword [ebp+0CH]                    ; 0528 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 052B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 052F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0532 _ 89. 04 24
        call    boxfill8                                ; 0535 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 053A _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 053D _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 0540 _ 8B. 45, 10
        sub     eax, 23                                 ; 0543 _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 0546 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 054A _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0552 _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 0556 _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 15                      ; 055E _ C7. 44 24, 08, 0000000F
        mov     eax, dword [ebp+0CH]                    ; 0566 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0569 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 056D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0570 _ 89. 04 24
        call    boxfill8                                ; 0573 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0578 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 057B _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 057E _ 8B. 45, 10
        sub     eax, 3                                  ; 0581 _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 0584 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0588 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0590 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0594 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 059C _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 05A4 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 05A7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 05AB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 05AE _ 89. 04 24
        call    boxfill8                                ; 05B1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 05B6 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 05B9 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 05BC _ 8B. 45, 10
        sub     eax, 24                                 ; 05BF _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 05C2 _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 05C6 _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 05CE _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 05D2 _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 05DA _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 05E2 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 05E5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 05E9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 05EC _ 89. 04 24
        call    boxfill8                                ; 05EF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 05F4 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 05F7 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 05FA _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 05FD _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0600 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0603 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0606 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0609 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 060C _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0610 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0614 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0618 _ 89. 44 24, 0C
        mov     dword [esp+8H], 15                      ; 061C _ C7. 44 24, 08, 0000000F
        mov     eax, dword [ebp+0CH]                    ; 0624 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0627 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 062B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 062E _ 89. 04 24
        call    boxfill8                                ; 0631 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0636 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 0639 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 063C _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 063F _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 0642 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 0645 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 0648 _ 8B. 45, 0C
        sub     eax, 47                                 ; 064B _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 064E _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0652 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0656 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 065A _ 89. 44 24, 0C
        mov     dword [esp+8H], 15                      ; 065E _ C7. 44 24, 08, 0000000F
        mov     eax, dword [ebp+0CH]                    ; 0666 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0669 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 066D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0670 _ 89. 04 24
        call    boxfill8                                ; 0673 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0678 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 067B _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 067E _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0681 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0684 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0687 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 068A _ 8B. 45, 0C
        sub     eax, 47                                 ; 068D _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0690 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0694 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0698 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 069C _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 06A0 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 06A8 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 06AB _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 06AF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 06B2 _ 89. 04 24
        call    boxfill8                                ; 06B5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 06BA _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 06BD _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 06C0 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 06C3 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 06C6 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 06C9 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 06CC _ 8B. 45, 0C
        sub     eax, 3                                  ; 06CF _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 06D2 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 06D6 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 06DA _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 06DE _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 06E2 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 06EA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 06ED _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 06F1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 06F4 _ 89. 04 24
        call    boxfill8                                ; 06F7 _ E8, FFFFFFFC(rel)
        add     esp, 36                                 ; 06FC _ 83. C4, 24
        pop     ebx                                     ; 06FF _ 5B
        pop     ebp                                     ; 0700 _ 5D
        ret                                             ; 0701 _ C3
; init_screen8 End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 0702 _ 55
        mov     ebp, esp                                ; 0703 _ 89. E5
        sub     esp, 40                                 ; 0705 _ 83. EC, 28
        mov     eax, dword [ebp+10H]                    ; 0708 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 070B _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 070E _ A1, 000000F0(d)
        add     eax, edx                                ; 0713 _ 01. D0
        mov     dword [mx], eax                         ; 0715 _ A3, 000000F0(d)
        mov     eax, dword [ebp+10H]                    ; 071A _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 071D _ 8B. 50, 08
        mov     eax, dword [my]                         ; 0720 _ A1, 000000F4(d)
        add     eax, edx                                ; 0725 _ 01. D0
        mov     dword [my], eax                         ; 0727 _ A3, 000000F4(d)
        mov     eax, dword [mx]                         ; 072C _ A1, 000000F0(d)
        test    eax, eax                                ; 0731 _ 85. C0
        jns     ?_005                                   ; 0733 _ 79, 0A
        mov     dword [mx], 0                           ; 0735 _ C7. 05, 000000F0(d), 00000000
?_005:  mov     eax, dword [my]                         ; 073F _ A1, 000000F4(d)
        test    eax, eax                                ; 0744 _ 85. C0
        jns     ?_006                                   ; 0746 _ 79, 0A
        mov     dword [my], 0                           ; 0748 _ C7. 05, 000000F4(d), 00000000
?_006:  mov     eax, dword [xsize]                      ; 0752 _ A1, 000000F8(d)
        lea     edx, [eax-10H]                          ; 0757 _ 8D. 50, F0
        mov     eax, dword [mx]                         ; 075A _ A1, 000000F0(d)
        cmp     edx, eax                                ; 075F _ 39. C2
        jge     ?_007                                   ; 0761 _ 7D, 0D
        mov     eax, dword [xsize]                      ; 0763 _ A1, 000000F8(d)
        sub     eax, 16                                 ; 0768 _ 83. E8, 10
        mov     dword [mx], eax                         ; 076B _ A3, 000000F0(d)
?_007:  mov     eax, dword [ysize]                      ; 0770 _ A1, 000000FC(d)
        lea     edx, [eax-10H]                          ; 0775 _ 8D. 50, F0
        mov     eax, dword [my]                         ; 0778 _ A1, 000000F4(d)
        cmp     edx, eax                                ; 077D _ 39. C2
        jge     ?_008                                   ; 077F _ 7D, 0D
        mov     eax, dword [ysize]                      ; 0781 _ A1, 000000FC(d)
        sub     eax, 16                                 ; 0786 _ 83. E8, 10
        mov     dword [my], eax                         ; 0789 _ A3, 000000F4(d)
?_008:  mov     dword [esp+14H], ?_119                  ; 078E _ C7. 44 24, 14, 00000000(d)
        mov     dword [esp+10H], 7                      ; 0796 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 0                      ; 079E _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 07A6 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 07AE _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 07B1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 07B5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 07B8 _ 89. 04 24
        call    showString                              ; 07BB _ E8, FFFFFFFC(rel)
        leave                                           ; 07C0 _ C9
        ret                                             ; 07C1 _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 07C2 _ 55
        mov     ebp, esp                                ; 07C3 _ 89. E5
        sub     esp, 40                                 ; 07C5 _ 83. EC, 28
        mov     eax, dword [buf_back]                   ; 07C8 _ A1, 00000100(d)
        mov     dword [ebp-0CH], eax                    ; 07CD _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 07D0 _ C6. 45, F3, 00
        call    io_sti                                  ; 07D4 _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 07D9 _ C7. 04 24, 00000020(d)
        call    fifo8_get                               ; 07E0 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-0DH], al                      ; 07E5 _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 07E8 _ 0F B6. 45, F3
        mov     dword [esp+4H], eax                     ; 07EC _ 89. 44 24, 04
        mov     dword [esp], mdec                       ; 07F0 _ C7. 04 24, 000000E0(d)
        call    mouse_decode                            ; 07F7 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 07FC _ 85. C0
        jz      ?_009                                   ; 07FE _ 74, 3F
        mov     dword [esp+8H], mdec                    ; 0800 _ C7. 44 24, 08, 000000E0(d)
        mov     eax, dword [ebp+0CH]                    ; 0808 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 080B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 080F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0812 _ 89. 04 24
        call    computeMousePosition                    ; 0815 _ E8, FFFFFFFC(rel)
        mov     edx, dword [my]                         ; 081A _ 8B. 15, 000000F4(d)
        mov     eax, dword [mx]                         ; 0820 _ A1, 000000F0(d)
        mov     dword [esp+0CH], edx                    ; 0825 _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 0829 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 082D _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 0830 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0834 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0837 _ 89. 04 24
        call    sheet_slide                             ; 083A _ E8, FFFFFFFC(rel)
?_009:  leave                                           ; 083F _ C9
        ret                                             ; 0840 _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 0841 _ 55
        mov     ebp, esp                                ; 0842 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0844 _ 8B. 45, 08
        mov     dword [eax], 655360                     ; 0847 _ C7. 00, 000A0000
        mov     eax, dword [ebp+8H]                     ; 084D _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 0850 _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 0856 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 0859 _ 66: C7. 40, 06, 00C8
        pop     ebp                                     ; 085F _ 5D
        ret                                             ; 0860 _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 0861 _ 55
        mov     ebp, esp                                ; 0862 _ 89. E5
        push    ebx                                     ; 0864 _ 53
        sub     esp, 52                                 ; 0865 _ 83. EC, 34
        mov     eax, dword [ebp+18H]                    ; 0868 _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 086B _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 086E _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 0871 _ 89. 45, F4
        jmp     ?_011                                   ; 0874 _ EB, 4B

?_010:  mov     eax, dword [ebp+1CH]                    ; 0876 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 0879 _ 0F B6. 00
        movzx   eax, al                                 ; 087C _ 0F B6. C0
        shl     eax, 4                                  ; 087F _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 0882 _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 0888 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 088C _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 088F _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 0892 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 0895 _ 8B. 00
        mov     dword [esp+14H], ebx                    ; 0897 _ 89. 5C 24, 14
        mov     dword [esp+10H], ecx                    ; 089B _ 89. 4C 24, 10
        mov     ecx, dword [ebp+14H]                    ; 089F _ 8B. 4D, 14
        mov     dword [esp+0CH], ecx                    ; 08A2 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp+10H]                    ; 08A6 _ 8B. 4D, 10
        mov     dword [esp+8H], ecx                     ; 08A9 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 08AD _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 08B1 _ 89. 04 24
        call    showFont8                               ; 08B4 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 08B9 _ 83. 45, 10, 08
        add     dword [ebp+1CH], 1                      ; 08BD _ 83. 45, 1C, 01
?_011:  mov     eax, dword [ebp+1CH]                    ; 08C1 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 08C4 _ 0F B6. 00
        test    al, al                                  ; 08C7 _ 84. C0
        jnz     ?_010                                   ; 08C9 _ 75, AB
        mov     eax, dword [ebp+14H]                    ; 08CB _ 8B. 45, 14
        add     eax, 16                                 ; 08CE _ 83. C0, 10
        mov     dword [esp+14H], eax                    ; 08D1 _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 08D5 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 08D8 _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 08DC _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 08DF _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 08E3 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 08E6 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 08EA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 08ED _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 08F1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 08F4 _ 89. 04 24
        call    sheet_refresh                           ; 08F7 _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 08FC _ 83. C4, 34
        pop     ebx                                     ; 08FF _ 5B
        pop     ebp                                     ; 0900 _ 5D
        ret                                             ; 0901 _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 0902 _ 55
        mov     ebp, esp                                ; 0903 _ 89. E5
        sub     esp, 24                                 ; 0905 _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1639          ; 0908 _ C7. 44 24, 08, 00000020(d)
        mov     dword [esp+4H], 15                      ; 0910 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 0918 _ C7. 04 24, 00000000
        call    set_palette                             ; 091F _ E8, FFFFFFFC(rel)
        nop                                             ; 0924 _ 90
        leave                                           ; 0925 _ C9
        ret                                             ; 0926 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0927 _ 55
        mov     ebp, esp                                ; 0928 _ 89. E5
        sub     esp, 40                                 ; 092A _ 83. EC, 28
        call    io_load_eflags                          ; 092D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0932 _ 89. 45, F4
        call    io_cli                                  ; 0935 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 093A _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 093D _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 0941 _ C7. 04 24, 000003C8
        call    io_out8                                 ; 0948 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 094D _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 0950 _ 89. 45, F0
        jmp     ?_013                                   ; 0953 _ EB, 62

?_012:  mov     eax, dword [ebp+10H]                    ; 0955 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 0958 _ 0F B6. 00
        shr     al, 2                                   ; 095B _ C0. E8, 02
        movzx   eax, al                                 ; 095E _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0961 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0965 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 096C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0971 _ 8B. 45, 10
        add     eax, 1                                  ; 0974 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 0977 _ 0F B6. 00
        shr     al, 2                                   ; 097A _ C0. E8, 02
        movzx   eax, al                                 ; 097D _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0980 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0984 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 098B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0990 _ 8B. 45, 10
        add     eax, 2                                  ; 0993 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 0996 _ 0F B6. 00
        shr     al, 2                                   ; 0999 _ C0. E8, 02
        movzx   eax, al                                 ; 099C _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 099F _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 09A3 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 09AA _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 09AF _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 09B3 _ 83. 45, F0, 01
?_013:  mov     eax, dword [ebp-10H]                    ; 09B7 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 09BA _ 3B. 45, 0C
        jle     ?_012                                   ; 09BD _ 7E, 96
        mov     eax, dword [ebp-0CH]                    ; 09BF _ 8B. 45, F4
        mov     dword [esp], eax                        ; 09C2 _ 89. 04 24
        call    io_store_eflags                         ; 09C5 _ E8, FFFFFFFC(rel)
        nop                                             ; 09CA _ 90
        leave                                           ; 09CB _ C9
        ret                                             ; 09CC _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 09CD _ 55
        mov     ebp, esp                                ; 09CE _ 89. E5
        sub     esp, 20                                 ; 09D0 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 09D3 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 09D6 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 09D9 _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 09DC _ 89. 45, FC
        jmp     ?_017                                   ; 09DF _ EB, 33

?_014:  mov     eax, dword [ebp+14H]                    ; 09E1 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 09E4 _ 89. 45, F8
        jmp     ?_016                                   ; 09E7 _ EB, 1F

?_015:  mov     eax, dword [ebp-4H]                     ; 09E9 _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 09EC _ 0F AF. 45, 0C
        mov     edx, eax                                ; 09F0 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 09F2 _ 8B. 45, F8
        add     eax, edx                                ; 09F5 _ 01. D0
        mov     edx, eax                                ; 09F7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 09F9 _ 8B. 45, 08
        add     edx, eax                                ; 09FC _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 09FE _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0A02 _ 88. 02
        add     dword [ebp-8H], 1                       ; 0A04 _ 83. 45, F8, 01
?_016:  mov     eax, dword [ebp-8H]                     ; 0A08 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0A0B _ 3B. 45, 1C
        jle     ?_015                                   ; 0A0E _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0A10 _ 83. 45, FC, 01
?_017:  mov     eax, dword [ebp-4H]                     ; 0A14 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 0A17 _ 3B. 45, 20
        jle     ?_014                                   ; 0A1A _ 7E, C5
        leave                                           ; 0A1C _ C9
        ret                                             ; 0A1D _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 0A1E _ 55
        mov     ebp, esp                                ; 0A1F _ 89. E5
        sub     esp, 20                                 ; 0A21 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 0A24 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 0A27 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0A2A _ C7. 45, FC, 00000000
        jmp     ?_027                                   ; 0A31 _ E9, 0000016C

?_018:  mov     edx, dword [ebp-4H]                     ; 0A36 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 0A39 _ 8B. 45, 1C
        add     eax, edx                                ; 0A3C _ 01. D0
        movzx   eax, byte [eax]                         ; 0A3E _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 0A41 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 0A44 _ 80. 7D, FB, 00
        jns     ?_019                                   ; 0A48 _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 0A4A _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0A4D _ 8B. 55, 14
        add     eax, edx                                ; 0A50 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0A52 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0A56 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0A58 _ 8B. 45, 10
        add     eax, edx                                ; 0A5B _ 01. D0
        mov     edx, eax                                ; 0A5D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A5F _ 8B. 45, 08
        add     edx, eax                                ; 0A62 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0A64 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0A68 _ 88. 02
?_019:  movsx   eax, byte [ebp-5H]                      ; 0A6A _ 0F BE. 45, FB
        and     eax, 40H                                ; 0A6E _ 83. E0, 40
        test    eax, eax                                ; 0A71 _ 85. C0
        jz      ?_020                                   ; 0A73 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0A75 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0A78 _ 8B. 55, 14
        add     eax, edx                                ; 0A7B _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0A7D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0A81 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0A83 _ 8B. 45, 10
        add     eax, edx                                ; 0A86 _ 01. D0
        lea     edx, [eax+1H]                           ; 0A88 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0A8B _ 8B. 45, 08
        add     edx, eax                                ; 0A8E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0A90 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0A94 _ 88. 02
?_020:  movsx   eax, byte [ebp-5H]                      ; 0A96 _ 0F BE. 45, FB
        and     eax, 20H                                ; 0A9A _ 83. E0, 20
        test    eax, eax                                ; 0A9D _ 85. C0
        jz      ?_021                                   ; 0A9F _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0AA1 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0AA4 _ 8B. 55, 14
        add     eax, edx                                ; 0AA7 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0AA9 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0AAD _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0AAF _ 8B. 45, 10
        add     eax, edx                                ; 0AB2 _ 01. D0
        lea     edx, [eax+2H]                           ; 0AB4 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0AB7 _ 8B. 45, 08
        add     edx, eax                                ; 0ABA _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0ABC _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0AC0 _ 88. 02
?_021:  movsx   eax, byte [ebp-5H]                      ; 0AC2 _ 0F BE. 45, FB
        and     eax, 10H                                ; 0AC6 _ 83. E0, 10
        test    eax, eax                                ; 0AC9 _ 85. C0
        jz      ?_022                                   ; 0ACB _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0ACD _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0AD0 _ 8B. 55, 14
        add     eax, edx                                ; 0AD3 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0AD5 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0AD9 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0ADB _ 8B. 45, 10
        add     eax, edx                                ; 0ADE _ 01. D0
        lea     edx, [eax+3H]                           ; 0AE0 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 0AE3 _ 8B. 45, 08
        add     edx, eax                                ; 0AE6 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0AE8 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0AEC _ 88. 02
?_022:  movsx   eax, byte [ebp-5H]                      ; 0AEE _ 0F BE. 45, FB
        and     eax, 08H                                ; 0AF2 _ 83. E0, 08
        test    eax, eax                                ; 0AF5 _ 85. C0
        jz      ?_023                                   ; 0AF7 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0AF9 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0AFC _ 8B. 55, 14
        add     eax, edx                                ; 0AFF _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0B01 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0B05 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0B07 _ 8B. 45, 10
        add     eax, edx                                ; 0B0A _ 01. D0
        lea     edx, [eax+4H]                           ; 0B0C _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0B0F _ 8B. 45, 08
        add     edx, eax                                ; 0B12 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0B14 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0B18 _ 88. 02
?_023:  movsx   eax, byte [ebp-5H]                      ; 0B1A _ 0F BE. 45, FB
        and     eax, 04H                                ; 0B1E _ 83. E0, 04
        test    eax, eax                                ; 0B21 _ 85. C0
        jz      ?_024                                   ; 0B23 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0B25 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0B28 _ 8B. 55, 14
        add     eax, edx                                ; 0B2B _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0B2D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0B31 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0B33 _ 8B. 45, 10
        add     eax, edx                                ; 0B36 _ 01. D0
        lea     edx, [eax+5H]                           ; 0B38 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 0B3B _ 8B. 45, 08
        add     edx, eax                                ; 0B3E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0B40 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0B44 _ 88. 02
?_024:  movsx   eax, byte [ebp-5H]                      ; 0B46 _ 0F BE. 45, FB
        and     eax, 02H                                ; 0B4A _ 83. E0, 02
        test    eax, eax                                ; 0B4D _ 85. C0
        jz      ?_025                                   ; 0B4F _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0B51 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0B54 _ 8B. 55, 14
        add     eax, edx                                ; 0B57 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0B59 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0B5D _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0B5F _ 8B. 45, 10
        add     eax, edx                                ; 0B62 _ 01. D0
        lea     edx, [eax+6H]                           ; 0B64 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 0B67 _ 8B. 45, 08
        add     edx, eax                                ; 0B6A _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0B6C _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0B70 _ 88. 02
?_025:  movsx   eax, byte [ebp-5H]                      ; 0B72 _ 0F BE. 45, FB
        and     eax, 01H                                ; 0B76 _ 83. E0, 01
        test    eax, eax                                ; 0B79 _ 85. C0
        jz      ?_026                                   ; 0B7B _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0B7D _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0B80 _ 8B. 55, 14
        add     eax, edx                                ; 0B83 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0B85 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0B89 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0B8B _ 8B. 45, 10
        add     eax, edx                                ; 0B8E _ 01. D0
        lea     edx, [eax+7H]                           ; 0B90 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 0B93 _ 8B. 45, 08
        add     edx, eax                                ; 0B96 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0B98 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0B9C _ 88. 02
?_026:  add     dword [ebp-4H], 1                       ; 0B9E _ 83. 45, FC, 01
?_027:  cmp     dword [ebp-4H], 15                      ; 0BA2 _ 83. 7D, FC, 0F
        jle     ?_018                                   ; 0BA6 _ 0F 8E, FFFFFE8A
        leave                                           ; 0BAC _ C9
        ret                                             ; 0BAD _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 0BAE _ 55
        mov     ebp, esp                                ; 0BAF _ 89. E5
        sub     esp, 20                                 ; 0BB1 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 0BB4 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0BB7 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0BBA _ C7. 45, FC, 00000000
        jmp     ?_034                                   ; 0BC1 _ E9, 000000B1

?_028:  mov     dword [ebp-8H], 0                       ; 0BC6 _ C7. 45, F8, 00000000
        jmp     ?_033                                   ; 0BCD _ E9, 00000097

?_029:  mov     eax, dword [ebp-4H]                     ; 0BD2 _ 8B. 45, FC
        shl     eax, 4                                  ; 0BD5 _ C1. E0, 04
        mov     edx, eax                                ; 0BD8 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0BDA _ 8B. 45, F8
        add     eax, edx                                ; 0BDD _ 01. D0
        add     eax, cursor.1686                        ; 0BDF _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 0BE4 _ 0F B6. 00
        cmp     al, 42                                  ; 0BE7 _ 3C, 2A
        jnz     ?_030                                   ; 0BE9 _ 75, 17
        mov     eax, dword [ebp-4H]                     ; 0BEB _ 8B. 45, FC
        shl     eax, 4                                  ; 0BEE _ C1. E0, 04
        mov     edx, eax                                ; 0BF1 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0BF3 _ 8B. 45, F8
        add     eax, edx                                ; 0BF6 _ 01. D0
        mov     edx, eax                                ; 0BF8 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0BFA _ 8B. 45, 08
        add     eax, edx                                ; 0BFD _ 01. D0
        mov     byte [eax], 0                           ; 0BFF _ C6. 00, 00
?_030:  mov     eax, dword [ebp-4H]                     ; 0C02 _ 8B. 45, FC
        shl     eax, 4                                  ; 0C05 _ C1. E0, 04
        mov     edx, eax                                ; 0C08 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0C0A _ 8B. 45, F8
        add     eax, edx                                ; 0C0D _ 01. D0
        add     eax, cursor.1686                        ; 0C0F _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 0C14 _ 0F B6. 00
        cmp     al, 79                                  ; 0C17 _ 3C, 4F
        jnz     ?_031                                   ; 0C19 _ 75, 17
        mov     eax, dword [ebp-4H]                     ; 0C1B _ 8B. 45, FC
        shl     eax, 4                                  ; 0C1E _ C1. E0, 04
        mov     edx, eax                                ; 0C21 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0C23 _ 8B. 45, F8
        add     eax, edx                                ; 0C26 _ 01. D0
        mov     edx, eax                                ; 0C28 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0C2A _ 8B. 45, 08
        add     eax, edx                                ; 0C2D _ 01. D0
        mov     byte [eax], 7                           ; 0C2F _ C6. 00, 07
?_031:  mov     eax, dword [ebp-4H]                     ; 0C32 _ 8B. 45, FC
        shl     eax, 4                                  ; 0C35 _ C1. E0, 04
        mov     edx, eax                                ; 0C38 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0C3A _ 8B. 45, F8
        add     eax, edx                                ; 0C3D _ 01. D0
        add     eax, cursor.1686                        ; 0C3F _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 0C44 _ 0F B6. 00
        cmp     al, 46                                  ; 0C47 _ 3C, 2E
        jnz     ?_032                                   ; 0C49 _ 75, 1A
        mov     eax, dword [ebp-4H]                     ; 0C4B _ 8B. 45, FC
        shl     eax, 4                                  ; 0C4E _ C1. E0, 04
        mov     edx, eax                                ; 0C51 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0C53 _ 8B. 45, F8
        add     eax, edx                                ; 0C56 _ 01. D0
        mov     edx, eax                                ; 0C58 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0C5A _ 8B. 45, 08
        add     edx, eax                                ; 0C5D _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0C5F _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0C63 _ 88. 02
?_032:  add     dword [ebp-8H], 1                       ; 0C65 _ 83. 45, F8, 01
?_033:  cmp     dword [ebp-8H], 15                      ; 0C69 _ 83. 7D, F8, 0F
        jle     ?_029                                   ; 0C6D _ 0F 8E, FFFFFF5F
        add     dword [ebp-4H], 1                       ; 0C73 _ 83. 45, FC, 01
?_034:  cmp     dword [ebp-4H], 15                      ; 0C77 _ 83. 7D, FC, 0F
        jle     ?_028                                   ; 0C7B _ 0F 8E, FFFFFF45
        leave                                           ; 0C81 _ C9
        ret                                             ; 0C82 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 0C83 _ 55
        mov     ebp, esp                                ; 0C84 _ 89. E5
        sub     esp, 16                                 ; 0C86 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 0C89 _ C7. 45, FC, 00000000
        jmp     ?_038                                   ; 0C90 _ EB, 50

?_035:  mov     dword [ebp-8H], 0                       ; 0C92 _ C7. 45, F8, 00000000
        jmp     ?_037                                   ; 0C99 _ EB, 3B

?_036:  mov     eax, dword [ebp-4H]                     ; 0C9B _ 8B. 45, FC
        mov     edx, dword [ebp+1CH]                    ; 0C9E _ 8B. 55, 1C
        add     eax, edx                                ; 0CA1 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0CA3 _ 0F AF. 45, 0C
        mov     edx, dword [ebp-8H]                     ; 0CA7 _ 8B. 55, F8
        mov     ecx, dword [ebp+18H]                    ; 0CAA _ 8B. 4D, 18
        add     edx, ecx                                ; 0CAD _ 01. CA
        add     eax, edx                                ; 0CAF _ 01. D0
        mov     edx, eax                                ; 0CB1 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0CB3 _ 8B. 45, 08
        add     edx, eax                                ; 0CB6 _ 01. C2
        mov     eax, dword [ebp-4H]                     ; 0CB8 _ 8B. 45, FC
        imul    eax, dword [ebp+24H]                    ; 0CBB _ 0F AF. 45, 24
        mov     ecx, eax                                ; 0CBF _ 89. C1
        mov     eax, dword [ebp-8H]                     ; 0CC1 _ 8B. 45, F8
        add     eax, ecx                                ; 0CC4 _ 01. C8
        mov     ecx, eax                                ; 0CC6 _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 0CC8 _ 8B. 45, 20
        add     eax, ecx                                ; 0CCB _ 01. C8
        movzx   eax, byte [eax]                         ; 0CCD _ 0F B6. 00
        mov     byte [edx], al                          ; 0CD0 _ 88. 02
        add     dword [ebp-8H], 1                       ; 0CD2 _ 83. 45, F8, 01
?_037:  mov     eax, dword [ebp-8H]                     ; 0CD6 _ 8B. 45, F8
        cmp     eax, dword [ebp+10H]                    ; 0CD9 _ 3B. 45, 10
        jl      ?_036                                   ; 0CDC _ 7C, BD
        add     dword [ebp-4H], 1                       ; 0CDE _ 83. 45, FC, 01
?_038:  mov     eax, dword [ebp-4H]                     ; 0CE2 _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 0CE5 _ 3B. 45, 14
        jl      ?_035                                   ; 0CE8 _ 7C, A8
        leave                                           ; 0CEA _ C9
        ret                                             ; 0CEB _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 0CEC _ 55
        mov     ebp, esp                                ; 0CED _ 89. E5
        sub     esp, 40                                 ; 0CEF _ 83. EC, 28
        mov     eax, dword [bootInfo]                   ; 0CF2 _ A1, 00000000(d)
        mov     dword [ebp-14H], eax                    ; 0CF7 _ 89. 45, EC
        movzx   eax, word [?_128]                       ; 0CFA _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0D01 _ 98
        mov     dword [ebp-10H], eax                    ; 0D02 _ 89. 45, F0
        movzx   eax, word [?_129]                       ; 0D05 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 0D0C _ 98
        mov     dword [ebp-0CH], eax                    ; 0D0D _ 89. 45, F4
        mov     dword [esp+4H], 32                      ; 0D10 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 0D18 _ C7. 04 24, 00000020
        call    io_out8                                 ; 0D1F _ E8, FFFFFFFC(rel)
        mov     byte [ebp-15H], 0                       ; 0D24 _ C6. 45, EB, 00
        mov     dword [esp], 96                         ; 0D28 _ C7. 04 24, 00000060
        call    io_in8                                  ; 0D2F _ E8, FFFFFFFC(rel)
        mov     byte [ebp-15H], al                      ; 0D34 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 0D37 _ 0F B6. 45, EB
        mov     dword [esp+4H], eax                     ; 0D3B _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 0D3F _ C7. 04 24, 00000008(d)
        call    fifo8_put                               ; 0D46 _ E8, FFFFFFFC(rel)
        nop                                             ; 0D4B _ 90
        leave                                           ; 0D4C _ C9
        ret                                             ; 0D4D _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 0D4E _ 55
        mov     ebp, esp                                ; 0D4F _ 89. E5
        sub     esp, 4                                  ; 0D51 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 0D54 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 0D57 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 0D5A _ 80. 7D, FC, 09
        jle     ?_039                                   ; 0D5E _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 0D60 _ 0F B6. 45, FC
        add     eax, 55                                 ; 0D64 _ 83. C0, 37
        jmp     ?_040                                   ; 0D67 _ EB, 07

?_039:  movzx   eax, byte [ebp-4H]                      ; 0D69 _ 0F B6. 45, FC
        add     eax, 48                                 ; 0D6D _ 83. C0, 30
?_040:  leave                                           ; 0D70 _ C9
        ret                                             ; 0D71 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 0D72 _ 55
        mov     ebp, esp                                ; 0D73 _ 89. E5
        sub     esp, 24                                 ; 0D75 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 0D78 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 0D7B _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0D7E _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 0D85 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 0D89 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 0D8C _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 0D8F _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 0D93 _ 89. 04 24
        call    charToHexVal                            ; 0D96 _ E8, FFFFFFFC(rel)
        mov     byte [?_127], al                        ; 0D9B _ A2, 00000007(d)
        movzx   eax, byte [ebp-14H]                     ; 0DA0 _ 0F B6. 45, EC
        shr     al, 4                                   ; 0DA4 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 0DA7 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 0DAA _ 0F B6. 45, EC
        movsx   eax, al                                 ; 0DAE _ 0F BE. C0
        mov     dword [esp], eax                        ; 0DB1 _ 89. 04 24
        call    charToHexVal                            ; 0DB4 _ E8, FFFFFFFC(rel)
        mov     byte [?_126], al                        ; 0DB9 _ A2, 00000006(d)
        mov     eax, keyval                             ; 0DBE _ B8, 00000004(d)
        leave                                           ; 0DC3 _ C9
        ret                                             ; 0DC4 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 0DC5 _ 55
        mov     ebp, esp                                ; 0DC6 _ 89. E5
        sub     esp, 16                                 ; 0DC8 _ 83. EC, 10
        mov     byte [str.1734], 48                     ; 0DCB _ C6. 05, 00000220(d), 30
        mov     byte [?_130], 88                        ; 0DD2 _ C6. 05, 00000221(d), 58
        mov     byte [?_131], 0                         ; 0DD9 _ C6. 05, 0000022A(d), 00
        mov     dword [ebp-0CH], 2                      ; 0DE0 _ C7. 45, F4, 00000002
        jmp     ?_042                                   ; 0DE7 _ EB, 0F

?_041:  mov     eax, dword [ebp-0CH]                    ; 0DE9 _ 8B. 45, F4
        add     eax, str.1734                           ; 0DEC _ 05, 00000220(d)
        mov     byte [eax], 48                          ; 0DF1 _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 0DF4 _ 83. 45, F4, 01
?_042:  cmp     dword [ebp-0CH], 9                      ; 0DF8 _ 83. 7D, F4, 09
        jle     ?_041                                   ; 0DFC _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 0DFE _ C7. 45, F8, 00000009
        jmp     ?_046                                   ; 0E05 _ EB, 40

?_043:  mov     eax, dword [ebp+8H]                     ; 0E07 _ 8B. 45, 08
        and     eax, 0FH                                ; 0E0A _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 0E0D _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0E10 _ 8B. 45, 08
        shr     eax, 4                                  ; 0E13 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 0E16 _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 0E19 _ 83. 7D, FC, 09
        jle     ?_044                                   ; 0E1D _ 7E, 13
        mov     eax, dword [ebp-4H]                     ; 0E1F _ 8B. 45, FC
        add     eax, 55                                 ; 0E22 _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 0E25 _ 8B. 55, F8
        add     edx, str.1734                           ; 0E28 _ 81. C2, 00000220(d)
        mov     byte [edx], al                          ; 0E2E _ 88. 02
        jmp     ?_045                                   ; 0E30 _ EB, 11

?_044:  mov     eax, dword [ebp-4H]                     ; 0E32 _ 8B. 45, FC
        add     eax, 48                                 ; 0E35 _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 0E38 _ 8B. 55, F8
        add     edx, str.1734                           ; 0E3B _ 81. C2, 00000220(d)
        mov     byte [edx], al                          ; 0E41 _ 88. 02
?_045:  sub     dword [ebp-8H], 1                       ; 0E43 _ 83. 6D, F8, 01
?_046:  cmp     dword [ebp-8H], 1                       ; 0E47 _ 83. 7D, F8, 01
        jle     ?_047                                   ; 0E4B _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 0E4D _ 83. 7D, 08, 00
        jnz     ?_043                                   ; 0E51 _ 75, B4
?_047:  mov     eax, str.1734                           ; 0E53 _ B8, 00000220(d)
        leave                                           ; 0E58 _ C9
        ret                                             ; 0E59 _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 0E5A _ 55
        mov     ebp, esp                                ; 0E5B _ 89. E5
        sub     esp, 24                                 ; 0E5D _ 83. EC, 18
?_048:  mov     dword [esp], 100                        ; 0E60 _ C7. 04 24, 00000064
        call    io_in8                                  ; 0E67 _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 0E6C _ 83. E0, 02
        test    eax, eax                                ; 0E6F _ 85. C0
        jnz     ?_049                                   ; 0E71 _ 75, 02
        jmp     ?_050                                   ; 0E73 _ EB, 02

?_049:  jmp     ?_048                                   ; 0E75 _ EB, E9

?_050:  leave                                           ; 0E77 _ C9
        ret                                             ; 0E78 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 0E79 _ 55
        mov     ebp, esp                                ; 0E7A _ 89. E5
        sub     esp, 24                                 ; 0E7C _ 83. EC, 18
        call    wait_KBC_sendready                      ; 0E7F _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 0E84 _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 0E8C _ C7. 04 24, 00000064
        call    io_out8                                 ; 0E93 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 0E98 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 0E9D _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 0EA5 _ C7. 04 24, 00000060
        call    io_out8                                 ; 0EAC _ E8, FFFFFFFC(rel)
        nop                                             ; 0EB1 _ 90
        leave                                           ; 0EB2 _ C9
        ret                                             ; 0EB3 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 0EB4 _ 55
        mov     ebp, esp                                ; 0EB5 _ 89. E5
        sub     esp, 24                                 ; 0EB7 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 0EBA _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 0EBF _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 0EC7 _ C7. 04 24, 00000064
        call    io_out8                                 ; 0ECE _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 0ED3 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 0ED8 _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 0EE0 _ C7. 04 24, 00000060
        call    io_out8                                 ; 0EE7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0EEC _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 0EEF _ C6. 40, 03, 00
        nop                                             ; 0EF3 _ 90
        leave                                           ; 0EF4 _ C9
        ret                                             ; 0EF5 _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 0EF6 _ 55
        mov     ebp, esp                                ; 0EF7 _ 89. E5
        sub     esp, 40                                 ; 0EF9 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 0EFC _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 0F04 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 0F0B _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 0F10 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 0F18 _ C7. 04 24, 00000020
        call    io_out8                                 ; 0F1F _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 0F24 _ C7. 04 24, 00000060
        call    io_in8                                  ; 0F2B _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 0F30 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0F33 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 0F37 _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 0F3B _ C7. 04 24, 00000020(d)
        call    fifo8_put                               ; 0F42 _ E8, FFFFFFFC(rel)
        leave                                           ; 0F47 _ C9
        ret                                             ; 0F48 _ C3
; intHandlerForMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 0F49 _ 55
        mov     ebp, esp                                ; 0F4A _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0F4C _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0F4F _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 0F52 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0F55 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 0F58 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 0F5B _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0F5D _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0F60 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 0F63 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0F66 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0F69 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 0F70 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0F73 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 0F7A _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0F7D _ C7. 40, 08, 00000000
        nop                                             ; 0F84 _ 90
        pop     ebp                                     ; 0F85 _ 5D
        ret                                             ; 0F86 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 0F87 _ 55
        mov     ebp, esp                                ; 0F88 _ 89. E5
        sub     esp, 4                                  ; 0F8A _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0F8D _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0F90 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0F93 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0F96 _ 8B. 40, 10
        test    eax, eax                                ; 0F99 _ 85. C0
        jnz     ?_051                                   ; 0F9B _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 0F9D _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 0FA0 _ 8B. 40, 14
        or      eax, 01H                                ; 0FA3 _ 83. C8, 01
        mov     edx, eax                                ; 0FA6 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0FA8 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 0FAB _ 89. 50, 14
        mov     eax, 4294967295                         ; 0FAE _ B8, FFFFFFFF
        jmp     ?_053                                   ; 0FB3 _ EB, 50

?_051:  mov     eax, dword [ebp+8H]                     ; 0FB5 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0FB8 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0FBA _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0FBD _ 8B. 40, 04
        add     edx, eax                                ; 0FC0 _ 01. C2
        movzx   eax, byte [ebp-4H]                      ; 0FC2 _ 0F B6. 45, FC
        mov     byte [edx], al                          ; 0FC6 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 0FC8 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0FCB _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 0FCE _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0FD1 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0FD4 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0FD7 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0FDA _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0FDD _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0FE0 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0FE3 _ 39. C2
        jnz     ?_052                                   ; 0FE5 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0FE7 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0FEA _ C7. 40, 04, 00000000
?_052:  mov     eax, dword [ebp+8H]                     ; 0FF1 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0FF4 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 0FF7 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 0FFA _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0FFD _ 89. 50, 10
        mov     eax, 0                                  ; 1000 _ B8, 00000000
?_053:  leave                                           ; 1005 _ C9
        ret                                             ; 1006 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 1007 _ 55
        mov     ebp, esp                                ; 1008 _ 89. E5
        sub     esp, 16                                 ; 100A _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 100D _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 1010 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 1013 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1016 _ 8B. 40, 0C
        cmp     edx, eax                                ; 1019 _ 39. C2
        jnz     ?_054                                   ; 101B _ 75, 07
        mov     eax, 4294967295                         ; 101D _ B8, FFFFFFFF
        jmp     ?_056                                   ; 1022 _ EB, 51

?_054:  mov     eax, dword [ebp+8H]                     ; 1024 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1027 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 1029 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 102C _ 8B. 40, 08
        add     eax, edx                                ; 102F _ 01. D0
        movzx   eax, byte [eax]                         ; 1031 _ 0F B6. 00
        movzx   eax, al                                 ; 1034 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 1037 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 103A _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 103D _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 1040 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1043 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1046 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1049 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 104C _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 104F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1052 _ 8B. 40, 0C
        cmp     edx, eax                                ; 1055 _ 39. C2
        jnz     ?_055                                   ; 1057 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 1059 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 105C _ C7. 40, 08, 00000000
?_055:  mov     eax, dword [ebp+8H]                     ; 1063 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1066 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 1069 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 106C _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 106F _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 1072 _ 8B. 45, FC
?_056:  leave                                           ; 1075 _ C9
        ret                                             ; 1076 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 1077 _ 55
        mov     ebp, esp                                ; 1078 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 107A _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 107D _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1080 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1083 _ 8B. 40, 10
        sub     edx, eax                                ; 1086 _ 29. C2
        mov     eax, edx                                ; 1088 _ 89. D0
        pop     ebp                                     ; 108A _ 5D
        ret                                             ; 108B _ C3
; fifo8_status End of function

mouse_decode:; Function begin
        push    ebp                                     ; 108C _ 55
        mov     ebp, esp                                ; 108D _ 89. E5
        sub     esp, 4                                  ; 108F _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 1092 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 1095 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1098 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 109B _ 0F B6. 40, 03
        test    al, al                                  ; 109F _ 84. C0
        jnz     ?_058                                   ; 10A1 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 10A3 _ 80. 7D, FC, FA
        jnz     ?_057                                   ; 10A7 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 10A9 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 10AC _ C6. 40, 03, 01
?_057:  mov     eax, 0                                  ; 10B0 _ B8, 00000000
        jmp     ?_065                                   ; 10B5 _ E9, 0000010F

?_058:  mov     eax, dword [ebp+8H]                     ; 10BA _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 10BD _ 0F B6. 40, 03
        cmp     al, 1                                   ; 10C1 _ 3C, 01
        jnz     ?_060                                   ; 10C3 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 10C5 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 10C9 _ 25, 000000C8
        cmp     eax, 8                                  ; 10CE _ 83. F8, 08
        jnz     ?_059                                   ; 10D1 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 10D3 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 10D6 _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 10DA _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 10DC _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 10DF _ C6. 40, 03, 02
?_059:  mov     eax, 0                                  ; 10E3 _ B8, 00000000
        jmp     ?_065                                   ; 10E8 _ E9, 000000DC

?_060:  mov     eax, dword [ebp+8H]                     ; 10ED _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 10F0 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 10F4 _ 3C, 02
        jnz     ?_061                                   ; 10F6 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 10F8 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 10FB _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 10FF _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1102 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 1105 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 1109 _ B8, 00000000
        jmp     ?_065                                   ; 110E _ E9, 000000B6

?_061:  mov     eax, dword [ebp+8H]                     ; 1113 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1116 _ 0F B6. 40, 03
        cmp     al, 3                                   ; 111A _ 3C, 03
        jne     ?_064                                   ; 111C _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 1122 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 1125 _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 1129 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 112C _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 112F _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 1133 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1136 _ 0F B6. 00
        movzx   eax, al                                 ; 1139 _ 0F B6. C0
        and     eax, 07H                                ; 113C _ 83. E0, 07
        mov     edx, eax                                ; 113F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1141 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1144 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1147 _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 114A _ 0F B6. 40, 01
        movzx   edx, al                                 ; 114E _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 1151 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1154 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1157 _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 115A _ 0F B6. 40, 02
        movzx   edx, al                                 ; 115E _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 1161 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1164 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1167 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 116A _ 0F B6. 00
        movzx   eax, al                                 ; 116D _ 0F B6. C0
        and     eax, 10H                                ; 1170 _ 83. E0, 10
        test    eax, eax                                ; 1173 _ 85. C0
        jz      ?_062                                   ; 1175 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 1177 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 117A _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 117D _ 0D, FFFFFF00
        mov     edx, eax                                ; 1182 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1184 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1187 _ 89. 50, 04
?_062:  mov     eax, dword [ebp+8H]                     ; 118A _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 118D _ 0F B6. 00
        movzx   eax, al                                 ; 1190 _ 0F B6. C0
        and     eax, 20H                                ; 1193 _ 83. E0, 20
        test    eax, eax                                ; 1196 _ 85. C0
        jz      ?_063                                   ; 1198 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 119A _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 119D _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 11A0 _ 0D, FFFFFF00
        mov     edx, eax                                ; 11A5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 11A7 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 11AA _ 89. 50, 08
?_063:  mov     eax, dword [ebp+8H]                     ; 11AD _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 11B0 _ 8B. 40, 08
        neg     eax                                     ; 11B3 _ F7. D8
        mov     edx, eax                                ; 11B5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 11B7 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 11BA _ 89. 50, 08
        mov     eax, 1                                  ; 11BD _ B8, 00000001
        jmp     ?_065                                   ; 11C2 _ EB, 05

?_064:  mov     eax, 4294967295                         ; 11C4 _ B8, FFFFFFFF
?_065:  leave                                           ; 11C9 _ C9
        ret                                             ; 11CA _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 11CB _ 55
        mov     ebp, esp                                ; 11CC _ 89. E5
        sub     esp, 88                                 ; 11CE _ 83. EC, 58
        mov     dword [ebp-30H], 0                      ; 11D1 _ C7. 45, D0, 00000000
        mov     dword [ebp-2CH], 0                      ; 11D8 _ C7. 45, D4, 00000000
        mov     dword [ebp-28H], 104                    ; 11DF _ C7. 45, D8, 00000068
        mov     dword [ebp-24H], 80                     ; 11E6 _ C7. 45, DC, 00000050
        mov     edx, dword [ysize]                      ; 11ED _ 8B. 15, 000000FC(d)
        mov     eax, dword [ebp+0CH]                    ; 11F3 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 11F6 _ 8B. 00
        mov     dword [esp+8H], edx                     ; 11F8 _ 89. 54 24, 08
        mov     edx, dword [ebp+1CH]                    ; 11FC _ 8B. 55, 1C
        mov     dword [esp+4H], edx                     ; 11FF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1203 _ 89. 04 24
        call    init_screen8                            ; 1206 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+20H]                    ; 120B _ 8B. 45, 20
        movsx   eax, al                                 ; 120E _ 0F BE. C0
        mov     dword [esp+14H], ?_120                  ; 1211 _ C7. 44 24, 14, 00000017(d)
        mov     dword [esp+10H], eax                    ; 1219 _ 89. 44 24, 10
        mov     eax, dword [ebp-2CH]                    ; 121D _ 8B. 45, D4
        mov     dword [esp+0CH], eax                    ; 1220 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1224 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1227 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 122B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 122E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1232 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1235 _ 89. 04 24
        call    showString                              ; 1238 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+18H]                    ; 123D _ 8B. 45, 18
        mov     dword [esp], eax                        ; 1240 _ 89. 04 24
        call    intToHexStr                             ; 1243 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 1248 _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 124B _ 8B. 45, 20
        movsx   eax, al                                 ; 124E _ 0F BE. C0
        mov     edx, dword [ebp-20H]                    ; 1251 _ 8B. 55, E0
        mov     dword [esp+14H], edx                    ; 1254 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 1258 _ 89. 44 24, 10
        mov     eax, dword [ebp-2CH]                    ; 125C _ 8B. 45, D4
        mov     dword [esp+0CH], eax                    ; 125F _ 89. 44 24, 0C
        mov     eax, dword [ebp-28H]                    ; 1263 _ 8B. 45, D8
        mov     dword [esp+8H], eax                     ; 1266 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 126A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 126D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1271 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1274 _ 89. 04 24
        call    showString                              ; 1277 _ E8, FFFFFFFC(rel)
        add     dword [ebp-2CH], 16                     ; 127C _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 1280 _ 8B. 45, 20
        movsx   eax, al                                 ; 1283 _ 0F BE. C0
        mov     dword [esp+14H], ?_121                  ; 1286 _ C7. 44 24, 14, 00000021(d)
        mov     dword [esp+10H], eax                    ; 128E _ 89. 44 24, 10
        mov     eax, dword [ebp-2CH]                    ; 1292 _ 8B. 45, D4
        mov     dword [esp+0CH], eax                    ; 1295 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1299 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 129C _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 12A0 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 12A3 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 12A7 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 12AA _ 89. 04 24
        call    showString                              ; 12AD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 12B2 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 12B5 _ 8B. 00
        mov     dword [esp], eax                        ; 12B7 _ 89. 04 24
        call    intToHexStr                             ; 12BA _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 12BF _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 12C2 _ 8B. 45, 20
        movsx   eax, al                                 ; 12C5 _ 0F BE. C0
        mov     edx, dword [ebp-1CH]                    ; 12C8 _ 8B. 55, E4
        mov     dword [esp+14H], edx                    ; 12CB _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 12CF _ 89. 44 24, 10
        mov     eax, dword [ebp-2CH]                    ; 12D3 _ 8B. 45, D4
        mov     dword [esp+0CH], eax                    ; 12D6 _ 89. 44 24, 0C
        mov     eax, dword [ebp-28H]                    ; 12DA _ 8B. 45, D8
        mov     dword [esp+8H], eax                     ; 12DD _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 12E1 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 12E4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 12E8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 12EB _ 89. 04 24
        call    showString                              ; 12EE _ E8, FFFFFFFC(rel)
        add     dword [ebp-2CH], 16                     ; 12F3 _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 12F7 _ 8B. 45, 20
        movsx   eax, al                                 ; 12FA _ 0F BE. C0
        mov     dword [esp+14H], ?_122                  ; 12FD _ C7. 44 24, 14, 0000002D(d)
        mov     dword [esp+10H], eax                    ; 1305 _ 89. 44 24, 10
        mov     eax, dword [ebp-2CH]                    ; 1309 _ 8B. 45, D4
        mov     dword [esp+0CH], eax                    ; 130C _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1310 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1313 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1317 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 131A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 131E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1321 _ 89. 04 24
        call    showString                              ; 1324 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1329 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 132C _ 8B. 40, 04
        mov     dword [esp], eax                        ; 132F _ 89. 04 24
        call    intToHexStr                             ; 1332 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 1337 _ 89. 45, E8
        mov     eax, dword [ebp+20H]                    ; 133A _ 8B. 45, 20
        movsx   eax, al                                 ; 133D _ 0F BE. C0
        mov     edx, dword [ebp-18H]                    ; 1340 _ 8B. 55, E8
        mov     dword [esp+14H], edx                    ; 1343 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 1347 _ 89. 44 24, 10
        mov     eax, dword [ebp-2CH]                    ; 134B _ 8B. 45, D4
        mov     dword [esp+0CH], eax                    ; 134E _ 89. 44 24, 0C
        mov     eax, dword [ebp-28H]                    ; 1352 _ 8B. 45, D8
        mov     dword [esp+8H], eax                     ; 1355 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1359 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 135C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1360 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1363 _ 89. 04 24
        call    showString                              ; 1366 _ E8, FFFFFFFC(rel)
        add     dword [ebp-2CH], 16                     ; 136B _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 136F _ 8B. 45, 20
        movsx   eax, al                                 ; 1372 _ 0F BE. C0
        mov     dword [esp+14H], ?_123                  ; 1375 _ C7. 44 24, 14, 00000039(d)
        mov     dword [esp+10H], eax                    ; 137D _ 89. 44 24, 10
        mov     eax, dword [ebp-2CH]                    ; 1381 _ 8B. 45, D4
        mov     dword [esp+0CH], eax                    ; 1384 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1388 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 138B _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 138F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1392 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1396 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1399 _ 89. 04 24
        call    showString                              ; 139C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 13A1 _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 13A4 _ 8B. 40, 08
        mov     dword [esp], eax                        ; 13A7 _ 89. 04 24
        call    intToHexStr                             ; 13AA _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 13AF _ 89. 45, EC
        mov     eax, dword [ebp+20H]                    ; 13B2 _ 8B. 45, 20
        movsx   eax, al                                 ; 13B5 _ 0F BE. C0
        mov     edx, dword [ebp-14H]                    ; 13B8 _ 8B. 55, EC
        mov     dword [esp+14H], edx                    ; 13BB _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 13BF _ 89. 44 24, 10
        mov     eax, dword [ebp-2CH]                    ; 13C3 _ 8B. 45, D4
        mov     dword [esp+0CH], eax                    ; 13C6 _ 89. 44 24, 0C
        mov     eax, dword [ebp-28H]                    ; 13CA _ 8B. 45, D8
        mov     dword [esp+8H], eax                     ; 13CD _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 13D1 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 13D4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 13D8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 13DB _ 89. 04 24
        call    showString                              ; 13DE _ E8, FFFFFFFC(rel)
        add     dword [ebp-2CH], 16                     ; 13E3 _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 13E7 _ 8B. 45, 20
        movsx   eax, al                                 ; 13EA _ 0F BE. C0
        mov     dword [esp+14H], ?_124                  ; 13ED _ C7. 44 24, 14, 00000045(d)
        mov     dword [esp+10H], eax                    ; 13F5 _ 89. 44 24, 10
        mov     eax, dword [ebp-2CH]                    ; 13F9 _ 8B. 45, D4
        mov     dword [esp+0CH], eax                    ; 13FC _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1400 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1403 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1407 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 140A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 140E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1411 _ 89. 04 24
        call    showString                              ; 1414 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1419 _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 141C _ 8B. 40, 0C
        mov     dword [esp], eax                        ; 141F _ 89. 04 24
        call    intToHexStr                             ; 1422 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1427 _ 89. 45, F0
        mov     eax, dword [ebp+20H]                    ; 142A _ 8B. 45, 20
        movsx   eax, al                                 ; 142D _ 0F BE. C0
        mov     edx, dword [ebp-10H]                    ; 1430 _ 8B. 55, F0
        mov     dword [esp+14H], edx                    ; 1433 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 1437 _ 89. 44 24, 10
        mov     eax, dword [ebp-2CH]                    ; 143B _ 8B. 45, D4
        mov     dword [esp+0CH], eax                    ; 143E _ 89. 44 24, 0C
        mov     eax, dword [ebp-28H]                    ; 1442 _ 8B. 45, D8
        mov     dword [esp+8H], eax                     ; 1445 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1449 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 144C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1450 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1453 _ 89. 04 24
        call    showString                              ; 1456 _ E8, FFFFFFFC(rel)
        add     dword [ebp-2CH], 16                     ; 145B _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 145F _ 8B. 45, 20
        movsx   eax, al                                 ; 1462 _ 0F BE. C0
        mov     dword [esp+14H], ?_125                  ; 1465 _ C7. 44 24, 14, 00000052(d)
        mov     dword [esp+10H], eax                    ; 146D _ 89. 44 24, 10
        mov     eax, dword [ebp-2CH]                    ; 1471 _ 8B. 45, D4
        mov     dword [esp+0CH], eax                    ; 1474 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1478 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 147B _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 147F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1482 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1486 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1489 _ 89. 04 24
        call    showString                              ; 148C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1491 _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 1494 _ 8B. 40, 10
        mov     dword [esp], eax                        ; 1497 _ 89. 04 24
        call    intToHexStr                             ; 149A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 149F _ 89. 45, F4
        mov     eax, dword [ebp+20H]                    ; 14A2 _ 8B. 45, 20
        movsx   eax, al                                 ; 14A5 _ 0F BE. C0
        mov     edx, dword [ebp-0CH]                    ; 14A8 _ 8B. 55, F4
        mov     dword [esp+14H], edx                    ; 14AB _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 14AF _ 89. 44 24, 10
        mov     eax, dword [ebp-2CH]                    ; 14B3 _ 8B. 45, D4
        mov     dword [esp+0CH], eax                    ; 14B6 _ 89. 44 24, 0C
        mov     eax, dword [ebp-28H]                    ; 14BA _ 8B. 45, D8
        mov     dword [esp+8H], eax                     ; 14BD _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 14C1 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 14C4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 14C8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 14CB _ 89. 04 24
        call    showString                              ; 14CE _ E8, FFFFFFFC(rel)
        leave                                           ; 14D3 _ C9
        ret                                             ; 14D4 _ C3
; showMemoryInfo End of function

memman_init:; Function begin
        push    ebp                                     ; 14D5 _ 55
        mov     ebp, esp                                ; 14D6 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 14D8 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 14DB _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 14E1 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 14E4 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 14EB _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 14EE _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 14F5 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 14F8 _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 14FF _ 5D
        ret                                             ; 1500 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 1501 _ 55
        mov     ebp, esp                                ; 1502 _ 89. E5
        sub     esp, 16                                 ; 1504 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 1507 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 150E _ C7. 45, F8, 00000000
        jmp     ?_067                                   ; 1515 _ EB, 14

?_066:  mov     eax, dword [ebp+8H]                     ; 1517 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 151A _ 8B. 55, F8
        add     edx, 2                                  ; 151D _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1520 _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 1524 _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 1527 _ 83. 45, F8, 01
?_067:  mov     eax, dword [ebp+8H]                     ; 152B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 152E _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 1530 _ 3B. 45, F8
        ja      ?_066                                   ; 1533 _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 1535 _ 8B. 45, FC
        leave                                           ; 1538 _ C9
        ret                                             ; 1539 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 153A _ 55
        mov     ebp, esp                                ; 153B _ 89. E5
        sub     esp, 16                                 ; 153D _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1540 _ C7. 45, F8, 00000000
        jmp     ?_071                                   ; 1547 _ E9, 00000085

?_068:  mov     eax, dword [ebp+8H]                     ; 154C _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 154F _ 8B. 55, F8
        add     edx, 2                                  ; 1552 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1555 _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 1559 _ 3B. 45, 0C
        jc      ?_070                                   ; 155C _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 155E _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1561 _ 8B. 55, F8
        add     edx, 2                                  ; 1564 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1567 _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 156A _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 156D _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1570 _ 8B. 55, F8
        add     edx, 2                                  ; 1573 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1576 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 1579 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 157C _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 157F _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1582 _ 8B. 55, F8
        add     edx, 2                                  ; 1585 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 1588 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 158B _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 158E _ 8B. 55, F8
        add     edx, 2                                  ; 1591 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1594 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 1598 _ 2B. 45, 0C
        mov     edx, eax                                ; 159B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 159D _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 15A0 _ 8B. 4D, F8
        add     ecx, 2                                  ; 15A3 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 15A6 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 15AA _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 15AD _ 8B. 55, F8
        add     edx, 2                                  ; 15B0 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 15B3 _ 8B. 44 D0, 04
        test    eax, eax                                ; 15B7 _ 85. C0
        jnz     ?_069                                   ; 15B9 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 15BB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 15BE _ 8B. 00
        lea     edx, [eax-1H]                           ; 15C0 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 15C3 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 15C6 _ 89. 10
?_069:  mov     eax, dword [ebp-4H]                     ; 15C8 _ 8B. 45, FC
        jmp     ?_072                                   ; 15CB _ EB, 17

?_070:  add     dword [ebp-8H], 1                       ; 15CD _ 83. 45, F8, 01
?_071:  mov     eax, dword [ebp+8H]                     ; 15D1 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 15D4 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 15D6 _ 3B. 45, F8
        ja      ?_068                                   ; 15D9 _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 15DF _ B8, 00000000
?_072:  leave                                           ; 15E4 _ C9
        ret                                             ; 15E5 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 15E6 _ 55
        mov     ebp, esp                                ; 15E7 _ 89. E5
        push    ebx                                     ; 15E9 _ 53
        sub     esp, 16                                 ; 15EA _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 15ED _ C7. 45, F4, 00000000
        jmp     ?_075                                   ; 15F4 _ EB, 17

?_073:  mov     eax, dword [ebp+8H]                     ; 15F6 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 15F9 _ 8B. 55, F4
        add     edx, 2                                  ; 15FC _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 15FF _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 1602 _ 3B. 45, 0C
        jbe     ?_074                                   ; 1605 _ 76, 02
        jmp     ?_076                                   ; 1607 _ EB, 0E

?_074:  add     dword [ebp-0CH], 1                      ; 1609 _ 83. 45, F4, 01
?_075:  mov     eax, dword [ebp+8H]                     ; 160D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1610 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 1612 _ 3B. 45, F4
        jg      ?_073                                   ; 1615 _ 7F, DF
?_076:  cmp     dword [ebp-0CH], 0                      ; 1617 _ 83. 7D, F4, 00
        jle     ?_078                                   ; 161B _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 1621 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1624 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1627 _ 8B. 45, 08
        add     edx, 2                                  ; 162A _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 162D _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 1630 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 1633 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1636 _ 8B. 45, 08
        add     ecx, 2                                  ; 1639 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 163C _ 8B. 44 C8, 04
        add     eax, edx                                ; 1640 _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 1642 _ 3B. 45, 0C
        jne     ?_078                                   ; 1645 _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 164B _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 164E _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 1651 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1654 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1657 _ 8B. 45, 08
        add     edx, 2                                  ; 165A _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 165D _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 1661 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1664 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1667 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 166A _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 166D _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1671 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1674 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 1676 _ 3B. 45, F4
        jle     ?_077                                   ; 1679 _ 7E, 56
        mov     eax, dword [ebp+10H]                    ; 167B _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 167E _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 1681 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1684 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1687 _ 8B. 55, F4
        add     edx, 2                                  ; 168A _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 168D _ 8B. 04 D0
        cmp     ecx, eax                                ; 1690 _ 39. C1
        jnz     ?_077                                   ; 1692 _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 1694 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1697 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 169A _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 169D _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 16A0 _ 8B. 45, 08
        add     edx, 2                                  ; 16A3 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 16A6 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 16AA _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 16AD _ 8B. 4D, F4
        add     ecx, 2                                  ; 16B0 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 16B3 _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 16B7 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 16BA _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 16BD _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 16C0 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 16C4 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 16C7 _ 8B. 00
        lea     edx, [eax-1H]                           ; 16C9 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 16CC _ 8B. 45, 08
        mov     dword [eax], edx                        ; 16CF _ 89. 10
?_077:  mov     eax, 0                                  ; 16D1 _ B8, 00000000
        jmp     ?_084                                   ; 16D6 _ E9, 0000011C

?_078:  mov     eax, dword [ebp+8H]                     ; 16DB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 16DE _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 16E0 _ 3B. 45, F4
        jle     ?_079                                   ; 16E3 _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 16E5 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 16E8 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 16EB _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 16EE _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 16F1 _ 8B. 55, F4
        add     edx, 2                                  ; 16F4 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 16F7 _ 8B. 04 D0
        cmp     ecx, eax                                ; 16FA _ 39. C1
        jnz     ?_079                                   ; 16FC _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 16FE _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1701 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1704 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1707 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 170A _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 170D _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1710 _ 8B. 55, F4
        add     edx, 2                                  ; 1713 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1716 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 171A _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 171D _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1720 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1723 _ 8B. 55, F4
        add     edx, 2                                  ; 1726 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1729 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 172D _ B8, 00000000
        jmp     ?_084                                   ; 1732 _ E9, 000000C0

?_079:  mov     eax, dword [ebp+8H]                     ; 1737 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 173A _ 8B. 00
        cmp     eax, 4095                               ; 173C _ 3D, 00000FFF
        jg      ?_083                                   ; 1741 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 1747 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 174A _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 174C _ 89. 45, F8
        jmp     ?_081                                   ; 174F _ EB, 28

?_080:  mov     eax, dword [ebp-8H]                     ; 1751 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1754 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 1757 _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 175A _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 175D _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 1760 _ 8B. 45, 08
        add     edx, 2                                  ; 1763 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 1766 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 1769 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 176B _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 176E _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 1771 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 1775 _ 83. 6D, F8, 01
?_081:  mov     eax, dword [ebp-8H]                     ; 1779 _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 177C _ 3B. 45, F4
        jg      ?_080                                   ; 177F _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 1781 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1784 _ 8B. 00
        lea     edx, [eax+1H]                           ; 1786 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1789 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 178C _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 178E _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1791 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1794 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1797 _ 8B. 00
        cmp     edx, eax                                ; 1799 _ 39. C2
        jge     ?_082                                   ; 179B _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 179D _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 17A0 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 17A2 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 17A5 _ 89. 50, 04
?_082:  mov     eax, dword [ebp+8H]                     ; 17A8 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 17AB _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 17AE _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 17B1 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 17B4 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 17B7 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 17BA _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 17BD _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 17C0 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 17C3 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 17C7 _ B8, 00000000
        jmp     ?_084                                   ; 17CC _ EB, 29

?_083:  mov     eax, dword [ebp+8H]                     ; 17CE _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 17D1 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 17D4 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 17D7 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 17DA _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 17DD _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 17E0 _ 8B. 40, 08
        mov     edx, eax                                ; 17E3 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 17E5 _ 8B. 45, 10
        add     eax, edx                                ; 17E8 _ 01. D0
        mov     edx, eax                                ; 17EA _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 17EC _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 17EF _ 89. 50, 08
        mov     eax, 4294967295                         ; 17F2 _ B8, FFFFFFFF
?_084:  add     esp, 16                                 ; 17F7 _ 83. C4, 10
        pop     ebx                                     ; 17FA _ 5B
        pop     ebp                                     ; 17FB _ 5D
        ret                                             ; 17FC _ C3
; memman_free End of function

memman_allock_4k:; Function begin
        push    ebp                                     ; 17FD _ 55
        mov     ebp, esp                                ; 17FE _ 89. E5
        sub     esp, 24                                 ; 1800 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 1803 _ 8B. 45, 0C
        add     eax, 4095                               ; 1806 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 180B _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 1810 _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 1813 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1816 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 181A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 181D _ 89. 04 24
        call    memman_alloc                            ; 1820 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 1825 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1828 _ 8B. 45, FC
        leave                                           ; 182B _ C9
        ret                                             ; 182C _ C3
; memman_allock_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 182D _ 55
        mov     ebp, esp                                ; 182E _ 89. E5
        sub     esp, 28                                 ; 1830 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 1833 _ 8B. 45, 10
        add     eax, 4095                               ; 1836 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 183B _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 1840 _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 1843 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 1846 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 184A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 184D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1851 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1854 _ 89. 04 24
        call    memman_free                             ; 1857 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 185C _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 185F _ 8B. 45, FC
        leave                                           ; 1862 _ C9
        ret                                             ; 1863 _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 1864 _ 55
        mov     ebp, esp                                ; 1865 _ 89. E5
        sub     esp, 40                                 ; 1867 _ 83. EC, 28
        mov     dword [esp+4H], 9232                    ; 186A _ C7. 44 24, 04, 00002410
        mov     eax, dword [ebp+8H]                     ; 1872 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1875 _ 89. 04 24
        call    memman_allock_4k                         ; 1878 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 187D _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 1880 _ 83. 7D, F4, 00
        jnz     ?_085                                   ; 1884 _ 75, 07
        mov     eax, 0                                  ; 1886 _ B8, 00000000
        jmp     ?_088                                   ; 188B _ EB, 54

?_085:  mov     eax, dword [ebp-0CH]                    ; 188D _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 1890 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 1893 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 1895 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 1898 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 189B _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 189E _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 18A1 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 18A4 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 18A7 _ 8B. 45, F4
        mov     dword [eax+0CH], -1                     ; 18AA _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 18B1 _ C7. 45, F0, 00000000
        jmp     ?_087                                   ; 18B8 _ EB, 1B

?_086:  mov     eax, dword [ebp-0CH]                    ; 18BA _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 18BD _ 8B. 55, F0
        add     edx, 33                                 ; 18C0 _ 83. C2, 21
        shl     edx, 5                                  ; 18C3 _ C1. E2, 05
        add     eax, edx                                ; 18C6 _ 01. D0
        add     eax, 12                                 ; 18C8 _ 83. C0, 0C
        mov     dword [eax], 0                          ; 18CB _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 18D1 _ 83. 45, F0, 01
?_087:  cmp     dword [ebp-10H], 255                    ; 18D5 _ 81. 7D, F0, 000000FF
        jle     ?_086                                   ; 18DC _ 7E, DC
        mov     eax, dword [ebp-0CH]                    ; 18DE _ 8B. 45, F4
?_088:  leave                                           ; 18E1 _ C9
        ret                                             ; 18E2 _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 18E3 _ 55
        mov     ebp, esp                                ; 18E4 _ 89. E5
        sub     esp, 16                                 ; 18E6 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 18E9 _ C7. 45, F8, 00000000
        jmp     ?_091                                   ; 18F0 _ EB, 57

?_089:  mov     eax, dword [ebp+8H]                     ; 18F2 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 18F5 _ 8B. 55, F8
        add     edx, 33                                 ; 18F8 _ 83. C2, 21
        shl     edx, 5                                  ; 18FB _ C1. E2, 05
        add     eax, edx                                ; 18FE _ 01. D0
        add     eax, 12                                 ; 1900 _ 83. C0, 0C
        mov     eax, dword [eax]                        ; 1903 _ 8B. 00
        test    eax, eax                                ; 1905 _ 85. C0
        jnz     ?_090                                   ; 1907 _ 75, 3C
        mov     eax, dword [ebp-8H]                     ; 1909 _ 8B. 45, F8
        shl     eax, 5                                  ; 190C _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 190F _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 1915 _ 8B. 45, 08
        add     eax, edx                                ; 1918 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 191A _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 191D _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1920 _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 1923 _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 1926 _ 8B. 55, FC
        mov     dword [eax+ecx*4], edx                  ; 1929 _ 89. 14 88
        mov     eax, dword [ebp-4H]                     ; 192C _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 192F _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 1936 _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 1939 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 1940 _ 8B. 45, FC
        jmp     ?_092                                   ; 1943 _ EB, 12

?_090:  add     dword [ebp-8H], 1                       ; 1945 _ 83. 45, F8, 01
?_091:  cmp     dword [ebp-8H], 255                     ; 1949 _ 81. 7D, F8, 000000FF
        jle     ?_089                                   ; 1950 _ 7E, A0
        mov     eax, 0                                  ; 1952 _ B8, 00000000
?_092:  leave                                           ; 1957 _ C9
        ret                                             ; 1958 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 1959 _ 55
        mov     ebp, esp                                ; 195A _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 195C _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 195F _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 1962 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1964 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1967 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 196A _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 196D _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 1970 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 1973 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1976 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 1979 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 197C _ 89. 50, 14
        nop                                             ; 197F _ 90
        pop     ebp                                     ; 1980 _ 5D
        ret                                             ; 1981 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 1982 _ 55
        mov     ebp, esp                                ; 1983 _ 89. E5
        push    ebx                                     ; 1985 _ 53
        sub     esp, 52                                 ; 1986 _ 83. EC, 34
        mov     eax, dword [ebp+0CH]                    ; 1989 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 198C _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 198F _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 1992 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1995 _ 8B. 40, 0C
        add     eax, 1                                  ; 1998 _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 199B _ 3B. 45, 10
        jge     ?_093                                   ; 199E _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 19A0 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 19A3 _ 8B. 40, 0C
        add     eax, 1                                  ; 19A6 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 19A9 _ 89. 45, 10
?_093:  cmp     dword [ebp+10H], -1                     ; 19AC _ 83. 7D, 10, FF
        jge     ?_094                                   ; 19B0 _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 19B2 _ C7. 45, 10, FFFFFFFF
?_094:  mov     eax, dword [ebp+0CH]                    ; 19B9 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 19BC _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 19BF _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 19C2 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 19C5 _ 3B. 45, 10
        jle     ?_102                                   ; 19C8 _ 0F 8E, 00000100
        cmp     dword [ebp+10H], 0                      ; 19CE _ 83. 7D, 10, 00
        js      ?_097                                   ; 19D2 _ 78, 52
        mov     eax, dword [ebp-0CH]                    ; 19D4 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 19D7 _ 89. 45, F0
        jmp     ?_096                                   ; 19DA _ EB, 31

?_095:  mov     eax, dword [ebp-10H]                    ; 19DC _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 19DF _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 19E2 _ 8B. 45, 08
        add     edx, 4                                  ; 19E5 _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 19E8 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 19EB _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 19EE _ 8B. 4D, F0
        add     ecx, 4                                  ; 19F1 _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 19F4 _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 19F7 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 19FA _ 8B. 55, F0
        add     edx, 4                                  ; 19FD _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1A00 _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 1A03 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 1A06 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 1A09 _ 83. 6D, F0, 01
?_096:  mov     eax, dword [ebp-10H]                    ; 1A0D _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1A10 _ 3B. 45, 10
        jg      ?_095                                   ; 1A13 _ 7F, C7
        mov     eax, dword [ebp+8H]                     ; 1A15 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1A18 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1A1B _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1A1E _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 1A21 _ 89. 14 88
        jmp     ?_101                                   ; 1A24 _ EB, 5E

?_097:  mov     eax, dword [ebp+8H]                     ; 1A26 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1A29 _ 8B. 40, 0C
        cmp     eax, dword [ebp-0CH]                    ; 1A2C _ 3B. 45, F4
        jle     ?_100                                   ; 1A2F _ 7E, 44
        mov     eax, dword [ebp-0CH]                    ; 1A31 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 1A34 _ 89. 45, F0
        jmp     ?_099                                   ; 1A37 _ EB, 31

?_098:  mov     eax, dword [ebp-10H]                    ; 1A39 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 1A3C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1A3F _ 8B. 45, 08
        add     edx, 4                                  ; 1A42 _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1A45 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1A48 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 1A4B _ 8B. 4D, F0
        add     ecx, 4                                  ; 1A4E _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1A51 _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1A54 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1A57 _ 8B. 55, F0
        add     edx, 4                                  ; 1A5A _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1A5D _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 1A60 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 1A63 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 1A66 _ 83. 45, F0, 01
?_099:  mov     eax, dword [ebp+8H]                     ; 1A6A _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1A6D _ 8B. 40, 0C
        cmp     eax, dword [ebp-10H]                    ; 1A70 _ 3B. 45, F0
        jg      ?_098                                   ; 1A73 _ 7F, C4
?_100:  mov     eax, dword [ebp+8H]                     ; 1A75 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1A78 _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 1A7B _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1A7E _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1A81 _ 89. 50, 0C
?_101:  mov     eax, dword [ebp+0CH]                    ; 1A84 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1A87 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1A8A _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1A8D _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1A90 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1A93 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1A96 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1A99 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1A9C _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1A9F _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1AA2 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1AA5 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1AA8 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1AAB _ 8B. 40, 0C
        mov     dword [esp+10H], ebx                    ; 1AAE _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1AB2 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1AB6 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 1ABA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1ABE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1AC1 _ 89. 04 24
        call    sheet_refreshsub                        ; 1AC4 _ E8, FFFFFFFC(rel)
        jmp     ?_109                                   ; 1AC9 _ E9, 00000111

?_102:  mov     eax, dword [ebp-0CH]                    ; 1ACE _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1AD1 _ 3B. 45, 10
        jge     ?_109                                   ; 1AD4 _ 0F 8D, 00000105
        cmp     dword [ebp-0CH], 0                      ; 1ADA _ 83. 7D, F4, 00
        js      ?_105                                   ; 1ADE _ 78, 52
        mov     eax, dword [ebp-0CH]                    ; 1AE0 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 1AE3 _ 89. 45, F0
        jmp     ?_104                                   ; 1AE6 _ EB, 31

?_103:  mov     eax, dword [ebp-10H]                    ; 1AE8 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 1AEB _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1AEE _ 8B. 45, 08
        add     edx, 4                                  ; 1AF1 _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1AF4 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1AF7 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 1AFA _ 8B. 4D, F0
        add     ecx, 4                                  ; 1AFD _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1B00 _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1B03 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1B06 _ 8B. 55, F0
        add     edx, 4                                  ; 1B09 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1B0C _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 1B0F _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 1B12 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 1B15 _ 83. 45, F0, 01
?_104:  mov     eax, dword [ebp-10H]                    ; 1B19 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1B1C _ 3B. 45, 10
        jl      ?_103                                   ; 1B1F _ 7C, C7
        mov     eax, dword [ebp+8H]                     ; 1B21 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1B24 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1B27 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1B2A _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 1B2D _ 89. 14 88
        jmp     ?_108                                   ; 1B30 _ EB, 68

?_105:  mov     eax, dword [ebp+8H]                     ; 1B32 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1B35 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 1B38 _ 89. 45, F0
        jmp     ?_107                                   ; 1B3B _ EB, 37

?_106:  mov     eax, dword [ebp-10H]                    ; 1B3D _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 1B40 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1B43 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1B46 _ 8B. 55, F0
        add     edx, 4                                  ; 1B49 _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1B4C _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1B4F _ 8B. 45, 08
        add     ecx, 4                                  ; 1B52 _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1B55 _ 89. 14 88
        mov     eax, dword [ebp-10H]                    ; 1B58 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 1B5B _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1B5E _ 8B. 45, 08
        add     edx, 4                                  ; 1B61 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1B64 _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 1B67 _ 8B. 55, F0
        add     edx, 1                                  ; 1B6A _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 1B6D _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 1B70 _ 83. 6D, F0, 01
?_107:  mov     eax, dword [ebp-10H]                    ; 1B74 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1B77 _ 3B. 45, 10
        jge     ?_106                                   ; 1B7A _ 7D, C1
        mov     eax, dword [ebp+8H]                     ; 1B7C _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1B7F _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1B82 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1B85 _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 1B88 _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1B8B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1B8E _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 1B91 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1B94 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1B97 _ 89. 50, 0C
?_108:  mov     eax, dword [ebp+0CH]                    ; 1B9A _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1B9D _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1BA0 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1BA3 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1BA6 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1BA9 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1BAC _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1BAF _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1BB2 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1BB5 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1BB8 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1BBB _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1BBE _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1BC1 _ 8B. 40, 0C
        mov     dword [esp+10H], ebx                    ; 1BC4 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1BC8 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1BCC _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 1BD0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1BD4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1BD7 _ 89. 04 24
        call    sheet_refreshsub                        ; 1BDA _ E8, FFFFFFFC(rel)
?_109:  add     esp, 52                                 ; 1BDF _ 83. C4, 34
        pop     ebx                                     ; 1BE2 _ 5B
        pop     ebp                                     ; 1BE3 _ 5D
        ret                                             ; 1BE4 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 1BE5 _ 55
        mov     ebp, esp                                ; 1BE6 _ 89. E5
        push    esi                                     ; 1BE8 _ 56
        push    ebx                                     ; 1BE9 _ 53
        sub     esp, 32                                 ; 1BEA _ 83. EC, 20
        mov     eax, dword [ebp+0CH]                    ; 1BED _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1BF0 _ 8B. 40, 18
        test    eax, eax                                ; 1BF3 _ 85. C0
        js      ?_110                                   ; 1BF5 _ 78, 49
        mov     eax, dword [ebp+0CH]                    ; 1BF7 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1BFA _ 8B. 50, 10
        mov     eax, dword [ebp+1CH]                    ; 1BFD _ 8B. 45, 1C
        lea     ebx, [edx+eax]                          ; 1C00 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1C03 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1C06 _ 8B. 50, 0C
        mov     eax, dword [ebp+18H]                    ; 1C09 _ 8B. 45, 18
        lea     ecx, [edx+eax]                          ; 1C0C _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1C0F _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1C12 _ 8B. 50, 10
        mov     eax, dword [ebp+14H]                    ; 1C15 _ 8B. 45, 14
        add     edx, eax                                ; 1C18 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 1C1A _ 8B. 45, 0C
        mov     esi, dword [eax+0CH]                    ; 1C1D _ 8B. 70, 0C
        mov     eax, dword [ebp+10H]                    ; 1C20 _ 8B. 45, 10
        add     eax, esi                                ; 1C23 _ 01. F0
        mov     dword [esp+10H], ebx                    ; 1C25 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1C29 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1C2D _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 1C31 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1C35 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1C38 _ 89. 04 24
        call    sheet_refreshsub                        ; 1C3B _ E8, FFFFFFFC(rel)
?_110:  mov     eax, 0                                  ; 1C40 _ B8, 00000000
        add     esp, 32                                 ; 1C45 _ 83. C4, 20
        pop     ebx                                     ; 1C48 _ 5B
        pop     esi                                     ; 1C49 _ 5E
        pop     ebp                                     ; 1C4A _ 5D
        ret                                             ; 1C4B _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 1C4C _ 55
        mov     ebp, esp                                ; 1C4D _ 89. E5
        sub     esp, 56                                 ; 1C4F _ 83. EC, 38
        mov     eax, dword [ebp+0CH]                    ; 1C52 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1C55 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 1C58 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1C5B _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 1C5E _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 1C61 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 1C64 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 1C67 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 1C6A _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1C6D _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 1C70 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 1C73 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1C76 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1C79 _ 8B. 40, 18
        test    eax, eax                                ; 1C7C _ 85. C0
        js      ?_111                                   ; 1C7E _ 78, 6E
        mov     eax, dword [ebp+0CH]                    ; 1C80 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 1C83 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 1C86 _ 8B. 45, F4
        add     edx, eax                                ; 1C89 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 1C8B _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 1C8E _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 1C91 _ 8B. 45, F0
        add     eax, ecx                                ; 1C94 _ 01. C8
        mov     dword [esp+10H], edx                    ; 1C96 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 1C9A _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 1C9E _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 1CA1 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 1CA5 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 1CA8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1CAC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1CAF _ 89. 04 24
        call    sheet_refreshsub                        ; 1CB2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 1CB7 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 1CBA _ 8B. 50, 08
        mov     eax, dword [ebp+14H]                    ; 1CBD _ 8B. 45, 14
        add     edx, eax                                ; 1CC0 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 1CC2 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 1CC5 _ 8B. 48, 04
        mov     eax, dword [ebp+10H]                    ; 1CC8 _ 8B. 45, 10
        add     eax, ecx                                ; 1CCB _ 01. C8
        mov     dword [esp+10H], edx                    ; 1CCD _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 1CD1 _ 89. 44 24, 0C
        mov     eax, dword [ebp+14H]                    ; 1CD5 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 1CD8 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 1CDC _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 1CDF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1CE3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1CE6 _ 89. 04 24
        call    sheet_refreshsub                        ; 1CE9 _ E8, FFFFFFFC(rel)
?_111:  leave                                           ; 1CEE _ C9
        ret                                             ; 1CEF _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 1CF0 _ 55
        mov     ebp, esp                                ; 1CF1 _ 89. E5
        sub     esp, 48                                 ; 1CF3 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 1CF6 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1CF9 _ 8B. 00
        mov     dword [ebp-14H], eax                    ; 1CFB _ 89. 45, EC
        mov     dword [ebp-20H], 0                      ; 1CFE _ C7. 45, E0, 00000000
        jmp     ?_118                                   ; 1D05 _ E9, 000000DC

?_112:  mov     eax, dword [ebp+8H]                     ; 1D0A _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 1D0D _ 8B. 55, E0
        add     edx, 4                                  ; 1D10 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1D13 _ 8B. 04 90
        mov     dword [ebp-10H], eax                    ; 1D16 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 1D19 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 1D1C _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 1D1E _ 89. 45, F4
        mov     dword [ebp-18H], 0                      ; 1D21 _ C7. 45, E8, 00000000
        jmp     ?_117                                   ; 1D28 _ E9, 000000A6

?_113:  mov     eax, dword [ebp-10H]                    ; 1D2D _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 1D30 _ 8B. 50, 10
        mov     eax, dword [ebp-18H]                    ; 1D33 _ 8B. 45, E8
        add     eax, edx                                ; 1D36 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 1D38 _ 89. 45, F8
        mov     dword [ebp-1CH], 0                      ; 1D3B _ C7. 45, E4, 00000000
        jmp     ?_116                                   ; 1D42 _ EB, 7C

?_114:  mov     eax, dword [ebp-10H]                    ; 1D44 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 1D47 _ 8B. 50, 0C
        mov     eax, dword [ebp-1CH]                    ; 1D4A _ 8B. 45, E4
        add     eax, edx                                ; 1D4D _ 01. D0
        mov     dword [ebp-4H], eax                     ; 1D4F _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 1D52 _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 1D55 _ 3B. 45, FC
        jg      ?_115                                   ; 1D58 _ 7F, 62
        mov     eax, dword [ebp-4H]                     ; 1D5A _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 1D5D _ 3B. 45, 14
        jge     ?_115                                   ; 1D60 _ 7D, 5A
        mov     eax, dword [ebp+10H]                    ; 1D62 _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 1D65 _ 3B. 45, F8
        jg      ?_115                                   ; 1D68 _ 7F, 52
        mov     eax, dword [ebp-8H]                     ; 1D6A _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 1D6D _ 3B. 45, 18
        jge     ?_115                                   ; 1D70 _ 7D, 4A
        mov     eax, dword [ebp-10H]                    ; 1D72 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 1D75 _ 8B. 40, 04
        imul    eax, dword [ebp-18H]                    ; 1D78 _ 0F AF. 45, E8
        mov     edx, eax                                ; 1D7C _ 89. C2
        mov     eax, dword [ebp-1CH]                    ; 1D7E _ 8B. 45, E4
        add     eax, edx                                ; 1D81 _ 01. D0
        mov     edx, eax                                ; 1D83 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 1D85 _ 8B. 45, F4
        add     eax, edx                                ; 1D88 _ 01. D0
        movzx   eax, byte [eax]                         ; 1D8A _ 0F B6. 00
        mov     byte [ebp-21H], al                      ; 1D8D _ 88. 45, DF
        movzx   edx, byte [ebp-21H]                     ; 1D90 _ 0F B6. 55, DF
        mov     eax, dword [ebp-10H]                    ; 1D94 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 1D97 _ 8B. 40, 14
        cmp     edx, eax                                ; 1D9A _ 39. C2
        jz      ?_115                                   ; 1D9C _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 1D9E _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1DA1 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 1DA4 _ 0F AF. 45, F8
        mov     edx, eax                                ; 1DA8 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1DAA _ 8B. 45, FC
        add     eax, edx                                ; 1DAD _ 01. D0
        mov     edx, eax                                ; 1DAF _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 1DB1 _ 8B. 45, EC
        add     edx, eax                                ; 1DB4 _ 01. C2
        movzx   eax, byte [ebp-21H]                     ; 1DB6 _ 0F B6. 45, DF
        mov     byte [edx], al                          ; 1DBA _ 88. 02
?_115:  add     dword [ebp-1CH], 1                      ; 1DBC _ 83. 45, E4, 01
?_116:  mov     eax, dword [ebp-10H]                    ; 1DC0 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 1DC3 _ 8B. 40, 04
        cmp     eax, dword [ebp-1CH]                    ; 1DC6 _ 3B. 45, E4
        jg      ?_114                                   ; 1DC9 _ 0F 8F, FFFFFF75
        add     dword [ebp-18H], 1                      ; 1DCF _ 83. 45, E8, 01
?_117:  mov     eax, dword [ebp-10H]                    ; 1DD3 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 1DD6 _ 8B. 40, 08
        cmp     eax, dword [ebp-18H]                    ; 1DD9 _ 3B. 45, E8
        jg      ?_113                                   ; 1DDC _ 0F 8F, FFFFFF4B
        add     dword [ebp-20H], 1                      ; 1DE2 _ 83. 45, E0, 01
?_118:  mov     eax, dword [ebp+8H]                     ; 1DE6 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1DE9 _ 8B. 40, 0C
        cmp     eax, dword [ebp-20H]                    ; 1DEC _ 3B. 45, E0
        jge     ?_112                                   ; 1DEF _ 0F 8D, FFFFFF15
        leave                                           ; 1DF5 _ C9
        ret                                             ; 1DF6 _ C3
; sheet_refreshsub End of function


; SECTION .rodata align=1 noexecute                       ; section number 2, const

?_119:                                                  ; byte
        db 69H, 6DH, 70H, 72H, 6FH, 76H, 65H, 20H       ; 0000 _ improve 
        db 73H, 74H, 72H, 69H, 6EH, 67H, 20H, 73H       ; 0008 _ string s
        db 68H, 6FH, 77H, 69H, 6EH, 67H, 00H            ; 0010 _ howing.

?_120:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0017 _ page is:
        db 20H, 00H                                     ; 001F _  .

?_121:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0021 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0029 _ L: .

?_122:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 002D _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 0035 _ H: .

?_123:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0039 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0041 _ w: .

?_124:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 0045 _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 004D _ gh: .

?_125:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 0052 _ type: .


; SECTION .data   align=32 noexecute                      ; section number 3, data

memman:                                                 ; dword
        dd 00100000H                                    ; 0000 _ 1048576 

keyval:                                                 ; byte
        db 30H, 58H                                     ; 0004 _ 0X

?_126:  db 00H                                          ; 0006 _ .

?_127:  db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0007 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 000F _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0017 _ ........
        db 00H                                          ; 001F _ .

table_rgb.1639:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0020 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........

cursor.1686:                                            ; byte
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH       ; 0060 _ ********
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2EH, 2EH       ; 0068 _ ******..
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0070 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 0078 _ OOOO*...
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0080 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0088 _ OOO*....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0090 _ *OOOOOOO
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0098 _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00A0 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00A8 _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00B0 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00B8 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00C0 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00C8 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00D0 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00D8 _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2AH, 4FH       ; 00E0 _ *OOOO**O
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00E8 _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2AH       ; 00F0 _ *OOO*..*
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 00F8 _ OOO*....
        db 2AH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0100 _ *OO*....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 0108 _ *OOO*...
        db 2AH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0110 _ *O*.....
        db 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH       ; 0118 _ .*OOO*..
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0120 _ **......
        db 2EH, 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH       ; 0128 _ ..*OOO*.
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0130 _ *.......
        db 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 4FH, 2AH       ; 0138 _ ...*OOO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0140 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 2AH       ; 0148 _ ....*OO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0150 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 2AH, 2AH       ; 0158 _ .....***


; SECTION .bss    align=32 noexecute                      ; section number 4, bss

bootInfo:                                               ; qword
        resb    4                                       ; 0000

?_128:  resw    1                                       ; 0004

?_129:  resw    1                                       ; 0006

keyinfo:                                                ; byte
        resb    24                                      ; 0008

mouseinfo:                                              ; byte
        resb    32                                      ; 0020

keybuf:                                                 ; yword
        resb    32                                      ; 0040

mousebuf:                                               ; byte
        resb    128                                     ; 0060

mdec:                                                   ; oword
        resb    16                                      ; 00E0

mx:     resd    1                                       ; 00F0

my:     resd    1                                       ; 00F4

xsize:  resd    1                                       ; 00F8

ysize:  resd    1                                       ; 00FC

buf_back: resd  8                                       ; 0100

buf_mouse:                                              ; byte
        resb    256                                     ; 0120

str.1734:                                               ; byte
        resb    1                                       ; 0220

?_130:  resb    9                                       ; 0221

?_131:  resb    1                                       ; 022A


