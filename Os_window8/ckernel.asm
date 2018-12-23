; Disassembly of file: ckernel.o
; Mon Nov  5 13:13:21 2018
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
; global shtctl_init: function
; global sheet_alloc: function
; global sheet_setbuf: function
; global sheet_updown: function
; global sheet_refresh: function
; global sheet_slide: function
; global memman_init: function
; global memman_total: function
; global memman_alloc: function
; global memman_free: function
; global memman_alloc_4k: function
; global memman_free_4k: function
; global memman

; extern get_memory_block_count                           ; near
; extern io_out8                                          ; near
; extern io_sti                                           ; near
; extern io_store_eflags                                  ; near
; extern io_stihlt                                        ; near
; extern get_adr_buffer                                   ; near
; extern io_cli                                           ; near
; extern memman_allock_4k                                 ; near
; extern io_in8                                           ; near
; extern systemFont                                       ; byte
; extern io_load_eflags                                   ; near


;SECTION .text   align=1 execute                         ; section number 1, code

CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    ebx                                     ; 0003 _ 53
        sub     esp, 68                                 ; 0004 _ 83. EC, 44
        mov     dword [esp], bootInfo                   ; 0007 _ C7. 04 24, 00000000(d)
        call    initBootInfo                            ; 000E _ E8, FFFFFFFC(rel)
        mov     eax, dword [bootInfo]                   ; 0013 _ A1, 00000000(d)
        mov     dword [ebp-24H], eax                    ; 0018 _ 89. 45, DC
        movzx   eax, word [?_129]                       ; 001B _ 0F B7. 05, 00000006(d)
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
        call    memman_alloc_4k                        ; 0122 _ E8, FFFFFFFC(rel)
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
        mov     dword [esp+0CH], 0                      ; 01A8 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 01B0 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-20H]                    ; 01B8 _ 8B. 45, E0
        mov     dword [esp+4H], eax                     ; 01BB _ 89. 44 24, 04
        mov     eax, dword [ebp-10H]                    ; 01BF _ 8B. 45, F0
        mov     dword [esp], eax                        ; 01C2 _ 89. 04 24
        call    sheet_slide                             ; 01C5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [xsize]                      ; 01CA _ A1, 000000F8(d)
        sub     eax, 16                                 ; 01CF _ 83. E8, 10
        mov     edx, eax                                ; 01D2 _ 89. C2
        shr     edx, 31                                 ; 01D4 _ C1. EA, 1F
        add     eax, edx                                ; 01D7 _ 01. D0
        sar     eax, 1                                  ; 01D9 _ D1. F8
        mov     dword [mx], eax                         ; 01DB _ A3, 000000F0(d)
        mov     eax, dword [ysize]                      ; 01E0 _ A1, 000000FC(d)
        sub     eax, 44                                 ; 01E5 _ 83. E8, 2C
        mov     edx, eax                                ; 01E8 _ 89. C2
        shr     edx, 31                                 ; 01EA _ C1. EA, 1F
        add     eax, edx                                ; 01ED _ 01. D0
        sar     eax, 1                                  ; 01EF _ D1. F8
        mov     dword [my], eax                         ; 01F1 _ A3, 000000F4(d)
        mov     edx, dword [my]                         ; 01F6 _ 8B. 15, 000000F4(d)
        mov     eax, dword [mx]                         ; 01FC _ A1, 000000F0(d)
        mov     dword [esp+0CH], edx                    ; 0201 _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 0205 _ 89. 44 24, 08
        mov     eax, dword [ebp-1CH]                    ; 0209 _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 020C _ 89. 44 24, 04
        mov     eax, dword [ebp-10H]                    ; 0210 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 0213 _ 89. 04 24
        call    sheet_slide                             ; 0216 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 0                       ; 021B _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-20H]                    ; 0223 _ 8B. 45, E0
        mov     dword [esp+4H], eax                     ; 0226 _ 89. 44 24, 04
        mov     eax, dword [ebp-10H]                    ; 022A _ 8B. 45, F0
        mov     dword [esp], eax                        ; 022D _ 89. 04 24
        call    sheet_updown                            ; 0230 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 1                       ; 0235 _ C7. 44 24, 08, 00000001
        mov     eax, dword [ebp-1CH]                    ; 023D _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 0240 _ 89. 44 24, 04
        mov     eax, dword [ebp-10H]                    ; 0244 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 0247 _ 89. 04 24
        call    sheet_updown                            ; 024A _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 024F _ E8, FFFFFFFC(rel)
        mov     dword [esp], mdec                       ; 0254 _ C7. 04 24, 000000E0(d)
        call    enable_mouse                            ; 025B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 0                      ; 0260 _ C7. 45, F4, 00000000
        mov     dword [ebp-28H], 0                      ; 0267 _ C7. 45, D8, 00000000
?_001:  call    io_cli                                  ; 026E _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 0273 _ C7. 04 24, 00000008(d)
        call    fifo8_status                            ; 027A _ E8, FFFFFFFC(rel)
        mov     ebx, eax                                ; 027F _ 89. C3
        mov     dword [esp], mouseinfo                  ; 0281 _ C7. 04 24, 00000020(d)
        call    fifo8_status                            ; 0288 _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 028D _ 01. D8
        test    eax, eax                                ; 028F _ 85. C0
        jnz     ?_002                                   ; 0291 _ 75, 0A
        call    io_stihlt                               ; 0293 _ E8, FFFFFFFC(rel)
        jmp     ?_005                                   ; 0298 _ E9, 000000B2

?_002:  mov     dword [esp], keyinfo                    ; 029D _ C7. 04 24, 00000008(d)
        call    fifo8_status                            ; 02A4 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 02A9 _ 85. C0
        jz      ?_004                                   ; 02AB _ 74, 7B
        mov     dword [esp], keyinfo                    ; 02AD _ C7. 04 24, 00000008(d)
        call    fifo8_get                               ; 02B4 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 02B9 _ 89. 45, F4
        cmp     dword [ebp-0CH], 28                     ; 02BC _ 83. 7D, F4, 1C
        jne     ?_005                                   ; 02C0 _ 0F 85, 00000089
        mov     ebx, dword [xsize]                      ; 02C6 _ 8B. 1D, 000000F8(d)
        mov     ecx, dword [buf_back]                   ; 02CC _ 8B. 0D, 00000100(d)
        mov     edx, dword [ebp-28H]                    ; 02D2 _ 8B. 55, D8
        mov     eax, edx                                ; 02D5 _ 89. D0
        shl     eax, 2                                  ; 02D7 _ C1. E0, 02
        add     eax, edx                                ; 02DA _ 01. D0
        shl     eax, 2                                  ; 02DC _ C1. E0, 02
        mov     edx, eax                                ; 02DF _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 02E1 _ 8B. 45, EC
        add     edx, eax                                ; 02E4 _ 01. C2
        mov     dword [esp+10H], 7                      ; 02E6 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ebx                    ; 02EE _ 89. 5C 24, 0C
        mov     eax, dword [ebp-28H]                    ; 02F2 _ 8B. 45, D8
        mov     dword [esp+8H], eax                     ; 02F5 _ 89. 44 24, 08
        mov     dword [esp+4H], ecx                     ; 02F9 _ 89. 4C 24, 04
        mov     dword [esp], edx                        ; 02FD _ 89. 14 24
        call    showMemoryInfo                          ; 0300 _ E8, FFFFFFFC(rel)
        add     dword [ebp-28H], 1                      ; 0305 _ 83. 45, D8, 01
        mov     eax, dword [ebp-28H]                    ; 0309 _ 8B. 45, D8
        cmp     eax, dword [ebp-18H]                    ; 030C _ 3B. 45, E8
        jle     ?_003                                   ; 030F _ 7E, 07
        mov     dword [ebp-28H], 0                      ; 0311 _ C7. 45, D8, 00000000
?_003:  mov     eax, dword [ebp-10H]                    ; 0318 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 031B _ 89. 04 24
        call    sheet_refresh                           ; 031E _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0323 _ E9, FFFFFF46

?_004:  mov     dword [esp], mouseinfo                  ; 0328 _ C7. 04 24, 00000020(d)
        call    fifo8_status                            ; 032F _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0334 _ 85. C0
        jz      ?_005                                   ; 0336 _ 74, 17
        mov     eax, dword [ebp-1CH]                    ; 0338 _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 033B _ 89. 44 24, 04
        mov     eax, dword [ebp-10H]                    ; 033F _ 8B. 45, F0
        mov     dword [esp], eax                        ; 0342 _ 89. 04 24
        call    show_mouse_info                         ; 0345 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 034A _ E9, FFFFFF1F

?_005:  jmp     ?_001                                   ; 034F _ E9, FFFFFF1A
; CMain End of function

init_screen8:; Function begin
        push    ebp                                     ; 0354 _ 55
        mov     ebp, esp                                ; 0355 _ 89. E5
        push    ebx                                     ; 0357 _ 53
        sub     esp, 36                                 ; 0358 _ 83. EC, 24
        mov     eax, dword [ebp+10H]                    ; 035B _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 035E _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 0361 _ 8B. 45, 0C
        sub     eax, 1                                  ; 0364 _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 0367 _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 036B _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 036F _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 0377 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 14                      ; 037F _ C7. 44 24, 08, 0000000E
        mov     eax, dword [ebp+0CH]                    ; 0387 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 038A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 038E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0391 _ 89. 04 24
        call    boxfill8                                ; 0394 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0399 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 039C _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 039F _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 03A2 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 03A5 _ 8B. 45, 10
        sub     eax, 28                                 ; 03A8 _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 03AB _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 03AF _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 03B3 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 03B7 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 03BF _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 03C7 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 03CA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 03CE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 03D1 _ 89. 04 24
        call    boxfill8                                ; 03D4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 03D9 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 03DC _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 03DF _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 03E2 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 03E5 _ 8B. 45, 10
        sub     eax, 27                                 ; 03E8 _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 03EB _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 03EF _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 03F3 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 03F7 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 03FF _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0407 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 040A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 040E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0411 _ 89. 04 24
        call    boxfill8                                ; 0414 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0419 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 041C _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 041F _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0422 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0425 _ 8B. 45, 10
        sub     eax, 26                                 ; 0428 _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 042B _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 042F _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0433 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0437 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 043F _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0447 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 044A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 044E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0451 _ 89. 04 24
        call    boxfill8                                ; 0454 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0459 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 045C _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 045F _ 8B. 45, 10
        sub     eax, 24                                 ; 0462 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0465 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0469 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0471 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0475 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 047D _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0485 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0488 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 048C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 048F _ 89. 04 24
        call    boxfill8                                ; 0492 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0497 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 049A _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 049D _ 8B. 45, 10
        sub     eax, 24                                 ; 04A0 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 04A3 _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 04A7 _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 04AF _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 04B3 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 04BB _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 04C3 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 04C6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 04CA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 04CD _ 89. 04 24
        call    boxfill8                                ; 04D0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 04D5 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 04D8 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 04DB _ 8B. 45, 10
        sub     eax, 4                                  ; 04DE _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 04E1 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 04E5 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 04ED _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 04F1 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 15                      ; 04F9 _ C7. 44 24, 08, 0000000F
        mov     eax, dword [ebp+0CH]                    ; 0501 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0504 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0508 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 050B _ 89. 04 24
        call    boxfill8                                ; 050E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0513 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0516 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 0519 _ 8B. 45, 10
        sub     eax, 23                                 ; 051C _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 051F _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0523 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 052B _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 052F _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 15                      ; 0537 _ C7. 44 24, 08, 0000000F
        mov     eax, dword [ebp+0CH]                    ; 053F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0542 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0546 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0549 _ 89. 04 24
        call    boxfill8                                ; 054C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0551 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0554 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0557 _ 8B. 45, 10
        sub     eax, 3                                  ; 055A _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 055D _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0561 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0569 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 056D _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 0575 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 057D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0580 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0584 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0587 _ 89. 04 24
        call    boxfill8                                ; 058A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 058F _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0592 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0595 _ 8B. 45, 10
        sub     eax, 24                                 ; 0598 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 059B _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 059F _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 05A7 _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 05AB _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 05B3 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 05BB _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 05BE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 05C2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 05C5 _ 89. 04 24
        call    boxfill8                                ; 05C8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 05CD _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 05D0 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 05D3 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 05D6 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 05D9 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 05DC _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 05DF _ 8B. 45, 0C
        sub     eax, 47                                 ; 05E2 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 05E5 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 05E9 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 05ED _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 05F1 _ 89. 44 24, 0C
        mov     dword [esp+8H], 15                      ; 05F5 _ C7. 44 24, 08, 0000000F
        mov     eax, dword [ebp+0CH]                    ; 05FD _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0600 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0604 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0607 _ 89. 04 24
        call    boxfill8                                ; 060A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 060F _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 0612 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 0615 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 0618 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 061B _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 061E _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 0621 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0624 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0627 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 062B _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 062F _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0633 _ 89. 44 24, 0C
        mov     dword [esp+8H], 15                      ; 0637 _ C7. 44 24, 08, 0000000F
        mov     eax, dword [ebp+0CH]                    ; 063F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0642 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0646 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0649 _ 89. 04 24
        call    boxfill8                                ; 064C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0651 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0654 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0657 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 065A _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 065D _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0660 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0663 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0666 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0669 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 066D _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0671 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0675 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 0679 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0681 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0684 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0688 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 068B _ 89. 04 24
        call    boxfill8                                ; 068E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0693 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0696 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0699 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 069C _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 069F _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 06A2 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 06A5 _ 8B. 45, 0C
        sub     eax, 3                                  ; 06A8 _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 06AB _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 06AF _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 06B3 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 06B7 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 06BB _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 06C3 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 06C6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 06CA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 06CD _ 89. 04 24
        call    boxfill8                                ; 06D0 _ E8, FFFFFFFC(rel)
        add     esp, 36                                 ; 06D5 _ 83. C4, 24
        pop     ebx                                     ; 06D8 _ 5B
        pop     ebp                                     ; 06D9 _ 5D
        ret                                             ; 06DA _ C3
; init_screen8 End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 06DB _ 55
        mov     ebp, esp                                ; 06DC _ 89. E5
        sub     esp, 40                                 ; 06DE _ 83. EC, 28
        mov     eax, dword [ebp+8H]                     ; 06E1 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 06E4 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 06E7 _ A1, 000000F0(d)
        add     eax, edx                                ; 06EC _ 01. D0
        mov     dword [mx], eax                         ; 06EE _ A3, 000000F0(d)
        mov     eax, dword [ebp+8H]                     ; 06F3 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 06F6 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 06F9 _ A1, 000000F4(d)
        add     eax, edx                                ; 06FE _ 01. D0
        mov     dword [my], eax                         ; 0700 _ A3, 000000F4(d)
        mov     eax, dword [mx]                         ; 0705 _ A1, 000000F0(d)
        test    eax, eax                                ; 070A _ 85. C0
        jns     ?_006                                   ; 070C _ 79, 0A
        mov     dword [mx], 0                           ; 070E _ C7. 05, 000000F0(d), 00000000
?_006:  mov     eax, dword [my]                         ; 0718 _ A1, 000000F4(d)
        test    eax, eax                                ; 071D _ 85. C0
        jns     ?_007                                   ; 071F _ 79, 0A
        mov     dword [my], 0                           ; 0721 _ C7. 05, 000000F4(d), 00000000
?_007:  mov     eax, dword [xsize]                      ; 072B _ A1, 000000F8(d)
        lea     edx, [eax-10H]                          ; 0730 _ 8D. 50, F0
        mov     eax, dword [mx]                         ; 0733 _ A1, 000000F0(d)
        cmp     edx, eax                                ; 0738 _ 39. C2
        jge     ?_008                                   ; 073A _ 7D, 0D
        mov     eax, dword [xsize]                      ; 073C _ A1, 000000F8(d)
        sub     eax, 16                                 ; 0741 _ 83. E8, 10
        mov     dword [mx], eax                         ; 0744 _ A3, 000000F0(d)
?_008:  mov     eax, dword [ysize]                      ; 0749 _ A1, 000000FC(d)
        lea     edx, [eax-10H]                          ; 074E _ 8D. 50, F0
        mov     eax, dword [my]                         ; 0751 _ A1, 000000F4(d)
        cmp     edx, eax                                ; 0756 _ 39. C2
        jge     ?_009                                   ; 0758 _ 7D, 0D
        mov     eax, dword [ysize]                      ; 075A _ A1, 000000FC(d)
        sub     eax, 16                                 ; 075F _ 83. E8, 10
        mov     dword [my], eax                         ; 0762 _ A3, 000000F4(d)
?_009:  mov     edx, dword [xsize]                      ; 0767 _ 8B. 15, 000000F8(d)
        mov     eax, dword [buf_back]                   ; 076D _ A1, 00000100(d)
        mov     dword [esp+18H], 15                     ; 0772 _ C7. 44 24, 18, 0000000F
        mov     dword [esp+14H], 79                     ; 077A _ C7. 44 24, 14, 0000004F
        mov     dword [esp+10H], 0                      ; 0782 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 078A _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 14                      ; 0792 _ C7. 44 24, 08, 0000000E
        mov     dword [esp+4H], edx                     ; 079A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 079E _ 89. 04 24
        call    boxfill8                                ; 07A1 _ E8, FFFFFFFC(rel)
        mov     edx, dword [xsize]                      ; 07A6 _ 8B. 15, 000000F8(d)
        mov     eax, dword [buf_back]                   ; 07AC _ A1, 00000100(d)
        mov     dword [esp+14H], ?_119                  ; 07B1 _ C7. 44 24, 14, 00000000(d)
        mov     dword [esp+10H], 7                      ; 07B9 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 0                      ; 07C1 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 07C9 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 07D1 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 07D5 _ 89. 04 24
        call    showString                              ; 07D8 _ E8, FFFFFFFC(rel)
        leave                                           ; 07DD _ C9
        ret                                             ; 07DE _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 07DF _ 55
        mov     ebp, esp                                ; 07E0 _ 89. E5
        sub     esp, 40                                 ; 07E2 _ 83. EC, 28
        mov     eax, dword [buf_back]                   ; 07E5 _ A1, 00000100(d)
        mov     dword [ebp-0CH], eax                    ; 07EA _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 07ED _ C6. 45, F3, 00
        call    io_sti                                  ; 07F1 _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 07F6 _ C7. 04 24, 00000020(d)
        call    fifo8_get                               ; 07FD _ E8, FFFFFFFC(rel)
        mov     byte [ebp-0DH], al                      ; 0802 _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 0805 _ 0F B6. 45, F3
        mov     dword [esp+4H], eax                     ; 0809 _ 89. 44 24, 04
        mov     dword [esp], mdec                       ; 080D _ C7. 04 24, 000000E0(d)
        call    mouse_decode                            ; 0814 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0819 _ 85. C0
        jz      ?_010                                   ; 081B _ 74, 31
        mov     dword [esp], mdec                       ; 081D _ C7. 04 24, 000000E0(d)
        call    computeMousePosition                    ; 0824 _ E8, FFFFFFFC(rel)
        mov     edx, dword [my]                         ; 0829 _ 8B. 15, 000000F4(d)
        mov     eax, dword [mx]                         ; 082F _ A1, 000000F0(d)
        mov     dword [esp+0CH], edx                    ; 0834 _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 0838 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 083C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 083F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0843 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0846 _ 89. 04 24
        call    sheet_slide                             ; 0849 _ E8, FFFFFFFC(rel)
?_010:  leave                                           ; 084E _ C9
        ret                                             ; 084F _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 0850 _ 55
        mov     ebp, esp                                ; 0851 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0853 _ 8B. 45, 08
        mov     dword [eax], 655360                     ; 0856 _ C7. 00, 000A0000
        mov     eax, dword [ebp+8H]                     ; 085C _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 085F _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 0865 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 0868 _ 66: C7. 40, 06, 00C8
        pop     ebp                                     ; 086E _ 5D
        ret                                             ; 086F _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 0870 _ 55
        mov     ebp, esp                                ; 0871 _ 89. E5
        sub     esp, 40                                 ; 0873 _ 83. EC, 28
        mov     eax, dword [ebp+18H]                    ; 0876 _ 8B. 45, 18
        mov     byte [ebp-0CH], al                      ; 0879 _ 88. 45, F4
        jmp     ?_012                                   ; 087C _ EB, 46

?_011:  mov     eax, dword [ebp+1CH]                    ; 087E _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 0881 _ 0F B6. 00
        movzx   eax, al                                 ; 0884 _ 0F B6. C0
        shl     eax, 4                                  ; 0887 _ C1. E0, 04
        lea     edx, [systemFont+eax]                   ; 088A _ 8D. 90, 00000000(d)
        movsx   eax, byte [ebp-0CH]                     ; 0890 _ 0F BE. 45, F4
        mov     dword [esp+14H], edx                    ; 0894 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0898 _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 089C _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 089F _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 08A3 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 08A6 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 08AA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 08AD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 08B1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 08B4 _ 89. 04 24
        call    showFont8                               ; 08B7 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 08BC _ 83. 45, 10, 08
        add     dword [ebp+1CH], 1                      ; 08C0 _ 83. 45, 1C, 01
?_012:  mov     eax, dword [ebp+1CH]                    ; 08C4 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 08C7 _ 0F B6. 00
        test    al, al                                  ; 08CA _ 84. C0
        jnz     ?_011                                   ; 08CC _ 75, B0
        leave                                           ; 08CE _ C9
        ret                                             ; 08CF _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 08D0 _ 55
        mov     ebp, esp                                ; 08D1 _ 89. E5
        sub     esp, 24                                 ; 08D3 _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1621          ; 08D6 _ C7. 44 24, 08, 00000020(d)
        mov     dword [esp+4H], 15                      ; 08DE _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 08E6 _ C7. 04 24, 00000000
        call    set_palette                             ; 08ED _ E8, FFFFFFFC(rel)
        nop                                             ; 08F2 _ 90
        leave                                           ; 08F3 _ C9
        ret                                             ; 08F4 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 08F5 _ 55
        mov     ebp, esp                                ; 08F6 _ 89. E5
        sub     esp, 40                                 ; 08F8 _ 83. EC, 28
        call    io_load_eflags                          ; 08FB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0900 _ 89. 45, F4
        call    io_cli                                  ; 0903 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0908 _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 090B _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 090F _ C7. 04 24, 000003C8
        call    io_out8                                 ; 0916 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 091B _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 091E _ 89. 45, F0
        jmp     ?_014                                   ; 0921 _ EB, 62

?_013:  mov     eax, dword [ebp+10H]                    ; 0923 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 0926 _ 0F B6. 00
        shr     al, 2                                   ; 0929 _ C0. E8, 02
        movzx   eax, al                                 ; 092C _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 092F _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0933 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 093A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 093F _ 8B. 45, 10
        add     eax, 1                                  ; 0942 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 0945 _ 0F B6. 00
        shr     al, 2                                   ; 0948 _ C0. E8, 02
        movzx   eax, al                                 ; 094B _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 094E _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0952 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0959 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 095E _ 8B. 45, 10
        add     eax, 2                                  ; 0961 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 0964 _ 0F B6. 00
        shr     al, 2                                   ; 0967 _ C0. E8, 02
        movzx   eax, al                                 ; 096A _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 096D _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0971 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0978 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 097D _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 0981 _ 83. 45, F0, 01
?_014:  mov     eax, dword [ebp-10H]                    ; 0985 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 0988 _ 3B. 45, 0C
        jle     ?_013                                   ; 098B _ 7E, 96
        mov     eax, dword [ebp-0CH]                    ; 098D _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0990 _ 89. 04 24
        call    io_store_eflags                         ; 0993 _ E8, FFFFFFFC(rel)
        nop                                             ; 0998 _ 90
        leave                                           ; 0999 _ C9
        ret                                             ; 099A _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 099B _ 55
        mov     ebp, esp                                ; 099C _ 89. E5
        sub     esp, 20                                 ; 099E _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 09A1 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 09A4 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 09A7 _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 09AA _ 89. 45, FC
        jmp     ?_018                                   ; 09AD _ EB, 33

?_015:  mov     eax, dword [ebp+14H]                    ; 09AF _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 09B2 _ 89. 45, F8
        jmp     ?_017                                   ; 09B5 _ EB, 1F

?_016:  mov     eax, dword [ebp-4H]                     ; 09B7 _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 09BA _ 0F AF. 45, 0C
        mov     edx, eax                                ; 09BE _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 09C0 _ 8B. 45, F8
        add     eax, edx                                ; 09C3 _ 01. D0
        mov     edx, eax                                ; 09C5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 09C7 _ 8B. 45, 08
        add     edx, eax                                ; 09CA _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 09CC _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 09D0 _ 88. 02
        add     dword [ebp-8H], 1                       ; 09D2 _ 83. 45, F8, 01
?_017:  mov     eax, dword [ebp-8H]                     ; 09D6 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 09D9 _ 3B. 45, 1C
        jle     ?_016                                   ; 09DC _ 7E, D9
        add     dword [ebp-4H], 1                       ; 09DE _ 83. 45, FC, 01
?_018:  mov     eax, dword [ebp-4H]                     ; 09E2 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 09E5 _ 3B. 45, 20
        jle     ?_015                                   ; 09E8 _ 7E, C5
        leave                                           ; 09EA _ C9
        ret                                             ; 09EB _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 09EC _ 55
        mov     ebp, esp                                ; 09ED _ 89. E5
        sub     esp, 20                                 ; 09EF _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 09F2 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 09F5 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 09F8 _ C7. 45, FC, 00000000
        jmp     ?_028                                   ; 09FF _ E9, 0000016C

?_019:  mov     edx, dword [ebp-4H]                     ; 0A04 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 0A07 _ 8B. 45, 1C
        add     eax, edx                                ; 0A0A _ 01. D0
        movzx   eax, byte [eax]                         ; 0A0C _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 0A0F _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 0A12 _ 80. 7D, FB, 00
        jns     ?_020                                   ; 0A16 _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 0A18 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0A1B _ 8B. 55, 14
        add     eax, edx                                ; 0A1E _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0A20 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0A24 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0A26 _ 8B. 45, 10
        add     eax, edx                                ; 0A29 _ 01. D0
        mov     edx, eax                                ; 0A2B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A2D _ 8B. 45, 08
        add     edx, eax                                ; 0A30 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0A32 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0A36 _ 88. 02
?_020:  movsx   eax, byte [ebp-5H]                      ; 0A38 _ 0F BE. 45, FB
        and     eax, 40H                                ; 0A3C _ 83. E0, 40
        test    eax, eax                                ; 0A3F _ 85. C0
        jz      ?_021                                   ; 0A41 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0A43 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0A46 _ 8B. 55, 14
        add     eax, edx                                ; 0A49 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0A4B _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0A4F _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0A51 _ 8B. 45, 10
        add     eax, edx                                ; 0A54 _ 01. D0
        lea     edx, [eax+1H]                           ; 0A56 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0A59 _ 8B. 45, 08
        add     edx, eax                                ; 0A5C _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0A5E _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0A62 _ 88. 02
?_021:  movsx   eax, byte [ebp-5H]                      ; 0A64 _ 0F BE. 45, FB
        and     eax, 20H                                ; 0A68 _ 83. E0, 20
        test    eax, eax                                ; 0A6B _ 85. C0
        jz      ?_022                                   ; 0A6D _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0A6F _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0A72 _ 8B. 55, 14
        add     eax, edx                                ; 0A75 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0A77 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0A7B _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0A7D _ 8B. 45, 10
        add     eax, edx                                ; 0A80 _ 01. D0
        lea     edx, [eax+2H]                           ; 0A82 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0A85 _ 8B. 45, 08
        add     edx, eax                                ; 0A88 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0A8A _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0A8E _ 88. 02
?_022:  movsx   eax, byte [ebp-5H]                      ; 0A90 _ 0F BE. 45, FB
        and     eax, 10H                                ; 0A94 _ 83. E0, 10
        test    eax, eax                                ; 0A97 _ 85. C0
        jz      ?_023                                   ; 0A99 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0A9B _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0A9E _ 8B. 55, 14
        add     eax, edx                                ; 0AA1 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0AA3 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0AA7 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0AA9 _ 8B. 45, 10
        add     eax, edx                                ; 0AAC _ 01. D0
        lea     edx, [eax+3H]                           ; 0AAE _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 0AB1 _ 8B. 45, 08
        add     edx, eax                                ; 0AB4 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0AB6 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0ABA _ 88. 02
?_023:  movsx   eax, byte [ebp-5H]                      ; 0ABC _ 0F BE. 45, FB
        and     eax, 08H                                ; 0AC0 _ 83. E0, 08
        test    eax, eax                                ; 0AC3 _ 85. C0
        jz      ?_024                                   ; 0AC5 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0AC7 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0ACA _ 8B. 55, 14
        add     eax, edx                                ; 0ACD _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0ACF _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0AD3 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0AD5 _ 8B. 45, 10
        add     eax, edx                                ; 0AD8 _ 01. D0
        lea     edx, [eax+4H]                           ; 0ADA _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0ADD _ 8B. 45, 08
        add     edx, eax                                ; 0AE0 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0AE2 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0AE6 _ 88. 02
?_024:  movsx   eax, byte [ebp-5H]                      ; 0AE8 _ 0F BE. 45, FB
        and     eax, 04H                                ; 0AEC _ 83. E0, 04
        test    eax, eax                                ; 0AEF _ 85. C0
        jz      ?_025                                   ; 0AF1 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0AF3 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0AF6 _ 8B. 55, 14
        add     eax, edx                                ; 0AF9 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0AFB _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0AFF _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0B01 _ 8B. 45, 10
        add     eax, edx                                ; 0B04 _ 01. D0
        lea     edx, [eax+5H]                           ; 0B06 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 0B09 _ 8B. 45, 08
        add     edx, eax                                ; 0B0C _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0B0E _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0B12 _ 88. 02
?_025:  movsx   eax, byte [ebp-5H]                      ; 0B14 _ 0F BE. 45, FB
        and     eax, 02H                                ; 0B18 _ 83. E0, 02
        test    eax, eax                                ; 0B1B _ 85. C0
        jz      ?_026                                   ; 0B1D _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0B1F _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0B22 _ 8B. 55, 14
        add     eax, edx                                ; 0B25 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0B27 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0B2B _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0B2D _ 8B. 45, 10
        add     eax, edx                                ; 0B30 _ 01. D0
        lea     edx, [eax+6H]                           ; 0B32 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 0B35 _ 8B. 45, 08
        add     edx, eax                                ; 0B38 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0B3A _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0B3E _ 88. 02
?_026:  movsx   eax, byte [ebp-5H]                      ; 0B40 _ 0F BE. 45, FB
        and     eax, 01H                                ; 0B44 _ 83. E0, 01
        test    eax, eax                                ; 0B47 _ 85. C0
        jz      ?_027                                   ; 0B49 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0B4B _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0B4E _ 8B. 55, 14
        add     eax, edx                                ; 0B51 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0B53 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0B57 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0B59 _ 8B. 45, 10
        add     eax, edx                                ; 0B5C _ 01. D0
        lea     edx, [eax+7H]                           ; 0B5E _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 0B61 _ 8B. 45, 08
        add     edx, eax                                ; 0B64 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0B66 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0B6A _ 88. 02
?_027:  add     dword [ebp-4H], 1                       ; 0B6C _ 83. 45, FC, 01
?_028:  cmp     dword [ebp-4H], 15                      ; 0B70 _ 83. 7D, FC, 0F
        jle     ?_019                                   ; 0B74 _ 0F 8E, FFFFFE8A
        leave                                           ; 0B7A _ C9
        ret                                             ; 0B7B _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 0B7C _ 55
        mov     ebp, esp                                ; 0B7D _ 89. E5
        sub     esp, 20                                 ; 0B7F _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 0B82 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0B85 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0B88 _ C7. 45, FC, 00000000
        jmp     ?_035                                   ; 0B8F _ E9, 000000B1

?_029:  mov     dword [ebp-8H], 0                       ; 0B94 _ C7. 45, F8, 00000000
        jmp     ?_034                                   ; 0B9B _ E9, 00000097

?_030:  mov     eax, dword [ebp-4H]                     ; 0BA0 _ 8B. 45, FC
        shl     eax, 4                                  ; 0BA3 _ C1. E0, 04
        mov     edx, eax                                ; 0BA6 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0BA8 _ 8B. 45, F8
        add     eax, edx                                ; 0BAB _ 01. D0
        add     eax, cursor.1668                        ; 0BAD _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 0BB2 _ 0F B6. 00
        cmp     al, 42                                  ; 0BB5 _ 3C, 2A
        jnz     ?_031                                   ; 0BB7 _ 75, 17
        mov     eax, dword [ebp-4H]                     ; 0BB9 _ 8B. 45, FC
        shl     eax, 4                                  ; 0BBC _ C1. E0, 04
        mov     edx, eax                                ; 0BBF _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0BC1 _ 8B. 45, F8
        add     eax, edx                                ; 0BC4 _ 01. D0
        mov     edx, eax                                ; 0BC6 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0BC8 _ 8B. 45, 08
        add     eax, edx                                ; 0BCB _ 01. D0
        mov     byte [eax], 0                           ; 0BCD _ C6. 00, 00
?_031:  mov     eax, dword [ebp-4H]                     ; 0BD0 _ 8B. 45, FC
        shl     eax, 4                                  ; 0BD3 _ C1. E0, 04
        mov     edx, eax                                ; 0BD6 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0BD8 _ 8B. 45, F8
        add     eax, edx                                ; 0BDB _ 01. D0
        add     eax, cursor.1668                        ; 0BDD _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 0BE2 _ 0F B6. 00
        cmp     al, 79                                  ; 0BE5 _ 3C, 4F
        jnz     ?_032                                   ; 0BE7 _ 75, 17
        mov     eax, dword [ebp-4H]                     ; 0BE9 _ 8B. 45, FC
        shl     eax, 4                                  ; 0BEC _ C1. E0, 04
        mov     edx, eax                                ; 0BEF _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0BF1 _ 8B. 45, F8
        add     eax, edx                                ; 0BF4 _ 01. D0
        mov     edx, eax                                ; 0BF6 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0BF8 _ 8B. 45, 08
        add     eax, edx                                ; 0BFB _ 01. D0
        mov     byte [eax], 7                           ; 0BFD _ C6. 00, 07
?_032:  mov     eax, dword [ebp-4H]                     ; 0C00 _ 8B. 45, FC
        shl     eax, 4                                  ; 0C03 _ C1. E0, 04
        mov     edx, eax                                ; 0C06 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0C08 _ 8B. 45, F8
        add     eax, edx                                ; 0C0B _ 01. D0
        add     eax, cursor.1668                        ; 0C0D _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 0C12 _ 0F B6. 00
        cmp     al, 46                                  ; 0C15 _ 3C, 2E
        jnz     ?_033                                   ; 0C17 _ 75, 1A
        mov     eax, dword [ebp-4H]                     ; 0C19 _ 8B. 45, FC
        shl     eax, 4                                  ; 0C1C _ C1. E0, 04
        mov     edx, eax                                ; 0C1F _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0C21 _ 8B. 45, F8
        add     eax, edx                                ; 0C24 _ 01. D0
        mov     edx, eax                                ; 0C26 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0C28 _ 8B. 45, 08
        add     edx, eax                                ; 0C2B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0C2D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0C31 _ 88. 02
?_033:  add     dword [ebp-8H], 1                       ; 0C33 _ 83. 45, F8, 01
?_034:  cmp     dword [ebp-8H], 15                      ; 0C37 _ 83. 7D, F8, 0F
        jle     ?_030                                   ; 0C3B _ 0F 8E, FFFFFF5F
        add     dword [ebp-4H], 1                       ; 0C41 _ 83. 45, FC, 01
?_035:  cmp     dword [ebp-4H], 15                      ; 0C45 _ 83. 7D, FC, 0F
        jle     ?_029                                   ; 0C49 _ 0F 8E, FFFFFF45
        leave                                           ; 0C4F _ C9
        ret                                             ; 0C50 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 0C51 _ 55
        mov     ebp, esp                                ; 0C52 _ 89. E5
        sub     esp, 16                                 ; 0C54 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 0C57 _ C7. 45, FC, 00000000
        jmp     ?_039                                   ; 0C5E _ EB, 50

?_036:  mov     dword [ebp-8H], 0                       ; 0C60 _ C7. 45, F8, 00000000
        jmp     ?_038                                   ; 0C67 _ EB, 3B

?_037:  mov     eax, dword [ebp-4H]                     ; 0C69 _ 8B. 45, FC
        mov     edx, dword [ebp+1CH]                    ; 0C6C _ 8B. 55, 1C
        add     eax, edx                                ; 0C6F _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0C71 _ 0F AF. 45, 0C
        mov     edx, dword [ebp-8H]                     ; 0C75 _ 8B. 55, F8
        mov     ecx, dword [ebp+18H]                    ; 0C78 _ 8B. 4D, 18
        add     edx, ecx                                ; 0C7B _ 01. CA
        add     eax, edx                                ; 0C7D _ 01. D0
        mov     edx, eax                                ; 0C7F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0C81 _ 8B. 45, 08
        add     edx, eax                                ; 0C84 _ 01. C2
        mov     eax, dword [ebp-4H]                     ; 0C86 _ 8B. 45, FC
        imul    eax, dword [ebp+24H]                    ; 0C89 _ 0F AF. 45, 24
        mov     ecx, eax                                ; 0C8D _ 89. C1
        mov     eax, dword [ebp-8H]                     ; 0C8F _ 8B. 45, F8
        add     eax, ecx                                ; 0C92 _ 01. C8
        mov     ecx, eax                                ; 0C94 _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 0C96 _ 8B. 45, 20
        add     eax, ecx                                ; 0C99 _ 01. C8
        movzx   eax, byte [eax]                         ; 0C9B _ 0F B6. 00
        mov     byte [edx], al                          ; 0C9E _ 88. 02
        add     dword [ebp-8H], 1                       ; 0CA0 _ 83. 45, F8, 01
?_038:  mov     eax, dword [ebp-8H]                     ; 0CA4 _ 8B. 45, F8
        cmp     eax, dword [ebp+10H]                    ; 0CA7 _ 3B. 45, 10
        jl      ?_037                                   ; 0CAA _ 7C, BD
        add     dword [ebp-4H], 1                       ; 0CAC _ 83. 45, FC, 01
?_039:  mov     eax, dword [ebp-4H]                     ; 0CB0 _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 0CB3 _ 3B. 45, 14
        jl      ?_036                                   ; 0CB6 _ 7C, A8
        leave                                           ; 0CB8 _ C9
        ret                                             ; 0CB9 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 0CBA _ 55
        mov     ebp, esp                                ; 0CBB _ 89. E5
        sub     esp, 40                                 ; 0CBD _ 83. EC, 28
        mov     eax, dword [bootInfo]                   ; 0CC0 _ A1, 00000000(d)
        mov     dword [ebp-14H], eax                    ; 0CC5 _ 89. 45, EC
        movzx   eax, word [?_128]                       ; 0CC8 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0CCF _ 98
        mov     dword [ebp-10H], eax                    ; 0CD0 _ 89. 45, F0
        movzx   eax, word [?_129]                       ; 0CD3 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 0CDA _ 98
        mov     dword [ebp-0CH], eax                    ; 0CDB _ 89. 45, F4
        mov     dword [esp+4H], 32                      ; 0CDE _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 0CE6 _ C7. 04 24, 00000020
        call    io_out8                                 ; 0CED _ E8, FFFFFFFC(rel)
        mov     byte [ebp-15H], 0                       ; 0CF2 _ C6. 45, EB, 00
        mov     dword [esp], 96                         ; 0CF6 _ C7. 04 24, 00000060
        call    io_in8                                  ; 0CFD _ E8, FFFFFFFC(rel)
        mov     byte [ebp-15H], al                      ; 0D02 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 0D05 _ 0F B6. 45, EB
        mov     dword [esp+4H], eax                     ; 0D09 _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 0D0D _ C7. 04 24, 00000008(d)
        call    fifo8_put                               ; 0D14 _ E8, FFFFFFFC(rel)
        nop                                             ; 0D19 _ 90
        leave                                           ; 0D1A _ C9
        ret                                             ; 0D1B _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 0D1C _ 55
        mov     ebp, esp                                ; 0D1D _ 89. E5
        sub     esp, 4                                  ; 0D1F _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 0D22 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 0D25 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 0D28 _ 80. 7D, FC, 09
        jle     ?_040                                   ; 0D2C _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 0D2E _ 0F B6. 45, FC
        add     eax, 55                                 ; 0D32 _ 83. C0, 37
        jmp     ?_041                                   ; 0D35 _ EB, 07

?_040:  movzx   eax, byte [ebp-4H]                      ; 0D37 _ 0F B6. 45, FC
        add     eax, 48                                 ; 0D3B _ 83. C0, 30
?_041:  leave                                           ; 0D3E _ C9
        ret                                             ; 0D3F _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 0D40 _ 55
        mov     ebp, esp                                ; 0D41 _ 89. E5
        sub     esp, 24                                 ; 0D43 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 0D46 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 0D49 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0D4C _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 0D53 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 0D57 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 0D5A _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 0D5D _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 0D61 _ 89. 04 24
        call    charToHexVal                            ; 0D64 _ E8, FFFFFFFC(rel)
        mov     byte [?_127], al                        ; 0D69 _ A2, 00000007(d)
        movzx   eax, byte [ebp-14H]                     ; 0D6E _ 0F B6. 45, EC
        shr     al, 4                                   ; 0D72 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 0D75 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 0D78 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 0D7C _ 0F BE. C0
        mov     dword [esp], eax                        ; 0D7F _ 89. 04 24
        call    charToHexVal                            ; 0D82 _ E8, FFFFFFFC(rel)
        mov     byte [?_126], al                        ; 0D87 _ A2, 00000006(d)
        mov     eax, keyval                             ; 0D8C _ B8, 00000004(d)
        leave                                           ; 0D91 _ C9
        ret                                             ; 0D92 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 0D93 _ 55
        mov     ebp, esp                                ; 0D94 _ 89. E5
        sub     esp, 16                                 ; 0D96 _ 83. EC, 10
        mov     byte [str.1716], 48                     ; 0D99 _ C6. 05, 00000220(d), 30
        mov     byte [?_130], 88                        ; 0DA0 _ C6. 05, 00000221(d), 58
        mov     byte [?_131], 0                         ; 0DA7 _ C6. 05, 0000022A(d), 00
        mov     dword [ebp-0CH], 2                      ; 0DAE _ C7. 45, F4, 00000002
        jmp     ?_043                                   ; 0DB5 _ EB, 0F

?_042:  mov     eax, dword [ebp-0CH]                    ; 0DB7 _ 8B. 45, F4
        add     eax, str.1716                           ; 0DBA _ 05, 00000220(d)
        mov     byte [eax], 48                          ; 0DBF _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 0DC2 _ 83. 45, F4, 01
?_043:  cmp     dword [ebp-0CH], 9                      ; 0DC6 _ 83. 7D, F4, 09
        jle     ?_042                                   ; 0DCA _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 0DCC _ C7. 45, F8, 00000009
        jmp     ?_047                                   ; 0DD3 _ EB, 40

?_044:  mov     eax, dword [ebp+8H]                     ; 0DD5 _ 8B. 45, 08
        and     eax, 0FH                                ; 0DD8 _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 0DDB _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0DDE _ 8B. 45, 08
        shr     eax, 4                                  ; 0DE1 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 0DE4 _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 0DE7 _ 83. 7D, FC, 09
        jle     ?_045                                   ; 0DEB _ 7E, 13
        mov     eax, dword [ebp-4H]                     ; 0DED _ 8B. 45, FC
        add     eax, 55                                 ; 0DF0 _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 0DF3 _ 8B. 55, F8
        add     edx, str.1716                           ; 0DF6 _ 81. C2, 00000220(d)
        mov     byte [edx], al                          ; 0DFC _ 88. 02
        jmp     ?_046                                   ; 0DFE _ EB, 11

?_045:  mov     eax, dword [ebp-4H]                     ; 0E00 _ 8B. 45, FC
        add     eax, 48                                 ; 0E03 _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 0E06 _ 8B. 55, F8
        add     edx, str.1716                           ; 0E09 _ 81. C2, 00000220(d)
        mov     byte [edx], al                          ; 0E0F _ 88. 02
?_046:  sub     dword [ebp-8H], 1                       ; 0E11 _ 83. 6D, F8, 01
?_047:  cmp     dword [ebp-8H], 1                       ; 0E15 _ 83. 7D, F8, 01
        jle     ?_048                                   ; 0E19 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 0E1B _ 83. 7D, 08, 00
        jnz     ?_044                                   ; 0E1F _ 75, B4
?_048:  mov     eax, str.1716                           ; 0E21 _ B8, 00000220(d)
        leave                                           ; 0E26 _ C9
        ret                                             ; 0E27 _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 0E28 _ 55
        mov     ebp, esp                                ; 0E29 _ 89. E5
        sub     esp, 24                                 ; 0E2B _ 83. EC, 18
?_049:  mov     dword [esp], 100                        ; 0E2E _ C7. 04 24, 00000064
        call    io_in8                                  ; 0E35 _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 0E3A _ 83. E0, 02
        test    eax, eax                                ; 0E3D _ 85. C0
        jnz     ?_050                                   ; 0E3F _ 75, 02
        jmp     ?_051                                   ; 0E41 _ EB, 02

?_050:  jmp     ?_049                                   ; 0E43 _ EB, E9

?_051:  leave                                           ; 0E45 _ C9
        ret                                             ; 0E46 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 0E47 _ 55
        mov     ebp, esp                                ; 0E48 _ 89. E5
        sub     esp, 24                                 ; 0E4A _ 83. EC, 18
        call    wait_KBC_sendready                      ; 0E4D _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 0E52 _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 0E5A _ C7. 04 24, 00000064
        call    io_out8                                 ; 0E61 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 0E66 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 0E6B _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 0E73 _ C7. 04 24, 00000060
        call    io_out8                                 ; 0E7A _ E8, FFFFFFFC(rel)
        nop                                             ; 0E7F _ 90
        leave                                           ; 0E80 _ C9
        ret                                             ; 0E81 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 0E82 _ 55
        mov     ebp, esp                                ; 0E83 _ 89. E5
        sub     esp, 24                                 ; 0E85 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 0E88 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 0E8D _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 0E95 _ C7. 04 24, 00000064
        call    io_out8                                 ; 0E9C _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 0EA1 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 0EA6 _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 0EAE _ C7. 04 24, 00000060
        call    io_out8                                 ; 0EB5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0EBA _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 0EBD _ C6. 40, 03, 00
        nop                                             ; 0EC1 _ 90
        leave                                           ; 0EC2 _ C9
        ret                                             ; 0EC3 _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 0EC4 _ 55
        mov     ebp, esp                                ; 0EC5 _ 89. E5
        sub     esp, 40                                 ; 0EC7 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 0ECA _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 0ED2 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 0ED9 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 0EDE _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 0EE6 _ C7. 04 24, 00000020
        call    io_out8                                 ; 0EED _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 0EF2 _ C7. 04 24, 00000060
        call    io_in8                                  ; 0EF9 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 0EFE _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0F01 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 0F05 _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 0F09 _ C7. 04 24, 00000020(d)
        call    fifo8_put                               ; 0F10 _ E8, FFFFFFFC(rel)
        leave                                           ; 0F15 _ C9
        ret                                             ; 0F16 _ C3
; intHandlerForMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 0F17 _ 55
        mov     ebp, esp                                ; 0F18 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0F1A _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0F1D _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 0F20 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0F23 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 0F26 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 0F29 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0F2B _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0F2E _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 0F31 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0F34 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0F37 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 0F3E _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0F41 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 0F48 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0F4B _ C7. 40, 08, 00000000
        nop                                             ; 0F52 _ 90
        pop     ebp                                     ; 0F53 _ 5D
        ret                                             ; 0F54 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 0F55 _ 55
        mov     ebp, esp                                ; 0F56 _ 89. E5
        sub     esp, 4                                  ; 0F58 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0F5B _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0F5E _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0F61 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0F64 _ 8B. 40, 10
        test    eax, eax                                ; 0F67 _ 85. C0
        jnz     ?_052                                   ; 0F69 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 0F6B _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 0F6E _ 8B. 40, 14
        or      eax, 01H                                ; 0F71 _ 83. C8, 01
        mov     edx, eax                                ; 0F74 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F76 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 0F79 _ 89. 50, 14
        mov     eax, 4294967295                         ; 0F7C _ B8, FFFFFFFF
        jmp     ?_054                                   ; 0F81 _ EB, 50

?_052:  mov     eax, dword [ebp+8H]                     ; 0F83 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0F86 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0F88 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0F8B _ 8B. 40, 04
        add     edx, eax                                ; 0F8E _ 01. C2
        movzx   eax, byte [ebp-4H]                      ; 0F90 _ 0F B6. 45, FC
        mov     byte [edx], al                          ; 0F94 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 0F96 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0F99 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 0F9C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0F9F _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0FA2 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0FA5 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0FA8 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0FAB _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0FAE _ 8B. 40, 0C
        cmp     edx, eax                                ; 0FB1 _ 39. C2
        jnz     ?_053                                   ; 0FB3 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0FB5 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0FB8 _ C7. 40, 04, 00000000
?_053:  mov     eax, dword [ebp+8H]                     ; 0FBF _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0FC2 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 0FC5 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 0FC8 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0FCB _ 89. 50, 10
        mov     eax, 0                                  ; 0FCE _ B8, 00000000
?_054:  leave                                           ; 0FD3 _ C9
        ret                                             ; 0FD4 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 0FD5 _ 55
        mov     ebp, esp                                ; 0FD6 _ 89. E5
        sub     esp, 16                                 ; 0FD8 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 0FDB _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 0FDE _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0FE1 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0FE4 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0FE7 _ 39. C2
        jnz     ?_055                                   ; 0FE9 _ 75, 07
        mov     eax, 4294967295                         ; 0FEB _ B8, FFFFFFFF
        jmp     ?_057                                   ; 0FF0 _ EB, 51

?_055:  mov     eax, dword [ebp+8H]                     ; 0FF2 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0FF5 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0FF7 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0FFA _ 8B. 40, 08
        add     eax, edx                                ; 0FFD _ 01. D0
        movzx   eax, byte [eax]                         ; 0FFF _ 0F B6. 00
        movzx   eax, al                                 ; 1002 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 1005 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1008 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 100B _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 100E _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1011 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1014 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1017 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 101A _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 101D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1020 _ 8B. 40, 0C
        cmp     edx, eax                                ; 1023 _ 39. C2
        jnz     ?_056                                   ; 1025 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 1027 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 102A _ C7. 40, 08, 00000000
?_056:  mov     eax, dword [ebp+8H]                     ; 1031 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1034 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 1037 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 103A _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 103D _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 1040 _ 8B. 45, FC
?_057:  leave                                           ; 1043 _ C9
        ret                                             ; 1044 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 1045 _ 55
        mov     ebp, esp                                ; 1046 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1048 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 104B _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 104E _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1051 _ 8B. 40, 10
        sub     edx, eax                                ; 1054 _ 29. C2
        mov     eax, edx                                ; 1056 _ 89. D0
        pop     ebp                                     ; 1058 _ 5D
        ret                                             ; 1059 _ C3
; fifo8_status End of function

mouse_decode:; Function begin
        push    ebp                                     ; 105A _ 55
        mov     ebp, esp                                ; 105B _ 89. E5
        sub     esp, 4                                  ; 105D _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 1060 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 1063 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1066 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1069 _ 0F B6. 40, 03
        test    al, al                                  ; 106D _ 84. C0
        jnz     ?_059                                   ; 106F _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 1071 _ 80. 7D, FC, FA
        jnz     ?_058                                   ; 1075 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 1077 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 107A _ C6. 40, 03, 01
?_058:  mov     eax, 0                                  ; 107E _ B8, 00000000
        jmp     ?_066                                   ; 1083 _ E9, 0000010F

?_059:  mov     eax, dword [ebp+8H]                     ; 1088 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 108B _ 0F B6. 40, 03
        cmp     al, 1                                   ; 108F _ 3C, 01
        jnz     ?_061                                   ; 1091 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 1093 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 1097 _ 25, 000000C8
        cmp     eax, 8                                  ; 109C _ 83. F8, 08
        jnz     ?_060                                   ; 109F _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 10A1 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 10A4 _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 10A8 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 10AA _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 10AD _ C6. 40, 03, 02
?_060:  mov     eax, 0                                  ; 10B1 _ B8, 00000000
        jmp     ?_066                                   ; 10B6 _ E9, 000000DC

?_061:  mov     eax, dword [ebp+8H]                     ; 10BB _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 10BE _ 0F B6. 40, 03
        cmp     al, 2                                   ; 10C2 _ 3C, 02
        jnz     ?_062                                   ; 10C4 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 10C6 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 10C9 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 10CD _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 10D0 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 10D3 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 10D7 _ B8, 00000000
        jmp     ?_066                                   ; 10DC _ E9, 000000B6

?_062:  mov     eax, dword [ebp+8H]                     ; 10E1 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 10E4 _ 0F B6. 40, 03
        cmp     al, 3                                   ; 10E8 _ 3C, 03
        jne     ?_065                                   ; 10EA _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 10F0 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 10F3 _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 10F7 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 10FA _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 10FD _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 1101 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1104 _ 0F B6. 00
        movzx   eax, al                                 ; 1107 _ 0F B6. C0
        and     eax, 07H                                ; 110A _ 83. E0, 07
        mov     edx, eax                                ; 110D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 110F _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1112 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1115 _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 1118 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 111C _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 111F _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1122 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1125 _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 1128 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 112C _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 112F _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1132 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1135 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1138 _ 0F B6. 00
        movzx   eax, al                                 ; 113B _ 0F B6. C0
        and     eax, 10H                                ; 113E _ 83. E0, 10
        test    eax, eax                                ; 1141 _ 85. C0
        jz      ?_063                                   ; 1143 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 1145 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1148 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 114B _ 0D, FFFFFF00
        mov     edx, eax                                ; 1150 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1152 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1155 _ 89. 50, 04
?_063:  mov     eax, dword [ebp+8H]                     ; 1158 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 115B _ 0F B6. 00
        movzx   eax, al                                 ; 115E _ 0F B6. C0
        and     eax, 20H                                ; 1161 _ 83. E0, 20
        test    eax, eax                                ; 1164 _ 85. C0
        jz      ?_064                                   ; 1166 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 1168 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 116B _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 116E _ 0D, FFFFFF00
        mov     edx, eax                                ; 1173 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1175 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1178 _ 89. 50, 08
?_064:  mov     eax, dword [ebp+8H]                     ; 117B _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 117E _ 8B. 40, 08
        neg     eax                                     ; 1181 _ F7. D8
        mov     edx, eax                                ; 1183 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1185 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1188 _ 89. 50, 08
        mov     eax, 1                                  ; 118B _ B8, 00000001
        jmp     ?_066                                   ; 1190 _ EB, 05

?_065:  mov     eax, 4294967295                         ; 1192 _ B8, FFFFFFFF
?_066:  leave                                           ; 1197 _ C9
        ret                                             ; 1198 _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 1199 _ 55
        mov     ebp, esp                                ; 119A _ 89. E5
        sub     esp, 88                                 ; 119C _ 83. EC, 58
        mov     dword [ebp-30H], 0                      ; 119F _ C7. 45, D0, 00000000
        mov     dword [ebp-2CH], 0                      ; 11A6 _ C7. 45, D4, 00000000
        mov     dword [ebp-28H], 104                    ; 11AD _ C7. 45, D8, 00000068
        mov     dword [ebp-24H], 80                     ; 11B4 _ C7. 45, DC, 00000050
        mov     dword [esp+18H], 100                    ; 11BB _ C7. 44 24, 18, 00000064
        mov     eax, dword [ebp+14H]                    ; 11C3 _ 8B. 45, 14
        mov     dword [esp+14H], eax                    ; 11C6 _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 11CA _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 11D2 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 14                      ; 11DA _ C7. 44 24, 08, 0000000E
        mov     eax, dword [ebp+14H]                    ; 11E2 _ 8B. 45, 14
        mov     dword [esp+4H], eax                     ; 11E5 _ 89. 44 24, 04
        mov     eax, dword [ebp+0CH]                    ; 11E9 _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 11EC _ 89. 04 24
        call    boxfill8                                ; 11EF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+18H]                    ; 11F4 _ 8B. 45, 18
        movsx   eax, al                                 ; 11F7 _ 0F BE. C0
        mov     dword [esp+14H], ?_120                  ; 11FA _ C7. 44 24, 14, 0000000B(d)
        mov     dword [esp+10H], eax                    ; 1202 _ 89. 44 24, 10
        mov     eax, dword [ebp-2CH]                    ; 1206 _ 8B. 45, D4
        mov     dword [esp+0CH], eax                    ; 1209 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 120D _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1210 _ 89. 44 24, 08
        mov     eax, dword [ebp+14H]                    ; 1214 _ 8B. 45, 14
        mov     dword [esp+4H], eax                     ; 1217 _ 89. 44 24, 04
        mov     eax, dword [ebp+0CH]                    ; 121B _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 121E _ 89. 04 24
        call    showString                              ; 1221 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1226 _ 8B. 45, 10
        mov     dword [esp], eax                        ; 1229 _ 89. 04 24
        call    intToHexStr                             ; 122C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 1231 _ 89. 45, E0
        mov     eax, dword [ebp+18H]                    ; 1234 _ 8B. 45, 18
        movsx   eax, al                                 ; 1237 _ 0F BE. C0
        mov     edx, dword [ebp-20H]                    ; 123A _ 8B. 55, E0
        mov     dword [esp+14H], edx                    ; 123D _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 1241 _ 89. 44 24, 10
        mov     eax, dword [ebp-2CH]                    ; 1245 _ 8B. 45, D4
        mov     dword [esp+0CH], eax                    ; 1248 _ 89. 44 24, 0C
        mov     eax, dword [ebp-28H]                    ; 124C _ 8B. 45, D8
        mov     dword [esp+8H], eax                     ; 124F _ 89. 44 24, 08
        mov     eax, dword [ebp+14H]                    ; 1253 _ 8B. 45, 14
        mov     dword [esp+4H], eax                     ; 1256 _ 89. 44 24, 04
        mov     eax, dword [ebp+0CH]                    ; 125A _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 125D _ 89. 04 24
        call    showString                              ; 1260 _ E8, FFFFFFFC(rel)
        add     dword [ebp-2CH], 16                     ; 1265 _ 83. 45, D4, 10
        mov     eax, dword [ebp+18H]                    ; 1269 _ 8B. 45, 18
        movsx   eax, al                                 ; 126C _ 0F BE. C0
        mov     dword [esp+14H], ?_121                  ; 126F _ C7. 44 24, 14, 00000015(d)
        mov     dword [esp+10H], eax                    ; 1277 _ 89. 44 24, 10
        mov     eax, dword [ebp-2CH]                    ; 127B _ 8B. 45, D4
        mov     dword [esp+0CH], eax                    ; 127E _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1282 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1285 _ 89. 44 24, 08
        mov     eax, dword [ebp+14H]                    ; 1289 _ 8B. 45, 14
        mov     dword [esp+4H], eax                     ; 128C _ 89. 44 24, 04
        mov     eax, dword [ebp+0CH]                    ; 1290 _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 1293 _ 89. 04 24
        call    showString                              ; 1296 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 129B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 129E _ 8B. 00
        mov     dword [esp], eax                        ; 12A0 _ 89. 04 24
        call    intToHexStr                             ; 12A3 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 12A8 _ 89. 45, E4
        mov     eax, dword [ebp+18H]                    ; 12AB _ 8B. 45, 18
        movsx   eax, al                                 ; 12AE _ 0F BE. C0
        mov     edx, dword [ebp-1CH]                    ; 12B1 _ 8B. 55, E4
        mov     dword [esp+14H], edx                    ; 12B4 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 12B8 _ 89. 44 24, 10
        mov     eax, dword [ebp-2CH]                    ; 12BC _ 8B. 45, D4
        mov     dword [esp+0CH], eax                    ; 12BF _ 89. 44 24, 0C
        mov     eax, dword [ebp-28H]                    ; 12C3 _ 8B. 45, D8
        mov     dword [esp+8H], eax                     ; 12C6 _ 89. 44 24, 08
        mov     eax, dword [ebp+14H]                    ; 12CA _ 8B. 45, 14
        mov     dword [esp+4H], eax                     ; 12CD _ 89. 44 24, 04
        mov     eax, dword [ebp+0CH]                    ; 12D1 _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 12D4 _ 89. 04 24
        call    showString                              ; 12D7 _ E8, FFFFFFFC(rel)
        add     dword [ebp-2CH], 16                     ; 12DC _ 83. 45, D4, 10
        mov     eax, dword [ebp+18H]                    ; 12E0 _ 8B. 45, 18
        movsx   eax, al                                 ; 12E3 _ 0F BE. C0
        mov     dword [esp+14H], ?_122                  ; 12E6 _ C7. 44 24, 14, 00000021(d)
        mov     dword [esp+10H], eax                    ; 12EE _ 89. 44 24, 10
        mov     eax, dword [ebp-2CH]                    ; 12F2 _ 8B. 45, D4
        mov     dword [esp+0CH], eax                    ; 12F5 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 12F9 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 12FC _ 89. 44 24, 08
        mov     eax, dword [ebp+14H]                    ; 1300 _ 8B. 45, 14
        mov     dword [esp+4H], eax                     ; 1303 _ 89. 44 24, 04
        mov     eax, dword [ebp+0CH]                    ; 1307 _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 130A _ 89. 04 24
        call    showString                              ; 130D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 1312 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1315 _ 8B. 40, 04
        mov     dword [esp], eax                        ; 1318 _ 89. 04 24
        call    intToHexStr                             ; 131B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 1320 _ 89. 45, E8
        mov     eax, dword [ebp+18H]                    ; 1323 _ 8B. 45, 18
        movsx   eax, al                                 ; 1326 _ 0F BE. C0
        mov     edx, dword [ebp-18H]                    ; 1329 _ 8B. 55, E8
        mov     dword [esp+14H], edx                    ; 132C _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 1330 _ 89. 44 24, 10
        mov     eax, dword [ebp-2CH]                    ; 1334 _ 8B. 45, D4
        mov     dword [esp+0CH], eax                    ; 1337 _ 89. 44 24, 0C
        mov     eax, dword [ebp-28H]                    ; 133B _ 8B. 45, D8
        mov     dword [esp+8H], eax                     ; 133E _ 89. 44 24, 08
        mov     eax, dword [ebp+14H]                    ; 1342 _ 8B. 45, 14
        mov     dword [esp+4H], eax                     ; 1345 _ 89. 44 24, 04
        mov     eax, dword [ebp+0CH]                    ; 1349 _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 134C _ 89. 04 24
        call    showString                              ; 134F _ E8, FFFFFFFC(rel)
        add     dword [ebp-2CH], 16                     ; 1354 _ 83. 45, D4, 10
        mov     eax, dword [ebp+18H]                    ; 1358 _ 8B. 45, 18
        movsx   eax, al                                 ; 135B _ 0F BE. C0
        mov     dword [esp+14H], ?_123                  ; 135E _ C7. 44 24, 14, 0000002D(d)
        mov     dword [esp+10H], eax                    ; 1366 _ 89. 44 24, 10
        mov     eax, dword [ebp-2CH]                    ; 136A _ 8B. 45, D4
        mov     dword [esp+0CH], eax                    ; 136D _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1371 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1374 _ 89. 44 24, 08
        mov     eax, dword [ebp+14H]                    ; 1378 _ 8B. 45, 14
        mov     dword [esp+4H], eax                     ; 137B _ 89. 44 24, 04
        mov     eax, dword [ebp+0CH]                    ; 137F _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 1382 _ 89. 04 24
        call    showString                              ; 1385 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 138A _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 138D _ 8B. 40, 08
        mov     dword [esp], eax                        ; 1390 _ 89. 04 24
        call    intToHexStr                             ; 1393 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 1398 _ 89. 45, EC
        mov     eax, dword [ebp+18H]                    ; 139B _ 8B. 45, 18
        movsx   eax, al                                 ; 139E _ 0F BE. C0
        mov     edx, dword [ebp-14H]                    ; 13A1 _ 8B. 55, EC
        mov     dword [esp+14H], edx                    ; 13A4 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 13A8 _ 89. 44 24, 10
        mov     eax, dword [ebp-2CH]                    ; 13AC _ 8B. 45, D4
        mov     dword [esp+0CH], eax                    ; 13AF _ 89. 44 24, 0C
        mov     eax, dword [ebp-28H]                    ; 13B3 _ 8B. 45, D8
        mov     dword [esp+8H], eax                     ; 13B6 _ 89. 44 24, 08
        mov     eax, dword [ebp+14H]                    ; 13BA _ 8B. 45, 14
        mov     dword [esp+4H], eax                     ; 13BD _ 89. 44 24, 04
        mov     eax, dword [ebp+0CH]                    ; 13C1 _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 13C4 _ 89. 04 24
        call    showString                              ; 13C7 _ E8, FFFFFFFC(rel)
        add     dword [ebp-2CH], 16                     ; 13CC _ 83. 45, D4, 10
        mov     eax, dword [ebp+18H]                    ; 13D0 _ 8B. 45, 18
        movsx   eax, al                                 ; 13D3 _ 0F BE. C0
        mov     dword [esp+14H], ?_124                  ; 13D6 _ C7. 44 24, 14, 00000039(d)
        mov     dword [esp+10H], eax                    ; 13DE _ 89. 44 24, 10
        mov     eax, dword [ebp-2CH]                    ; 13E2 _ 8B. 45, D4
        mov     dword [esp+0CH], eax                    ; 13E5 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 13E9 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 13EC _ 89. 44 24, 08
        mov     eax, dword [ebp+14H]                    ; 13F0 _ 8B. 45, 14
        mov     dword [esp+4H], eax                     ; 13F3 _ 89. 44 24, 04
        mov     eax, dword [ebp+0CH]                    ; 13F7 _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 13FA _ 89. 04 24
        call    showString                              ; 13FD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 1402 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1405 _ 8B. 40, 0C
        mov     dword [esp], eax                        ; 1408 _ 89. 04 24
        call    intToHexStr                             ; 140B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1410 _ 89. 45, F0
        mov     eax, dword [ebp+18H]                    ; 1413 _ 8B. 45, 18
        movsx   eax, al                                 ; 1416 _ 0F BE. C0
        mov     edx, dword [ebp-10H]                    ; 1419 _ 8B. 55, F0
        mov     dword [esp+14H], edx                    ; 141C _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 1420 _ 89. 44 24, 10
        mov     eax, dword [ebp-2CH]                    ; 1424 _ 8B. 45, D4
        mov     dword [esp+0CH], eax                    ; 1427 _ 89. 44 24, 0C
        mov     eax, dword [ebp-28H]                    ; 142B _ 8B. 45, D8
        mov     dword [esp+8H], eax                     ; 142E _ 89. 44 24, 08
        mov     eax, dword [ebp+14H]                    ; 1432 _ 8B. 45, 14
        mov     dword [esp+4H], eax                     ; 1435 _ 89. 44 24, 04
        mov     eax, dword [ebp+0CH]                    ; 1439 _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 143C _ 89. 04 24
        call    showString                              ; 143F _ E8, FFFFFFFC(rel)
        add     dword [ebp-2CH], 16                     ; 1444 _ 83. 45, D4, 10
        mov     eax, dword [ebp+18H]                    ; 1448 _ 8B. 45, 18
        movsx   eax, al                                 ; 144B _ 0F BE. C0
        mov     dword [esp+14H], ?_125                  ; 144E _ C7. 44 24, 14, 00000046(d)
        mov     dword [esp+10H], eax                    ; 1456 _ 89. 44 24, 10
        mov     eax, dword [ebp-2CH]                    ; 145A _ 8B. 45, D4
        mov     dword [esp+0CH], eax                    ; 145D _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1461 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1464 _ 89. 44 24, 08
        mov     eax, dword [ebp+14H]                    ; 1468 _ 8B. 45, 14
        mov     dword [esp+4H], eax                     ; 146B _ 89. 44 24, 04
        mov     eax, dword [ebp+0CH]                    ; 146F _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 1472 _ 89. 04 24
        call    showString                              ; 1475 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 147A _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 147D _ 8B. 40, 10
        mov     dword [esp], eax                        ; 1480 _ 89. 04 24
        call    intToHexStr                             ; 1483 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 1488 _ 89. 45, F4
        mov     eax, dword [ebp+18H]                    ; 148B _ 8B. 45, 18
        movsx   eax, al                                 ; 148E _ 0F BE. C0
        mov     edx, dword [ebp-0CH]                    ; 1491 _ 8B. 55, F4
        mov     dword [esp+14H], edx                    ; 1494 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 1498 _ 89. 44 24, 10
        mov     eax, dword [ebp-2CH]                    ; 149C _ 8B. 45, D4
        mov     dword [esp+0CH], eax                    ; 149F _ 89. 44 24, 0C
        mov     eax, dword [ebp-28H]                    ; 14A3 _ 8B. 45, D8
        mov     dword [esp+8H], eax                     ; 14A6 _ 89. 44 24, 08
        mov     eax, dword [ebp+14H]                    ; 14AA _ 8B. 45, 14
        mov     dword [esp+4H], eax                     ; 14AD _ 89. 44 24, 04
        mov     eax, dword [ebp+0CH]                    ; 14B1 _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 14B4 _ 89. 04 24
        call    showString                              ; 14B7 _ E8, FFFFFFFC(rel)
        leave                                           ; 14BC _ C9
        ret                                             ; 14BD _ C3
; showMemoryInfo End of function

shtctl_init:; Function begin
        push    ebp                                     ; 14BE _ 55
        mov     ebp, esp                                ; 14BF _ 89. E5
        sub     esp, 40                                 ; 14C1 _ 83. EC, 28
        mov     dword [esp+4H], 9232                    ; 14C4 _ C7. 44 24, 04, 00002410
        mov     eax, dword [ebp+8H]                     ; 14CC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 14CF _ 89. 04 24
        call    memman_alloc_4k                        ; 14D2 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 14D7 _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 14DA _ 83. 7D, F4, 00
        jnz     ?_067                                   ; 14DE _ 75, 07
        mov     eax, 0                                  ; 14E0 _ B8, 00000000
        jmp     ?_070                                   ; 14E5 _ EB, 54

?_067:  mov     eax, dword [ebp-0CH]                    ; 14E7 _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 14EA _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 14ED _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 14EF _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 14F2 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 14F5 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 14F8 _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 14FB _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 14FE _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 1501 _ 8B. 45, F4
        mov     dword [eax+0CH], -1                     ; 1504 _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 150B _ C7. 45, F0, 00000000
        jmp     ?_069                                   ; 1512 _ EB, 1B

?_068:  mov     eax, dword [ebp-0CH]                    ; 1514 _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 1517 _ 8B. 55, F0
        add     edx, 33                                 ; 151A _ 83. C2, 21
        shl     edx, 5                                  ; 151D _ C1. E2, 05
        add     eax, edx                                ; 1520 _ 01. D0
        add     eax, 12                                 ; 1522 _ 83. C0, 0C
        mov     dword [eax], 0                          ; 1525 _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 152B _ 83. 45, F0, 01
?_069:  cmp     dword [ebp-10H], 255                    ; 152F _ 81. 7D, F0, 000000FF
        jle     ?_068                                   ; 1536 _ 7E, DC
        mov     eax, dword [ebp-0CH]                    ; 1538 _ 8B. 45, F4
?_070:  leave                                           ; 153B _ C9
        ret                                             ; 153C _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 153D _ 55
        mov     ebp, esp                                ; 153E _ 89. E5
        sub     esp, 16                                 ; 1540 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1543 _ C7. 45, F8, 00000000
        jmp     ?_073                                   ; 154A _ EB, 57

?_071:  mov     eax, dword [ebp+8H]                     ; 154C _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 154F _ 8B. 55, F8
        add     edx, 33                                 ; 1552 _ 83. C2, 21
        shl     edx, 5                                  ; 1555 _ C1. E2, 05
        add     eax, edx                                ; 1558 _ 01. D0
        add     eax, 12                                 ; 155A _ 83. C0, 0C
        mov     eax, dword [eax]                        ; 155D _ 8B. 00
        test    eax, eax                                ; 155F _ 85. C0
        jnz     ?_072                                   ; 1561 _ 75, 3C
        mov     eax, dword [ebp-8H]                     ; 1563 _ 8B. 45, F8
        shl     eax, 5                                  ; 1566 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 1569 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 156F _ 8B. 45, 08
        add     eax, edx                                ; 1572 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 1574 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1577 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 157A _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 157D _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 1580 _ 8B. 55, FC
        mov     dword [eax+ecx*4], edx                  ; 1583 _ 89. 14 88
        mov     eax, dword [ebp-4H]                     ; 1586 _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 1589 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 1590 _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 1593 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 159A _ 8B. 45, FC
        jmp     ?_074                                   ; 159D _ EB, 12

?_072:  add     dword [ebp-8H], 1                       ; 159F _ 83. 45, F8, 01
?_073:  cmp     dword [ebp-8H], 255                     ; 15A3 _ 81. 7D, F8, 000000FF
        jle     ?_071                                   ; 15AA _ 7E, A0
        mov     eax, 0                                  ; 15AC _ B8, 00000000
?_074:  leave                                           ; 15B1 _ C9
        ret                                             ; 15B2 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 15B3 _ 55
        mov     ebp, esp                                ; 15B4 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 15B6 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 15B9 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 15BC _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 15BE _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 15C1 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 15C4 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 15C7 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 15CA _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 15CD _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 15D0 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 15D3 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 15D6 _ 89. 50, 14
        nop                                             ; 15D9 _ 90
        pop     ebp                                     ; 15DA _ 5D
        ret                                             ; 15DB _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 15DC _ 55
        mov     ebp, esp                                ; 15DD _ 89. E5
        sub     esp, 40                                 ; 15DF _ 83. EC, 28
        mov     eax, dword [ebp+0CH]                    ; 15E2 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 15E5 _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 15E8 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 15EB _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 15EE _ 8B. 40, 0C
        add     eax, 1                                  ; 15F1 _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 15F4 _ 3B. 45, 10
        jge     ?_075                                   ; 15F7 _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 15F9 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 15FC _ 8B. 40, 0C
        add     eax, 1                                  ; 15FF _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 1602 _ 89. 45, 10
?_075:  cmp     dword [ebp+10H], -1                     ; 1605 _ 83. 7D, 10, FF
        jge     ?_076                                   ; 1609 _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 160B _ C7. 45, 10, FFFFFFFF
?_076:  mov     eax, dword [ebp+0CH]                    ; 1612 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 1615 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 1618 _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 161B _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 161E _ 3B. 45, 10
        jle     ?_084                                   ; 1621 _ 0F 8E, 000000C6
        cmp     dword [ebp+10H], 0                      ; 1627 _ 83. 7D, 10, 00
        js      ?_079                                   ; 162B _ 78, 52
        mov     eax, dword [ebp-0CH]                    ; 162D _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 1630 _ 89. 45, F0
        jmp     ?_078                                   ; 1633 _ EB, 31

?_077:  mov     eax, dword [ebp-10H]                    ; 1635 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1638 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 163B _ 8B. 45, 08
        add     edx, 4                                  ; 163E _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1641 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1644 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 1647 _ 8B. 4D, F0
        add     ecx, 4                                  ; 164A _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 164D _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1650 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1653 _ 8B. 55, F0
        add     edx, 4                                  ; 1656 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1659 _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 165C _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 165F _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 1662 _ 83. 6D, F0, 01
?_078:  mov     eax, dword [ebp-10H]                    ; 1666 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1669 _ 3B. 45, 10
        jg      ?_077                                   ; 166C _ 7F, C7
        mov     eax, dword [ebp+8H]                     ; 166E _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1671 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1674 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1677 _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 167A _ 89. 14 88
        jmp     ?_083                                   ; 167D _ EB, 5E

?_079:  mov     eax, dword [ebp+8H]                     ; 167F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1682 _ 8B. 40, 0C
        cmp     eax, dword [ebp-0CH]                    ; 1685 _ 3B. 45, F4
        jle     ?_082                                   ; 1688 _ 7E, 44
        mov     eax, dword [ebp-0CH]                    ; 168A _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 168D _ 89. 45, F0
        jmp     ?_081                                   ; 1690 _ EB, 31

?_080:  mov     eax, dword [ebp-10H]                    ; 1692 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 1695 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1698 _ 8B. 45, 08
        add     edx, 4                                  ; 169B _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 169E _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 16A1 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 16A4 _ 8B. 4D, F0
        add     ecx, 4                                  ; 16A7 _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 16AA _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 16AD _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 16B0 _ 8B. 55, F0
        add     edx, 4                                  ; 16B3 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 16B6 _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 16B9 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 16BC _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 16BF _ 83. 45, F0, 01
?_081:  mov     eax, dword [ebp+8H]                     ; 16C3 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 16C6 _ 8B. 40, 0C
        cmp     eax, dword [ebp-10H]                    ; 16C9 _ 3B. 45, F0
        jg      ?_080                                   ; 16CC _ 7F, C4
?_082:  mov     eax, dword [ebp+8H]                     ; 16CE _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 16D1 _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 16D4 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 16D7 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 16DA _ 89. 50, 0C
?_083:  mov     eax, dword [ebp+8H]                     ; 16DD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 16E0 _ 89. 04 24
        call    sheet_refresh                           ; 16E3 _ E8, FFFFFFFC(rel)
        jmp     ?_091                                   ; 16E8 _ E9, 000000D7

?_084:  mov     eax, dword [ebp-0CH]                    ; 16ED _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 16F0 _ 3B. 45, 10
        jge     ?_091                                   ; 16F3 _ 0F 8D, 000000CB
        cmp     dword [ebp-0CH], 0                      ; 16F9 _ 83. 7D, F4, 00
        js      ?_087                                   ; 16FD _ 78, 52
        mov     eax, dword [ebp-0CH]                    ; 16FF _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 1702 _ 89. 45, F0
        jmp     ?_086                                   ; 1705 _ EB, 31

?_085:  mov     eax, dword [ebp-10H]                    ; 1707 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 170A _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 170D _ 8B. 45, 08
        add     edx, 4                                  ; 1710 _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1713 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1716 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 1719 _ 8B. 4D, F0
        add     ecx, 4                                  ; 171C _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 171F _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1722 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1725 _ 8B. 55, F0
        add     edx, 4                                  ; 1728 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 172B _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 172E _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 1731 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 1734 _ 83. 45, F0, 01
?_086:  mov     eax, dword [ebp-10H]                    ; 1738 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 173B _ 3B. 45, 10
        jl      ?_085                                   ; 173E _ 7C, C7
        mov     eax, dword [ebp+8H]                     ; 1740 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1743 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1746 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1749 _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 174C _ 89. 14 88
        jmp     ?_090                                   ; 174F _ EB, 68

?_087:  mov     eax, dword [ebp+8H]                     ; 1751 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1754 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 1757 _ 89. 45, F0
        jmp     ?_089                                   ; 175A _ EB, 37

?_088:  mov     eax, dword [ebp-10H]                    ; 175C _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 175F _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1762 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1765 _ 8B. 55, F0
        add     edx, 4                                  ; 1768 _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 176B _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 176E _ 8B. 45, 08
        add     ecx, 4                                  ; 1771 _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1774 _ 89. 14 88
        mov     eax, dword [ebp-10H]                    ; 1777 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 177A _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 177D _ 8B. 45, 08
        add     edx, 4                                  ; 1780 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1783 _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 1786 _ 8B. 55, F0
        add     edx, 1                                  ; 1789 _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 178C _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 178F _ 83. 6D, F0, 01
?_089:  mov     eax, dword [ebp-10H]                    ; 1793 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1796 _ 3B. 45, 10
        jge     ?_088                                   ; 1799 _ 7D, C1
        mov     eax, dword [ebp+8H]                     ; 179B _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 179E _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 17A1 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 17A4 _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 17A7 _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 17AA _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 17AD _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 17B0 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 17B3 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 17B6 _ 89. 50, 0C
?_090:  mov     eax, dword [ebp+8H]                     ; 17B9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 17BC _ 89. 04 24
        call    sheet_refresh                           ; 17BF _ E8, FFFFFFFC(rel)
?_091:  leave                                           ; 17C4 _ C9
        ret                                             ; 17C5 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 17C6 _ 55
        mov     ebp, esp                                ; 17C7 _ 89. E5
        sub     esp, 48                                 ; 17C9 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 17CC _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 17CF _ 8B. 00
        mov     dword [ebp-14H], eax                    ; 17D1 _ 89. 45, EC
        mov     dword [ebp-20H], 0                      ; 17D4 _ C7. 45, E0, 00000000
        jmp     ?_098                                   ; 17DB _ E9, 000000B8

?_092:  mov     eax, dword [ebp+8H]                     ; 17E0 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 17E3 _ 8B. 55, E0
        add     edx, 4                                  ; 17E6 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 17E9 _ 8B. 04 90
        mov     dword [ebp-10H], eax                    ; 17EC _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 17EF _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 17F2 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 17F4 _ 89. 45, F4
        mov     dword [ebp-18H], 0                      ; 17F7 _ C7. 45, E8, 00000000
        jmp     ?_097                                   ; 17FE _ E9, 00000082

?_093:  mov     eax, dword [ebp-10H]                    ; 1803 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 1806 _ 8B. 50, 10
        mov     eax, dword [ebp-18H]                    ; 1809 _ 8B. 45, E8
        add     eax, edx                                ; 180C _ 01. D0
        mov     dword [ebp-8H], eax                     ; 180E _ 89. 45, F8
        mov     dword [ebp-1CH], 0                      ; 1811 _ C7. 45, E4, 00000000
        jmp     ?_096                                   ; 1818 _ EB, 5C

?_094:  mov     eax, dword [ebp-10H]                    ; 181A _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 181D _ 8B. 50, 0C
        mov     eax, dword [ebp-1CH]                    ; 1820 _ 8B. 45, E4
        add     eax, edx                                ; 1823 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 1825 _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 1828 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 182B _ 8B. 40, 04
        imul    eax, dword [ebp-18H]                    ; 182E _ 0F AF. 45, E8
        mov     edx, eax                                ; 1832 _ 89. C2
        mov     eax, dword [ebp-1CH]                    ; 1834 _ 8B. 45, E4
        add     eax, edx                                ; 1837 _ 01. D0
        mov     edx, eax                                ; 1839 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 183B _ 8B. 45, F4
        add     eax, edx                                ; 183E _ 01. D0
        movzx   eax, byte [eax]                         ; 1840 _ 0F B6. 00
        mov     byte [ebp-21H], al                      ; 1843 _ 88. 45, DF
        movzx   edx, byte [ebp-21H]                     ; 1846 _ 0F B6. 55, DF
        mov     eax, dword [ebp-10H]                    ; 184A _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 184D _ 8B. 40, 14
        cmp     edx, eax                                ; 1850 _ 39. C2
        jz      ?_095                                   ; 1852 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 1854 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1857 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 185A _ 0F AF. 45, F8
        mov     edx, eax                                ; 185E _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1860 _ 8B. 45, FC
        add     eax, edx                                ; 1863 _ 01. D0
        mov     edx, eax                                ; 1865 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 1867 _ 8B. 45, EC
        add     edx, eax                                ; 186A _ 01. C2
        movzx   eax, byte [ebp-21H]                     ; 186C _ 0F B6. 45, DF
        mov     byte [edx], al                          ; 1870 _ 88. 02
?_095:  add     dword [ebp-1CH], 1                      ; 1872 _ 83. 45, E4, 01
?_096:  mov     eax, dword [ebp-10H]                    ; 1876 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 1879 _ 8B. 40, 04
        cmp     eax, dword [ebp-1CH]                    ; 187C _ 3B. 45, E4
        jg      ?_094                                   ; 187F _ 7F, 99
        add     dword [ebp-18H], 1                      ; 1881 _ 83. 45, E8, 01
?_097:  mov     eax, dword [ebp-10H]                    ; 1885 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 1888 _ 8B. 40, 08
        cmp     eax, dword [ebp-18H]                    ; 188B _ 3B. 45, E8
        jg      ?_093                                   ; 188E _ 0F 8F, FFFFFF6F
        add     dword [ebp-20H], 1                      ; 1894 _ 83. 45, E0, 01
?_098:  mov     eax, dword [ebp+8H]                     ; 1898 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 189B _ 8B. 40, 0C
        cmp     eax, dword [ebp-20H]                    ; 189E _ 3B. 45, E0
        jge     ?_092                                   ; 18A1 _ 0F 8D, FFFFFF39
        mov     eax, 0                                  ; 18A7 _ B8, 00000000
        leave                                           ; 18AC _ C9
        ret                                             ; 18AD _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 18AE _ 55
        mov     ebp, esp                                ; 18AF _ 89. E5
        sub     esp, 4                                  ; 18B1 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 18B4 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 18B7 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 18BA _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 18BD _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 18C0 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 18C3 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 18C6 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 18C9 _ 8B. 40, 18
        test    eax, eax                                ; 18CC _ 85. C0
        js      ?_099                                   ; 18CE _ 78, 0B
        mov     eax, dword [ebp+8H]                     ; 18D0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 18D3 _ 89. 04 24
        call    sheet_refresh                           ; 18D6 _ E8, FFFFFFFC(rel)
?_099:  leave                                           ; 18DB _ C9
        ret                                             ; 18DC _ C3
; sheet_slide End of function

memman_init:; Function begin
        push    ebp                                     ; 18DD _ 55
        mov     ebp, esp                                ; 18DE _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 18E0 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 18E3 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 18E9 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 18EC _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 18F3 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 18F6 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 18FD _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 1900 _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 1907 _ 5D
        ret                                             ; 1908 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 1909 _ 55
        mov     ebp, esp                                ; 190A _ 89. E5
        sub     esp, 16                                 ; 190C _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 190F _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 1916 _ C7. 45, F8, 00000000
        jmp     ?_101                                   ; 191D _ EB, 14

?_100:  mov     eax, dword [ebp+8H]                     ; 191F _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1922 _ 8B. 55, F8
        add     edx, 2                                  ; 1925 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1928 _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 192C _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 192F _ 83. 45, F8, 01
?_101:  mov     eax, dword [ebp+8H]                     ; 1933 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1936 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 1938 _ 3B. 45, F8
        ja      ?_100                                   ; 193B _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 193D _ 8B. 45, FC
        leave                                           ; 1940 _ C9
        ret                                             ; 1941 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 1942 _ 55
        mov     ebp, esp                                ; 1943 _ 89. E5
        sub     esp, 16                                 ; 1945 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1948 _ C7. 45, F8, 00000000
        jmp     ?_105                                   ; 194F _ E9, 00000085

?_102:  mov     eax, dword [ebp+8H]                     ; 1954 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1957 _ 8B. 55, F8
        add     edx, 2                                  ; 195A _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 195D _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 1961 _ 3B. 45, 0C
        jc      ?_104                                   ; 1964 _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 1966 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1969 _ 8B. 55, F8
        add     edx, 2                                  ; 196C _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 196F _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 1972 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1975 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1978 _ 8B. 55, F8
        add     edx, 2                                  ; 197B _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 197E _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 1981 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 1984 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1987 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 198A _ 8B. 55, F8
        add     edx, 2                                  ; 198D _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 1990 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 1993 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1996 _ 8B. 55, F8
        add     edx, 2                                  ; 1999 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 199C _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 19A0 _ 2B. 45, 0C
        mov     edx, eax                                ; 19A3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 19A5 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 19A8 _ 8B. 4D, F8
        add     ecx, 2                                  ; 19AB _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 19AE _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 19B2 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 19B5 _ 8B. 55, F8
        add     edx, 2                                  ; 19B8 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 19BB _ 8B. 44 D0, 04
        test    eax, eax                                ; 19BF _ 85. C0
        jnz     ?_103                                   ; 19C1 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 19C3 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 19C6 _ 8B. 00
        lea     edx, [eax-1H]                           ; 19C8 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 19CB _ 8B. 45, 08
        mov     dword [eax], edx                        ; 19CE _ 89. 10
?_103:  mov     eax, dword [ebp-4H]                     ; 19D0 _ 8B. 45, FC
        jmp     ?_106                                   ; 19D3 _ EB, 17

?_104:  add     dword [ebp-8H], 1                       ; 19D5 _ 83. 45, F8, 01
?_105:  mov     eax, dword [ebp+8H]                     ; 19D9 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 19DC _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 19DE _ 3B. 45, F8
        ja      ?_102                                   ; 19E1 _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 19E7 _ B8, 00000000
?_106:  leave                                           ; 19EC _ C9
        ret                                             ; 19ED _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 19EE _ 55
        mov     ebp, esp                                ; 19EF _ 89. E5
        push    ebx                                     ; 19F1 _ 53
        sub     esp, 16                                 ; 19F2 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 19F5 _ C7. 45, F4, 00000000
        jmp     ?_109                                   ; 19FC _ EB, 17

?_107:  mov     eax, dword [ebp+8H]                     ; 19FE _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1A01 _ 8B. 55, F4
        add     edx, 2                                  ; 1A04 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1A07 _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 1A0A _ 3B. 45, 0C
        jbe     ?_108                                   ; 1A0D _ 76, 02
        jmp     ?_110                                   ; 1A0F _ EB, 0E

?_108:  add     dword [ebp-0CH], 1                      ; 1A11 _ 83. 45, F4, 01
?_109:  mov     eax, dword [ebp+8H]                     ; 1A15 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A18 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 1A1A _ 3B. 45, F4
        jg      ?_107                                   ; 1A1D _ 7F, DF
?_110:  cmp     dword [ebp-0CH], 0                      ; 1A1F _ 83. 7D, F4, 00
        jle     ?_112                                   ; 1A23 _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 1A29 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1A2C _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1A2F _ 8B. 45, 08
        add     edx, 2                                  ; 1A32 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1A35 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 1A38 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 1A3B _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1A3E _ 8B. 45, 08
        add     ecx, 2                                  ; 1A41 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1A44 _ 8B. 44 C8, 04
        add     eax, edx                                ; 1A48 _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 1A4A _ 3B. 45, 0C
        jne     ?_112                                   ; 1A4D _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 1A53 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1A56 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 1A59 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1A5C _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1A5F _ 8B. 45, 08
        add     edx, 2                                  ; 1A62 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1A65 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 1A69 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1A6C _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1A6F _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1A72 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1A75 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1A79 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A7C _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 1A7E _ 3B. 45, F4
        jle     ?_111                                   ; 1A81 _ 7E, 56
        mov     eax, dword [ebp+10H]                    ; 1A83 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 1A86 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 1A89 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1A8C _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1A8F _ 8B. 55, F4
        add     edx, 2                                  ; 1A92 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1A95 _ 8B. 04 D0
        cmp     ecx, eax                                ; 1A98 _ 39. C1
        jnz     ?_111                                   ; 1A9A _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 1A9C _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1A9F _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 1AA2 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1AA5 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1AA8 _ 8B. 45, 08
        add     edx, 2                                  ; 1AAB _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1AAE _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 1AB2 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 1AB5 _ 8B. 4D, F4
        add     ecx, 2                                  ; 1AB8 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1ABB _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 1ABF _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1AC2 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1AC5 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1AC8 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1ACC _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1ACF _ 8B. 00
        lea     edx, [eax-1H]                           ; 1AD1 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1AD4 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1AD7 _ 89. 10
?_111:  mov     eax, 0                                  ; 1AD9 _ B8, 00000000
        jmp     ?_118                                   ; 1ADE _ E9, 0000011C

?_112:  mov     eax, dword [ebp+8H]                     ; 1AE3 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1AE6 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 1AE8 _ 3B. 45, F4
        jle     ?_113                                   ; 1AEB _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 1AED _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 1AF0 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 1AF3 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1AF6 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1AF9 _ 8B. 55, F4
        add     edx, 2                                  ; 1AFC _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1AFF _ 8B. 04 D0
        cmp     ecx, eax                                ; 1B02 _ 39. C1
        jnz     ?_113                                   ; 1B04 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 1B06 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1B09 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1B0C _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1B0F _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1B12 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1B15 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1B18 _ 8B. 55, F4
        add     edx, 2                                  ; 1B1B _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1B1E _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 1B22 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1B25 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1B28 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1B2B _ 8B. 55, F4
        add     edx, 2                                  ; 1B2E _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1B31 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 1B35 _ B8, 00000000
        jmp     ?_118                                   ; 1B3A _ E9, 000000C0

?_113:  mov     eax, dword [ebp+8H]                     ; 1B3F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B42 _ 8B. 00
        cmp     eax, 4095                               ; 1B44 _ 3D, 00000FFF
        jg      ?_117                                   ; 1B49 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 1B4F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B52 _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 1B54 _ 89. 45, F8
        jmp     ?_115                                   ; 1B57 _ EB, 28

?_114:  mov     eax, dword [ebp-8H]                     ; 1B59 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1B5C _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 1B5F _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 1B62 _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 1B65 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 1B68 _ 8B. 45, 08
        add     edx, 2                                  ; 1B6B _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 1B6E _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 1B71 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 1B73 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 1B76 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 1B79 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 1B7D _ 83. 6D, F8, 01
?_115:  mov     eax, dword [ebp-8H]                     ; 1B81 _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 1B84 _ 3B. 45, F4
        jg      ?_114                                   ; 1B87 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 1B89 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B8C _ 8B. 00
        lea     edx, [eax+1H]                           ; 1B8E _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1B91 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1B94 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1B96 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1B99 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1B9C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B9F _ 8B. 00
        cmp     edx, eax                                ; 1BA1 _ 39. C2
        jge     ?_116                                   ; 1BA3 _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 1BA5 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1BA8 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 1BAA _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1BAD _ 89. 50, 04
?_116:  mov     eax, dword [ebp+8H]                     ; 1BB0 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1BB3 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1BB6 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1BB9 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1BBC _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1BBF _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1BC2 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1BC5 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 1BC8 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 1BCB _ 89. 54 C8, 04
        mov     eax, 0                                  ; 1BCF _ B8, 00000000
        jmp     ?_118                                   ; 1BD4 _ EB, 29

?_117:  mov     eax, dword [ebp+8H]                     ; 1BD6 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1BD9 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 1BDC _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1BDF _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1BE2 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1BE5 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1BE8 _ 8B. 40, 08
        mov     edx, eax                                ; 1BEB _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1BED _ 8B. 45, 10
        add     eax, edx                                ; 1BF0 _ 01. D0
        mov     edx, eax                                ; 1BF2 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1BF4 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1BF7 _ 89. 50, 08
        mov     eax, 4294967295                         ; 1BFA _ B8, FFFFFFFF
?_118:  add     esp, 16                                 ; 1BFF _ 83. C4, 10
        pop     ebx                                     ; 1C02 _ 5B
        pop     ebp                                     ; 1C03 _ 5D
        ret                                             ; 1C04 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 1C05 _ 55
        mov     ebp, esp                                ; 1C06 _ 89. E5
        sub     esp, 24                                 ; 1C08 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 1C0B _ 8B. 45, 0C
        add     eax, 4095                               ; 1C0E _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1C13 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 1C18 _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 1C1B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1C1E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1C22 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1C25 _ 89. 04 24
        call    memman_alloc                            ; 1C28 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 1C2D _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1C30 _ 8B. 45, FC
        leave                                           ; 1C33 _ C9
        ret                                             ; 1C34 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 1C35 _ 55
        mov     ebp, esp                                ; 1C36 _ 89. E5
        sub     esp, 28                                 ; 1C38 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 1C3B _ 8B. 45, 10
        add     eax, 4095                               ; 1C3E _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1C43 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 1C48 _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 1C4B _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 1C4E _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1C52 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1C55 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1C59 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1C5C _ 89. 04 24
        call    memman_free                             ; 1C5F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 1C64 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1C67 _ 8B. 45, FC
        leave                                           ; 1C6A _ C9
        ret                                             ; 1C6B _ C3
; memman_free_4k End of function


; SECTION .rodata align=1 noexecute                       ; section number 2, const

?_119:                                                  ; byte
        db 6DH, 6FH, 75H, 73H, 65H, 20H, 6DH, 6FH       ; 0000 _ mouse mo
        db 76H, 65H, 00H                                ; 0008 _ ve.

?_120:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 000B _ page is:
        db 20H, 00H                                     ; 0013 _  .

?_121:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0015 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 001D _ L: .

?_122:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0021 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 0029 _ H: .

?_123:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 002D _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0035 _ w: .

?_124:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 0039 _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 0041 _ gh: .

?_125:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 0046 _ type: .


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

table_rgb.1621:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0020 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........

cursor.1668:                                            ; byte
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

str.1716:                                               ; byte
        resb    1                                       ; 0220

?_130:  resb    9                                       ; 0221

?_131:  resb    1                                       ; 022A


