; Disassembly of file: ddr_detail.o
; Tue Oct 30 17:25:37 2018
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
; global showMemoryInfo: function

; extern io_in8                                           ; near
; extern systemFont                                       ; byte
; extern io_store_eflags                                  ; near
; extern io_out8                                          ; near
; extern io_load_eflags                                   ; near
; extern io_stihlt                                        ; near
; extern io_cli                                           ; near
; extern io_sti                                           ; near
; extern get_adr_buffer                                   ; near
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
        mov     dword [ebp-24H], eax                    ; 0018 _ 89. 45, DC
        movzx   eax, word [?_054]                       ; 001B _ 0F B7. 05, 00000124(d)
        cwde                                            ; 0022 _ 98
        mov     dword [ebp-20H], eax                    ; 0023 _ 89. 45, E0
        movzx   eax, word [?_055]                       ; 0026 _ 0F B7. 05, 00000126(d)
        cwde                                            ; 002D _ 98
        mov     dword [ebp-1CH], eax                    ; 002E _ 89. 45, E4
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
        mov     eax, dword [ebp-1CH]                    ; 0073 _ 8B. 45, E4
        lea     edx, [eax-1DH]                          ; 0076 _ 8D. 50, E3
        mov     eax, dword [ebp-20H]                    ; 0079 _ 8B. 45, E0
        sub     eax, 1                                  ; 007C _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 007F _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 0083 _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 0087 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 008F _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 14                      ; 0097 _ C7. 44 24, 08, 0000000E
        mov     eax, dword [ebp-20H]                    ; 009F _ 8B. 45, E0
        mov     dword [esp+4H], eax                     ; 00A2 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 00A6 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 00A9 _ 89. 04 24
        call    boxfill8                                ; 00AC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-1CH]                    ; 00B1 _ 8B. 45, E4
        lea     ecx, [eax-1CH]                          ; 00B4 _ 8D. 48, E4
        mov     eax, dword [ebp-20H]                    ; 00B7 _ 8B. 45, E0
        lea     edx, [eax-1H]                           ; 00BA _ 8D. 50, FF
        mov     eax, dword [ebp-1CH]                    ; 00BD _ 8B. 45, E4
        sub     eax, 28                                 ; 00C0 _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 00C3 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 00C7 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 00CB _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 00CF _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 00D7 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp-20H]                    ; 00DF _ 8B. 45, E0
        mov     dword [esp+4H], eax                     ; 00E2 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 00E6 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 00E9 _ 89. 04 24
        call    boxfill8                                ; 00EC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-1CH]                    ; 00F1 _ 8B. 45, E4
        lea     ecx, [eax-1BH]                          ; 00F4 _ 8D. 48, E5
        mov     eax, dword [ebp-20H]                    ; 00F7 _ 8B. 45, E0
        lea     edx, [eax-1H]                           ; 00FA _ 8D. 50, FF
        mov     eax, dword [ebp-1CH]                    ; 00FD _ 8B. 45, E4
        sub     eax, 27                                 ; 0100 _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 0103 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0107 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 010B _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 010F _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 0117 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp-20H]                    ; 011F _ 8B. 45, E0
        mov     dword [esp+4H], eax                     ; 0122 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 0126 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 0129 _ 89. 04 24
        call    boxfill8                                ; 012C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-1CH]                    ; 0131 _ 8B. 45, E4
        lea     ecx, [eax-1H]                           ; 0134 _ 8D. 48, FF
        mov     eax, dword [ebp-20H]                    ; 0137 _ 8B. 45, E0
        lea     edx, [eax-1H]                           ; 013A _ 8D. 50, FF
        mov     eax, dword [ebp-1CH]                    ; 013D _ 8B. 45, E4
        sub     eax, 26                                 ; 0140 _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 0143 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0147 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 014B _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 014F _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0157 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp-20H]                    ; 015F _ 8B. 45, E0
        mov     dword [esp+4H], eax                     ; 0162 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 0166 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 0169 _ 89. 04 24
        call    boxfill8                                ; 016C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-1CH]                    ; 0171 _ 8B. 45, E4
        lea     edx, [eax-18H]                          ; 0174 _ 8D. 50, E8
        mov     eax, dword [ebp-1CH]                    ; 0177 _ 8B. 45, E4
        sub     eax, 24                                 ; 017A _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 017D _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0181 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0189 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 018D _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 0195 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp-20H]                    ; 019D _ 8B. 45, E0
        mov     dword [esp+4H], eax                     ; 01A0 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 01A4 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 01A7 _ 89. 04 24
        call    boxfill8                                ; 01AA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-1CH]                    ; 01AF _ 8B. 45, E4
        lea     edx, [eax-4H]                           ; 01B2 _ 8D. 50, FC
        mov     eax, dword [ebp-1CH]                    ; 01B5 _ 8B. 45, E4
        sub     eax, 24                                 ; 01B8 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 01BB _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 01BF _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 01C7 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 01CB _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 01D3 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp-20H]                    ; 01DB _ 8B. 45, E0
        mov     dword [esp+4H], eax                     ; 01DE _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 01E2 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 01E5 _ 89. 04 24
        call    boxfill8                                ; 01E8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-1CH]                    ; 01ED _ 8B. 45, E4
        lea     edx, [eax-4H]                           ; 01F0 _ 8D. 50, FC
        mov     eax, dword [ebp-1CH]                    ; 01F3 _ 8B. 45, E4
        sub     eax, 4                                  ; 01F6 _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 01F9 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 01FD _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0205 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0209 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 15                      ; 0211 _ C7. 44 24, 08, 0000000F
        mov     eax, dword [ebp-20H]                    ; 0219 _ 8B. 45, E0
        mov     dword [esp+4H], eax                     ; 021C _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 0220 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 0223 _ 89. 04 24
        call    boxfill8                                ; 0226 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-1CH]                    ; 022B _ 8B. 45, E4
        lea     edx, [eax-5H]                           ; 022E _ 8D. 50, FB
        mov     eax, dword [ebp-1CH]                    ; 0231 _ 8B. 45, E4
        sub     eax, 23                                 ; 0234 _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 0237 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 023B _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0243 _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 0247 _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 15                      ; 024F _ C7. 44 24, 08, 0000000F
        mov     eax, dword [ebp-20H]                    ; 0257 _ 8B. 45, E0
        mov     dword [esp+4H], eax                     ; 025A _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 025E _ 8B. 45, DC
        mov     dword [esp], eax                        ; 0261 _ 89. 04 24
        call    boxfill8                                ; 0264 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-1CH]                    ; 0269 _ 8B. 45, E4
        lea     edx, [eax-3H]                           ; 026C _ 8D. 50, FD
        mov     eax, dword [ebp-1CH]                    ; 026F _ 8B. 45, E4
        sub     eax, 3                                  ; 0272 _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 0275 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0279 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0281 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0285 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 028D _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-20H]                    ; 0295 _ 8B. 45, E0
        mov     dword [esp+4H], eax                     ; 0298 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 029C _ 8B. 45, DC
        mov     dword [esp], eax                        ; 029F _ 89. 04 24
        call    boxfill8                                ; 02A2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-1CH]                    ; 02A7 _ 8B. 45, E4
        lea     edx, [eax-3H]                           ; 02AA _ 8D. 50, FD
        mov     eax, dword [ebp-1CH]                    ; 02AD _ 8B. 45, E4
        sub     eax, 24                                 ; 02B0 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 02B3 _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 02B7 _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 02BF _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 02C3 _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 02CB _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-20H]                    ; 02D3 _ 8B. 45, E0
        mov     dword [esp+4H], eax                     ; 02D6 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 02DA _ 8B. 45, DC
        mov     dword [esp], eax                        ; 02DD _ 89. 04 24
        call    boxfill8                                ; 02E0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-1CH]                    ; 02E5 _ 8B. 45, E4
        lea     ebx, [eax-18H]                          ; 02E8 _ 8D. 58, E8
        mov     eax, dword [ebp-20H]                    ; 02EB _ 8B. 45, E0
        lea     ecx, [eax-4H]                           ; 02EE _ 8D. 48, FC
        mov     eax, dword [ebp-1CH]                    ; 02F1 _ 8B. 45, E4
        lea     edx, [eax-18H]                          ; 02F4 _ 8D. 50, E8
        mov     eax, dword [ebp-20H]                    ; 02F7 _ 8B. 45, E0
        sub     eax, 47                                 ; 02FA _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 02FD _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0301 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0305 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0309 _ 89. 44 24, 0C
        mov     dword [esp+8H], 15                      ; 030D _ C7. 44 24, 08, 0000000F
        mov     eax, dword [ebp-20H]                    ; 0315 _ 8B. 45, E0
        mov     dword [esp+4H], eax                     ; 0318 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 031C _ 8B. 45, DC
        mov     dword [esp], eax                        ; 031F _ 89. 04 24
        call    boxfill8                                ; 0322 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-1CH]                    ; 0327 _ 8B. 45, E4
        lea     ebx, [eax-4H]                           ; 032A _ 8D. 58, FC
        mov     eax, dword [ebp-20H]                    ; 032D _ 8B. 45, E0
        lea     ecx, [eax-2FH]                          ; 0330 _ 8D. 48, D1
        mov     eax, dword [ebp-1CH]                    ; 0333 _ 8B. 45, E4
        lea     edx, [eax-17H]                          ; 0336 _ 8D. 50, E9
        mov     eax, dword [ebp-20H]                    ; 0339 _ 8B. 45, E0
        sub     eax, 47                                 ; 033C _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 033F _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0343 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0347 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 034B _ 89. 44 24, 0C
        mov     dword [esp+8H], 15                      ; 034F _ C7. 44 24, 08, 0000000F
        mov     eax, dword [ebp-20H]                    ; 0357 _ 8B. 45, E0
        mov     dword [esp+4H], eax                     ; 035A _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 035E _ 8B. 45, DC
        mov     dword [esp], eax                        ; 0361 _ 89. 04 24
        call    boxfill8                                ; 0364 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-1CH]                    ; 0369 _ 8B. 45, E4
        lea     ebx, [eax-3H]                           ; 036C _ 8D. 58, FD
        mov     eax, dword [ebp-20H]                    ; 036F _ 8B. 45, E0
        lea     ecx, [eax-4H]                           ; 0372 _ 8D. 48, FC
        mov     eax, dword [ebp-1CH]                    ; 0375 _ 8B. 45, E4
        lea     edx, [eax-3H]                           ; 0378 _ 8D. 50, FD
        mov     eax, dword [ebp-20H]                    ; 037B _ 8B. 45, E0
        sub     eax, 47                                 ; 037E _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0381 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0385 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0389 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 038D _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 0391 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp-20H]                    ; 0399 _ 8B. 45, E0
        mov     dword [esp+4H], eax                     ; 039C _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 03A0 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 03A3 _ 89. 04 24
        call    boxfill8                                ; 03A6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-1CH]                    ; 03AB _ 8B. 45, E4
        lea     ebx, [eax-3H]                           ; 03AE _ 8D. 58, FD
        mov     eax, dword [ebp-20H]                    ; 03B1 _ 8B. 45, E0
        lea     ecx, [eax-3H]                           ; 03B4 _ 8D. 48, FD
        mov     eax, dword [ebp-1CH]                    ; 03B7 _ 8B. 45, E4
        lea     edx, [eax-18H]                          ; 03BA _ 8D. 50, E8
        mov     eax, dword [ebp-20H]                    ; 03BD _ 8B. 45, E0
        sub     eax, 3                                  ; 03C0 _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 03C3 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 03C7 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 03CB _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 03CF _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 03D3 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp-20H]                    ; 03DB _ 8B. 45, E0
        mov     dword [esp+4H], eax                     ; 03DE _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 03E2 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 03E5 _ 89. 04 24
        call    boxfill8                                ; 03E8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-20H]                    ; 03ED _ 8B. 45, E0
        sub     eax, 16                                 ; 03F0 _ 83. E8, 10
        mov     edx, eax                                ; 03F3 _ 89. C2
        shr     edx, 31                                 ; 03F5 _ C1. EA, 1F
        add     eax, edx                                ; 03F8 _ 01. D0
        sar     eax, 1                                  ; 03FA _ D1. F8
        mov     dword [mx], eax                         ; 03FC _ A3, 00000000(d)
        mov     eax, dword [ebp-1CH]                    ; 0401 _ 8B. 45, E4
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
        mov     eax, dword [ebp-20H]                    ; 045C _ 8B. 45, E0
        mov     dword [esp+4H], eax                     ; 045F _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 0463 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 0466 _ 89. 04 24
        call    putblock                                ; 0469 _ E8, FFFFFFFC(rel)
        call    get_memory_block_count                  ; 046E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0473 _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 0476 _ 8B. 45, E8
        mov     dword [esp], eax                        ; 0479 _ 89. 04 24
        call    intToHexStr                             ; 047C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0481 _ 89. 45, EC
        call    get_adr_buffer                          ; 0484 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0489 _ 89. 45, F0
        call    io_sti                                  ; 048C _ E8, FFFFFFFC(rel)
        call    enable_mouse                            ; 0491 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 0                      ; 0496 _ C7. 45, F4, 00000000
        mov     dword [ebp-28H], 0                      ; 049D _ C7. 45, D8, 00000000
?_001:  call    io_cli                                  ; 04A4 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 04A9 _ C7. 04 24, 000001E0(d)
        call    fifo8_status                            ; 04B0 _ E8, FFFFFFFC(rel)
        mov     ebx, eax                                ; 04B5 _ 89. C3
        mov     dword [esp], mouseinfo                  ; 04B7 _ C7. 04 24, 000001F8(d)
        call    fifo8_status                            ; 04BE _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 04C3 _ 01. D8
        test    eax, eax                                ; 04C5 _ 85. C0
        jnz     ?_002                                   ; 04C7 _ 75, 0A
        call    io_stihlt                               ; 04C9 _ E8, FFFFFFFC(rel)
        jmp     ?_004                                   ; 04CE _ E9, 00000083

?_002:  mov     dword [esp], keyinfo                    ; 04D3 _ C7. 04 24, 000001E0(d)
        call    fifo8_status                            ; 04DA _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 04DF _ 85. C0
        jz      ?_003                                   ; 04E1 _ 74, 59
        call    io_sti                                  ; 04E3 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 04E8 _ C7. 04 24, 000001E0(d)
        call    fifo8_get                               ; 04EF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 04F4 _ 89. 45, F4
        cmp     dword [ebp-0CH], 28                     ; 04F7 _ 83. 7D, F4, 1C
        jnz     ?_004                                   ; 04FB _ 75, 59
        mov     edx, dword [ebp-28H]                    ; 04FD _ 8B. 55, D8
        mov     eax, edx                                ; 0500 _ 89. D0
        shl     eax, 2                                  ; 0502 _ C1. E0, 02
        add     eax, edx                                ; 0505 _ 01. D0
        shl     eax, 2                                  ; 0507 _ C1. E0, 02
        mov     edx, eax                                ; 050A _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 050C _ 8B. 45, F0
        add     edx, eax                                ; 050F _ 01. C2
        mov     dword [esp+10H], 7                      ; 0511 _ C7. 44 24, 10, 00000007
        mov     eax, dword [ebp-20H]                    ; 0519 _ 8B. 45, E0
        mov     dword [esp+0CH], eax                    ; 051C _ 89. 44 24, 0C
        mov     eax, dword [ebp-28H]                    ; 0520 _ 8B. 45, D8
        mov     dword [esp+8H], eax                     ; 0523 _ 89. 44 24, 08
        mov     eax, dword [ebp-24H]                    ; 0527 _ 8B. 45, DC
        mov     dword [esp+4H], eax                     ; 052A _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 052E _ 89. 14 24
        call    showMemoryInfo                          ; 0531 _ E8, FFFFFFFC(rel)
        add     dword [ebp-28H], 1                      ; 0536 _ 83. 45, D8, 01
        jmp     ?_004                                   ; 053A _ EB, 1A

?_003:  mov     dword [esp], mouseinfo                  ; 053C _ C7. 04 24, 000001F8(d)
        call    fifo8_status                            ; 0543 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0548 _ 85. C0
        jz      ?_004                                   ; 054A _ 74, 0A
        call    show_mouse_info                         ; 054C _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0551 _ E9, FFFFFF4E

?_004:  jmp     ?_001                                   ; 0556 _ E9, FFFFFF49
                                                        ; CMain End of function

show_mouse_info:                                        ; Function begin
        push    ebp                                     ; 055B _ 55
        mov     ebp, esp                                ; 055C _ 89. E5
        sub     esp, 72                                 ; 055E _ 83. EC, 48
        mov     eax, dword [bootInfo]                   ; 0561 _ A1, 00000120(d)
        mov     dword [ebp-18H], eax                    ; 0566 _ 89. 45, E8
        movzx   eax, word [?_054]                       ; 0569 _ 0F B7. 05, 00000124(d)
        cwde                                            ; 0570 _ 98
        mov     dword [ebp-14H], eax                    ; 0571 _ 89. 45, EC
        movzx   eax, word [?_055]                       ; 0574 _ 0F B7. 05, 00000126(d)
        cwde                                            ; 057B _ 98
        mov     dword [ebp-10H], eax                    ; 057C _ 89. 45, F0
        mov     byte [ebp-19H], 0                       ; 057F _ C6. 45, E7, 00
        call    io_sti                                  ; 0583 _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 0588 _ C7. 04 24, 000001F8(d)
        call    fifo8_get                               ; 058F _ E8, FFFFFFFC(rel)
        mov     byte [ebp-19H], al                      ; 0594 _ 88. 45, E7
        movzx   eax, byte [ebp-19H]                     ; 0597 _ 0F B6. 45, E7
        mov     dword [esp], eax                        ; 059B _ 89. 04 24
        call    charToHexStr                            ; 059E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 05A3 _ 89. 45, F4
        mov     eax, dword [mousePos.1511]              ; 05A6 _ A1, 00000018(d)
        cmp     eax, 256                                ; 05AB _ 3D, 00000100
        jg      ?_005                                   ; 05B0 _ 7F, 3F
        mov     eax, dword [mousePos.1511]              ; 05B2 _ A1, 00000018(d)
        mov     edx, dword [ebp-0CH]                    ; 05B7 _ 8B. 55, F4
        mov     dword [esp+14H], edx                    ; 05BA _ 89. 54 24, 14
        mov     dword [esp+10H], 7                      ; 05BE _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 16                     ; 05C6 _ C7. 44 24, 0C, 00000010
        mov     dword [esp+8H], eax                     ; 05CE _ 89. 44 24, 08
        mov     eax, dword [ebp-14H]                    ; 05D2 _ 8B. 45, EC
        mov     dword [esp+4H], eax                     ; 05D5 _ 89. 44 24, 04
        mov     eax, dword [ebp-18H]                    ; 05D9 _ 8B. 45, E8
        mov     dword [esp], eax                        ; 05DC _ 89. 04 24
        call    showString                              ; 05DF _ E8, FFFFFFFC(rel)
        mov     eax, dword [mousePos.1511]              ; 05E4 _ A1, 00000018(d)
        add     eax, 32                                 ; 05E9 _ 83. C0, 20
        mov     dword [mousePos.1511], eax              ; 05EC _ A3, 00000018(d)
?_005:  leave                                           ; 05F1 _ C9
        ret                                             ; 05F2 _ C3
                                                        ; show_mouse_info End of function

initBootInfo:                                           ; Function begin
        push    ebp                                     ; 05F3 _ 55
        mov     ebp, esp                                ; 05F4 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 05F6 _ 8B. 45, 08
        mov     dword [eax], 655360                     ; 05F9 _ C7. 00, 000A0000
        mov     eax, dword [ebp+8H]                     ; 05FF _ 8B. 45, 08
                                                        ; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 0602 _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 0608 _ 8B. 45, 08
                                                        ; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 060B _ 66: C7. 40, 06, 00C8
        pop     ebp                                     ; 0611 _ 5D
        ret                                             ; 0612 _ C3
                                                        ; initBootInfo End of function

init_palette:                                           ; Function begin
        push    ebp                                     ; 0613 _ 55
        mov     ebp, esp                                ; 0614 _ 89. E5
        sub     esp, 24                                 ; 0616 _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1518          ; 0619 _ C7. 44 24, 08, 00000020(d)
        mov     dword [esp+4H], 15                      ; 0621 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 0629 _ C7. 04 24, 00000000
        call    set_palette                             ; 0630 _ E8, FFFFFFFC(rel)
        nop                                             ; 0635 _ 90
        leave                                           ; 0636 _ C9
        ret                                             ; 0637 _ C3
                                                        ; init_palette End of function

set_palette:                                            ; Function begin
        push    ebp                                     ; 0638 _ 55
        mov     ebp, esp                                ; 0639 _ 89. E5
        sub     esp, 40                                 ; 063B _ 83. EC, 28
        call    io_load_eflags                          ; 063E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0643 _ 89. 45, F4
        call    io_cli                                  ; 0646 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 064B _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 064E _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 0652 _ C7. 04 24, 000003C8
        call    io_out8                                 ; 0659 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 065E _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 0661 _ 89. 45, F0
        jmp     ?_007                                   ; 0664 _ EB, 62

?_006:  mov     eax, dword [ebp+10H]                    ; 0666 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 0669 _ 0F B6. 00
        shr     al, 2                                   ; 066C _ C0. E8, 02
        movzx   eax, al                                 ; 066F _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0672 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0676 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 067D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0682 _ 8B. 45, 10
        add     eax, 1                                  ; 0685 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 0688 _ 0F B6. 00
        shr     al, 2                                   ; 068B _ C0. E8, 02
        movzx   eax, al                                 ; 068E _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0691 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0695 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 069C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 06A1 _ 8B. 45, 10
        add     eax, 2                                  ; 06A4 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 06A7 _ 0F B6. 00
        shr     al, 2                                   ; 06AA _ C0. E8, 02
        movzx   eax, al                                 ; 06AD _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 06B0 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 06B4 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 06BB _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 06C0 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 06C4 _ 83. 45, F0, 01
?_007:  mov     eax, dword [ebp-10H]                    ; 06C8 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 06CB _ 3B. 45, 0C
        jle     ?_006                                   ; 06CE _ 7E, 96
        mov     eax, dword [ebp-0CH]                    ; 06D0 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 06D3 _ 89. 04 24
        call    io_store_eflags                         ; 06D6 _ E8, FFFFFFFC(rel)
        nop                                             ; 06DB _ 90
        leave                                           ; 06DC _ C9
        ret                                             ; 06DD _ C3
                                                        ; set_palette End of function

showString:                                             ; Function begin
        push    ebp                                     ; 06DE _ 55
        mov     ebp, esp                                ; 06DF _ 89. E5
        sub     esp, 40                                 ; 06E1 _ 83. EC, 28
        mov     eax, dword [ebp+18H]                    ; 06E4 _ 8B. 45, 18
        mov     byte [ebp-0CH], al                      ; 06E7 _ 88. 45, F4
        jmp     ?_009                                   ; 06EA _ EB, 46

?_008:  mov     eax, dword [ebp+1CH]                    ; 06EC _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 06EF _ 0F B6. 00
        movzx   eax, al                                 ; 06F2 _ 0F B6. C0
        shl     eax, 4                                  ; 06F5 _ C1. E0, 04
        lea     edx, [systemFont+eax]                   ; 06F8 _ 8D. 90, 00000000(d)
        movsx   eax, byte [ebp-0CH]                     ; 06FE _ 0F BE. 45, F4
        mov     dword [esp+14H], edx                    ; 0702 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0706 _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 070A _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 070D _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 0711 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 0714 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0718 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 071B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 071F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0722 _ 89. 04 24
        call    showFont8                               ; 0725 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 072A _ 83. 45, 10, 08
        add     dword [ebp+1CH], 1                      ; 072E _ 83. 45, 1C, 01
?_009:  mov     eax, dword [ebp+1CH]                    ; 0732 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 0735 _ 0F B6. 00
        test    al, al                                  ; 0738 _ 84. C0
        jnz     ?_008                                   ; 073A _ 75, B0
        leave                                           ; 073C _ C9
        ret                                             ; 073D _ C3
                                                        ; showString End of function

boxfill8:                                               ; Function begin
        push    ebp                                     ; 073E _ 55
        mov     ebp, esp                                ; 073F _ 89. E5
        sub     esp, 20                                 ; 0741 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0744 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0747 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 074A _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 074D _ 89. 45, FC
        jmp     ?_013                                   ; 0750 _ EB, 33

?_010:  mov     eax, dword [ebp+14H]                    ; 0752 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 0755 _ 89. 45, F8
        jmp     ?_012                                   ; 0758 _ EB, 1F

?_011:  mov     eax, dword [ebp-4H]                     ; 075A _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 075D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0761 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0763 _ 8B. 45, F8
        add     eax, edx                                ; 0766 _ 01. D0
        mov     edx, eax                                ; 0768 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 076A _ 8B. 45, 08
        add     edx, eax                                ; 076D _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 076F _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0773 _ 88. 02
        add     dword [ebp-8H], 1                       ; 0775 _ 83. 45, F8, 01
?_012:  mov     eax, dword [ebp-8H]                     ; 0779 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 077C _ 3B. 45, 1C
        jle     ?_011                                   ; 077F _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0781 _ 83. 45, FC, 01
?_013:  mov     eax, dword [ebp-4H]                     ; 0785 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 0788 _ 3B. 45, 20
        jle     ?_010                                   ; 078B _ 7E, C5
        leave                                           ; 078D _ C9
        ret                                             ; 078E _ C3
                                                        ; boxfill8 End of function

showFont8:                                              ; Function begin
        push    ebp                                     ; 078F _ 55
        mov     ebp, esp                                ; 0790 _ 89. E5
        sub     esp, 20                                 ; 0792 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 0795 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 0798 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 079B _ C7. 45, FC, 00000000
        jmp     ?_023                                   ; 07A2 _ E9, 0000016C

?_014:  mov     edx, dword [ebp-4H]                     ; 07A7 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 07AA _ 8B. 45, 1C
        add     eax, edx                                ; 07AD _ 01. D0
        movzx   eax, byte [eax]                         ; 07AF _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 07B2 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 07B5 _ 80. 7D, FB, 00
        jns     ?_015                                   ; 07B9 _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 07BB _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 07BE _ 8B. 55, 14
        add     eax, edx                                ; 07C1 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 07C3 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 07C7 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 07C9 _ 8B. 45, 10
        add     eax, edx                                ; 07CC _ 01. D0
        mov     edx, eax                                ; 07CE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 07D0 _ 8B. 45, 08
        add     edx, eax                                ; 07D3 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 07D5 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 07D9 _ 88. 02
?_015:  movsx   eax, byte [ebp-5H]                      ; 07DB _ 0F BE. 45, FB
        and     eax, 40H                                ; 07DF _ 83. E0, 40
        test    eax, eax                                ; 07E2 _ 85. C0
        jz      ?_016                                   ; 07E4 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 07E6 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 07E9 _ 8B. 55, 14
        add     eax, edx                                ; 07EC _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 07EE _ 0F AF. 45, 0C
        mov     edx, eax                                ; 07F2 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 07F4 _ 8B. 45, 10
        add     eax, edx                                ; 07F7 _ 01. D0
        lea     edx, [eax+1H]                           ; 07F9 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 07FC _ 8B. 45, 08
        add     edx, eax                                ; 07FF _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0801 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0805 _ 88. 02
?_016:  movsx   eax, byte [ebp-5H]                      ; 0807 _ 0F BE. 45, FB
        and     eax, 20H                                ; 080B _ 83. E0, 20
        test    eax, eax                                ; 080E _ 85. C0
        jz      ?_017                                   ; 0810 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0812 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0815 _ 8B. 55, 14
        add     eax, edx                                ; 0818 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 081A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 081E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0820 _ 8B. 45, 10
        add     eax, edx                                ; 0823 _ 01. D0
        lea     edx, [eax+2H]                           ; 0825 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0828 _ 8B. 45, 08
        add     edx, eax                                ; 082B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 082D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0831 _ 88. 02
?_017:  movsx   eax, byte [ebp-5H]                      ; 0833 _ 0F BE. 45, FB
        and     eax, 10H                                ; 0837 _ 83. E0, 10
        test    eax, eax                                ; 083A _ 85. C0
        jz      ?_018                                   ; 083C _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 083E _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0841 _ 8B. 55, 14
        add     eax, edx                                ; 0844 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0846 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 084A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 084C _ 8B. 45, 10
        add     eax, edx                                ; 084F _ 01. D0
        lea     edx, [eax+3H]                           ; 0851 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 0854 _ 8B. 45, 08
        add     edx, eax                                ; 0857 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0859 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 085D _ 88. 02
?_018:  movsx   eax, byte [ebp-5H]                      ; 085F _ 0F BE. 45, FB
        and     eax, 08H                                ; 0863 _ 83. E0, 08
        test    eax, eax                                ; 0866 _ 85. C0
        jz      ?_019                                   ; 0868 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 086A _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 086D _ 8B. 55, 14
        add     eax, edx                                ; 0870 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0872 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0876 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0878 _ 8B. 45, 10
        add     eax, edx                                ; 087B _ 01. D0
        lea     edx, [eax+4H]                           ; 087D _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0880 _ 8B. 45, 08
        add     edx, eax                                ; 0883 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0885 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0889 _ 88. 02
?_019:  movsx   eax, byte [ebp-5H]                      ; 088B _ 0F BE. 45, FB
        and     eax, 04H                                ; 088F _ 83. E0, 04
        test    eax, eax                                ; 0892 _ 85. C0
        jz      ?_020                                   ; 0894 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0896 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0899 _ 8B. 55, 14
        add     eax, edx                                ; 089C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 089E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08A2 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08A4 _ 8B. 45, 10
        add     eax, edx                                ; 08A7 _ 01. D0
        lea     edx, [eax+5H]                           ; 08A9 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 08AC _ 8B. 45, 08
        add     edx, eax                                ; 08AF _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 08B1 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 08B5 _ 88. 02
?_020:  movsx   eax, byte [ebp-5H]                      ; 08B7 _ 0F BE. 45, FB
        and     eax, 02H                                ; 08BB _ 83. E0, 02
        test    eax, eax                                ; 08BE _ 85. C0
        jz      ?_021                                   ; 08C0 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 08C2 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 08C5 _ 8B. 55, 14
        add     eax, edx                                ; 08C8 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08CA _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08CE _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08D0 _ 8B. 45, 10
        add     eax, edx                                ; 08D3 _ 01. D0
        lea     edx, [eax+6H]                           ; 08D5 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 08D8 _ 8B. 45, 08
        add     edx, eax                                ; 08DB _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 08DD _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 08E1 _ 88. 02
?_021:  movsx   eax, byte [ebp-5H]                      ; 08E3 _ 0F BE. 45, FB
        and     eax, 01H                                ; 08E7 _ 83. E0, 01
        test    eax, eax                                ; 08EA _ 85. C0
        jz      ?_022                                   ; 08EC _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 08EE _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 08F1 _ 8B. 55, 14
        add     eax, edx                                ; 08F4 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08F6 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08FA _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08FC _ 8B. 45, 10
        add     eax, edx                                ; 08FF _ 01. D0
        lea     edx, [eax+7H]                           ; 0901 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 0904 _ 8B. 45, 08
        add     edx, eax                                ; 0907 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0909 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 090D _ 88. 02
?_022:  add     dword [ebp-4H], 1                       ; 090F _ 83. 45, FC, 01
?_023:  cmp     dword [ebp-4H], 15                      ; 0913 _ 83. 7D, FC, 0F
        jle     ?_014                                   ; 0917 _ 0F 8E, FFFFFE8A
        leave                                           ; 091D _ C9
        ret                                             ; 091E _ C3
                                                        ; showFont8 End of function

init_mouse_cursor:                                      ; Function begin
        push    ebp                                     ; 091F _ 55
        mov     ebp, esp                                ; 0920 _ 89. E5
        sub     esp, 20                                 ; 0922 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 0925 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0928 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 092B _ C7. 45, FC, 00000000
        jmp     ?_030                                   ; 0932 _ E9, 000000B1

?_024:  mov     dword [ebp-8H], 0                       ; 0937 _ C7. 45, F8, 00000000
        jmp     ?_029                                   ; 093E _ E9, 00000097

?_025:  mov     eax, dword [ebp-4H]                     ; 0943 _ 8B. 45, FC
        shl     eax, 4                                  ; 0946 _ C1. E0, 04
        mov     edx, eax                                ; 0949 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 094B _ 8B. 45, F8
        add     eax, edx                                ; 094E _ 01. D0
        add     eax, cursor.1576                        ; 0950 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 0955 _ 0F B6. 00
        cmp     al, 42                                  ; 0958 _ 3C, 2A
        jnz     ?_026                                   ; 095A _ 75, 17
        mov     eax, dword [ebp-4H]                     ; 095C _ 8B. 45, FC
        shl     eax, 4                                  ; 095F _ C1. E0, 04
        mov     edx, eax                                ; 0962 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0964 _ 8B. 45, F8
        add     eax, edx                                ; 0967 _ 01. D0
        mov     edx, eax                                ; 0969 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 096B _ 8B. 45, 08
        add     eax, edx                                ; 096E _ 01. D0
        mov     byte [eax], 0                           ; 0970 _ C6. 00, 00
?_026:  mov     eax, dword [ebp-4H]                     ; 0973 _ 8B. 45, FC
        shl     eax, 4                                  ; 0976 _ C1. E0, 04
        mov     edx, eax                                ; 0979 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 097B _ 8B. 45, F8
        add     eax, edx                                ; 097E _ 01. D0
        add     eax, cursor.1576                        ; 0980 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 0985 _ 0F B6. 00
        cmp     al, 79                                  ; 0988 _ 3C, 4F
        jnz     ?_027                                   ; 098A _ 75, 17
        mov     eax, dword [ebp-4H]                     ; 098C _ 8B. 45, FC
        shl     eax, 4                                  ; 098F _ C1. E0, 04
        mov     edx, eax                                ; 0992 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0994 _ 8B. 45, F8
        add     eax, edx                                ; 0997 _ 01. D0
        mov     edx, eax                                ; 0999 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 099B _ 8B. 45, 08
        add     eax, edx                                ; 099E _ 01. D0
        mov     byte [eax], 7                           ; 09A0 _ C6. 00, 07
?_027:  mov     eax, dword [ebp-4H]                     ; 09A3 _ 8B. 45, FC
        shl     eax, 4                                  ; 09A6 _ C1. E0, 04
        mov     edx, eax                                ; 09A9 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 09AB _ 8B. 45, F8
        add     eax, edx                                ; 09AE _ 01. D0
        add     eax, cursor.1576                        ; 09B0 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 09B5 _ 0F B6. 00
        cmp     al, 46                                  ; 09B8 _ 3C, 2E
        jnz     ?_028                                   ; 09BA _ 75, 1A
        mov     eax, dword [ebp-4H]                     ; 09BC _ 8B. 45, FC
        shl     eax, 4                                  ; 09BF _ C1. E0, 04
        mov     edx, eax                                ; 09C2 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 09C4 _ 8B. 45, F8
        add     eax, edx                                ; 09C7 _ 01. D0
        mov     edx, eax                                ; 09C9 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 09CB _ 8B. 45, 08
        add     edx, eax                                ; 09CE _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 09D0 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 09D4 _ 88. 02
?_028:  add     dword [ebp-8H], 1                       ; 09D6 _ 83. 45, F8, 01
?_029:  cmp     dword [ebp-8H], 15                      ; 09DA _ 83. 7D, F8, 0F
        jle     ?_025                                   ; 09DE _ 0F 8E, FFFFFF5F
        add     dword [ebp-4H], 1                       ; 09E4 _ 83. 45, FC, 01
?_030:  cmp     dword [ebp-4H], 15                      ; 09E8 _ 83. 7D, FC, 0F
        jle     ?_024                                   ; 09EC _ 0F 8E, FFFFFF45
        leave                                           ; 09F2 _ C9
        ret                                             ; 09F3 _ C3
                                                        ; init_mouse_cursor End of function

putblock:                                               ; Function begin
        push    ebp                                     ; 09F4 _ 55
        mov     ebp, esp                                ; 09F5 _ 89. E5
        sub     esp, 16                                 ; 09F7 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 09FA _ C7. 45, FC, 00000000
        jmp     ?_034                                   ; 0A01 _ EB, 50

?_031:  mov     dword [ebp-8H], 0                       ; 0A03 _ C7. 45, F8, 00000000
        jmp     ?_033                                   ; 0A0A _ EB, 3B

?_032:  mov     eax, dword [ebp-4H]                     ; 0A0C _ 8B. 45, FC
        mov     edx, dword [ebp+1CH]                    ; 0A0F _ 8B. 55, 1C
        add     eax, edx                                ; 0A12 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0A14 _ 0F AF. 45, 0C
        mov     edx, dword [ebp-8H]                     ; 0A18 _ 8B. 55, F8
        mov     ecx, dword [ebp+18H]                    ; 0A1B _ 8B. 4D, 18
        add     edx, ecx                                ; 0A1E _ 01. CA
        add     eax, edx                                ; 0A20 _ 01. D0
        mov     edx, eax                                ; 0A22 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A24 _ 8B. 45, 08
        add     edx, eax                                ; 0A27 _ 01. C2
        mov     eax, dword [ebp-4H]                     ; 0A29 _ 8B. 45, FC
        imul    eax, dword [ebp+24H]                    ; 0A2C _ 0F AF. 45, 24
        mov     ecx, eax                                ; 0A30 _ 89. C1
        mov     eax, dword [ebp-8H]                     ; 0A32 _ 8B. 45, F8
        add     eax, ecx                                ; 0A35 _ 01. C8
        mov     ecx, eax                                ; 0A37 _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 0A39 _ 8B. 45, 20
        add     eax, ecx                                ; 0A3C _ 01. C8
        movzx   eax, byte [eax]                         ; 0A3E _ 0F B6. 00
        mov     byte [edx], al                          ; 0A41 _ 88. 02
        add     dword [ebp-8H], 1                       ; 0A43 _ 83. 45, F8, 01
?_033:  mov     eax, dword [ebp-8H]                     ; 0A47 _ 8B. 45, F8
        cmp     eax, dword [ebp+10H]                    ; 0A4A _ 3B. 45, 10
        jl      ?_032                                   ; 0A4D _ 7C, BD
        add     dword [ebp-4H], 1                       ; 0A4F _ 83. 45, FC, 01
?_034:  mov     eax, dword [ebp-4H]                     ; 0A53 _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 0A56 _ 3B. 45, 14
        jl      ?_031                                   ; 0A59 _ 7C, A8
        leave                                           ; 0A5B _ C9
        ret                                             ; 0A5C _ C3
                                                        ; putblock End of function

intHandlerFromC:                                        ; Function begin
        push    ebp                                     ; 0A5D _ 55
        mov     ebp, esp                                ; 0A5E _ 89. E5
        sub     esp, 40                                 ; 0A60 _ 83. EC, 28
        mov     eax, dword [bootInfo]                   ; 0A63 _ A1, 00000120(d)
        mov     dword [ebp-14H], eax                    ; 0A68 _ 89. 45, EC
        movzx   eax, word [?_054]                       ; 0A6B _ 0F B7. 05, 00000124(d)
        cwde                                            ; 0A72 _ 98
        mov     dword [ebp-10H], eax                    ; 0A73 _ 89. 45, F0
        movzx   eax, word [?_055]                       ; 0A76 _ 0F B7. 05, 00000126(d)
        cwde                                            ; 0A7D _ 98
        mov     dword [ebp-0CH], eax                    ; 0A7E _ 89. 45, F4
        mov     dword [esp+4H], 32                      ; 0A81 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 0A89 _ C7. 04 24, 00000020
        call    io_out8                                 ; 0A90 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-15H], 0                       ; 0A95 _ C6. 45, EB, 00
        mov     dword [esp], 96                         ; 0A99 _ C7. 04 24, 00000060
        call    io_in8                                  ; 0AA0 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-15H], al                      ; 0AA5 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 0AA8 _ 0F B6. 45, EB
        mov     dword [esp+4H], eax                     ; 0AAC _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 0AB0 _ C7. 04 24, 000001E0(d)
        call    fifo8_put                               ; 0AB7 _ E8, FFFFFFFC(rel)
        nop                                             ; 0ABC _ 90
        leave                                           ; 0ABD _ C9
        ret                                             ; 0ABE _ C3
                                                        ; intHandlerFromC End of function

charToHexVal:                                           ; Function begin
        push    ebp                                     ; 0ABF _ 55
        mov     ebp, esp                                ; 0AC0 _ 89. E5
        sub     esp, 4                                  ; 0AC2 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 0AC5 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 0AC8 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 0ACB _ 80. 7D, FC, 09
        jle     ?_035                                   ; 0ACF _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 0AD1 _ 0F B6. 45, FC
        add     eax, 55                                 ; 0AD5 _ 83. C0, 37
        jmp     ?_036                                   ; 0AD8 _ EB, 07

?_035:  movzx   eax, byte [ebp-4H]                      ; 0ADA _ 0F B6. 45, FC
        add     eax, 48                                 ; 0ADE _ 83. C0, 30
?_036:  leave                                           ; 0AE1 _ C9
        ret                                             ; 0AE2 _ C3
                                                        ; charToHexVal End of function

charToHexStr:                                           ; Function begin
        push    ebp                                     ; 0AE3 _ 55
        mov     ebp, esp                                ; 0AE4 _ 89. E5
        sub     esp, 24                                 ; 0AE6 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 0AE9 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 0AEC _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0AEF _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 0AF6 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 0AFA _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 0AFD _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 0B00 _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 0B04 _ 89. 04 24
        call    charToHexVal                            ; 0B07 _ E8, FFFFFFFC(rel)
        mov     byte [?_053], al                        ; 0B0C _ A2, 00000013(d)
        movzx   eax, byte [ebp-14H]                     ; 0B11 _ 0F B6. 45, EC
        shr     al, 4                                   ; 0B15 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 0B18 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 0B1B _ 0F B6. 45, EC
        movsx   eax, al                                 ; 0B1F _ 0F BE. C0
        mov     dword [esp], eax                        ; 0B22 _ 89. 04 24
        call    charToHexVal                            ; 0B25 _ E8, FFFFFFFC(rel)
        mov     byte [?_052], al                        ; 0B2A _ A2, 00000012(d)
        mov     eax, keyval                             ; 0B2F _ B8, 00000010(d)
        leave                                           ; 0B34 _ C9
        ret                                             ; 0B35 _ C3
                                                        ; charToHexStr End of function

intToHexStr:                                            ; Function begin
        push    ebp                                     ; 0B36 _ 55
        mov     ebp, esp                                ; 0B37 _ 89. E5
        sub     esp, 16                                 ; 0B39 _ 83. EC, 10
        mov     byte [str.1624], 48                     ; 0B3C _ C6. 05, 00000210(d), 30
        mov     byte [?_056], 88                        ; 0B43 _ C6. 05, 00000211(d), 58
        mov     byte [?_057], 0                         ; 0B4A _ C6. 05, 0000021A(d), 00
        mov     dword [ebp-0CH], 2                      ; 0B51 _ C7. 45, F4, 00000002
        jmp     ?_038                                   ; 0B58 _ EB, 0F

?_037:  mov     eax, dword [ebp-0CH]                    ; 0B5A _ 8B. 45, F4
        add     eax, str.1624                           ; 0B5D _ 05, 00000210(d)
        mov     byte [eax], 48                          ; 0B62 _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 0B65 _ 83. 45, F4, 01
?_038:  cmp     dword [ebp-0CH], 9                      ; 0B69 _ 83. 7D, F4, 09
        jle     ?_037                                   ; 0B6D _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 0B6F _ C7. 45, F8, 00000009
        jmp     ?_041                                   ; 0B76 _ EB, 3C

?_039:  mov     eax, dword [ebp+8H]                     ; 0B78 _ 8B. 45, 08
        and     eax, 0FH                                ; 0B7B _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 0B7E _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0B81 _ 8B. 45, 08
        shr     eax, 4                                  ; 0B84 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 0B87 _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 0B8A _ 83. 7D, FC, 09
        jle     ?_040                                   ; 0B8E _ 7E, 13
        mov     eax, dword [ebp-4H]                     ; 0B90 _ 8B. 45, FC
        add     eax, 55                                 ; 0B93 _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 0B96 _ 8B. 55, F8
        add     edx, str.1624                           ; 0B99 _ 81. C2, 00000210(d)
        mov     byte [edx], al                          ; 0B9F _ 88. 02
        jmp     ?_041                                   ; 0BA1 _ EB, 11

?_040:  mov     eax, dword [ebp-4H]                     ; 0BA3 _ 8B. 45, FC
        add     eax, 48                                 ; 0BA6 _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 0BA9 _ 8B. 55, F8
        add     edx, str.1624                           ; 0BAC _ 81. C2, 00000210(d)
        mov     byte [edx], al                          ; 0BB2 _ 88. 02
?_041:  cmp     dword [ebp-8H], 1                       ; 0BB4 _ 83. 7D, F8, 01
        jle     ?_042                                   ; 0BB8 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 0BBA _ 83. 7D, 08, 00
        jnz     ?_039                                   ; 0BBE _ 75, B8
?_042:  mov     eax, str.1624                           ; 0BC0 _ B8, 00000210(d)
        leave                                           ; 0BC5 _ C9
        ret                                             ; 0BC6 _ C3
                                                        ; intToHexStr End of function

wait_KBC_sendready:                                     ; Function begin
        push    ebp                                     ; 0BC7 _ 55
        mov     ebp, esp                                ; 0BC8 _ 89. E5
        sub     esp, 24                                 ; 0BCA _ 83. EC, 18
?_043:  mov     dword [esp], 100                        ; 0BCD _ C7. 04 24, 00000064
        call    io_in8                                  ; 0BD4 _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 0BD9 _ 83. E0, 02
        test    eax, eax                                ; 0BDC _ 85. C0
        jnz     ?_044                                   ; 0BDE _ 75, 02
        jmp     ?_045                                   ; 0BE0 _ EB, 02

?_044:  jmp     ?_043                                   ; 0BE2 _ EB, E9

?_045:  leave                                           ; 0BE4 _ C9
        ret                                             ; 0BE5 _ C3
                                                        ; wait_KBC_sendready End of function

init_keyboard:                                          ; Function begin
        push    ebp                                     ; 0BE6 _ 55
        mov     ebp, esp                                ; 0BE7 _ 89. E5
        sub     esp, 24                                 ; 0BE9 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 0BEC _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 0BF1 _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 0BF9 _ C7. 04 24, 00000064
        call    io_out8                                 ; 0C00 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 0C05 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 0C0A _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 0C12 _ C7. 04 24, 00000060
        call    io_out8                                 ; 0C19 _ E8, FFFFFFFC(rel)
        nop                                             ; 0C1E _ 90
        leave                                           ; 0C1F _ C9
        ret                                             ; 0C20 _ C3
                                                        ; init_keyboard End of function

enable_mouse:                                           ; Function begin
        push    ebp                                     ; 0C21 _ 55
        mov     ebp, esp                                ; 0C22 _ 89. E5
        sub     esp, 24                                 ; 0C24 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 0C27 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 0C2C _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 0C34 _ C7. 04 24, 00000064
        call    io_out8                                 ; 0C3B _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 0C40 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 0C45 _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 0C4D _ C7. 04 24, 00000060
        call    io_out8                                 ; 0C54 _ E8, FFFFFFFC(rel)
        nop                                             ; 0C59 _ 90
        leave                                           ; 0C5A _ C9
        ret                                             ; 0C5B _ C3
                                                        ; enable_mouse End of function

intHandlerForMouse:                                     ; Function begin
        push    ebp                                     ; 0C5C _ 55
        mov     ebp, esp                                ; 0C5D _ 89. E5
        sub     esp, 40                                 ; 0C5F _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 0C62 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 0C6A _ C7. 04 24, 000000A0
        call    io_out8                                 ; 0C71 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 0C76 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 0C7E _ C7. 04 24, 00000020
        call    io_out8                                 ; 0C85 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 0C8A _ C7. 04 24, 00000060
        call    io_in8                                  ; 0C91 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 0C96 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0C99 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 0C9D _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 0CA1 _ C7. 04 24, 000001F8(d)
        call    fifo8_put                               ; 0CA8 _ E8, FFFFFFFC(rel)
        leave                                           ; 0CAD _ C9
        ret                                             ; 0CAE _ C3
                                                        ; intHandlerForMouse End of function

fifo8_init:                                             ; Function begin
        push    ebp                                     ; 0CAF _ 55
        mov     ebp, esp                                ; 0CB0 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0CB2 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0CB5 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 0CB8 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0CBB _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 0CBE _ 8B. 55, 10
        mov     dword [eax], edx                        ; 0CC1 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0CC3 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0CC6 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 0CC9 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0CCC _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0CCF _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 0CD6 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0CD9 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 0CE0 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0CE3 _ C7. 40, 08, 00000000
        nop                                             ; 0CEA _ 90
        pop     ebp                                     ; 0CEB _ 5D
        ret                                             ; 0CEC _ C3
                                                        ; fifo8_init End of function

fifo8_put:                                              ; Function begin
        push    ebp                                     ; 0CED _ 55
        mov     ebp, esp                                ; 0CEE _ 89. E5
        sub     esp, 4                                  ; 0CF0 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0CF3 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0CF6 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0CF9 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0CFC _ 8B. 40, 10
        test    eax, eax                                ; 0CFF _ 85. C0
        jnz     ?_046                                   ; 0D01 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 0D03 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 0D06 _ 8B. 40, 14
        or      eax, 01H                                ; 0D09 _ 83. C8, 01
        mov     edx, eax                                ; 0D0C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0D0E _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 0D11 _ 89. 50, 14
        mov     eax, 4294967295                         ; 0D14 _ B8, FFFFFFFF
        jmp     ?_048                                   ; 0D19 _ EB, 50

?_046:  mov     eax, dword [ebp+8H]                     ; 0D1B _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0D1E _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0D20 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0D23 _ 8B. 40, 04
        add     edx, eax                                ; 0D26 _ 01. C2
        movzx   eax, byte [ebp-4H]                      ; 0D28 _ 0F B6. 45, FC
        mov     byte [edx], al                          ; 0D2C _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 0D2E _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0D31 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 0D34 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0D37 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0D3A _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0D3D _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0D40 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0D43 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0D46 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0D49 _ 39. C2
        jnz     ?_047                                   ; 0D4B _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0D4D _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0D50 _ C7. 40, 04, 00000000
?_047:  mov     eax, dword [ebp+8H]                     ; 0D57 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0D5A _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 0D5D _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 0D60 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0D63 _ 89. 50, 10
        mov     eax, 0                                  ; 0D66 _ B8, 00000000
?_048:  leave                                           ; 0D6B _ C9
        ret                                             ; 0D6C _ C3
                                                        ; fifo8_put End of function

fifo8_get:                                              ; Function begin
        push    ebp                                     ; 0D6D _ 55
        mov     ebp, esp                                ; 0D6E _ 89. E5
        sub     esp, 16                                 ; 0D70 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 0D73 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 0D76 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0D79 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0D7C _ 8B. 40, 0C
        cmp     edx, eax                                ; 0D7F _ 39. C2
        jnz     ?_049                                   ; 0D81 _ 75, 07
        mov     eax, 4294967295                         ; 0D83 _ B8, FFFFFFFF
        jmp     ?_051                                   ; 0D88 _ EB, 51

?_049:  mov     eax, dword [ebp+8H]                     ; 0D8A _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0D8D _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0D8F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0D92 _ 8B. 40, 08
        add     eax, edx                                ; 0D95 _ 01. D0
        movzx   eax, byte [eax]                         ; 0D97 _ 0F B6. 00
        movzx   eax, al                                 ; 0D9A _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 0D9D _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0DA0 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0DA3 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 0DA6 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0DA9 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0DAC _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0DAF _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0DB2 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0DB5 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0DB8 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0DBB _ 39. C2
        jnz     ?_050                                   ; 0DBD _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0DBF _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0DC2 _ C7. 40, 08, 00000000
?_050:  mov     eax, dword [ebp+8H]                     ; 0DC9 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0DCC _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 0DCF _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0DD2 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0DD5 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 0DD8 _ 8B. 45, FC
?_051:  leave                                           ; 0DDB _ C9
        ret                                             ; 0DDC _ C3
                                                        ; fifo8_get End of function

fifo8_status:                                           ; Function begin
        push    ebp                                     ; 0DDD _ 55
        mov     ebp, esp                                ; 0DDE _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0DE0 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 0DE3 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0DE6 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0DE9 _ 8B. 40, 10
        sub     edx, eax                                ; 0DEC _ 29. C2
        mov     eax, edx                                ; 0DEE _ 89. D0
        pop     ebp                                     ; 0DF0 _ 5D
        ret                                             ; 0DF1 _ C3
                                                        ; fifo8_status End of function

showMemoryInfo:                                         ; Function begin
        push    ebp                                     ; 0DF2 _ 55
        mov     ebp, esp                                ; 0DF3 _ 89. E5
        sub     esp, 88                                 ; 0DF5 _ 83. EC, 58
        mov     dword [ebp-30H], 0                      ; 0DF8 _ C7. 45, D0, 00000000
        mov     dword [ebp-2CH], 0                      ; 0DFF _ C7. 45, D4, 00000000
        mov     dword [ebp-28H], 104                    ; 0E06 _ C7. 45, D8, 00000068
        mov     dword [ebp-24H], 80                     ; 0E0D _ C7. 45, DC, 00000050
        mov     dword [esp+18H], 100                    ; 0E14 _ C7. 44 24, 18, 00000064
        mov     eax, dword [ebp+14H]                    ; 0E1C _ 8B. 45, 14
        mov     dword [esp+14H], eax                    ; 0E1F _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 0E23 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 0E2B _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 14                      ; 0E33 _ C7. 44 24, 08, 0000000E
        mov     eax, dword [ebp+14H]                    ; 0E3B _ 8B. 45, 14
        mov     dword [esp+4H], eax                     ; 0E3E _ 89. 44 24, 04
        mov     eax, dword [ebp+0CH]                    ; 0E42 _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 0E45 _ 89. 04 24
        call    boxfill8                                ; 0E48 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+18H]                    ; 0E4D _ 8B. 45, 18
        movsx   eax, al                                 ; 0E50 _ 0F BE. C0
        mov     dword [esp+14H], ?_058                  ; 0E53 _ C7. 44 24, 14, 00000000(d)
        mov     dword [esp+10H], eax                    ; 0E5B _ 89. 44 24, 10
        mov     eax, dword [ebp-2CH]                    ; 0E5F _ 8B. 45, D4
        mov     dword [esp+0CH], eax                    ; 0E62 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 0E66 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 0E69 _ 89. 44 24, 08
        mov     eax, dword [ebp+14H]                    ; 0E6D _ 8B. 45, 14
        mov     dword [esp+4H], eax                     ; 0E70 _ 89. 44 24, 04
        mov     eax, dword [ebp+0CH]                    ; 0E74 _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 0E77 _ 89. 04 24
        call    showString                              ; 0E7A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0E7F _ 8B. 45, 10
        mov     dword [esp], eax                        ; 0E82 _ 89. 04 24
        call    intToHexStr                             ; 0E85 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 0E8A _ 89. 45, E0
        mov     eax, dword [ebp+18H]                    ; 0E8D _ 8B. 45, 18
        movsx   eax, al                                 ; 0E90 _ 0F BE. C0
        mov     edx, dword [ebp-20H]                    ; 0E93 _ 8B. 55, E0
        mov     dword [esp+14H], edx                    ; 0E96 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0E9A _ 89. 44 24, 10
        mov     eax, dword [ebp-2CH]                    ; 0E9E _ 8B. 45, D4
        mov     dword [esp+0CH], eax                    ; 0EA1 _ 89. 44 24, 0C
        mov     eax, dword [ebp-28H]                    ; 0EA5 _ 8B. 45, D8
        mov     dword [esp+8H], eax                     ; 0EA8 _ 89. 44 24, 08
        mov     eax, dword [ebp+14H]                    ; 0EAC _ 8B. 45, 14
        mov     dword [esp+4H], eax                     ; 0EAF _ 89. 44 24, 04
        mov     eax, dword [ebp+0CH]                    ; 0EB3 _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 0EB6 _ 89. 04 24
        call    showString                              ; 0EB9 _ E8, FFFFFFFC(rel)
        add     dword [ebp-2CH], 16                     ; 0EBE _ 83. 45, D4, 10
        mov     eax, dword [ebp+18H]                    ; 0EC2 _ 8B. 45, 18
        movsx   eax, al                                 ; 0EC5 _ 0F BE. C0
        mov     dword [esp+14H], ?_059                  ; 0EC8 _ C7. 44 24, 14, 0000000A(d)
        mov     dword [esp+10H], eax                    ; 0ED0 _ 89. 44 24, 10
        mov     eax, dword [ebp-2CH]                    ; 0ED4 _ 8B. 45, D4
        mov     dword [esp+0CH], eax                    ; 0ED7 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 0EDB _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 0EDE _ 89. 44 24, 08
        mov     eax, dword [ebp+14H]                    ; 0EE2 _ 8B. 45, 14
        mov     dword [esp+4H], eax                     ; 0EE5 _ 89. 44 24, 04
        mov     eax, dword [ebp+0CH]                    ; 0EE9 _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 0EEC _ 89. 04 24
        call    showString                              ; 0EEF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0EF4 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 0EF7 _ 8B. 00
        mov     dword [esp], eax                        ; 0EF9 _ 89. 04 24
        call    intToHexStr                             ; 0EFC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 0F01 _ 89. 45, E4
        mov     eax, dword [ebp+18H]                    ; 0F04 _ 8B. 45, 18
        movsx   eax, al                                 ; 0F07 _ 0F BE. C0
        mov     edx, dword [ebp-1CH]                    ; 0F0A _ 8B. 55, E4
        mov     dword [esp+14H], edx                    ; 0F0D _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0F11 _ 89. 44 24, 10
        mov     eax, dword [ebp-2CH]                    ; 0F15 _ 8B. 45, D4
        mov     dword [esp+0CH], eax                    ; 0F18 _ 89. 44 24, 0C
        mov     eax, dword [ebp-28H]                    ; 0F1C _ 8B. 45, D8
        mov     dword [esp+8H], eax                     ; 0F1F _ 89. 44 24, 08
        mov     eax, dword [ebp+14H]                    ; 0F23 _ 8B. 45, 14
        mov     dword [esp+4H], eax                     ; 0F26 _ 89. 44 24, 04
        mov     eax, dword [ebp+0CH]                    ; 0F2A _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 0F2D _ 89. 04 24
        call    showString                              ; 0F30 _ E8, FFFFFFFC(rel)
        add     dword [ebp-2CH], 16                     ; 0F35 _ 83. 45, D4, 10
        mov     eax, dword [ebp+18H]                    ; 0F39 _ 8B. 45, 18
        movsx   eax, al                                 ; 0F3C _ 0F BE. C0
        mov     dword [esp+14H], ?_060                  ; 0F3F _ C7. 44 24, 14, 00000016(d)
        mov     dword [esp+10H], eax                    ; 0F47 _ 89. 44 24, 10
        mov     eax, dword [ebp-2CH]                    ; 0F4B _ 8B. 45, D4
        mov     dword [esp+0CH], eax                    ; 0F4E _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 0F52 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 0F55 _ 89. 44 24, 08
        mov     eax, dword [ebp+14H]                    ; 0F59 _ 8B. 45, 14
        mov     dword [esp+4H], eax                     ; 0F5C _ 89. 44 24, 04
        mov     eax, dword [ebp+0CH]                    ; 0F60 _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 0F63 _ 89. 04 24
        call    showString                              ; 0F66 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0F6B _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0F6E _ 8B. 40, 04
        mov     dword [esp], eax                        ; 0F71 _ 89. 04 24
        call    intToHexStr                             ; 0F74 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0F79 _ 89. 45, E8
        mov     eax, dword [ebp+18H]                    ; 0F7C _ 8B. 45, 18
        movsx   eax, al                                 ; 0F7F _ 0F BE. C0
        mov     edx, dword [ebp-18H]                    ; 0F82 _ 8B. 55, E8
        mov     dword [esp+14H], edx                    ; 0F85 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0F89 _ 89. 44 24, 10
        mov     eax, dword [ebp-2CH]                    ; 0F8D _ 8B. 45, D4
        mov     dword [esp+0CH], eax                    ; 0F90 _ 89. 44 24, 0C
        mov     eax, dword [ebp-28H]                    ; 0F94 _ 8B. 45, D8
        mov     dword [esp+8H], eax                     ; 0F97 _ 89. 44 24, 08
        mov     eax, dword [ebp+14H]                    ; 0F9B _ 8B. 45, 14
        mov     dword [esp+4H], eax                     ; 0F9E _ 89. 44 24, 04
        mov     eax, dword [ebp+0CH]                    ; 0FA2 _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 0FA5 _ 89. 04 24
        call    showString                              ; 0FA8 _ E8, FFFFFFFC(rel)
        add     dword [ebp-2CH], 16                     ; 0FAD _ 83. 45, D4, 10
        mov     eax, dword [ebp+18H]                    ; 0FB1 _ 8B. 45, 18
        movsx   eax, al                                 ; 0FB4 _ 0F BE. C0
        mov     dword [esp+14H], ?_061                  ; 0FB7 _ C7. 44 24, 14, 00000022(d)
        mov     dword [esp+10H], eax                    ; 0FBF _ 89. 44 24, 10
        mov     eax, dword [ebp-2CH]                    ; 0FC3 _ 8B. 45, D4
        mov     dword [esp+0CH], eax                    ; 0FC6 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 0FCA _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 0FCD _ 89. 44 24, 08
        mov     eax, dword [ebp+14H]                    ; 0FD1 _ 8B. 45, 14
        mov     dword [esp+4H], eax                     ; 0FD4 _ 89. 44 24, 04
        mov     eax, dword [ebp+0CH]                    ; 0FD8 _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 0FDB _ 89. 04 24
        call    showString                              ; 0FDE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0FE3 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0FE6 _ 8B. 40, 08
        mov     dword [esp], eax                        ; 0FE9 _ 89. 04 24
        call    intToHexStr                             ; 0FEC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0FF1 _ 89. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0FF4 _ 8B. 45, 18
        movsx   eax, al                                 ; 0FF7 _ 0F BE. C0
        mov     edx, dword [ebp-14H]                    ; 0FFA _ 8B. 55, EC
        mov     dword [esp+14H], edx                    ; 0FFD _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 1001 _ 89. 44 24, 10
        mov     eax, dword [ebp-2CH]                    ; 1005 _ 8B. 45, D4
        mov     dword [esp+0CH], eax                    ; 1008 _ 89. 44 24, 0C
        mov     eax, dword [ebp-28H]                    ; 100C _ 8B. 45, D8
        mov     dword [esp+8H], eax                     ; 100F _ 89. 44 24, 08
        mov     eax, dword [ebp+14H]                    ; 1013 _ 8B. 45, 14
        mov     dword [esp+4H], eax                     ; 1016 _ 89. 44 24, 04
        mov     eax, dword [ebp+0CH]                    ; 101A _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 101D _ 89. 04 24
        call    showString                              ; 1020 _ E8, FFFFFFFC(rel)
        add     dword [ebp-2CH], 16                     ; 1025 _ 83. 45, D4, 10
        mov     eax, dword [ebp+18H]                    ; 1029 _ 8B. 45, 18
        movsx   eax, al                                 ; 102C _ 0F BE. C0
        mov     dword [esp+14H], ?_062                  ; 102F _ C7. 44 24, 14, 0000002E(d)
        mov     dword [esp+10H], eax                    ; 1037 _ 89. 44 24, 10
        mov     eax, dword [ebp-2CH]                    ; 103B _ 8B. 45, D4
        mov     dword [esp+0CH], eax                    ; 103E _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1042 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1045 _ 89. 44 24, 08
        mov     eax, dword [ebp+14H]                    ; 1049 _ 8B. 45, 14
        mov     dword [esp+4H], eax                     ; 104C _ 89. 44 24, 04
        mov     eax, dword [ebp+0CH]                    ; 1050 _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 1053 _ 89. 04 24
        call    showString                              ; 1056 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 105B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 105E _ 8B. 40, 0C
        mov     dword [esp], eax                        ; 1061 _ 89. 04 24
        call    intToHexStr                             ; 1064 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1069 _ 89. 45, F0
        mov     eax, dword [ebp+18H]                    ; 106C _ 8B. 45, 18
        movsx   eax, al                                 ; 106F _ 0F BE. C0
        mov     edx, dword [ebp-10H]                    ; 1072 _ 8B. 55, F0
        mov     dword [esp+14H], edx                    ; 1075 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 1079 _ 89. 44 24, 10
        mov     eax, dword [ebp-2CH]                    ; 107D _ 8B. 45, D4
        mov     dword [esp+0CH], eax                    ; 1080 _ 89. 44 24, 0C
        mov     eax, dword [ebp-28H]                    ; 1084 _ 8B. 45, D8
        mov     dword [esp+8H], eax                     ; 1087 _ 89. 44 24, 08
        mov     eax, dword [ebp+14H]                    ; 108B _ 8B. 45, 14
        mov     dword [esp+4H], eax                     ; 108E _ 89. 44 24, 04
        mov     eax, dword [ebp+0CH]                    ; 1092 _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 1095 _ 89. 04 24
        call    showString                              ; 1098 _ E8, FFFFFFFC(rel)
        add     dword [ebp-2CH], 16                     ; 109D _ 83. 45, D4, 10
        mov     eax, dword [ebp+18H]                    ; 10A1 _ 8B. 45, 18
        movsx   eax, al                                 ; 10A4 _ 0F BE. C0
        mov     dword [esp+14H], ?_063                  ; 10A7 _ C7. 44 24, 14, 0000003B(d)
        mov     dword [esp+10H], eax                    ; 10AF _ 89. 44 24, 10
        mov     eax, dword [ebp-2CH]                    ; 10B3 _ 8B. 45, D4
        mov     dword [esp+0CH], eax                    ; 10B6 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 10BA _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 10BD _ 89. 44 24, 08
        mov     eax, dword [ebp+14H]                    ; 10C1 _ 8B. 45, 14
        mov     dword [esp+4H], eax                     ; 10C4 _ 89. 44 24, 04
        mov     eax, dword [ebp+0CH]                    ; 10C8 _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 10CB _ 89. 04 24
        call    showString                              ; 10CE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 10D3 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 10D6 _ 8B. 40, 10
        mov     dword [esp], eax                        ; 10D9 _ 89. 04 24
        call    intToHexStr                             ; 10DC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 10E1 _ 89. 45, F4
        mov     eax, dword [ebp+18H]                    ; 10E4 _ 8B. 45, 18
        movsx   eax, al                                 ; 10E7 _ 0F BE. C0
        mov     edx, dword [ebp-0CH]                    ; 10EA _ 8B. 55, F4
        mov     dword [esp+14H], edx                    ; 10ED _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 10F1 _ 89. 44 24, 10
        mov     eax, dword [ebp-2CH]                    ; 10F5 _ 8B. 45, D4
        mov     dword [esp+0CH], eax                    ; 10F8 _ 89. 44 24, 0C
        mov     eax, dword [ebp-28H]                    ; 10FC _ 8B. 45, D8
        mov     dword [esp+8H], eax                     ; 10FF _ 89. 44 24, 08
        mov     eax, dword [ebp+14H]                    ; 1103 _ 8B. 45, 14
        mov     dword [esp+4H], eax                     ; 1106 _ 89. 44 24, 04
        mov     eax, dword [ebp+0CH]                    ; 110A _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 110D _ 89. 04 24
        call    showString                              ; 1110 _ E8, FFFFFFFC(rel)
        leave                                           ; 1115 _ C9
        ret                                             ; 1116 _ C3
                                                        ; showMemoryInfo End of function


                                                        ; SECTION .data   align=32 noexecute                      ; section number 2, data

fontA:                                                  ; oword
        db 00H, 18H, 18H, 18H, 18H, 24H, 24H, 24H       ; 0000 _ .....$$$
        db 24H, 7EH, 42H, 42H, 42H, 0E7H, 00H, 00H      ; 0008 _ $~BBB...

keyval:                                                 ; byte
        db 30H, 58H                                     ; 0010 _ 0X

?_052:  db 00H                                          ; 0012 _ .

?_053:  db 00H, 00H, 00H, 00H, 00H                      ; 0013 _ .....

mousePos.1511:                                          ; dword
        dd 00000010H, 00000000H                         ; 0018 _ 16 0

table_rgb.1518:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0020 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........

cursor.1576:                                            ; byte
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

str.1624:                                               ; byte
        resb    1                                       ; 0210

?_056:  resb    9                                       ; 0211

?_057:  resb    1                                       ; 021A


                                                        ; SECTION .rodata align=1 noexecute                       ; section number 4, const

?_058:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0000 _ page is:
        db 20H, 00H                                     ; 0008 _  .

?_059:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 000A _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0012 _ L: .

?_060:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0016 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 001E _ H: .

?_061:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0022 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 002A _ w: .

?_062:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 002E _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 0036 _ gh: .

?_063:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 003B _ type: .

