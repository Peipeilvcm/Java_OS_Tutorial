; Disassembly of file: ddr_detective.o
; Sun Oct 28 19:44:26 2018
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386


; global CMain: function
; global show_mouse_info: function
; global initBootInfo: function
; global init_palette: function
; global set_palette: function
; global showString: function
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

; extern io_in8                                           ; near
; extern systemFont                                       ; byte
; extern io_store_eflags                                  ; near
; extern io_out8                                          ; near
; extern io_load_eflags                                   ; near
; extern fifo_status                                      ; near
; extern io_stihlt                                        ; near
; extern io_cli                                           ; near
; extern io_sti                                           ; near
; extern get_memory_block_count                           ; near


; SECTION .text   align=1 execute                         ; section number 1, code

CMain:                                                  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    ebx                                     ; 0003 _ 53
        sub     esp, 68                                 ; 0004 _ 83. EC, 44
        mov     dword [esp], bootInfo                   ; 0007 _ C7. 04 24, 00000120(d)
        call    initBootInfo                            ; 000E _ E8, FFFFFFFC(rel)
        mov     eax, dword [bootInfo]                   ; 0013 _ A1, 00000120(d)
        mov     dword [ebp-20H], eax                    ; 0018 _ 89. 45, E0
        movzx   eax, word [?_054]                       ; 001B _ 0F B7. 05, 00000124(d)
        cwde                                            ; 0022 _ 98
        mov     dword [ebp-1CH], eax                    ; 0023 _ 89. 45, E4
        movzx   eax, word [?_055]                       ; 0026 _ 0F B7. 05, 00000126(d)
        cwde                                            ; 002D _ 98
        mov     dword [ebp-18H], eax                    ; 002E _ 89. 45, E8
        mov     dword [esp+8H], mousebuf                ; 0031 _ C7. 44 24, 08, 00000140(d)
        mov     dword [esp+4H], 128                     ; 0039 _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 0041 _ C7. 04 24, 000001F8(d)
        call    fifo8_init                              ; 0048 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], keybuf                  ; 004D _ C7. 44 24, 08, 000001C0(d)
        mov     dword [esp+4H], 32                      ; 0055 _ C7. 44 24, 04, 00000020
        mov     dword [esp], keyinfo                    ; 005D _ C7. 04 24, 000001E0(d)
        call    fifo8_init                              ; 0064 _ E8, FFFFFFFC(rel)
        call    init_palette                            ; 0069 _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 006E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 0073 _ 8B. 45, E8
        lea     edx, [eax-1DH]                          ; 0076 _ 8D. 50, E3
        mov     eax, dword [ebp-1CH]                    ; 0079 _ 8B. 45, E4
        sub     eax, 1                                  ; 007C _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 007F _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 0083 _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 0087 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 008F _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 14                      ; 0097 _ C7. 44 24, 08, 0000000E
        mov     eax, dword [ebp-1CH]                    ; 009F _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 00A2 _ 89. 44 24, 04
        mov     eax, dword [ebp-20H]                    ; 00A6 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 00A9 _ 89. 04 24
        call    boxfill8                                ; 00AC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 00B1 _ 8B. 45, E8
        lea     ecx, [eax-1CH]                          ; 00B4 _ 8D. 48, E4
        mov     eax, dword [ebp-1CH]                    ; 00B7 _ 8B. 45, E4
        lea     edx, [eax-1H]                           ; 00BA _ 8D. 50, FF
        mov     eax, dword [ebp-18H]                    ; 00BD _ 8B. 45, E8
        sub     eax, 28                                 ; 00C0 _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 00C3 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 00C7 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 00CB _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 00CF _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 00D7 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp-1CH]                    ; 00DF _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 00E2 _ 89. 44 24, 04
        mov     eax, dword [ebp-20H]                    ; 00E6 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 00E9 _ 89. 04 24
        call    boxfill8                                ; 00EC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 00F1 _ 8B. 45, E8
        lea     ecx, [eax-1BH]                          ; 00F4 _ 8D. 48, E5
        mov     eax, dword [ebp-1CH]                    ; 00F7 _ 8B. 45, E4
        lea     edx, [eax-1H]                           ; 00FA _ 8D. 50, FF
        mov     eax, dword [ebp-18H]                    ; 00FD _ 8B. 45, E8
        sub     eax, 27                                 ; 0100 _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 0103 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0107 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 010B _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 010F _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 0117 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp-1CH]                    ; 011F _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 0122 _ 89. 44 24, 04
        mov     eax, dword [ebp-20H]                    ; 0126 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 0129 _ 89. 04 24
        call    boxfill8                                ; 012C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 0131 _ 8B. 45, E8
        lea     ecx, [eax-1H]                           ; 0134 _ 8D. 48, FF
        mov     eax, dword [ebp-1CH]                    ; 0137 _ 8B. 45, E4
        lea     edx, [eax-1H]                           ; 013A _ 8D. 50, FF
        mov     eax, dword [ebp-18H]                    ; 013D _ 8B. 45, E8
        sub     eax, 26                                 ; 0140 _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 0143 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0147 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 014B _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 014F _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0157 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp-1CH]                    ; 015F _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 0162 _ 89. 44 24, 04
        mov     eax, dword [ebp-20H]                    ; 0166 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 0169 _ 89. 04 24
        call    boxfill8                                ; 016C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 0171 _ 8B. 45, E8
        lea     edx, [eax-18H]                          ; 0174 _ 8D. 50, E8
        mov     eax, dword [ebp-18H]                    ; 0177 _ 8B. 45, E8
        sub     eax, 24                                 ; 017A _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 017D _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0181 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0189 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 018D _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 0195 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp-1CH]                    ; 019D _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 01A0 _ 89. 44 24, 04
        mov     eax, dword [ebp-20H]                    ; 01A4 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 01A7 _ 89. 04 24
        call    boxfill8                                ; 01AA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 01AF _ 8B. 45, E8
        lea     edx, [eax-4H]                           ; 01B2 _ 8D. 50, FC
        mov     eax, dword [ebp-18H]                    ; 01B5 _ 8B. 45, E8
        sub     eax, 24                                 ; 01B8 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 01BB _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 01BF _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 01C7 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 01CB _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 01D3 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp-1CH]                    ; 01DB _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 01DE _ 89. 44 24, 04
        mov     eax, dword [ebp-20H]                    ; 01E2 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 01E5 _ 89. 04 24
        call    boxfill8                                ; 01E8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 01ED _ 8B. 45, E8
        lea     edx, [eax-4H]                           ; 01F0 _ 8D. 50, FC
        mov     eax, dword [ebp-18H]                    ; 01F3 _ 8B. 45, E8
        sub     eax, 4                                  ; 01F6 _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 01F9 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 01FD _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0205 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0209 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 15                      ; 0211 _ C7. 44 24, 08, 0000000F
        mov     eax, dword [ebp-1CH]                    ; 0219 _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 021C _ 89. 44 24, 04
        mov     eax, dword [ebp-20H]                    ; 0220 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 0223 _ 89. 04 24
        call    boxfill8                                ; 0226 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 022B _ 8B. 45, E8
        lea     edx, [eax-5H]                           ; 022E _ 8D. 50, FB
        mov     eax, dword [ebp-18H]                    ; 0231 _ 8B. 45, E8
        sub     eax, 23                                 ; 0234 _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 0237 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 023B _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0243 _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 0247 _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 15                      ; 024F _ C7. 44 24, 08, 0000000F
        mov     eax, dword [ebp-1CH]                    ; 0257 _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 025A _ 89. 44 24, 04
        mov     eax, dword [ebp-20H]                    ; 025E _ 8B. 45, E0
        mov     dword [esp], eax                        ; 0261 _ 89. 04 24
        call    boxfill8                                ; 0264 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 0269 _ 8B. 45, E8
        lea     edx, [eax-3H]                           ; 026C _ 8D. 50, FD
        mov     eax, dword [ebp-18H]                    ; 026F _ 8B. 45, E8
        sub     eax, 3                                  ; 0272 _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 0275 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0279 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0281 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0285 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 028D _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-1CH]                    ; 0295 _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 0298 _ 89. 44 24, 04
        mov     eax, dword [ebp-20H]                    ; 029C _ 8B. 45, E0
        mov     dword [esp], eax                        ; 029F _ 89. 04 24
        call    boxfill8                                ; 02A2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 02A7 _ 8B. 45, E8
        lea     edx, [eax-3H]                           ; 02AA _ 8D. 50, FD
        mov     eax, dword [ebp-18H]                    ; 02AD _ 8B. 45, E8
        sub     eax, 24                                 ; 02B0 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 02B3 _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 02B7 _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 02BF _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 02C3 _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 02CB _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-1CH]                    ; 02D3 _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 02D6 _ 89. 44 24, 04
        mov     eax, dword [ebp-20H]                    ; 02DA _ 8B. 45, E0
        mov     dword [esp], eax                        ; 02DD _ 89. 04 24
        call    boxfill8                                ; 02E0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 02E5 _ 8B. 45, E8
        lea     ebx, [eax-18H]                          ; 02E8 _ 8D. 58, E8
        mov     eax, dword [ebp-1CH]                    ; 02EB _ 8B. 45, E4
        lea     ecx, [eax-4H]                           ; 02EE _ 8D. 48, FC
        mov     eax, dword [ebp-18H]                    ; 02F1 _ 8B. 45, E8
        lea     edx, [eax-18H]                          ; 02F4 _ 8D. 50, E8
        mov     eax, dword [ebp-1CH]                    ; 02F7 _ 8B. 45, E4
        sub     eax, 47                                 ; 02FA _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 02FD _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0301 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0305 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0309 _ 89. 44 24, 0C
        mov     dword [esp+8H], 15                      ; 030D _ C7. 44 24, 08, 0000000F
        mov     eax, dword [ebp-1CH]                    ; 0315 _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 0318 _ 89. 44 24, 04
        mov     eax, dword [ebp-20H]                    ; 031C _ 8B. 45, E0
        mov     dword [esp], eax                        ; 031F _ 89. 04 24
        call    boxfill8                                ; 0322 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 0327 _ 8B. 45, E8
        lea     ebx, [eax-4H]                           ; 032A _ 8D. 58, FC
        mov     eax, dword [ebp-1CH]                    ; 032D _ 8B. 45, E4
        lea     ecx, [eax-2FH]                          ; 0330 _ 8D. 48, D1
        mov     eax, dword [ebp-18H]                    ; 0333 _ 8B. 45, E8
        lea     edx, [eax-17H]                          ; 0336 _ 8D. 50, E9
        mov     eax, dword [ebp-1CH]                    ; 0339 _ 8B. 45, E4
        sub     eax, 47                                 ; 033C _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 033F _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0343 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0347 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 034B _ 89. 44 24, 0C
        mov     dword [esp+8H], 15                      ; 034F _ C7. 44 24, 08, 0000000F
        mov     eax, dword [ebp-1CH]                    ; 0357 _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 035A _ 89. 44 24, 04
        mov     eax, dword [ebp-20H]                    ; 035E _ 8B. 45, E0
        mov     dword [esp], eax                        ; 0361 _ 89. 04 24
        call    boxfill8                                ; 0364 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 0369 _ 8B. 45, E8
        lea     ebx, [eax-3H]                           ; 036C _ 8D. 58, FD
        mov     eax, dword [ebp-1CH]                    ; 036F _ 8B. 45, E4
        lea     ecx, [eax-4H]                           ; 0372 _ 8D. 48, FC
        mov     eax, dword [ebp-18H]                    ; 0375 _ 8B. 45, E8
        lea     edx, [eax-3H]                           ; 0378 _ 8D. 50, FD
        mov     eax, dword [ebp-1CH]                    ; 037B _ 8B. 45, E4
        sub     eax, 47                                 ; 037E _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0381 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0385 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0389 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 038D _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 0391 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp-1CH]                    ; 0399 _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 039C _ 89. 44 24, 04
        mov     eax, dword [ebp-20H]                    ; 03A0 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 03A3 _ 89. 04 24
        call    boxfill8                                ; 03A6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 03AB _ 8B. 45, E8
        lea     ebx, [eax-3H]                           ; 03AE _ 8D. 58, FD
        mov     eax, dword [ebp-1CH]                    ; 03B1 _ 8B. 45, E4
        lea     ecx, [eax-3H]                           ; 03B4 _ 8D. 48, FD
        mov     eax, dword [ebp-18H]                    ; 03B7 _ 8B. 45, E8
        lea     edx, [eax-18H]                          ; 03BA _ 8D. 50, E8
        mov     eax, dword [ebp-1CH]                    ; 03BD _ 8B. 45, E4
        sub     eax, 3                                  ; 03C0 _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 03C3 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 03C7 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 03CB _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 03CF _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 03D3 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp-1CH]                    ; 03DB _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 03DE _ 89. 44 24, 04
        mov     eax, dword [ebp-20H]                    ; 03E2 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 03E5 _ 89. 04 24
        call    boxfill8                                ; 03E8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-1CH]                    ; 03ED _ 8B. 45, E4
        sub     eax, 16                                 ; 03F0 _ 83. E8, 10
        mov     edx, eax                                ; 03F3 _ 89. C2
        shr     edx, 31                                 ; 03F5 _ C1. EA, 1F
        add     eax, edx                                ; 03F8 _ 01. D0
        sar     eax, 1                                  ; 03FA _ D1. F8
        mov     dword [mx], eax                         ; 03FC _ A3, 00000000(d)
        mov     eax, dword [ebp-18H]                    ; 0401 _ 8B. 45, E8
        sub     eax, 44                                 ; 0404 _ 83. E8, 2C
        mov     edx, eax                                ; 0407 _ 89. C2
        shr     edx, 31                                 ; 0409 _ C1. EA, 1F
        add     eax, edx                                ; 040C _ 01. D0
        sar     eax, 1                                  ; 040E _ D1. F8
        mov     dword [my], eax                         ; 0410 _ A3, 00000004(d)
        mov     dword [esp+4H], 14                      ; 0415 _ C7. 44 24, 04, 0000000E
        mov     dword [esp], mcursor                    ; 041D _ C7. 04 24, 00000020(d)
        call    init_mouse_cursor                       ; 0424 _ E8, FFFFFFFC(rel)
        mov     edx, dword [my]                         ; 0429 _ 8B. 15, 00000004(d)
        mov     eax, dword [mx]                         ; 042F _ A1, 00000000(d)
        mov     dword [esp+1CH], 16                     ; 0434 _ C7. 44 24, 1C, 00000010
        mov     dword [esp+18H], mcursor                ; 043C _ C7. 44 24, 18, 00000020(d)
        mov     dword [esp+14H], edx                    ; 0444 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0448 _ 89. 44 24, 10
        mov     dword [esp+0CH], 16                     ; 044C _ C7. 44 24, 0C, 00000010
        mov     dword [esp+8H], 16                      ; 0454 _ C7. 44 24, 08, 00000010
        mov     eax, dword [ebp-1CH]                    ; 045C _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 045F _ 89. 44 24, 04
        mov     eax, dword [ebp-20H]                    ; 0463 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 0466 _ 89. 04 24
        call    putblock                                ; 0469 _ E8, FFFFFFFC(rel)
        call    get_memory_block_count                  ; 046E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0473 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 0476 _ 8B. 45, EC
        mov     dword [esp], eax                        ; 0479 _ 89. 04 24
        call    intToHexStr                             ; 047C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0481 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 0484 _ 8B. 45, F0
        mov     dword [esp+14H], eax                    ; 0487 _ 89. 44 24, 14
        mov     dword [esp+10H], 7                      ; 048B _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 0                      ; 0493 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 049B _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-1CH]                    ; 04A3 _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 04A6 _ 89. 44 24, 04
        mov     eax, dword [ebp-20H]                    ; 04AA _ 8B. 45, E0
        mov     dword [esp], eax                        ; 04AD _ 89. 04 24
        call    showString                              ; 04B0 _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 04B5 _ E8, FFFFFFFC(rel)
        call    enable_mouse                            ; 04BA _ E8, FFFFFFFC(rel)
?_001:  call    io_cli                                  ; 04BF _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 04C4 _ C7. 04 24, 000001E0(d)
        call    fifo8_status                            ; 04CB _ E8, FFFFFFFC(rel)
        mov     ebx, eax                                ; 04D0 _ 89. C3
        mov     dword [esp], mouseinfo                  ; 04D2 _ C7. 04 24, 000001F8(d)
        call    fifo8_status                            ; 04D9 _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 04DE _ 01. D8
        test    eax, eax                                ; 04E0 _ 85. C0
        jnz     ?_002                                   ; 04E2 _ 75, 0A
        call    io_stihlt                               ; 04E4 _ E8, FFFFFFFC(rel)
        jmp     ?_004                                   ; 04E9 _ E9, 00000091

?_002:  mov     dword [esp], keyinfo                    ; 04EE _ C7. 04 24, 000001E0(d)
        call    fifo8_status                            ; 04F5 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 04FA _ 85. C0
        jz      ?_003                                   ; 04FC _ 74, 67
        call    io_sti                                  ; 04FE _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 0503 _ C7. 04 24, 000001E0(d)
        call    fifo8_get                               ; 050A _ E8, FFFFFFFC(rel)
        mov     byte [ebp-21H], al                      ; 050F _ 88. 45, DF
        movzx   eax, byte [ebp-21H]                     ; 0512 _ 0F B6. 45, DF
        movzx   eax, al                                 ; 0516 _ 0F B6. C0
        mov     dword [esp], eax                        ; 0519 _ 89. 04 24
        call    charToHexStr                            ; 051C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0521 _ 89. 45, F4
        mov     eax, dword [showPos.1489]               ; 0524 _ A1, 00000210(d)
        mov     edx, dword [ebp-0CH]                    ; 0529 _ 8B. 55, F4
        mov     dword [esp+14H], edx                    ; 052C _ 89. 54 24, 14
        mov     dword [esp+10H], 7                      ; 0530 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 0                      ; 0538 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], eax                     ; 0540 _ 89. 44 24, 08
        mov     eax, dword [ebp-1CH]                    ; 0544 _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 0547 _ 89. 44 24, 04
        mov     eax, dword [ebp-20H]                    ; 054B _ 8B. 45, E0
        mov     dword [esp], eax                        ; 054E _ 89. 04 24
        call    showString                              ; 0551 _ E8, FFFFFFFC(rel)
        mov     eax, dword [showPos.1489]               ; 0556 _ A1, 00000210(d)
        add     eax, 32                                 ; 055B _ 83. C0, 20
        mov     dword [showPos.1489], eax               ; 055E _ A3, 00000210(d)
        jmp     ?_004                                   ; 0563 _ EB, 1A

?_003:  mov     dword [esp], mouseinfo                  ; 0565 _ C7. 04 24, 000001F8(d)
        call    fifo8_status                            ; 056C _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0571 _ 85. C0
        jz      ?_004                                   ; 0573 _ 74, 0A
        call    show_mouse_info                         ; 0575 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 057A _ E9, FFFFFF40

?_004:  jmp     ?_001                                   ; 057F _ E9, FFFFFF3B
                                                        ; CMain End of function

show_mouse_info:                                        ; Function begin
        push    ebp                                     ; 0584 _ 55
        mov     ebp, esp                                ; 0585 _ 89. E5
        sub     esp, 72                                 ; 0587 _ 83. EC, 48
        mov     eax, dword [bootInfo]                   ; 058A _ A1, 00000120(d)
        mov     dword [ebp-18H], eax                    ; 058F _ 89. 45, E8
        movzx   eax, word [?_054]                       ; 0592 _ 0F B7. 05, 00000124(d)
        cwde                                            ; 0599 _ 98
        mov     dword [ebp-14H], eax                    ; 059A _ 89. 45, EC
        movzx   eax, word [?_055]                       ; 059D _ 0F B7. 05, 00000126(d)
        cwde                                            ; 05A4 _ 98
        mov     dword [ebp-10H], eax                    ; 05A5 _ 89. 45, F0
        mov     byte [ebp-19H], 0                       ; 05A8 _ C6. 45, E7, 00
        call    io_sti                                  ; 05AC _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 05B1 _ C7. 04 24, 000001F8(d)
        call    fifo8_get                               ; 05B8 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-19H], al                      ; 05BD _ 88. 45, E7
        movzx   eax, byte [ebp-19H]                     ; 05C0 _ 0F B6. 45, E7
        mov     dword [esp], eax                        ; 05C4 _ 89. 04 24
        call    charToHexStr                            ; 05C7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 05CC _ 89. 45, F4
        mov     eax, dword [mousePos.1499]              ; 05CF _ A1, 00000018(d)
        cmp     eax, 256                                ; 05D4 _ 3D, 00000100
        jg      ?_005                                   ; 05D9 _ 7F, 3F
        mov     eax, dword [mousePos.1499]              ; 05DB _ A1, 00000018(d)
        mov     edx, dword [ebp-0CH]                    ; 05E0 _ 8B. 55, F4
        mov     dword [esp+14H], edx                    ; 05E3 _ 89. 54 24, 14
        mov     dword [esp+10H], 7                      ; 05E7 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 16                     ; 05EF _ C7. 44 24, 0C, 00000010
        mov     dword [esp+8H], eax                     ; 05F7 _ 89. 44 24, 08
        mov     eax, dword [ebp-14H]                    ; 05FB _ 8B. 45, EC
        mov     dword [esp+4H], eax                     ; 05FE _ 89. 44 24, 04
        mov     eax, dword [ebp-18H]                    ; 0602 _ 8B. 45, E8
        mov     dword [esp], eax                        ; 0605 _ 89. 04 24
        call    showString                              ; 0608 _ E8, FFFFFFFC(rel)
        mov     eax, dword [mousePos.1499]              ; 060D _ A1, 00000018(d)
        add     eax, 32                                 ; 0612 _ 83. C0, 20
        mov     dword [mousePos.1499], eax              ; 0615 _ A3, 00000018(d)
?_005:  leave                                           ; 061A _ C9
        ret                                             ; 061B _ C3
                                                        ; show_mouse_info End of function

initBootInfo:                                           ; Function begin
        push    ebp                                     ; 061C _ 55
        mov     ebp, esp                                ; 061D _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 061F _ 8B. 45, 08
        mov     dword [eax], 655360                     ; 0622 _ C7. 00, 000A0000
        mov     eax, dword [ebp+8H]                     ; 0628 _ 8B. 45, 08
                                                        ; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 062B _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 0631 _ 8B. 45, 08
                                                        ; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 0634 _ 66: C7. 40, 06, 00C8
        pop     ebp                                     ; 063A _ 5D
        ret                                             ; 063B _ C3
                                                        ; initBootInfo End of function

init_palette:                                           ; Function begin
        push    ebp                                     ; 063C _ 55
        mov     ebp, esp                                ; 063D _ 89. E5
        sub     esp, 24                                 ; 063F _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1506          ; 0642 _ C7. 44 24, 08, 00000020(d)
        mov     dword [esp+4H], 15                      ; 064A _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 0652 _ C7. 04 24, 00000000
        call    set_palette                             ; 0659 _ E8, FFFFFFFC(rel)
        nop                                             ; 065E _ 90
        leave                                           ; 065F _ C9
        ret                                             ; 0660 _ C3
                                                        ; init_palette End of function

set_palette:                                            ; Function begin
        push    ebp                                     ; 0661 _ 55
        mov     ebp, esp                                ; 0662 _ 89. E5
        sub     esp, 40                                 ; 0664 _ 83. EC, 28
        call    io_load_eflags                          ; 0667 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 066C _ 89. 45, F4
        call    io_cli                                  ; 066F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0674 _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 0677 _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 067B _ C7. 04 24, 000003C8
        call    io_out8                                 ; 0682 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0687 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 068A _ 89. 45, F0
        jmp     ?_007                                   ; 068D _ EB, 62

?_006:  mov     eax, dword [ebp+10H]                    ; 068F _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 0692 _ 0F B6. 00
        shr     al, 2                                   ; 0695 _ C0. E8, 02
        movzx   eax, al                                 ; 0698 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 069B _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 069F _ C7. 04 24, 000003C9
        call    io_out8                                 ; 06A6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 06AB _ 8B. 45, 10
        add     eax, 1                                  ; 06AE _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 06B1 _ 0F B6. 00
        shr     al, 2                                   ; 06B4 _ C0. E8, 02
        movzx   eax, al                                 ; 06B7 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 06BA _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 06BE _ C7. 04 24, 000003C9
        call    io_out8                                 ; 06C5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 06CA _ 8B. 45, 10
        add     eax, 2                                  ; 06CD _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 06D0 _ 0F B6. 00
        shr     al, 2                                   ; 06D3 _ C0. E8, 02
        movzx   eax, al                                 ; 06D6 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 06D9 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 06DD _ C7. 04 24, 000003C9
        call    io_out8                                 ; 06E4 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 06E9 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 06ED _ 83. 45, F0, 01
?_007:  mov     eax, dword [ebp-10H]                    ; 06F1 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 06F4 _ 3B. 45, 0C
        jle     ?_006                                   ; 06F7 _ 7E, 96
        mov     eax, dword [ebp-0CH]                    ; 06F9 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 06FC _ 89. 04 24
        call    io_store_eflags                         ; 06FF _ E8, FFFFFFFC(rel)
        nop                                             ; 0704 _ 90
        leave                                           ; 0705 _ C9
        ret                                             ; 0706 _ C3
                                                        ; set_palette End of function

showString:                                             ; Function begin
        push    ebp                                     ; 0707 _ 55
        mov     ebp, esp                                ; 0708 _ 89. E5
        sub     esp, 40                                 ; 070A _ 83. EC, 28
        mov     eax, dword [ebp+18H]                    ; 070D _ 8B. 45, 18
        mov     byte [ebp-0CH], al                      ; 0710 _ 88. 45, F4
        jmp     ?_009                                   ; 0713 _ EB, 46

?_008:  mov     eax, dword [ebp+1CH]                    ; 0715 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 0718 _ 0F B6. 00
        movzx   eax, al                                 ; 071B _ 0F B6. C0
        shl     eax, 4                                  ; 071E _ C1. E0, 04
        lea     edx, [systemFont+eax]                   ; 0721 _ 8D. 90, 00000000(d)
        movsx   eax, byte [ebp-0CH]                     ; 0727 _ 0F BE. 45, F4
        mov     dword [esp+14H], edx                    ; 072B _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 072F _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 0733 _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 0736 _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 073A _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 073D _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0741 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0744 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0748 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 074B _ 89. 04 24
        call    showFont8                               ; 074E _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 0753 _ 83. 45, 10, 08
        add     dword [ebp+1CH], 1                      ; 0757 _ 83. 45, 1C, 01
?_009:  mov     eax, dword [ebp+1CH]                    ; 075B _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 075E _ 0F B6. 00
        test    al, al                                  ; 0761 _ 84. C0
        jnz     ?_008                                   ; 0763 _ 75, B0
        leave                                           ; 0765 _ C9
        ret                                             ; 0766 _ C3
                                                        ; showString End of function

boxfill8:                                               ; Function begin
        push    ebp                                     ; 0767 _ 55
        mov     ebp, esp                                ; 0768 _ 89. E5
        sub     esp, 20                                 ; 076A _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 076D _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0770 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0773 _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 0776 _ 89. 45, FC
        jmp     ?_013                                   ; 0779 _ EB, 33

?_010:  mov     eax, dword [ebp+14H]                    ; 077B _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 077E _ 89. 45, F8
        jmp     ?_012                                   ; 0781 _ EB, 1F

?_011:  mov     eax, dword [ebp-4H]                     ; 0783 _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 0786 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 078A _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 078C _ 8B. 45, F8
        add     eax, edx                                ; 078F _ 01. D0
        mov     edx, eax                                ; 0791 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0793 _ 8B. 45, 08
        add     edx, eax                                ; 0796 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0798 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 079C _ 88. 02
        add     dword [ebp-8H], 1                       ; 079E _ 83. 45, F8, 01
?_012:  mov     eax, dword [ebp-8H]                     ; 07A2 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 07A5 _ 3B. 45, 1C
        jle     ?_011                                   ; 07A8 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 07AA _ 83. 45, FC, 01
?_013:  mov     eax, dword [ebp-4H]                     ; 07AE _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 07B1 _ 3B. 45, 20
        jle     ?_010                                   ; 07B4 _ 7E, C5
        leave                                           ; 07B6 _ C9
        ret                                             ; 07B7 _ C3
                                                        ; boxfill8 End of function

showFont8:                                              ; Function begin
        push    ebp                                     ; 07B8 _ 55
        mov     ebp, esp                                ; 07B9 _ 89. E5
        sub     esp, 20                                 ; 07BB _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 07BE _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 07C1 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 07C4 _ C7. 45, FC, 00000000
        jmp     ?_023                                   ; 07CB _ E9, 0000016C

?_014:  mov     edx, dword [ebp-4H]                     ; 07D0 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 07D3 _ 8B. 45, 1C
        add     eax, edx                                ; 07D6 _ 01. D0
        movzx   eax, byte [eax]                         ; 07D8 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 07DB _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 07DE _ 80. 7D, FB, 00
        jns     ?_015                                   ; 07E2 _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 07E4 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 07E7 _ 8B. 55, 14
        add     eax, edx                                ; 07EA _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 07EC _ 0F AF. 45, 0C
        mov     edx, eax                                ; 07F0 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 07F2 _ 8B. 45, 10
        add     eax, edx                                ; 07F5 _ 01. D0
        mov     edx, eax                                ; 07F7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 07F9 _ 8B. 45, 08
        add     edx, eax                                ; 07FC _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 07FE _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0802 _ 88. 02
?_015:  movsx   eax, byte [ebp-5H]                      ; 0804 _ 0F BE. 45, FB
        and     eax, 40H                                ; 0808 _ 83. E0, 40
        test    eax, eax                                ; 080B _ 85. C0
        jz      ?_016                                   ; 080D _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 080F _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0812 _ 8B. 55, 14
        add     eax, edx                                ; 0815 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0817 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 081B _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 081D _ 8B. 45, 10
        add     eax, edx                                ; 0820 _ 01. D0
        lea     edx, [eax+1H]                           ; 0822 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0825 _ 8B. 45, 08
        add     edx, eax                                ; 0828 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 082A _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 082E _ 88. 02
?_016:  movsx   eax, byte [ebp-5H]                      ; 0830 _ 0F BE. 45, FB
        and     eax, 20H                                ; 0834 _ 83. E0, 20
        test    eax, eax                                ; 0837 _ 85. C0
        jz      ?_017                                   ; 0839 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 083B _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 083E _ 8B. 55, 14
        add     eax, edx                                ; 0841 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0843 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0847 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0849 _ 8B. 45, 10
        add     eax, edx                                ; 084C _ 01. D0
        lea     edx, [eax+2H]                           ; 084E _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0851 _ 8B. 45, 08
        add     edx, eax                                ; 0854 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0856 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 085A _ 88. 02
?_017:  movsx   eax, byte [ebp-5H]                      ; 085C _ 0F BE. 45, FB
        and     eax, 10H                                ; 0860 _ 83. E0, 10
        test    eax, eax                                ; 0863 _ 85. C0
        jz      ?_018                                   ; 0865 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0867 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 086A _ 8B. 55, 14
        add     eax, edx                                ; 086D _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 086F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0873 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0875 _ 8B. 45, 10
        add     eax, edx                                ; 0878 _ 01. D0
        lea     edx, [eax+3H]                           ; 087A _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 087D _ 8B. 45, 08
        add     edx, eax                                ; 0880 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0882 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0886 _ 88. 02
?_018:  movsx   eax, byte [ebp-5H]                      ; 0888 _ 0F BE. 45, FB
        and     eax, 08H                                ; 088C _ 83. E0, 08
        test    eax, eax                                ; 088F _ 85. C0
        jz      ?_019                                   ; 0891 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0893 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0896 _ 8B. 55, 14
        add     eax, edx                                ; 0899 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 089B _ 0F AF. 45, 0C
        mov     edx, eax                                ; 089F _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08A1 _ 8B. 45, 10
        add     eax, edx                                ; 08A4 _ 01. D0
        lea     edx, [eax+4H]                           ; 08A6 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 08A9 _ 8B. 45, 08
        add     edx, eax                                ; 08AC _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 08AE _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 08B2 _ 88. 02
?_019:  movsx   eax, byte [ebp-5H]                      ; 08B4 _ 0F BE. 45, FB
        and     eax, 04H                                ; 08B8 _ 83. E0, 04
        test    eax, eax                                ; 08BB _ 85. C0
        jz      ?_020                                   ; 08BD _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 08BF _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 08C2 _ 8B. 55, 14
        add     eax, edx                                ; 08C5 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08C7 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08CB _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08CD _ 8B. 45, 10
        add     eax, edx                                ; 08D0 _ 01. D0
        lea     edx, [eax+5H]                           ; 08D2 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 08D5 _ 8B. 45, 08
        add     edx, eax                                ; 08D8 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 08DA _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 08DE _ 88. 02
?_020:  movsx   eax, byte [ebp-5H]                      ; 08E0 _ 0F BE. 45, FB
        and     eax, 02H                                ; 08E4 _ 83. E0, 02
        test    eax, eax                                ; 08E7 _ 85. C0
        jz      ?_021                                   ; 08E9 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 08EB _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 08EE _ 8B. 55, 14
        add     eax, edx                                ; 08F1 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08F3 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08F7 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08F9 _ 8B. 45, 10
        add     eax, edx                                ; 08FC _ 01. D0
        lea     edx, [eax+6H]                           ; 08FE _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 0901 _ 8B. 45, 08
        add     edx, eax                                ; 0904 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0906 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 090A _ 88. 02
?_021:  movsx   eax, byte [ebp-5H]                      ; 090C _ 0F BE. 45, FB
        and     eax, 01H                                ; 0910 _ 83. E0, 01
        test    eax, eax                                ; 0913 _ 85. C0
        jz      ?_022                                   ; 0915 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0917 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 091A _ 8B. 55, 14
        add     eax, edx                                ; 091D _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 091F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0923 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0925 _ 8B. 45, 10
        add     eax, edx                                ; 0928 _ 01. D0
        lea     edx, [eax+7H]                           ; 092A _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 092D _ 8B. 45, 08
        add     edx, eax                                ; 0930 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0932 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0936 _ 88. 02
?_022:  add     dword [ebp-4H], 1                       ; 0938 _ 83. 45, FC, 01
?_023:  cmp     dword [ebp-4H], 15                      ; 093C _ 83. 7D, FC, 0F
        jle     ?_014                                   ; 0940 _ 0F 8E, FFFFFE8A
        leave                                           ; 0946 _ C9
        ret                                             ; 0947 _ C3
                                                        ; showFont8 End of function

init_mouse_cursor:                                      ; Function begin
        push    ebp                                     ; 0948 _ 55
        mov     ebp, esp                                ; 0949 _ 89. E5
        sub     esp, 20                                 ; 094B _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 094E _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0951 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0954 _ C7. 45, FC, 00000000
        jmp     ?_030                                   ; 095B _ E9, 000000B1

?_024:  mov     dword [ebp-8H], 0                       ; 0960 _ C7. 45, F8, 00000000
        jmp     ?_029                                   ; 0967 _ E9, 00000097

?_025:  mov     eax, dword [ebp-4H]                     ; 096C _ 8B. 45, FC
        shl     eax, 4                                  ; 096F _ C1. E0, 04
        mov     edx, eax                                ; 0972 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0974 _ 8B. 45, F8
        add     eax, edx                                ; 0977 _ 01. D0
        add     eax, cursor.1564                        ; 0979 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 097E _ 0F B6. 00
        cmp     al, 42                                  ; 0981 _ 3C, 2A
        jnz     ?_026                                   ; 0983 _ 75, 17
        mov     eax, dword [ebp-4H]                     ; 0985 _ 8B. 45, FC
        shl     eax, 4                                  ; 0988 _ C1. E0, 04
        mov     edx, eax                                ; 098B _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 098D _ 8B. 45, F8
        add     eax, edx                                ; 0990 _ 01. D0
        mov     edx, eax                                ; 0992 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0994 _ 8B. 45, 08
        add     eax, edx                                ; 0997 _ 01. D0
        mov     byte [eax], 0                           ; 0999 _ C6. 00, 00
?_026:  mov     eax, dword [ebp-4H]                     ; 099C _ 8B. 45, FC
        shl     eax, 4                                  ; 099F _ C1. E0, 04
        mov     edx, eax                                ; 09A2 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 09A4 _ 8B. 45, F8
        add     eax, edx                                ; 09A7 _ 01. D0
        add     eax, cursor.1564                        ; 09A9 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 09AE _ 0F B6. 00
        cmp     al, 79                                  ; 09B1 _ 3C, 4F
        jnz     ?_027                                   ; 09B3 _ 75, 17
        mov     eax, dword [ebp-4H]                     ; 09B5 _ 8B. 45, FC
        shl     eax, 4                                  ; 09B8 _ C1. E0, 04
        mov     edx, eax                                ; 09BB _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 09BD _ 8B. 45, F8
        add     eax, edx                                ; 09C0 _ 01. D0
        mov     edx, eax                                ; 09C2 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 09C4 _ 8B. 45, 08
        add     eax, edx                                ; 09C7 _ 01. D0
        mov     byte [eax], 7                           ; 09C9 _ C6. 00, 07
?_027:  mov     eax, dword [ebp-4H]                     ; 09CC _ 8B. 45, FC
        shl     eax, 4                                  ; 09CF _ C1. E0, 04
        mov     edx, eax                                ; 09D2 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 09D4 _ 8B. 45, F8
        add     eax, edx                                ; 09D7 _ 01. D0
        add     eax, cursor.1564                        ; 09D9 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 09DE _ 0F B6. 00
        cmp     al, 46                                  ; 09E1 _ 3C, 2E
        jnz     ?_028                                   ; 09E3 _ 75, 1A
        mov     eax, dword [ebp-4H]                     ; 09E5 _ 8B. 45, FC
        shl     eax, 4                                  ; 09E8 _ C1. E0, 04
        mov     edx, eax                                ; 09EB _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 09ED _ 8B. 45, F8
        add     eax, edx                                ; 09F0 _ 01. D0
        mov     edx, eax                                ; 09F2 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 09F4 _ 8B. 45, 08
        add     edx, eax                                ; 09F7 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 09F9 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 09FD _ 88. 02
?_028:  add     dword [ebp-8H], 1                       ; 09FF _ 83. 45, F8, 01
?_029:  cmp     dword [ebp-8H], 15                      ; 0A03 _ 83. 7D, F8, 0F
        jle     ?_025                                   ; 0A07 _ 0F 8E, FFFFFF5F
        add     dword [ebp-4H], 1                       ; 0A0D _ 83. 45, FC, 01
?_030:  cmp     dword [ebp-4H], 15                      ; 0A11 _ 83. 7D, FC, 0F
        jle     ?_024                                   ; 0A15 _ 0F 8E, FFFFFF45
        leave                                           ; 0A1B _ C9
        ret                                             ; 0A1C _ C3
                                                        ; init_mouse_cursor End of function

putblock:                                               ; Function begin
        push    ebp                                     ; 0A1D _ 55
        mov     ebp, esp                                ; 0A1E _ 89. E5
        sub     esp, 16                                 ; 0A20 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 0A23 _ C7. 45, FC, 00000000
        jmp     ?_034                                   ; 0A2A _ EB, 50

?_031:  mov     dword [ebp-8H], 0                       ; 0A2C _ C7. 45, F8, 00000000
        jmp     ?_033                                   ; 0A33 _ EB, 3B

?_032:  mov     eax, dword [ebp-4H]                     ; 0A35 _ 8B. 45, FC
        mov     edx, dword [ebp+1CH]                    ; 0A38 _ 8B. 55, 1C
        add     eax, edx                                ; 0A3B _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0A3D _ 0F AF. 45, 0C
        mov     edx, dword [ebp-8H]                     ; 0A41 _ 8B. 55, F8
        mov     ecx, dword [ebp+18H]                    ; 0A44 _ 8B. 4D, 18
        add     edx, ecx                                ; 0A47 _ 01. CA
        add     eax, edx                                ; 0A49 _ 01. D0
        mov     edx, eax                                ; 0A4B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A4D _ 8B. 45, 08
        add     edx, eax                                ; 0A50 _ 01. C2
        mov     eax, dword [ebp-4H]                     ; 0A52 _ 8B. 45, FC
        imul    eax, dword [ebp+24H]                    ; 0A55 _ 0F AF. 45, 24
        mov     ecx, eax                                ; 0A59 _ 89. C1
        mov     eax, dword [ebp-8H]                     ; 0A5B _ 8B. 45, F8
        add     eax, ecx                                ; 0A5E _ 01. C8
        mov     ecx, eax                                ; 0A60 _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 0A62 _ 8B. 45, 20
        add     eax, ecx                                ; 0A65 _ 01. C8
        movzx   eax, byte [eax]                         ; 0A67 _ 0F B6. 00
        mov     byte [edx], al                          ; 0A6A _ 88. 02
        add     dword [ebp-8H], 1                       ; 0A6C _ 83. 45, F8, 01
?_033:  mov     eax, dword [ebp-8H]                     ; 0A70 _ 8B. 45, F8
        cmp     eax, dword [ebp+10H]                    ; 0A73 _ 3B. 45, 10
        jl      ?_032                                   ; 0A76 _ 7C, BD
        add     dword [ebp-4H], 1                       ; 0A78 _ 83. 45, FC, 01
?_034:  mov     eax, dword [ebp-4H]                     ; 0A7C _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 0A7F _ 3B. 45, 14
        jl      ?_031                                   ; 0A82 _ 7C, A8
        leave                                           ; 0A84 _ C9
        ret                                             ; 0A85 _ C3
                                                        ; putblock End of function

intHandlerFromC:                                        ; Function begin
        push    ebp                                     ; 0A86 _ 55
        mov     ebp, esp                                ; 0A87 _ 89. E5
        sub     esp, 40                                 ; 0A89 _ 83. EC, 28
        mov     eax, dword [bootInfo]                   ; 0A8C _ A1, 00000120(d)
        mov     dword [ebp-14H], eax                    ; 0A91 _ 89. 45, EC
        movzx   eax, word [?_054]                       ; 0A94 _ 0F B7. 05, 00000124(d)
        cwde                                            ; 0A9B _ 98
        mov     dword [ebp-10H], eax                    ; 0A9C _ 89. 45, F0
        movzx   eax, word [?_055]                       ; 0A9F _ 0F B7. 05, 00000126(d)
        cwde                                            ; 0AA6 _ 98
        mov     dword [ebp-0CH], eax                    ; 0AA7 _ 89. 45, F4
        mov     dword [esp+4H], 32                      ; 0AAA _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 0AB2 _ C7. 04 24, 00000020
        call    io_out8                                 ; 0AB9 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-15H], 0                       ; 0ABE _ C6. 45, EB, 00
        mov     dword [esp], 96                         ; 0AC2 _ C7. 04 24, 00000060
        call    io_in8                                  ; 0AC9 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-15H], al                      ; 0ACE _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 0AD1 _ 0F B6. 45, EB
        mov     dword [esp+4H], eax                     ; 0AD5 _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 0AD9 _ C7. 04 24, 000001E0(d)
        call    fifo8_put                               ; 0AE0 _ E8, FFFFFFFC(rel)
        nop                                             ; 0AE5 _ 90
        leave                                           ; 0AE6 _ C9
        ret                                             ; 0AE7 _ C3
                                                        ; intHandlerFromC End of function

charToHexVal:                                           ; Function begin
        push    ebp                                     ; 0AE8 _ 55
        mov     ebp, esp                                ; 0AE9 _ 89. E5
        sub     esp, 4                                  ; 0AEB _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 0AEE _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 0AF1 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 0AF4 _ 80. 7D, FC, 09
        jle     ?_035                                   ; 0AF8 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 0AFA _ 0F B6. 45, FC
        add     eax, 55                                 ; 0AFE _ 83. C0, 37
        jmp     ?_036                                   ; 0B01 _ EB, 07

?_035:  movzx   eax, byte [ebp-4H]                      ; 0B03 _ 0F B6. 45, FC
        add     eax, 48                                 ; 0B07 _ 83. C0, 30
?_036:  leave                                           ; 0B0A _ C9
        ret                                             ; 0B0B _ C3
                                                        ; charToHexVal End of function

charToHexStr:                                           ; Function begin
        push    ebp                                     ; 0B0C _ 55
        mov     ebp, esp                                ; 0B0D _ 89. E5
        sub     esp, 24                                 ; 0B0F _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 0B12 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 0B15 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0B18 _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 0B1F _ 0F B6. 45, EC
        and     eax, 0FH                                ; 0B23 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 0B26 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 0B29 _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 0B2D _ 89. 04 24
        call    charToHexVal                            ; 0B30 _ E8, FFFFFFFC(rel)
        mov     byte [?_053], al                        ; 0B35 _ A2, 00000013(d)
        movzx   eax, byte [ebp-14H]                     ; 0B3A _ 0F B6. 45, EC
        shr     al, 4                                   ; 0B3E _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 0B41 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 0B44 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 0B48 _ 0F BE. C0
        mov     dword [esp], eax                        ; 0B4B _ 89. 04 24
        call    charToHexVal                            ; 0B4E _ E8, FFFFFFFC(rel)
        mov     byte [?_052], al                        ; 0B53 _ A2, 00000012(d)
        mov     eax, keyval                             ; 0B58 _ B8, 00000010(d)
        leave                                           ; 0B5D _ C9
        ret                                             ; 0B5E _ C3
                                                        ; charToHexStr End of function

intToHexStr:                                            ; Function begin
        push    ebp                                     ; 0B5F _ 55
        mov     ebp, esp                                ; 0B60 _ 89. E5
        sub     esp, 16                                 ; 0B62 _ 83. EC, 10
        mov     byte [str.1612], 48                     ; 0B65 _ C6. 05, 00000214(d), 30
        mov     byte [?_056], 88                        ; 0B6C _ C6. 05, 00000215(d), 58
        mov     byte [?_057], 0                         ; 0B73 _ C6. 05, 0000021E(d), 00
        mov     dword [ebp-0CH], 2                      ; 0B7A _ C7. 45, F4, 00000002
        jmp     ?_038                                   ; 0B81 _ EB, 0F

?_037:  mov     eax, dword [ebp-0CH]                    ; 0B83 _ 8B. 45, F4
        add     eax, str.1612                           ; 0B86 _ 05, 00000214(d)
        mov     byte [eax], 48                          ; 0B8B _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 0B8E _ 83. 45, F4, 01
?_038:  cmp     dword [ebp-0CH], 9                      ; 0B92 _ 83. 7D, F4, 09
        jle     ?_037                                   ; 0B96 _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 0B98 _ C7. 45, F8, 00000009
        jmp     ?_041                                   ; 0B9F _ EB, 3C

?_039:  mov     eax, dword [ebp+8H]                     ; 0BA1 _ 8B. 45, 08
        and     eax, 0FH                                ; 0BA4 _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 0BA7 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0BAA _ 8B. 45, 08
        shr     eax, 4                                  ; 0BAD _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 0BB0 _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 0BB3 _ 83. 7D, FC, 09
        jle     ?_040                                   ; 0BB7 _ 7E, 13
        mov     eax, dword [ebp-4H]                     ; 0BB9 _ 8B. 45, FC
        add     eax, 55                                 ; 0BBC _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 0BBF _ 8B. 55, F8
        add     edx, str.1612                           ; 0BC2 _ 81. C2, 00000214(d)
        mov     byte [edx], al                          ; 0BC8 _ 88. 02
        jmp     ?_041                                   ; 0BCA _ EB, 11

?_040:  mov     eax, dword [ebp-4H]                     ; 0BCC _ 8B. 45, FC
        add     eax, 48                                 ; 0BCF _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 0BD2 _ 8B. 55, F8
        add     edx, str.1612                           ; 0BD5 _ 81. C2, 00000214(d)
        mov     byte [edx], al                          ; 0BDB _ 88. 02
?_041:  cmp     dword [ebp-8H], 1                       ; 0BDD _ 83. 7D, F8, 01
        jle     ?_042                                   ; 0BE1 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 0BE3 _ 83. 7D, 08, 00
        jnz     ?_039                                   ; 0BE7 _ 75, B8
?_042:  mov     eax, str.1612                           ; 0BE9 _ B8, 00000214(d)
        leave                                           ; 0BEE _ C9
        ret                                             ; 0BEF _ C3
                                                        ; intToHexStr End of function

wait_KBC_sendready:                                     ; Function begin
        push    ebp                                     ; 0BF0 _ 55
        mov     ebp, esp                                ; 0BF1 _ 89. E5
        sub     esp, 24                                 ; 0BF3 _ 83. EC, 18
?_043:  mov     dword [esp], 100                        ; 0BF6 _ C7. 04 24, 00000064
        call    io_in8                                  ; 0BFD _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 0C02 _ 83. E0, 02
        test    eax, eax                                ; 0C05 _ 85. C0
        jnz     ?_044                                   ; 0C07 _ 75, 02
        jmp     ?_045                                   ; 0C09 _ EB, 02

?_044:  jmp     ?_043                                   ; 0C0B _ EB, E9

?_045:  leave                                           ; 0C0D _ C9
        ret                                             ; 0C0E _ C3
                                                        ; wait_KBC_sendready End of function

init_keyboard:                                          ; Function begin
        push    ebp                                     ; 0C0F _ 55
        mov     ebp, esp                                ; 0C10 _ 89. E5
        sub     esp, 24                                 ; 0C12 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 0C15 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 0C1A _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 0C22 _ C7. 04 24, 00000064
        call    io_out8                                 ; 0C29 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 0C2E _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 0C33 _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 0C3B _ C7. 04 24, 00000060
        call    io_out8                                 ; 0C42 _ E8, FFFFFFFC(rel)
        nop                                             ; 0C47 _ 90
        leave                                           ; 0C48 _ C9
        ret                                             ; 0C49 _ C3
                                                        ; init_keyboard End of function

enable_mouse:                                           ; Function begin
        push    ebp                                     ; 0C4A _ 55
        mov     ebp, esp                                ; 0C4B _ 89. E5
        sub     esp, 24                                 ; 0C4D _ 83. EC, 18
        call    wait_KBC_sendready                      ; 0C50 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 0C55 _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 0C5D _ C7. 04 24, 00000064
        call    io_out8                                 ; 0C64 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 0C69 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 0C6E _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 0C76 _ C7. 04 24, 00000060
        call    io_out8                                 ; 0C7D _ E8, FFFFFFFC(rel)
        nop                                             ; 0C82 _ 90
        leave                                           ; 0C83 _ C9
        ret                                             ; 0C84 _ C3
                                                        ; enable_mouse End of function

intHandlerForMouse:                                     ; Function begin
        push    ebp                                     ; 0C85 _ 55
        mov     ebp, esp                                ; 0C86 _ 89. E5
        sub     esp, 40                                 ; 0C88 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 0C8B _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 0C93 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 0C9A _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 0C9F _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 0CA7 _ C7. 04 24, 00000020
        call    io_out8                                 ; 0CAE _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 0CB3 _ C7. 04 24, 00000060
        call    io_in8                                  ; 0CBA _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 0CBF _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0CC2 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 0CC6 _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 0CCA _ C7. 04 24, 000001F8(d)
        call    fifo8_put                               ; 0CD1 _ E8, FFFFFFFC(rel)
        leave                                           ; 0CD6 _ C9
        ret                                             ; 0CD7 _ C3
                                                        ; intHandlerForMouse End of function

fifo8_init:                                             ; Function begin
        push    ebp                                     ; 0CD8 _ 55
        mov     ebp, esp                                ; 0CD9 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0CDB _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0CDE _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 0CE1 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0CE4 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 0CE7 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 0CEA _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0CEC _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0CEF _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 0CF2 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0CF5 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0CF8 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 0CFF _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0D02 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 0D09 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0D0C _ C7. 40, 08, 00000000
        nop                                             ; 0D13 _ 90
        pop     ebp                                     ; 0D14 _ 5D
        ret                                             ; 0D15 _ C3
                                                        ; fifo8_init End of function

fifo8_put:                                              ; Function begin
        push    ebp                                     ; 0D16 _ 55
        mov     ebp, esp                                ; 0D17 _ 89. E5
        sub     esp, 4                                  ; 0D19 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0D1C _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0D1F _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0D22 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0D25 _ 8B. 40, 10
        test    eax, eax                                ; 0D28 _ 85. C0
        jnz     ?_046                                   ; 0D2A _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 0D2C _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 0D2F _ 8B. 40, 14
        or      eax, 01H                                ; 0D32 _ 83. C8, 01
        mov     edx, eax                                ; 0D35 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0D37 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 0D3A _ 89. 50, 14
        mov     eax, 4294967295                         ; 0D3D _ B8, FFFFFFFF
        jmp     ?_048                                   ; 0D42 _ EB, 50

?_046:  mov     eax, dword [ebp+8H]                     ; 0D44 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0D47 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0D49 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0D4C _ 8B. 40, 04
        add     edx, eax                                ; 0D4F _ 01. C2
        movzx   eax, byte [ebp-4H]                      ; 0D51 _ 0F B6. 45, FC
        mov     byte [edx], al                          ; 0D55 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 0D57 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0D5A _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 0D5D _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0D60 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0D63 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0D66 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0D69 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0D6C _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0D6F _ 8B. 40, 0C
        cmp     edx, eax                                ; 0D72 _ 39. C2
        jnz     ?_047                                   ; 0D74 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0D76 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0D79 _ C7. 40, 04, 00000000
?_047:  mov     eax, dword [ebp+8H]                     ; 0D80 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0D83 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 0D86 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 0D89 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0D8C _ 89. 50, 10
        mov     eax, 0                                  ; 0D8F _ B8, 00000000
?_048:  leave                                           ; 0D94 _ C9
        ret                                             ; 0D95 _ C3
                                                        ; fifo8_put End of function

fifo8_get:                                              ; Function begin
        push    ebp                                     ; 0D96 _ 55
        mov     ebp, esp                                ; 0D97 _ 89. E5
        sub     esp, 16                                 ; 0D99 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 0D9C _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 0D9F _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0DA2 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0DA5 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0DA8 _ 39. C2
        jnz     ?_049                                   ; 0DAA _ 75, 07
        mov     eax, 4294967295                         ; 0DAC _ B8, FFFFFFFF
        jmp     ?_051                                   ; 0DB1 _ EB, 51

?_049:  mov     eax, dword [ebp+8H]                     ; 0DB3 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0DB6 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0DB8 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0DBB _ 8B. 40, 08
        add     eax, edx                                ; 0DBE _ 01. D0
        movzx   eax, byte [eax]                         ; 0DC0 _ 0F B6. 00
        movzx   eax, al                                 ; 0DC3 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 0DC6 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0DC9 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0DCC _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 0DCF _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0DD2 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0DD5 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0DD8 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0DDB _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0DDE _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0DE1 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0DE4 _ 39. C2
        jnz     ?_050                                   ; 0DE6 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0DE8 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0DEB _ C7. 40, 08, 00000000
?_050:  mov     eax, dword [ebp+8H]                     ; 0DF2 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0DF5 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 0DF8 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0DFB _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0DFE _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 0E01 _ 8B. 45, FC
?_051:  leave                                           ; 0E04 _ C9
        ret                                             ; 0E05 _ C3
                                                        ; fifo8_get End of function

fifo8_status:                                           ; Function begin
        push    ebp                                     ; 0E06 _ 55
        mov     ebp, esp                                ; 0E07 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0E09 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 0E0C _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0E0F _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0E12 _ 8B. 40, 10
        sub     edx, eax                                ; 0E15 _ 29. C2
        mov     eax, edx                                ; 0E17 _ 89. D0
        pop     ebp                                     ; 0E19 _ 5D
        ret                                             ; 0E1A _ C3
                                                        ; fifo8_status End of function


                                                        ; SECTION .data   align=32 noexecute                      ; section number 2, data

fontA:                                                  ; oword
        db 00H, 18H, 18H, 18H, 18H, 24H, 24H, 24H       ; 0000 _ .....$$$
        db 24H, 7EH, 42H, 42H, 42H, 0E7H, 00H, 00H      ; 0008 _ $~BBB...

keyval:                                                 ; byte
        db 30H, 58H                                     ; 0010 _ 0X

?_052:  db 00H                                          ; 0012 _ .

?_053:  db 00H, 00H, 00H, 00H, 00H                      ; 0013 _ .....

mousePos.1499:                                          ; dword
        dd 00000010H, 00000000H                         ; 0018 _ 16 0

table_rgb.1506:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0020 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........

cursor.1564:                                            ; byte
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


                                                        ; SECTION .bss    align=32 noexecute                      ; section number 3, bss

mx:                                                     ; dword
        resd    1                                       ; 0000

my:     resd    1                                       ; 0004

xsize:  resd    1                                       ; 0008

ysize:  resd    5                                       ; 000C

mcursor:                                                ; byte
        resb    256                                     ; 0020

bootInfo:                                               ; qword
        resb    4                                       ; 0120

?_054:  resw    1                                       ; 0124

?_055:  resw    13                                      ; 0126

mousebuf:                                               ; byte
        resb    128                                     ; 0140

keybuf:                                                 ; yword
        resb    32                                      ; 01C0

keyinfo:                                                ; byte
        resb    24                                      ; 01E0

mouseinfo:                                              ; byte
        resb    24                                      ; 01F8

showPos.1489:                                           ; dword
        resd    1                                       ; 0210

str.1612:                                               ; byte
        resb    1                                       ; 0214

?_056:  resb    9                                       ; 0215

?_057:  resb    1                                       ; 021E

