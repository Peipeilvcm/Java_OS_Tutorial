; Disassembly of file: write_mouse.o
; Tue Oct 23 10:40:26 2018
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386


; global CMain: function
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
; global wait_KBC_sendready: function
; global init_keyboard: function
; global enable_mouse: function
; global intHandlerForMouse: function

; extern io_hlt                                           ; near
; extern io_in8                                           ; near
; extern systemFont                                       ; byte
; extern io_store_eflags                                  ; near
; extern io_out8                                          ; near
; extern io_load_eflags                                   ; near
; extern io_stihlt                                        ; near
; extern io_cli                                           ; near
; extern io_sti                                           ; near


; SECTION .text   align=1 execute                         ; section number 1, code

CMain:                                                  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    ebx                                     ; 0003 _ 53
        sub     esp, 68                                 ; 0004 _ 83. EC, 44
        mov     dword [esp], bootInfo                   ; 0007 _ C7. 04 24, 00000100(d)
        call    initBootInfo                            ; 000E _ E8, FFFFFFFC(rel)
        mov     eax, dword [bootInfo]                   ; 0013 _ A1, 00000100(d)
        mov     dword [ebp-1CH], eax                    ; 0018 _ 89. 45, E4
        movzx   eax, word [?_041]                       ; 001B _ 0F B7. 05, 00000104(d)
        cwde                                            ; 0022 _ 98
        mov     dword [ebp-18H], eax                    ; 0023 _ 89. 45, E8
        movzx   eax, word [?_042]                       ; 0026 _ 0F B7. 05, 00000106(d)
        cwde                                            ; 002D _ 98
        mov     dword [ebp-14H], eax                    ; 002E _ 89. 45, EC
        call    init_palette                            ; 0031 _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 0036 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 003B _ 8B. 45, EC
        lea     edx, [eax-1DH]                          ; 003E _ 8D. 50, E3
        mov     eax, dword [ebp-18H]                    ; 0041 _ 8B. 45, E8
        sub     eax, 1                                  ; 0044 _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 0047 _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 004B _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 004F _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 0057 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 14                      ; 005F _ C7. 44 24, 08, 0000000E
        mov     eax, dword [ebp-18H]                    ; 0067 _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 006A _ 89. 44 24, 04
        mov     eax, dword [ebp-1CH]                    ; 006E _ 8B. 45, E4
        mov     dword [esp], eax                        ; 0071 _ 89. 04 24
        call    boxfill8                                ; 0074 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 0079 _ 8B. 45, EC
        lea     ecx, [eax-1CH]                          ; 007C _ 8D. 48, E4
        mov     eax, dword [ebp-18H]                    ; 007F _ 8B. 45, E8
        lea     edx, [eax-1H]                           ; 0082 _ 8D. 50, FF
        mov     eax, dword [ebp-14H]                    ; 0085 _ 8B. 45, EC
        sub     eax, 28                                 ; 0088 _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 008B _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 008F _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0093 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0097 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 009F _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp-18H]                    ; 00A7 _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 00AA _ 89. 44 24, 04
        mov     eax, dword [ebp-1CH]                    ; 00AE _ 8B. 45, E4
        mov     dword [esp], eax                        ; 00B1 _ 89. 04 24
        call    boxfill8                                ; 00B4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 00B9 _ 8B. 45, EC
        lea     ecx, [eax-1BH]                          ; 00BC _ 8D. 48, E5
        mov     eax, dword [ebp-18H]                    ; 00BF _ 8B. 45, E8
        lea     edx, [eax-1H]                           ; 00C2 _ 8D. 50, FF
        mov     eax, dword [ebp-14H]                    ; 00C5 _ 8B. 45, EC
        sub     eax, 27                                 ; 00C8 _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 00CB _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 00CF _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 00D3 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 00D7 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 00DF _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp-18H]                    ; 00E7 _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 00EA _ 89. 44 24, 04
        mov     eax, dword [ebp-1CH]                    ; 00EE _ 8B. 45, E4
        mov     dword [esp], eax                        ; 00F1 _ 89. 04 24
        call    boxfill8                                ; 00F4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 00F9 _ 8B. 45, EC
        lea     ecx, [eax-1H]                           ; 00FC _ 8D. 48, FF
        mov     eax, dword [ebp-18H]                    ; 00FF _ 8B. 45, E8
        lea     edx, [eax-1H]                           ; 0102 _ 8D. 50, FF
        mov     eax, dword [ebp-14H]                    ; 0105 _ 8B. 45, EC
        sub     eax, 26                                 ; 0108 _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 010B _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 010F _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0113 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0117 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 011F _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp-18H]                    ; 0127 _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 012A _ 89. 44 24, 04
        mov     eax, dword [ebp-1CH]                    ; 012E _ 8B. 45, E4
        mov     dword [esp], eax                        ; 0131 _ 89. 04 24
        call    boxfill8                                ; 0134 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 0139 _ 8B. 45, EC
        lea     edx, [eax-18H]                          ; 013C _ 8D. 50, E8
        mov     eax, dword [ebp-14H]                    ; 013F _ 8B. 45, EC
        sub     eax, 24                                 ; 0142 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0145 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0149 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0151 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0155 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 015D _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp-18H]                    ; 0165 _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 0168 _ 89. 44 24, 04
        mov     eax, dword [ebp-1CH]                    ; 016C _ 8B. 45, E4
        mov     dword [esp], eax                        ; 016F _ 89. 04 24
        call    boxfill8                                ; 0172 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 0177 _ 8B. 45, EC
        lea     edx, [eax-4H]                           ; 017A _ 8D. 50, FC
        mov     eax, dword [ebp-14H]                    ; 017D _ 8B. 45, EC
        sub     eax, 24                                 ; 0180 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0183 _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 0187 _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 018F _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0193 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 019B _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp-18H]                    ; 01A3 _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 01A6 _ 89. 44 24, 04
        mov     eax, dword [ebp-1CH]                    ; 01AA _ 8B. 45, E4
        mov     dword [esp], eax                        ; 01AD _ 89. 04 24
        call    boxfill8                                ; 01B0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 01B5 _ 8B. 45, EC
        lea     edx, [eax-4H]                           ; 01B8 _ 8D. 50, FC
        mov     eax, dword [ebp-14H]                    ; 01BB _ 8B. 45, EC
        sub     eax, 4                                  ; 01BE _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 01C1 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 01C5 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 01CD _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 01D1 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 15                      ; 01D9 _ C7. 44 24, 08, 0000000F
        mov     eax, dword [ebp-18H]                    ; 01E1 _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 01E4 _ 89. 44 24, 04
        mov     eax, dword [ebp-1CH]                    ; 01E8 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 01EB _ 89. 04 24
        call    boxfill8                                ; 01EE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 01F3 _ 8B. 45, EC
        lea     edx, [eax-5H]                           ; 01F6 _ 8D. 50, FB
        mov     eax, dword [ebp-14H]                    ; 01F9 _ 8B. 45, EC
        sub     eax, 23                                 ; 01FC _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 01FF _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0203 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 020B _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 020F _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 15                      ; 0217 _ C7. 44 24, 08, 0000000F
        mov     eax, dword [ebp-18H]                    ; 021F _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 0222 _ 89. 44 24, 04
        mov     eax, dword [ebp-1CH]                    ; 0226 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 0229 _ 89. 04 24
        call    boxfill8                                ; 022C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 0231 _ 8B. 45, EC
        lea     edx, [eax-3H]                           ; 0234 _ 8D. 50, FD
        mov     eax, dword [ebp-14H]                    ; 0237 _ 8B. 45, EC
        sub     eax, 3                                  ; 023A _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 023D _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0241 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0249 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 024D _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 0255 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-18H]                    ; 025D _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 0260 _ 89. 44 24, 04
        mov     eax, dword [ebp-1CH]                    ; 0264 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 0267 _ 89. 04 24
        call    boxfill8                                ; 026A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 026F _ 8B. 45, EC
        lea     edx, [eax-3H]                           ; 0272 _ 8D. 50, FD
        mov     eax, dword [ebp-14H]                    ; 0275 _ 8B. 45, EC
        sub     eax, 24                                 ; 0278 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 027B _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 027F _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 0287 _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 028B _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 0293 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-18H]                    ; 029B _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 029E _ 89. 44 24, 04
        mov     eax, dword [ebp-1CH]                    ; 02A2 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 02A5 _ 89. 04 24
        call    boxfill8                                ; 02A8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 02AD _ 8B. 45, EC
        lea     ebx, [eax-18H]                          ; 02B0 _ 8D. 58, E8
        mov     eax, dword [ebp-18H]                    ; 02B3 _ 8B. 45, E8
        lea     ecx, [eax-4H]                           ; 02B6 _ 8D. 48, FC
        mov     eax, dword [ebp-14H]                    ; 02B9 _ 8B. 45, EC
        lea     edx, [eax-18H]                          ; 02BC _ 8D. 50, E8
        mov     eax, dword [ebp-18H]                    ; 02BF _ 8B. 45, E8
        sub     eax, 47                                 ; 02C2 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 02C5 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 02C9 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 02CD _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 02D1 _ 89. 44 24, 0C
        mov     dword [esp+8H], 15                      ; 02D5 _ C7. 44 24, 08, 0000000F
        mov     eax, dword [ebp-18H]                    ; 02DD _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 02E0 _ 89. 44 24, 04
        mov     eax, dword [ebp-1CH]                    ; 02E4 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 02E7 _ 89. 04 24
        call    boxfill8                                ; 02EA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 02EF _ 8B. 45, EC
        lea     ebx, [eax-4H]                           ; 02F2 _ 8D. 58, FC
        mov     eax, dword [ebp-18H]                    ; 02F5 _ 8B. 45, E8
        lea     ecx, [eax-2FH]                          ; 02F8 _ 8D. 48, D1
        mov     eax, dword [ebp-14H]                    ; 02FB _ 8B. 45, EC
        lea     edx, [eax-17H]                          ; 02FE _ 8D. 50, E9
        mov     eax, dword [ebp-18H]                    ; 0301 _ 8B. 45, E8
        sub     eax, 47                                 ; 0304 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0307 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 030B _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 030F _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0313 _ 89. 44 24, 0C
        mov     dword [esp+8H], 15                      ; 0317 _ C7. 44 24, 08, 0000000F
        mov     eax, dword [ebp-18H]                    ; 031F _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 0322 _ 89. 44 24, 04
        mov     eax, dword [ebp-1CH]                    ; 0326 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 0329 _ 89. 04 24
        call    boxfill8                                ; 032C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 0331 _ 8B. 45, EC
        lea     ebx, [eax-3H]                           ; 0334 _ 8D. 58, FD
        mov     eax, dword [ebp-18H]                    ; 0337 _ 8B. 45, E8
        lea     ecx, [eax-4H]                           ; 033A _ 8D. 48, FC
        mov     eax, dword [ebp-14H]                    ; 033D _ 8B. 45, EC
        lea     edx, [eax-3H]                           ; 0340 _ 8D. 50, FD
        mov     eax, dword [ebp-18H]                    ; 0343 _ 8B. 45, E8
        sub     eax, 47                                 ; 0346 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0349 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 034D _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0351 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0355 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 0359 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp-18H]                    ; 0361 _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 0364 _ 89. 44 24, 04
        mov     eax, dword [ebp-1CH]                    ; 0368 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 036B _ 89. 04 24
        call    boxfill8                                ; 036E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 0373 _ 8B. 45, EC
        lea     ebx, [eax-3H]                           ; 0376 _ 8D. 58, FD
        mov     eax, dword [ebp-18H]                    ; 0379 _ 8B. 45, E8
        lea     ecx, [eax-3H]                           ; 037C _ 8D. 48, FD
        mov     eax, dword [ebp-14H]                    ; 037F _ 8B. 45, EC
        lea     edx, [eax-18H]                          ; 0382 _ 8D. 50, E8
        mov     eax, dword [ebp-18H]                    ; 0385 _ 8B. 45, E8
        sub     eax, 3                                  ; 0388 _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 038B _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 038F _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0393 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0397 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 039B _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp-18H]                    ; 03A3 _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 03A6 _ 89. 44 24, 04
        mov     eax, dword [ebp-1CH]                    ; 03AA _ 8B. 45, E4
        mov     dword [esp], eax                        ; 03AD _ 89. 04 24
        call    boxfill8                                ; 03B0 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 14                      ; 03B5 _ C7. 44 24, 04, 0000000E
        mov     dword [esp], mcursor                    ; 03BD _ C7. 04 24, 00000000(d)
        call    init_mouse_cursor                       ; 03C4 _ E8, FFFFFFFC(rel)
        mov     dword [esp+1CH], 16                     ; 03C9 _ C7. 44 24, 1C, 00000010
        mov     dword [esp+18H], mcursor                ; 03D1 _ C7. 44 24, 18, 00000000(d)
        mov     dword [esp+14H], 80                     ; 03D9 _ C7. 44 24, 14, 00000050
        mov     dword [esp+10H], 80                     ; 03E1 _ C7. 44 24, 10, 00000050
        mov     dword [esp+0CH], 16                     ; 03E9 _ C7. 44 24, 0C, 00000010
        mov     dword [esp+8H], 16                      ; 03F1 _ C7. 44 24, 08, 00000010
        mov     eax, dword [ebp-18H]                    ; 03F9 _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 03FC _ 89. 44 24, 04
        mov     eax, dword [ebp-1CH]                    ; 0400 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 0403 _ 89. 04 24
        call    putblock                                ; 0406 _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 040B _ E8, FFFFFFFC(rel)
        call    enable_mouse                            ; 0410 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 0                      ; 0415 _ C7. 45, F0, 00000000
?_001:  call    io_cli                                  ; 041C _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_045]                      ; 0421 _ A1, 00000148(d)
        test    eax, eax                                ; 0426 _ 85. C0
        jnz     ?_002                                   ; 0428 _ 75, 07
        call    io_stihlt                               ; 042A _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 042F _ EB, EB

?_002:  mov     eax, dword [?_043]                      ; 0431 _ A1, 00000140(d)
        movzx   eax, byte [keybuf+eax]                  ; 0436 _ 0F B6. 80, 00000120(d)
        movzx   eax, al                                 ; 043D _ 0F B6. C0
        mov     dword [ebp-10H], eax                    ; 0440 _ 89. 45, F0
        mov     eax, dword [?_043]                      ; 0443 _ A1, 00000140(d)
        lea     edx, [eax+1H]                           ; 0448 _ 8D. 50, 01
        mov     eax, edx                                ; 044B _ 89. D0
        sar     eax, 31                                 ; 044D _ C1. F8, 1F
        shr     eax, 27                                 ; 0450 _ C1. E8, 1B
        add     edx, eax                                ; 0453 _ 01. C2
        and     edx, 1FH                                ; 0455 _ 83. E2, 1F
        sub     edx, eax                                ; 0458 _ 29. C2
        mov     eax, edx                                ; 045A _ 89. D0
        mov     dword [?_043], eax                      ; 045C _ A3, 00000140(d)
        call    io_sti                                  ; 0461 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_045]                      ; 0466 _ A1, 00000148(d)
        sub     eax, 1                                  ; 046B _ 83. E8, 01
        mov     dword [?_045], eax                      ; 046E _ A3, 00000148(d)
        mov     eax, dword [ebp-10H]                    ; 0473 _ 8B. 45, F0
        movzx   eax, al                                 ; 0476 _ 0F B6. C0
        mov     dword [esp], eax                        ; 0479 _ 89. 04 24
        call    charToHexStr                            ; 047C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0481 _ 89. 45, F4
        mov     eax, dword [showPos.1460]               ; 0484 _ A1, 0000014C(d)
        mov     edx, dword [ebp-0CH]                    ; 0489 _ 8B. 55, F4
        mov     dword [esp+14H], edx                    ; 048C _ 89. 54 24, 14
        mov     dword [esp+10H], 7                      ; 0490 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 0                      ; 0498 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], eax                     ; 04A0 _ 89. 44 24, 08
        mov     eax, dword [ebp-18H]                    ; 04A4 _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 04A7 _ 89. 44 24, 04
        mov     eax, dword [ebp-1CH]                    ; 04AB _ 8B. 45, E4
        mov     dword [esp], eax                        ; 04AE _ 89. 04 24
        call    showString                              ; 04B1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [showPos.1460]               ; 04B6 _ A1, 0000014C(d)
        add     eax, 32                                 ; 04BB _ 83. C0, 20
        mov     dword [showPos.1460], eax               ; 04BE _ A3, 0000014C(d)
        jmp     ?_001                                   ; 04C3 _ E9, FFFFFF54
                                                        ; CMain End of function

initBootInfo:                                           ; Function begin
        push    ebp                                     ; 04C8 _ 55
        mov     ebp, esp                                ; 04C9 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 04CB _ 8B. 45, 08
        mov     dword [eax], 655360                     ; 04CE _ C7. 00, 000A0000
        mov     eax, dword [ebp+8H]                     ; 04D4 _ 8B. 45, 08
                                                        ; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 04D7 _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 04DD _ 8B. 45, 08
                                                        ; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 04E0 _ 66: C7. 40, 06, 00C8
        pop     ebp                                     ; 04E6 _ 5D
        ret                                             ; 04E7 _ C3
                                                        ; initBootInfo End of function

init_palette:                                           ; Function begin
        push    ebp                                     ; 04E8 _ 55
        mov     ebp, esp                                ; 04E9 _ 89. E5
        sub     esp, 24                                 ; 04EB _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1468          ; 04EE _ C7. 44 24, 08, 00000020(d)
        mov     dword [esp+4H], 15                      ; 04F6 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 04FE _ C7. 04 24, 00000000
        call    set_palette                             ; 0505 _ E8, FFFFFFFC(rel)
        nop                                             ; 050A _ 90
        leave                                           ; 050B _ C9
        ret                                             ; 050C _ C3
                                                        ; init_palette End of function

set_palette:                                            ; Function begin
        push    ebp                                     ; 050D _ 55
        mov     ebp, esp                                ; 050E _ 89. E5
        sub     esp, 40                                 ; 0510 _ 83. EC, 28
        call    io_load_eflags                          ; 0513 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0518 _ 89. 45, F4
        call    io_cli                                  ; 051B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0520 _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 0523 _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 0527 _ C7. 04 24, 000003C8
        call    io_out8                                 ; 052E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0533 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 0536 _ 89. 45, F0
        jmp     ?_004                                   ; 0539 _ EB, 62

?_003:  mov     eax, dword [ebp+10H]                    ; 053B _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 053E _ 0F B6. 00
        shr     al, 2                                   ; 0541 _ C0. E8, 02
        movzx   eax, al                                 ; 0544 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0547 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 054B _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0552 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0557 _ 8B. 45, 10
        add     eax, 1                                  ; 055A _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 055D _ 0F B6. 00
        shr     al, 2                                   ; 0560 _ C0. E8, 02
        movzx   eax, al                                 ; 0563 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0566 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 056A _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0571 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0576 _ 8B. 45, 10
        add     eax, 2                                  ; 0579 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 057C _ 0F B6. 00
        shr     al, 2                                   ; 057F _ C0. E8, 02
        movzx   eax, al                                 ; 0582 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0585 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0589 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0590 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 0595 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 0599 _ 83. 45, F0, 01
?_004:  mov     eax, dword [ebp-10H]                    ; 059D _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 05A0 _ 3B. 45, 0C
        jle     ?_003                                   ; 05A3 _ 7E, 96
        mov     eax, dword [ebp-0CH]                    ; 05A5 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 05A8 _ 89. 04 24
        call    io_store_eflags                         ; 05AB _ E8, FFFFFFFC(rel)
        nop                                             ; 05B0 _ 90
        leave                                           ; 05B1 _ C9
        ret                                             ; 05B2 _ C3
                                                        ; set_palette End of function

showString:                                             ; Function begin
        push    ebp                                     ; 05B3 _ 55
        mov     ebp, esp                                ; 05B4 _ 89. E5
        sub     esp, 40                                 ; 05B6 _ 83. EC, 28
        mov     eax, dword [ebp+18H]                    ; 05B9 _ 8B. 45, 18
        mov     byte [ebp-0CH], al                      ; 05BC _ 88. 45, F4
        jmp     ?_006                                   ; 05BF _ EB, 46

?_005:  mov     eax, dword [ebp+1CH]                    ; 05C1 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 05C4 _ 0F B6. 00
        movzx   eax, al                                 ; 05C7 _ 0F B6. C0
        shl     eax, 4                                  ; 05CA _ C1. E0, 04
        lea     edx, [systemFont+eax]                   ; 05CD _ 8D. 90, 00000000(d)
        movsx   eax, byte [ebp-0CH]                     ; 05D3 _ 0F BE. 45, F4
        mov     dword [esp+14H], edx                    ; 05D7 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 05DB _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 05DF _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 05E2 _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 05E6 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 05E9 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 05ED _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 05F0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 05F4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 05F7 _ 89. 04 24
        call    showFont8                               ; 05FA _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 05FF _ 83. 45, 10, 08
        add     dword [ebp+1CH], 1                      ; 0603 _ 83. 45, 1C, 01
?_006:  mov     eax, dword [ebp+1CH]                    ; 0607 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 060A _ 0F B6. 00
        test    al, al                                  ; 060D _ 84. C0
        jnz     ?_005                                   ; 060F _ 75, B0
        leave                                           ; 0611 _ C9
        ret                                             ; 0612 _ C3
                                                        ; showString End of function

boxfill8:                                               ; Function begin
        push    ebp                                     ; 0613 _ 55
        mov     ebp, esp                                ; 0614 _ 89. E5
        sub     esp, 20                                 ; 0616 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0619 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 061C _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 061F _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 0622 _ 89. 45, FC
        jmp     ?_010                                   ; 0625 _ EB, 33

?_007:  mov     eax, dword [ebp+14H]                    ; 0627 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 062A _ 89. 45, F8
        jmp     ?_009                                   ; 062D _ EB, 1F

?_008:  mov     eax, dword [ebp-4H]                     ; 062F _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 0632 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0636 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0638 _ 8B. 45, F8
        add     eax, edx                                ; 063B _ 01. D0
        mov     edx, eax                                ; 063D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 063F _ 8B. 45, 08
        add     edx, eax                                ; 0642 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0644 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0648 _ 88. 02
        add     dword [ebp-8H], 1                       ; 064A _ 83. 45, F8, 01
?_009:  mov     eax, dword [ebp-8H]                     ; 064E _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0651 _ 3B. 45, 1C
        jle     ?_008                                   ; 0654 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0656 _ 83. 45, FC, 01
?_010:  mov     eax, dword [ebp-4H]                     ; 065A _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 065D _ 3B. 45, 20
        jle     ?_007                                   ; 0660 _ 7E, C5
        leave                                           ; 0662 _ C9
        ret                                             ; 0663 _ C3
                                                        ; boxfill8 End of function

showFont8:                                              ; Function begin
        push    ebp                                     ; 0664 _ 55
        mov     ebp, esp                                ; 0665 _ 89. E5
        sub     esp, 20                                 ; 0667 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 066A _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 066D _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0670 _ C7. 45, FC, 00000000
        jmp     ?_020                                   ; 0677 _ E9, 0000016C

?_011:  mov     edx, dword [ebp-4H]                     ; 067C _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 067F _ 8B. 45, 1C
        add     eax, edx                                ; 0682 _ 01. D0
        movzx   eax, byte [eax]                         ; 0684 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 0687 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 068A _ 80. 7D, FB, 00
        jns     ?_012                                   ; 068E _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 0690 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0693 _ 8B. 55, 14
        add     eax, edx                                ; 0696 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0698 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 069C _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 069E _ 8B. 45, 10
        add     eax, edx                                ; 06A1 _ 01. D0
        mov     edx, eax                                ; 06A3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 06A5 _ 8B. 45, 08
        add     edx, eax                                ; 06A8 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 06AA _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 06AE _ 88. 02
?_012:  movsx   eax, byte [ebp-5H]                      ; 06B0 _ 0F BE. 45, FB
        and     eax, 40H                                ; 06B4 _ 83. E0, 40
        test    eax, eax                                ; 06B7 _ 85. C0
        jz      ?_013                                   ; 06B9 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 06BB _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 06BE _ 8B. 55, 14
        add     eax, edx                                ; 06C1 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 06C3 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 06C7 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 06C9 _ 8B. 45, 10
        add     eax, edx                                ; 06CC _ 01. D0
        lea     edx, [eax+1H]                           ; 06CE _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 06D1 _ 8B. 45, 08
        add     edx, eax                                ; 06D4 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 06D6 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 06DA _ 88. 02
?_013:  movsx   eax, byte [ebp-5H]                      ; 06DC _ 0F BE. 45, FB
        and     eax, 20H                                ; 06E0 _ 83. E0, 20
        test    eax, eax                                ; 06E3 _ 85. C0
        jz      ?_014                                   ; 06E5 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 06E7 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 06EA _ 8B. 55, 14
        add     eax, edx                                ; 06ED _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 06EF _ 0F AF. 45, 0C
        mov     edx, eax                                ; 06F3 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 06F5 _ 8B. 45, 10
        add     eax, edx                                ; 06F8 _ 01. D0
        lea     edx, [eax+2H]                           ; 06FA _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 06FD _ 8B. 45, 08
        add     edx, eax                                ; 0700 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0702 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0706 _ 88. 02
?_014:  movsx   eax, byte [ebp-5H]                      ; 0708 _ 0F BE. 45, FB
        and     eax, 10H                                ; 070C _ 83. E0, 10
        test    eax, eax                                ; 070F _ 85. C0
        jz      ?_015                                   ; 0711 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0713 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0716 _ 8B. 55, 14
        add     eax, edx                                ; 0719 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 071B _ 0F AF. 45, 0C
        mov     edx, eax                                ; 071F _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0721 _ 8B. 45, 10
        add     eax, edx                                ; 0724 _ 01. D0
        lea     edx, [eax+3H]                           ; 0726 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 0729 _ 8B. 45, 08
        add     edx, eax                                ; 072C _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 072E _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0732 _ 88. 02
?_015:  movsx   eax, byte [ebp-5H]                      ; 0734 _ 0F BE. 45, FB
        and     eax, 08H                                ; 0738 _ 83. E0, 08
        test    eax, eax                                ; 073B _ 85. C0
        jz      ?_016                                   ; 073D _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 073F _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0742 _ 8B. 55, 14
        add     eax, edx                                ; 0745 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0747 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 074B _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 074D _ 8B. 45, 10
        add     eax, edx                                ; 0750 _ 01. D0
        lea     edx, [eax+4H]                           ; 0752 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0755 _ 8B. 45, 08
        add     edx, eax                                ; 0758 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 075A _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 075E _ 88. 02
?_016:  movsx   eax, byte [ebp-5H]                      ; 0760 _ 0F BE. 45, FB
        and     eax, 04H                                ; 0764 _ 83. E0, 04
        test    eax, eax                                ; 0767 _ 85. C0
        jz      ?_017                                   ; 0769 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 076B _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 076E _ 8B. 55, 14
        add     eax, edx                                ; 0771 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0773 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0777 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0779 _ 8B. 45, 10
        add     eax, edx                                ; 077C _ 01. D0
        lea     edx, [eax+5H]                           ; 077E _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 0781 _ 8B. 45, 08
        add     edx, eax                                ; 0784 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0786 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 078A _ 88. 02
?_017:  movsx   eax, byte [ebp-5H]                      ; 078C _ 0F BE. 45, FB
        and     eax, 02H                                ; 0790 _ 83. E0, 02
        test    eax, eax                                ; 0793 _ 85. C0
        jz      ?_018                                   ; 0795 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0797 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 079A _ 8B. 55, 14
        add     eax, edx                                ; 079D _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 079F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 07A3 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 07A5 _ 8B. 45, 10
        add     eax, edx                                ; 07A8 _ 01. D0
        lea     edx, [eax+6H]                           ; 07AA _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 07AD _ 8B. 45, 08
        add     edx, eax                                ; 07B0 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 07B2 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 07B6 _ 88. 02
?_018:  movsx   eax, byte [ebp-5H]                      ; 07B8 _ 0F BE. 45, FB
        and     eax, 01H                                ; 07BC _ 83. E0, 01
        test    eax, eax                                ; 07BF _ 85. C0
        jz      ?_019                                   ; 07C1 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 07C3 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 07C6 _ 8B. 55, 14
        add     eax, edx                                ; 07C9 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 07CB _ 0F AF. 45, 0C
        mov     edx, eax                                ; 07CF _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 07D1 _ 8B. 45, 10
        add     eax, edx                                ; 07D4 _ 01. D0
        lea     edx, [eax+7H]                           ; 07D6 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 07D9 _ 8B. 45, 08
        add     edx, eax                                ; 07DC _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 07DE _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 07E2 _ 88. 02
?_019:  add     dword [ebp-4H], 1                       ; 07E4 _ 83. 45, FC, 01
?_020:  cmp     dword [ebp-4H], 15                      ; 07E8 _ 83. 7D, FC, 0F
        jle     ?_011                                   ; 07EC _ 0F 8E, FFFFFE8A
        leave                                           ; 07F2 _ C9
        ret                                             ; 07F3 _ C3
                                                        ; showFont8 End of function

init_mouse_cursor:                                      ; Function begin
        push    ebp                                     ; 07F4 _ 55
        mov     ebp, esp                                ; 07F5 _ 89. E5
        sub     esp, 20                                 ; 07F7 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 07FA _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 07FD _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0800 _ C7. 45, FC, 00000000
        jmp     ?_027                                   ; 0807 _ E9, 000000B1

?_021:  mov     dword [ebp-8H], 0                       ; 080C _ C7. 45, F8, 00000000
        jmp     ?_026                                   ; 0813 _ E9, 00000097

?_022:  mov     eax, dword [ebp-4H]                     ; 0818 _ 8B. 45, FC
        shl     eax, 4                                  ; 081B _ C1. E0, 04
        mov     edx, eax                                ; 081E _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0820 _ 8B. 45, F8
        add     eax, edx                                ; 0823 _ 01. D0
        add     eax, cursor.1526                        ; 0825 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 082A _ 0F B6. 00
        cmp     al, 42                                  ; 082D _ 3C, 2A
        jnz     ?_023                                   ; 082F _ 75, 17
        mov     eax, dword [ebp-4H]                     ; 0831 _ 8B. 45, FC
        shl     eax, 4                                  ; 0834 _ C1. E0, 04
        mov     edx, eax                                ; 0837 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0839 _ 8B. 45, F8
        add     eax, edx                                ; 083C _ 01. D0
        mov     edx, eax                                ; 083E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0840 _ 8B. 45, 08
        add     eax, edx                                ; 0843 _ 01. D0
        mov     byte [eax], 0                           ; 0845 _ C6. 00, 00
?_023:  mov     eax, dword [ebp-4H]                     ; 0848 _ 8B. 45, FC
        shl     eax, 4                                  ; 084B _ C1. E0, 04
        mov     edx, eax                                ; 084E _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0850 _ 8B. 45, F8
        add     eax, edx                                ; 0853 _ 01. D0
        add     eax, cursor.1526                        ; 0855 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 085A _ 0F B6. 00
        cmp     al, 79                                  ; 085D _ 3C, 4F
        jnz     ?_024                                   ; 085F _ 75, 17
        mov     eax, dword [ebp-4H]                     ; 0861 _ 8B. 45, FC
        shl     eax, 4                                  ; 0864 _ C1. E0, 04
        mov     edx, eax                                ; 0867 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0869 _ 8B. 45, F8
        add     eax, edx                                ; 086C _ 01. D0
        mov     edx, eax                                ; 086E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0870 _ 8B. 45, 08
        add     eax, edx                                ; 0873 _ 01. D0
        mov     byte [eax], 7                           ; 0875 _ C6. 00, 07
?_024:  mov     eax, dword [ebp-4H]                     ; 0878 _ 8B. 45, FC
        shl     eax, 4                                  ; 087B _ C1. E0, 04
        mov     edx, eax                                ; 087E _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0880 _ 8B. 45, F8
        add     eax, edx                                ; 0883 _ 01. D0
        add     eax, cursor.1526                        ; 0885 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 088A _ 0F B6. 00
        cmp     al, 46                                  ; 088D _ 3C, 2E
        jnz     ?_025                                   ; 088F _ 75, 1A
        mov     eax, dword [ebp-4H]                     ; 0891 _ 8B. 45, FC
        shl     eax, 4                                  ; 0894 _ C1. E0, 04
        mov     edx, eax                                ; 0897 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0899 _ 8B. 45, F8
        add     eax, edx                                ; 089C _ 01. D0
        mov     edx, eax                                ; 089E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 08A0 _ 8B. 45, 08
        add     edx, eax                                ; 08A3 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 08A5 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 08A9 _ 88. 02
?_025:  add     dword [ebp-8H], 1                       ; 08AB _ 83. 45, F8, 01
?_026:  cmp     dword [ebp-8H], 15                      ; 08AF _ 83. 7D, F8, 0F
        jle     ?_022                                   ; 08B3 _ 0F 8E, FFFFFF5F
        add     dword [ebp-4H], 1                       ; 08B9 _ 83. 45, FC, 01
?_027:  cmp     dword [ebp-4H], 15                      ; 08BD _ 83. 7D, FC, 0F
        jle     ?_021                                   ; 08C1 _ 0F 8E, FFFFFF45
        leave                                           ; 08C7 _ C9
        ret                                             ; 08C8 _ C3
                                                        ; init_mouse_cursor End of function

putblock:                                               ; Function begin
        push    ebp                                     ; 08C9 _ 55
        mov     ebp, esp                                ; 08CA _ 89. E5
        sub     esp, 16                                 ; 08CC _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 08CF _ C7. 45, FC, 00000000
        jmp     ?_031                                   ; 08D6 _ EB, 50

?_028:  mov     dword [ebp-8H], 0                       ; 08D8 _ C7. 45, F8, 00000000
        jmp     ?_030                                   ; 08DF _ EB, 3B

?_029:  mov     eax, dword [ebp-4H]                     ; 08E1 _ 8B. 45, FC
        mov     edx, dword [ebp+1CH]                    ; 08E4 _ 8B. 55, 1C
        add     eax, edx                                ; 08E7 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08E9 _ 0F AF. 45, 0C
        mov     edx, dword [ebp-8H]                     ; 08ED _ 8B. 55, F8
        mov     ecx, dword [ebp+18H]                    ; 08F0 _ 8B. 4D, 18
        add     edx, ecx                                ; 08F3 _ 01. CA
        add     eax, edx                                ; 08F5 _ 01. D0
        mov     edx, eax                                ; 08F7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 08F9 _ 8B. 45, 08
        add     edx, eax                                ; 08FC _ 01. C2
        mov     eax, dword [ebp-4H]                     ; 08FE _ 8B. 45, FC
        imul    eax, dword [ebp+24H]                    ; 0901 _ 0F AF. 45, 24
        mov     ecx, eax                                ; 0905 _ 89. C1
        mov     eax, dword [ebp-8H]                     ; 0907 _ 8B. 45, F8
        add     eax, ecx                                ; 090A _ 01. C8
        mov     ecx, eax                                ; 090C _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 090E _ 8B. 45, 20
        add     eax, ecx                                ; 0911 _ 01. C8
        movzx   eax, byte [eax]                         ; 0913 _ 0F B6. 00
        mov     byte [edx], al                          ; 0916 _ 88. 02
        add     dword [ebp-8H], 1                       ; 0918 _ 83. 45, F8, 01
?_030:  mov     eax, dword [ebp-8H]                     ; 091C _ 8B. 45, F8
        cmp     eax, dword [ebp+10H]                    ; 091F _ 3B. 45, 10
        jl      ?_029                                   ; 0922 _ 7C, BD
        add     dword [ebp-4H], 1                       ; 0924 _ 83. 45, FC, 01
?_031:  mov     eax, dword [ebp-4H]                     ; 0928 _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 092B _ 3B. 45, 14
        jl      ?_028                                   ; 092E _ 7C, A8
        leave                                           ; 0930 _ C9
        ret                                             ; 0931 _ C3
                                                        ; putblock End of function

intHandlerFromC:                                        ; Function begin
        push    ebp                                     ; 0932 _ 55
        mov     ebp, esp                                ; 0933 _ 89. E5
        sub     esp, 40                                 ; 0935 _ 83. EC, 28
        mov     eax, dword [bootInfo]                   ; 0938 _ A1, 00000100(d)
        mov     dword [ebp-14H], eax                    ; 093D _ 89. 45, EC
        movzx   eax, word [?_041]                       ; 0940 _ 0F B7. 05, 00000104(d)
        cwde                                            ; 0947 _ 98
        mov     dword [ebp-10H], eax                    ; 0948 _ 89. 45, F0
        movzx   eax, word [?_042]                       ; 094B _ 0F B7. 05, 00000106(d)
        cwde                                            ; 0952 _ 98
        mov     dword [ebp-0CH], eax                    ; 0953 _ 89. 45, F4
        mov     dword [esp+4H], 33                      ; 0956 _ C7. 44 24, 04, 00000021
        mov     dword [esp], 32                         ; 095E _ C7. 04 24, 00000020
        call    io_out8                                 ; 0965 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-15H], 0                       ; 096A _ C6. 45, EB, 00
        mov     dword [esp], 96                         ; 096E _ C7. 04 24, 00000060
        call    io_in8                                  ; 0975 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-15H], al                      ; 097A _ 88. 45, EB
        mov     eax, dword [?_045]                      ; 097D _ A1, 00000148(d)
        cmp     eax, 31                                 ; 0982 _ 83. F8, 1F
        jg      ?_032                                   ; 0985 _ 7F, 3A
        mov     eax, dword [?_044]                      ; 0987 _ A1, 00000144(d)
        movzx   edx, byte [ebp-15H]                     ; 098C _ 0F B6. 55, EB
        mov     byte [keybuf+eax], dl                   ; 0990 _ 88. 90, 00000120(d)
        mov     eax, dword [?_045]                      ; 0996 _ A1, 00000148(d)
        add     eax, 1                                  ; 099B _ 83. C0, 01
        mov     dword [?_045], eax                      ; 099E _ A3, 00000148(d)
        mov     eax, dword [?_044]                      ; 09A3 _ A1, 00000144(d)
        lea     edx, [eax+1H]                           ; 09A8 _ 8D. 50, 01
        mov     eax, edx                                ; 09AB _ 89. D0
        sar     eax, 31                                 ; 09AD _ C1. F8, 1F
        shr     eax, 27                                 ; 09B0 _ C1. E8, 1B
        add     edx, eax                                ; 09B3 _ 01. C2
        and     edx, 1FH                                ; 09B5 _ 83. E2, 1F
        sub     edx, eax                                ; 09B8 _ 29. C2
        mov     eax, edx                                ; 09BA _ 89. D0
        mov     dword [?_044], eax                      ; 09BC _ A3, 00000144(d)
?_032:  leave                                           ; 09C1 _ C9
        ret                                             ; 09C2 _ C3
                                                        ; intHandlerFromC End of function

charToHexVal:                                           ; Function begin
        push    ebp                                     ; 09C3 _ 55
        mov     ebp, esp                                ; 09C4 _ 89. E5
        sub     esp, 4                                  ; 09C6 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 09C9 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 09CC _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 09CF _ 80. 7D, FC, 09
        jle     ?_033                                   ; 09D3 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 09D5 _ 0F B6. 45, FC
        add     eax, 55                                 ; 09D9 _ 83. C0, 37
        jmp     ?_034                                   ; 09DC _ EB, 07

?_033:  movzx   eax, byte [ebp-4H]                      ; 09DE _ 0F B6. 45, FC
        add     eax, 48                                 ; 09E2 _ 83. C0, 30
?_034:  leave                                           ; 09E5 _ C9
        ret                                             ; 09E6 _ C3
                                                        ; charToHexVal End of function

charToHexStr:                                           ; Function begin
        push    ebp                                     ; 09E7 _ 55
        mov     ebp, esp                                ; 09E8 _ 89. E5
        sub     esp, 24                                 ; 09EA _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 09ED _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 09F0 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 09F3 _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 09FA _ 0F B6. 45, EC
        and     eax, 0FH                                ; 09FE _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 0A01 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 0A04 _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 0A08 _ 89. 04 24
        call    charToHexVal                            ; 0A0B _ E8, FFFFFFFC(rel)
        mov     byte [?_040], al                        ; 0A10 _ A2, 00000013(d)
        movzx   eax, byte [ebp-14H]                     ; 0A15 _ 0F B6. 45, EC
        shr     al, 4                                   ; 0A19 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 0A1C _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 0A1F _ 0F B6. 45, EC
        movsx   eax, al                                 ; 0A23 _ 0F BE. C0
        mov     dword [esp], eax                        ; 0A26 _ 89. 04 24
        call    charToHexVal                            ; 0A29 _ E8, FFFFFFFC(rel)
        mov     byte [?_039], al                        ; 0A2E _ A2, 00000012(d)
        mov     eax, keyval                             ; 0A33 _ B8, 00000010(d)
        leave                                           ; 0A38 _ C9
        ret                                             ; 0A39 _ C3
                                                        ; charToHexStr End of function

wait_KBC_sendready:                                     ; Function begin
        push    ebp                                     ; 0A3A _ 55
        mov     ebp, esp                                ; 0A3B _ 89. E5
        sub     esp, 24                                 ; 0A3D _ 83. EC, 18
?_035:  mov     dword [esp], 100                        ; 0A40 _ C7. 04 24, 00000064
        call    io_in8                                  ; 0A47 _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 0A4C _ 83. E0, 02
        test    eax, eax                                ; 0A4F _ 85. C0
        jnz     ?_036                                   ; 0A51 _ 75, 02
        jmp     ?_037                                   ; 0A53 _ EB, 02

?_036:  jmp     ?_035                                   ; 0A55 _ EB, E9

?_037:  leave                                           ; 0A57 _ C9
        ret                                             ; 0A58 _ C3
                                                        ; wait_KBC_sendready End of function

init_keyboard:                                          ; Function begin
        push    ebp                                     ; 0A59 _ 55
        mov     ebp, esp                                ; 0A5A _ 89. E5
        sub     esp, 24                                 ; 0A5C _ 83. EC, 18
        call    wait_KBC_sendready                      ; 0A5F _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 0A64 _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 0A6C _ C7. 04 24, 00000064
        call    io_out8                                 ; 0A73 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 0A78 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 0A7D _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 0A85 _ C7. 04 24, 00000060
        call    io_out8                                 ; 0A8C _ E8, FFFFFFFC(rel)
        nop                                             ; 0A91 _ 90
        leave                                           ; 0A92 _ C9
        ret                                             ; 0A93 _ C3
                                                        ; init_keyboard End of function

enable_mouse:                                           ; Function begin
        push    ebp                                     ; 0A94 _ 55
        mov     ebp, esp                                ; 0A95 _ 89. E5
        sub     esp, 24                                 ; 0A97 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 0A9A _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 0A9F _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 0AA7 _ C7. 04 24, 00000064
        call    io_out8                                 ; 0AAE _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 0AB3 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 0AB8 _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 0AC0 _ C7. 04 24, 00000060
        call    io_out8                                 ; 0AC7 _ E8, FFFFFFFC(rel)
        nop                                             ; 0ACC _ 90
        leave                                           ; 0ACD _ C9
        ret                                             ; 0ACE _ C3
                                                        ; enable_mouse End of function

intHandlerForMouse:                                     ; Function begin
        push    ebp                                     ; 0ACF _ 55
        mov     ebp, esp                                ; 0AD0 _ 89. E5
        sub     esp, 56                                 ; 0AD2 _ 83. EC, 38
        mov     eax, dword [bootInfo]                   ; 0AD5 _ A1, 00000100(d)
        mov     dword [ebp-14H], eax                    ; 0ADA _ 89. 45, EC
        movzx   eax, word [?_041]                       ; 0ADD _ 0F B7. 05, 00000104(d)
        cwde                                            ; 0AE4 _ 98
        mov     dword [ebp-10H], eax                    ; 0AE5 _ 89. 45, F0
        movzx   eax, word [?_042]                       ; 0AE8 _ 0F B7. 05, 00000106(d)
        cwde                                            ; 0AEF _ 98
        mov     dword [ebp-0CH], eax                    ; 0AF0 _ 89. 45, F4
        mov     dword [esp+14H], ?_046                  ; 0AF3 _ C7. 44 24, 14, 00000000(d)
        mov     dword [esp+10H], 7                      ; 0AFB _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 0                      ; 0B03 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0B0B _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-10H]                    ; 0B13 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 0B16 _ 89. 44 24, 04
        mov     eax, dword [ebp-14H]                    ; 0B1A _ 8B. 45, EC
        mov     dword [esp], eax                        ; 0B1D _ 89. 04 24
        call    showString                              ; 0B20 _ E8, FFFFFFFC(rel)
?_038:  call    io_hlt                                  ; 0B25 _ E8, FFFFFFFC(rel)
        jmp     ?_038                                   ; 0B2A _ EB, F9
                                                        ; intHandlerForMouse End of function


                                                        ; SECTION .data   align=32 noexecute                      ; section number 2, data

fontA:                                                  ; oword
        db 00H, 18H, 18H, 18H, 18H, 24H, 24H, 24H       ; 0000 _ .....$$$
        db 24H, 7EH, 42H, 42H, 42H, 0E7H, 00H, 00H      ; 0008 _ $~BBB...

keyval:                                                 ; byte
        db 30H, 58H                                     ; 0010 _ 0X

?_039:  db 00H                                          ; 0012 _ .

?_040:  db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0013 _ ........
        db 00H, 00H, 00H, 00H, 00H                      ; 001B _ .....

table_rgb.1468:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0020 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........

cursor.1526:                                            ; byte
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

mcursor:                                                ; byte
        resb    256                                     ; 0000

bootInfo:                                               ; qword
        resb    4                                       ; 0100

?_041:  resw    1                                       ; 0104

?_042:  resw    13                                      ; 0106

keybuf:                                                 ; byte
        resb    32                                      ; 0120

?_043:  resd    1                                       ; 0140

?_044:  resd    1                                       ; 0144

?_045:  resd    1                                       ; 0148

showPos.1460:                                           ; dword
        resd    1                                       ; 014C


                                                        ; SECTION .rodata align=1 noexecute                       ; section number 4, const

?_046:                                                  ; byte
        db 50H, 53H, 2FH, 32H, 20H, 4DH, 6FH, 75H       ; 0000 _ PS/2 Mou
        db 73H, 65H, 20H, 48H, 61H, 6EH, 64H, 6CH       ; 0008 _ se Handl
        db 65H, 72H, 00H                                ; 0010 _ er.

