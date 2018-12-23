; Disassembly of file: write_vga_desktop.o
; Tue Oct 11 12:14:09 2016
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386



CMain:                                                  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    ebx                                     ; 0003 _ 53
        sub     esp, 36                                 ; 0004 _ 83. EC, 24
        sub     esp, 12                                 ; 0007 _ 83. EC, 0C
        push    bootInfo                                ; 000A _ 68, 00000100(d)
        call    initBootInfo                            ; 000F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0014 _ 83. C4, 10
        mov     eax, dword [bootInfo]                   ; 0017 _ A1, 00000100(d)
        mov     dword [ebp-1CH], eax                    ; 001C _ 89. 45, E4
        movzx   eax, word [?_048]                       ; 001F _ 0F B7. 05, 00000104(d)
        cwde                                            ; 0026 _ 98
        mov     dword [ebp-18H], eax                    ; 0027 _ 89. 45, E8
        movzx   eax, word [?_049]                       ; 002A _ 0F B7. 05, 00000106(d)
        cwde                                            ; 0031 _ 98
        mov     dword [ebp-14H], eax                    ; 0032 _ 89. 45, EC
        sub     esp, 4                                  ; 0035 _ 83. EC, 04
        push    keybuf                                  ; 0038 _ 68, 00000140(d)
        push    32                                      ; 003D _ 6A, 20
        push    keyinfo                                 ; 003F _ 68, 00000108(d)
        call    fifo8_init                              ; 0044 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0049 _ 83. C4, 10
        sub     esp, 4                                  ; 004C _ 83. EC, 04
        push    mousebuf                                ; 004F _ 68, 00000180(d)
        push    128                                     ; 0054 _ 68, 00000080
        push    mouseinfo                               ; 0059 _ 68, 00000120(d)
        call    fifo8_init                              ; 005E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0063 _ 83. C4, 10
        call    init_palette                            ; 0066 _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 006B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 0070 _ 8B. 45, EC
        lea     edx, [eax-1DH]                          ; 0073 _ 8D. 50, E3
        mov     eax, dword [ebp-18H]                    ; 0076 _ 8B. 45, E8
        sub     eax, 1                                  ; 0079 _ 83. E8, 01
        sub     esp, 4                                  ; 007C _ 83. EC, 04
        push    edx                                     ; 007F _ 52
        push    eax                                     ; 0080 _ 50
        push    0                                       ; 0081 _ 6A, 00
        push    0                                       ; 0083 _ 6A, 00
        push    14                                      ; 0085 _ 6A, 0E
        push    dword [ebp-18H]                         ; 0087 _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 008A _ FF. 75, E4
        call    boxfill8                                ; 008D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0092 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0095 _ 8B. 45, EC
        lea     ecx, [eax-1CH]                          ; 0098 _ 8D. 48, E4
        mov     eax, dword [ebp-18H]                    ; 009B _ 8B. 45, E8
        lea     edx, [eax-1H]                           ; 009E _ 8D. 50, FF
        mov     eax, dword [ebp-14H]                    ; 00A1 _ 8B. 45, EC
        sub     eax, 28                                 ; 00A4 _ 83. E8, 1C
        sub     esp, 4                                  ; 00A7 _ 83. EC, 04
        push    ecx                                     ; 00AA _ 51
        push    edx                                     ; 00AB _ 52
        push    eax                                     ; 00AC _ 50
        push    0                                       ; 00AD _ 6A, 00
        push    8                                       ; 00AF _ 6A, 08
        push    dword [ebp-18H]                         ; 00B1 _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 00B4 _ FF. 75, E4
        call    boxfill8                                ; 00B7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00BC _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 00BF _ 8B. 45, EC
        lea     ecx, [eax-1BH]                          ; 00C2 _ 8D. 48, E5
        mov     eax, dword [ebp-18H]                    ; 00C5 _ 8B. 45, E8
        lea     edx, [eax-1H]                           ; 00C8 _ 8D. 50, FF
        mov     eax, dword [ebp-14H]                    ; 00CB _ 8B. 45, EC
        sub     eax, 27                                 ; 00CE _ 83. E8, 1B
        sub     esp, 4                                  ; 00D1 _ 83. EC, 04
        push    ecx                                     ; 00D4 _ 51
        push    edx                                     ; 00D5 _ 52
        push    eax                                     ; 00D6 _ 50
        push    0                                       ; 00D7 _ 6A, 00
        push    7                                       ; 00D9 _ 6A, 07
        push    dword [ebp-18H]                         ; 00DB _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 00DE _ FF. 75, E4
        call    boxfill8                                ; 00E1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00E6 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 00E9 _ 8B. 45, EC
        lea     ecx, [eax-1H]                           ; 00EC _ 8D. 48, FF
        mov     eax, dword [ebp-18H]                    ; 00EF _ 8B. 45, E8
        lea     edx, [eax-1H]                           ; 00F2 _ 8D. 50, FF
        mov     eax, dword [ebp-14H]                    ; 00F5 _ 8B. 45, EC
        sub     eax, 26                                 ; 00F8 _ 83. E8, 1A
        sub     esp, 4                                  ; 00FB _ 83. EC, 04
        push    ecx                                     ; 00FE _ 51
        push    edx                                     ; 00FF _ 52
        push    eax                                     ; 0100 _ 50
        push    0                                       ; 0101 _ 6A, 00
        push    8                                       ; 0103 _ 6A, 08
        push    dword [ebp-18H]                         ; 0105 _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 0108 _ FF. 75, E4
        call    boxfill8                                ; 010B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0110 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0113 _ 8B. 45, EC
        lea     edx, [eax-18H]                          ; 0116 _ 8D. 50, E8
        mov     eax, dword [ebp-14H]                    ; 0119 _ 8B. 45, EC
        sub     eax, 24                                 ; 011C _ 83. E8, 18
        sub     esp, 4                                  ; 011F _ 83. EC, 04
        push    edx                                     ; 0122 _ 52
        push    59                                      ; 0123 _ 6A, 3B
        push    eax                                     ; 0125 _ 50
        push    3                                       ; 0126 _ 6A, 03
        push    7                                       ; 0128 _ 6A, 07
        push    dword [ebp-18H]                         ; 012A _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 012D _ FF. 75, E4
        call    boxfill8                                ; 0130 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0135 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0138 _ 8B. 45, EC
        lea     edx, [eax-4H]                           ; 013B _ 8D. 50, FC
        mov     eax, dword [ebp-14H]                    ; 013E _ 8B. 45, EC
        sub     eax, 24                                 ; 0141 _ 83. E8, 18
        sub     esp, 4                                  ; 0144 _ 83. EC, 04
        push    edx                                     ; 0147 _ 52
        push    2                                       ; 0148 _ 6A, 02
        push    eax                                     ; 014A _ 50
        push    2                                       ; 014B _ 6A, 02
        push    7                                       ; 014D _ 6A, 07
        push    dword [ebp-18H]                         ; 014F _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 0152 _ FF. 75, E4
        call    boxfill8                                ; 0155 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 015A _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 015D _ 8B. 45, EC
        lea     edx, [eax-4H]                           ; 0160 _ 8D. 50, FC
        mov     eax, dword [ebp-14H]                    ; 0163 _ 8B. 45, EC
        sub     eax, 4                                  ; 0166 _ 83. E8, 04
        sub     esp, 4                                  ; 0169 _ 83. EC, 04
        push    edx                                     ; 016C _ 52
        push    59                                      ; 016D _ 6A, 3B
        push    eax                                     ; 016F _ 50
        push    3                                       ; 0170 _ 6A, 03
        push    15                                      ; 0172 _ 6A, 0F
        push    dword [ebp-18H]                         ; 0174 _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 0177 _ FF. 75, E4
        call    boxfill8                                ; 017A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 017F _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0182 _ 8B. 45, EC
        lea     edx, [eax-5H]                           ; 0185 _ 8D. 50, FB
        mov     eax, dword [ebp-14H]                    ; 0188 _ 8B. 45, EC
        sub     eax, 23                                 ; 018B _ 83. E8, 17
        sub     esp, 4                                  ; 018E _ 83. EC, 04
        push    edx                                     ; 0191 _ 52
        push    59                                      ; 0192 _ 6A, 3B
        push    eax                                     ; 0194 _ 50
        push    59                                      ; 0195 _ 6A, 3B
        push    15                                      ; 0197 _ 6A, 0F
        push    dword [ebp-18H]                         ; 0199 _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 019C _ FF. 75, E4
        call    boxfill8                                ; 019F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01A4 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 01A7 _ 8B. 45, EC
        lea     edx, [eax-3H]                           ; 01AA _ 8D. 50, FD
        mov     eax, dword [ebp-14H]                    ; 01AD _ 8B. 45, EC
        sub     eax, 3                                  ; 01B0 _ 83. E8, 03
        sub     esp, 4                                  ; 01B3 _ 83. EC, 04
        push    edx                                     ; 01B6 _ 52
        push    59                                      ; 01B7 _ 6A, 3B
        push    eax                                     ; 01B9 _ 50
        push    2                                       ; 01BA _ 6A, 02
        push    0                                       ; 01BC _ 6A, 00
        push    dword [ebp-18H]                         ; 01BE _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 01C1 _ FF. 75, E4
        call    boxfill8                                ; 01C4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01C9 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 01CC _ 8B. 45, EC
        lea     edx, [eax-3H]                           ; 01CF _ 8D. 50, FD
        mov     eax, dword [ebp-14H]                    ; 01D2 _ 8B. 45, EC
        sub     eax, 24                                 ; 01D5 _ 83. E8, 18
        sub     esp, 4                                  ; 01D8 _ 83. EC, 04
        push    edx                                     ; 01DB _ 52
        push    60                                      ; 01DC _ 6A, 3C
        push    eax                                     ; 01DE _ 50
        push    60                                      ; 01DF _ 6A, 3C
        push    0                                       ; 01E1 _ 6A, 00
        push    dword [ebp-18H]                         ; 01E3 _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 01E6 _ FF. 75, E4
        call    boxfill8                                ; 01E9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01EE _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 01F1 _ 8B. 45, EC
        lea     ebx, [eax-18H]                          ; 01F4 _ 8D. 58, E8
        mov     eax, dword [ebp-18H]                    ; 01F7 _ 8B. 45, E8
        lea     ecx, [eax-4H]                           ; 01FA _ 8D. 48, FC
        mov     eax, dword [ebp-14H]                    ; 01FD _ 8B. 45, EC
        lea     edx, [eax-18H]                          ; 0200 _ 8D. 50, E8
        mov     eax, dword [ebp-18H]                    ; 0203 _ 8B. 45, E8
        sub     eax, 47                                 ; 0206 _ 83. E8, 2F
        sub     esp, 4                                  ; 0209 _ 83. EC, 04
        push    ebx                                     ; 020C _ 53
        push    ecx                                     ; 020D _ 51
        push    edx                                     ; 020E _ 52
        push    eax                                     ; 020F _ 50
        push    15                                      ; 0210 _ 6A, 0F
        push    dword [ebp-18H]                         ; 0212 _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 0215 _ FF. 75, E4
        call    boxfill8                                ; 0218 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 021D _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0220 _ 8B. 45, EC
        lea     ebx, [eax-4H]                           ; 0223 _ 8D. 58, FC
        mov     eax, dword [ebp-18H]                    ; 0226 _ 8B. 45, E8
        lea     ecx, [eax-2FH]                          ; 0229 _ 8D. 48, D1
        mov     eax, dword [ebp-14H]                    ; 022C _ 8B. 45, EC
        lea     edx, [eax-17H]                          ; 022F _ 8D. 50, E9
        mov     eax, dword [ebp-18H]                    ; 0232 _ 8B. 45, E8
        sub     eax, 47                                 ; 0235 _ 83. E8, 2F
        sub     esp, 4                                  ; 0238 _ 83. EC, 04
        push    ebx                                     ; 023B _ 53
        push    ecx                                     ; 023C _ 51
        push    edx                                     ; 023D _ 52
        push    eax                                     ; 023E _ 50
        push    15                                      ; 023F _ 6A, 0F
        push    dword [ebp-18H]                         ; 0241 _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 0244 _ FF. 75, E4
        call    boxfill8                                ; 0247 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 024C _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 024F _ 8B. 45, EC
        lea     ebx, [eax-3H]                           ; 0252 _ 8D. 58, FD
        mov     eax, dword [ebp-18H]                    ; 0255 _ 8B. 45, E8
        lea     ecx, [eax-4H]                           ; 0258 _ 8D. 48, FC
        mov     eax, dword [ebp-14H]                    ; 025B _ 8B. 45, EC
        lea     edx, [eax-3H]                           ; 025E _ 8D. 50, FD
        mov     eax, dword [ebp-18H]                    ; 0261 _ 8B. 45, E8
        sub     eax, 47                                 ; 0264 _ 83. E8, 2F
        sub     esp, 4                                  ; 0267 _ 83. EC, 04
        push    ebx                                     ; 026A _ 53
        push    ecx                                     ; 026B _ 51
        push    edx                                     ; 026C _ 52
        push    eax                                     ; 026D _ 50
        push    7                                       ; 026E _ 6A, 07
        push    dword [ebp-18H]                         ; 0270 _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 0273 _ FF. 75, E4
        call    boxfill8                                ; 0276 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 027B _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 027E _ 8B. 45, EC
        lea     ebx, [eax-3H]                           ; 0281 _ 8D. 58, FD
        mov     eax, dword [ebp-18H]                    ; 0284 _ 8B. 45, E8
        lea     ecx, [eax-3H]                           ; 0287 _ 8D. 48, FD
        mov     eax, dword [ebp-14H]                    ; 028A _ 8B. 45, EC
        lea     edx, [eax-18H]                          ; 028D _ 8D. 50, E8
        mov     eax, dword [ebp-18H]                    ; 0290 _ 8B. 45, E8
        sub     eax, 3                                  ; 0293 _ 83. E8, 03
        sub     esp, 4                                  ; 0296 _ 83. EC, 04
        push    ebx                                     ; 0299 _ 53
        push    ecx                                     ; 029A _ 51
        push    edx                                     ; 029B _ 52
        push    eax                                     ; 029C _ 50
        push    7                                       ; 029D _ 6A, 07
        push    dword [ebp-18H]                         ; 029F _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 02A2 _ FF. 75, E4
        call    boxfill8                                ; 02A5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02AA _ 83. C4, 20
        sub     esp, 8                                  ; 02AD _ 83. EC, 08
        push    14                                      ; 02B0 _ 6A, 0E
        push    mcursor                                 ; 02B2 _ 68, 00000000(d)
        call    init_mouse_cursor                       ; 02B7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02BC _ 83. C4, 10
        push    16                                      ; 02BF _ 6A, 10
        push    mcursor                                 ; 02C1 _ 68, 00000000(d)
        push    80                                      ; 02C6 _ 6A, 50
        push    80                                      ; 02C8 _ 6A, 50
        push    16                                      ; 02CA _ 6A, 10
        push    16                                      ; 02CC _ 6A, 10
        push    dword [ebp-18H]                         ; 02CE _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 02D1 _ FF. 75, E4
        call    putblock                                ; 02D4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02D9 _ 83. C4, 20
        call    io_sti                                  ; 02DC _ E8, FFFFFFFC(rel)
        call    enable_mouse                            ; 02E1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 0                      ; 02E6 _ C7. 45, F0, 00000000
?_001:  call    io_cli                                  ; 02ED _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 02F2 _ 83. EC, 0C
        push    keyinfo                                 ; 02F5 _ 68, 00000108(d)
        call    fifo8_status                            ; 02FA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02FF _ 83. C4, 10
        mov     ebx, eax                                ; 0302 _ 89. C3
        sub     esp, 12                                 ; 0304 _ 83. EC, 0C
        push    mouseinfo                               ; 0307 _ 68, 00000120(d)
        call    fifo8_status                            ; 030C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0311 _ 83. C4, 10
        add     eax, ebx                                ; 0314 _ 01. D8
        test    eax, eax                                ; 0316 _ 85. C0
        jnz     ?_002                                   ; 0318 _ 75, 0A
        call    io_stihlt                               ; 031A _ E8, FFFFFFFC(rel)
        jmp     ?_004                                   ; 031F _ E9, 00000087

?_002:  sub     esp, 12                                 ; 0324 _ 83. EC, 0C
        push    keyinfo                                 ; 0327 _ 68, 00000108(d)
        call    fifo8_status                            ; 032C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0331 _ 83. C4, 10
        test    eax, eax                                ; 0334 _ 85. C0
        jz      ?_003                                   ; 0336 _ 74, 5A
        call    io_sti                                  ; 0338 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 033D _ 83. EC, 0C
        push    keyinfo                                 ; 0340 _ 68, 00000108(d)
        call    fifo8_get                               ; 0345 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 034A _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 034D _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 0350 _ 8B. 45, F0
        movzx   eax, al                                 ; 0353 _ 0F B6. C0
        sub     esp, 12                                 ; 0356 _ 83. EC, 0C
        push    eax                                     ; 0359 _ 50
        call    charToHexStr                            ; 035A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 035F _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 0362 _ 89. 45, F4
        mov     eax, dword [showPos.1498]               ; 0365 _ A1, 00000200(d)
        sub     esp, 8                                  ; 036A _ 83. EC, 08
        push    dword [ebp-0CH]                         ; 036D _ FF. 75, F4
        push    7                                       ; 0370 _ 6A, 07
        push    0                                       ; 0372 _ 6A, 00
        push    eax                                     ; 0374 _ 50
        push    dword [ebp-18H]                         ; 0375 _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 0378 _ FF. 75, E4
        call    showString                              ; 037B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0380 _ 83. C4, 20
        mov     eax, dword [showPos.1498]               ; 0383 _ A1, 00000200(d)
        add     eax, 32                                 ; 0388 _ 83. C0, 20
        mov     dword [showPos.1498], eax               ; 038B _ A3, 00000200(d)
        jmp     ?_004                                   ; 0390 _ EB, 19

?_003:  sub     esp, 12                                 ; 0392 _ 83. EC, 0C
        push    mouseinfo                               ; 0395 _ 68, 00000120(d)
        call    fifo8_status                            ; 039A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 039F _ 83. C4, 10
        test    eax, eax                                ; 03A2 _ 85. C0
        jz      ?_004                                   ; 03A4 _ 74, 05
        call    show_mouse_info                         ; 03A6 _ E8, FFFFFFFC(rel)
?_004:  jmp     ?_001                                   ; 03AB _ E9, FFFFFF3D
                                                        ; CMain End of function

show_mouse_info:                                        ; Function begin
        push    ebp                                     ; 03B0 _ 55
        mov     ebp, esp                                ; 03B1 _ 89. E5
        sub     esp, 40                                 ; 03B3 _ 83. EC, 28
        mov     eax, dword [bootInfo]                   ; 03B6 _ A1, 00000100(d)
        mov     dword [ebp-18H], eax                    ; 03BB _ 89. 45, E8
        movzx   eax, word [?_048]                       ; 03BE _ 0F B7. 05, 00000104(d)
        cwde                                            ; 03C5 _ 98
        mov     dword [ebp-14H], eax                    ; 03C6 _ 89. 45, EC
        movzx   eax, word [?_049]                       ; 03C9 _ 0F B7. 05, 00000106(d)
        cwde                                            ; 03D0 _ 98
        mov     dword [ebp-10H], eax                    ; 03D1 _ 89. 45, F0
        mov     byte [ebp-19H], 0                       ; 03D4 _ C6. 45, E7, 00
        call    io_sti                                  ; 03D8 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 03DD _ 83. EC, 0C
        push    mouseinfo                               ; 03E0 _ 68, 00000120(d)
        call    fifo8_get                               ; 03E5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03EA _ 83. C4, 10
        mov     byte [ebp-19H], al                      ; 03ED _ 88. 45, E7
        movzx   eax, byte [ebp-19H]                     ; 03F0 _ 0F B6. 45, E7
        sub     esp, 12                                 ; 03F4 _ 83. EC, 0C
        push    eax                                     ; 03F7 _ 50
        call    charToHexStr                            ; 03F8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03FD _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 0400 _ 89. 45, F4
        mov     eax, dword [mousePos.1507]              ; 0403 _ A1, 00000018(d)
        cmp     eax, 256                                ; 0408 _ 3D, 00000100
        jg      ?_005                                   ; 040D _ 7F, 2B
        mov     eax, dword [mousePos.1507]              ; 040F _ A1, 00000018(d)
        sub     esp, 8                                  ; 0414 _ 83. EC, 08
        push    dword [ebp-0CH]                         ; 0417 _ FF. 75, F4
        push    7                                       ; 041A _ 6A, 07
        push    16                                      ; 041C _ 6A, 10
        push    eax                                     ; 041E _ 50
        push    dword [ebp-14H]                         ; 041F _ FF. 75, EC
        push    dword [ebp-18H]                         ; 0422 _ FF. 75, E8
        call    showString                              ; 0425 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 042A _ 83. C4, 20
        mov     eax, dword [mousePos.1507]              ; 042D _ A1, 00000018(d)
        add     eax, 32                                 ; 0432 _ 83. C0, 20
        mov     dword [mousePos.1507], eax              ; 0435 _ A3, 00000018(d)
?_005:  leave                                           ; 043A _ C9
        ret                                             ; 043B _ C3
                                                        ; show_mouse_info End of function

initBootInfo:                                           ; Function begin
        push    ebp                                     ; 043C _ 55
        mov     ebp, esp                                ; 043D _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 043F _ 8B. 45, 08
        mov     dword [eax], 655360                     ; 0442 _ C7. 00, 000A0000
        mov     eax, dword [ebp+8H]                     ; 0448 _ 8B. 45, 08
                                                        ; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 044B _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 0451 _ 8B. 45, 08
                                                        ; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 0454 _ 66: C7. 40, 06, 00C8
        pop     ebp                                     ; 045A _ 5D
        ret                                             ; 045B _ C3
                                                        ; initBootInfo End of function

showString:                                             ; Function begin
        push    ebp                                     ; 045C _ 55
        mov     ebp, esp                                ; 045D _ 89. E5
        sub     esp, 24                                 ; 045F _ 83. EC, 18
        mov     eax, dword [ebp+18H]                    ; 0462 _ 8B. 45, 18
        mov     byte [ebp-0CH], al                      ; 0465 _ 88. 45, F4
        jmp     ?_007                                   ; 0468 _ EB, 37

?_006:  mov     eax, dword [ebp+1CH]                    ; 046A _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 046D _ 0F B6. 00
        movzx   eax, al                                 ; 0470 _ 0F B6. C0
        shl     eax, 4                                  ; 0473 _ C1. E0, 04
        lea     edx, [systemFont+eax]                   ; 0476 _ 8D. 90, 00000000(d)
        movsx   eax, byte [ebp-0CH]                     ; 047C _ 0F BE. 45, F4
        sub     esp, 8                                  ; 0480 _ 83. EC, 08
        push    edx                                     ; 0483 _ 52
        push    eax                                     ; 0484 _ 50
        push    dword [ebp+14H]                         ; 0485 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 0488 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 048B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 048E _ FF. 75, 08
        call    showFont8                               ; 0491 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0496 _ 83. C4, 20
        add     dword [ebp+10H], 8                      ; 0499 _ 83. 45, 10, 08
        add     dword [ebp+1CH], 1                      ; 049D _ 83. 45, 1C, 01
?_007:  mov     eax, dword [ebp+1CH]                    ; 04A1 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 04A4 _ 0F B6. 00
        test    al, al                                  ; 04A7 _ 84. C0
        jnz     ?_006                                   ; 04A9 _ 75, BF
        leave                                           ; 04AB _ C9
        ret                                             ; 04AC _ C3
                                                        ; showString End of function

init_palette:                                           ; Function begin
        push    ebp                                     ; 04AD _ 55
        mov     ebp, esp                                ; 04AE _ 89. E5
        sub     esp, 8                                  ; 04B0 _ 83. EC, 08
        sub     esp, 4                                  ; 04B3 _ 83. EC, 04
        push    table_rgb.1525                          ; 04B6 _ 68, 00000020(d)
        push    15                                      ; 04BB _ 6A, 0F
        push    0                                       ; 04BD _ 6A, 00
        call    set_palette                             ; 04BF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04C4 _ 83. C4, 10
        nop                                             ; 04C7 _ 90
        leave                                           ; 04C8 _ C9
        ret                                             ; 04C9 _ C3
                                                        ; init_palette End of function

set_palette:                                            ; Function begin
        push    ebp                                     ; 04CA _ 55
        mov     ebp, esp                                ; 04CB _ 89. E5
        sub     esp, 24                                 ; 04CD _ 83. EC, 18
        call    io_load_eflags                          ; 04D0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 04D5 _ 89. 45, F4
        call    io_cli                                  ; 04D8 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 04DD _ 83. EC, 08
        push    dword [ebp+8H]                          ; 04E0 _ FF. 75, 08
        push    968                                     ; 04E3 _ 68, 000003C8
        call    io_out8                                 ; 04E8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04ED _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 04F0 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 04F3 _ 89. 45, F0
        jmp     ?_009                                   ; 04F6 _ EB, 65

?_008:  mov     eax, dword [ebp+10H]                    ; 04F8 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 04FB _ 0F B6. 00
        shr     al, 2                                   ; 04FE _ C0. E8, 02
        movzx   eax, al                                 ; 0501 _ 0F B6. C0
        sub     esp, 8                                  ; 0504 _ 83. EC, 08
        push    eax                                     ; 0507 _ 50
        push    969                                     ; 0508 _ 68, 000003C9
        call    io_out8                                 ; 050D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0512 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0515 _ 8B. 45, 10
        add     eax, 1                                  ; 0518 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 051B _ 0F B6. 00
        shr     al, 2                                   ; 051E _ C0. E8, 02
        movzx   eax, al                                 ; 0521 _ 0F B6. C0
        sub     esp, 8                                  ; 0524 _ 83. EC, 08
        push    eax                                     ; 0527 _ 50
        push    969                                     ; 0528 _ 68, 000003C9
        call    io_out8                                 ; 052D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0532 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0535 _ 8B. 45, 10
        add     eax, 2                                  ; 0538 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 053B _ 0F B6. 00
        shr     al, 2                                   ; 053E _ C0. E8, 02
        movzx   eax, al                                 ; 0541 _ 0F B6. C0
        sub     esp, 8                                  ; 0544 _ 83. EC, 08
        push    eax                                     ; 0547 _ 50
        push    969                                     ; 0548 _ 68, 000003C9
        call    io_out8                                 ; 054D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0552 _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 0555 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 0559 _ 83. 45, F0, 01
?_009:  mov     eax, dword [ebp-10H]                    ; 055D _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 0560 _ 3B. 45, 0C
        jle     ?_008                                   ; 0563 _ 7E, 93
        sub     esp, 12                                 ; 0565 _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 0568 _ FF. 75, F4
        call    io_store_eflags                         ; 056B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0570 _ 83. C4, 10
        nop                                             ; 0573 _ 90
        leave                                           ; 0574 _ C9
        ret                                             ; 0575 _ C3
                                                        ; set_palette End of function

boxfill8:                                               ; Function begin
        push    ebp                                     ; 0576 _ 55
        mov     ebp, esp                                ; 0577 _ 89. E5
        sub     esp, 20                                 ; 0579 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 057C _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 057F _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0582 _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 0585 _ 89. 45, FC
        jmp     ?_013                                   ; 0588 _ EB, 33

?_010:  mov     eax, dword [ebp+14H]                    ; 058A _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 058D _ 89. 45, F8
        jmp     ?_012                                   ; 0590 _ EB, 1F

?_011:  mov     eax, dword [ebp-4H]                     ; 0592 _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 0595 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0599 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 059B _ 8B. 45, F8
        add     eax, edx                                ; 059E _ 01. D0
        mov     edx, eax                                ; 05A0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 05A2 _ 8B. 45, 08
        add     edx, eax                                ; 05A5 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 05A7 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 05AB _ 88. 02
        add     dword [ebp-8H], 1                       ; 05AD _ 83. 45, F8, 01
?_012:  mov     eax, dword [ebp-8H]                     ; 05B1 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 05B4 _ 3B. 45, 1C
        jle     ?_011                                   ; 05B7 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 05B9 _ 83. 45, FC, 01
?_013:  mov     eax, dword [ebp-4H]                     ; 05BD _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 05C0 _ 3B. 45, 20
        jle     ?_010                                   ; 05C3 _ 7E, C5
        leave                                           ; 05C5 _ C9
        ret                                             ; 05C6 _ C3
                                                        ; boxfill8 End of function

showFont8:                                              ; Function begin
        push    ebp                                     ; 05C7 _ 55
        mov     ebp, esp                                ; 05C8 _ 89. E5
        sub     esp, 20                                 ; 05CA _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 05CD _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 05D0 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 05D3 _ C7. 45, FC, 00000000
        jmp     ?_023                                   ; 05DA _ E9, 0000016C

?_014:  mov     edx, dword [ebp-4H]                     ; 05DF _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 05E2 _ 8B. 45, 1C
        add     eax, edx                                ; 05E5 _ 01. D0
        movzx   eax, byte [eax]                         ; 05E7 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 05EA _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 05ED _ 80. 7D, FB, 00
        jns     ?_015                                   ; 05F1 _ 79, 20
        mov     edx, dword [ebp+14H]                    ; 05F3 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 05F6 _ 8B. 45, FC
        add     eax, edx                                ; 05F9 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 05FB _ 0F AF. 45, 0C
        mov     edx, eax                                ; 05FF _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0601 _ 8B. 45, 10
        add     eax, edx                                ; 0604 _ 01. D0
        mov     edx, eax                                ; 0606 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0608 _ 8B. 45, 08
        add     edx, eax                                ; 060B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 060D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0611 _ 88. 02
?_015:  movsx   eax, byte [ebp-5H]                      ; 0613 _ 0F BE. 45, FB
        and     eax, 40H                                ; 0617 _ 83. E0, 40
        test    eax, eax                                ; 061A _ 85. C0
        jz      ?_016                                   ; 061C _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 061E _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0621 _ 8B. 45, FC
        add     eax, edx                                ; 0624 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0626 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 062A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 062C _ 8B. 45, 10
        add     eax, edx                                ; 062F _ 01. D0
        lea     edx, [eax+1H]                           ; 0631 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0634 _ 8B. 45, 08
        add     edx, eax                                ; 0637 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0639 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 063D _ 88. 02
?_016:  movsx   eax, byte [ebp-5H]                      ; 063F _ 0F BE. 45, FB
        and     eax, 20H                                ; 0643 _ 83. E0, 20
        test    eax, eax                                ; 0646 _ 85. C0
        jz      ?_017                                   ; 0648 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 064A _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 064D _ 8B. 45, FC
        add     eax, edx                                ; 0650 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0652 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0656 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0658 _ 8B. 45, 10
        add     eax, edx                                ; 065B _ 01. D0
        lea     edx, [eax+2H]                           ; 065D _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0660 _ 8B. 45, 08
        add     edx, eax                                ; 0663 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0665 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0669 _ 88. 02
?_017:  movsx   eax, byte [ebp-5H]                      ; 066B _ 0F BE. 45, FB
        and     eax, 10H                                ; 066F _ 83. E0, 10
        test    eax, eax                                ; 0672 _ 85. C0
        jz      ?_018                                   ; 0674 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0676 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0679 _ 8B. 45, FC
        add     eax, edx                                ; 067C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 067E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0682 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0684 _ 8B. 45, 10
        add     eax, edx                                ; 0687 _ 01. D0
        lea     edx, [eax+3H]                           ; 0689 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 068C _ 8B. 45, 08
        add     edx, eax                                ; 068F _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0691 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0695 _ 88. 02
?_018:  movsx   eax, byte [ebp-5H]                      ; 0697 _ 0F BE. 45, FB
        and     eax, 08H                                ; 069B _ 83. E0, 08
        test    eax, eax                                ; 069E _ 85. C0
        jz      ?_019                                   ; 06A0 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 06A2 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 06A5 _ 8B. 45, FC
        add     eax, edx                                ; 06A8 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 06AA _ 0F AF. 45, 0C
        mov     edx, eax                                ; 06AE _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 06B0 _ 8B. 45, 10
        add     eax, edx                                ; 06B3 _ 01. D0
        lea     edx, [eax+4H]                           ; 06B5 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 06B8 _ 8B. 45, 08
        add     edx, eax                                ; 06BB _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 06BD _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 06C1 _ 88. 02
?_019:  movsx   eax, byte [ebp-5H]                      ; 06C3 _ 0F BE. 45, FB
        and     eax, 04H                                ; 06C7 _ 83. E0, 04
        test    eax, eax                                ; 06CA _ 85. C0
        jz      ?_020                                   ; 06CC _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 06CE _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 06D1 _ 8B. 45, FC
        add     eax, edx                                ; 06D4 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 06D6 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 06DA _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 06DC _ 8B. 45, 10
        add     eax, edx                                ; 06DF _ 01. D0
        lea     edx, [eax+5H]                           ; 06E1 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 06E4 _ 8B. 45, 08
        add     edx, eax                                ; 06E7 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 06E9 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 06ED _ 88. 02
?_020:  movsx   eax, byte [ebp-5H]                      ; 06EF _ 0F BE. 45, FB
        and     eax, 02H                                ; 06F3 _ 83. E0, 02
        test    eax, eax                                ; 06F6 _ 85. C0
        jz      ?_021                                   ; 06F8 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 06FA _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 06FD _ 8B. 45, FC
        add     eax, edx                                ; 0700 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0702 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0706 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0708 _ 8B. 45, 10
        add     eax, edx                                ; 070B _ 01. D0
        lea     edx, [eax+6H]                           ; 070D _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 0710 _ 8B. 45, 08
        add     edx, eax                                ; 0713 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0715 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0719 _ 88. 02
?_021:  movsx   eax, byte [ebp-5H]                      ; 071B _ 0F BE. 45, FB
        and     eax, 01H                                ; 071F _ 83. E0, 01
        test    eax, eax                                ; 0722 _ 85. C0
        jz      ?_022                                   ; 0724 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0726 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0729 _ 8B. 45, FC
        add     eax, edx                                ; 072C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 072E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0732 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0734 _ 8B. 45, 10
        add     eax, edx                                ; 0737 _ 01. D0
        lea     edx, [eax+7H]                           ; 0739 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 073C _ 8B. 45, 08
        add     edx, eax                                ; 073F _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0741 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0745 _ 88. 02
?_022:  add     dword [ebp-4H], 1                       ; 0747 _ 83. 45, FC, 01
?_023:  cmp     dword [ebp-4H], 15                      ; 074B _ 83. 7D, FC, 0F
        jle     ?_014                                   ; 074F _ 0F 8E, FFFFFE8A
        leave                                           ; 0755 _ C9
        ret                                             ; 0756 _ C3
                                                        ; showFont8 End of function

init_mouse_cursor:                                      ; Function begin
        push    ebp                                     ; 0757 _ 55
        mov     ebp, esp                                ; 0758 _ 89. E5
        sub     esp, 20                                 ; 075A _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 075D _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0760 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0763 _ C7. 45, FC, 00000000
        jmp     ?_030                                   ; 076A _ E9, 000000B1

?_024:  mov     dword [ebp-8H], 0                       ; 076F _ C7. 45, F8, 00000000
        jmp     ?_029                                   ; 0776 _ E9, 00000097

?_025:  mov     eax, dword [ebp-4H]                     ; 077B _ 8B. 45, FC
        shl     eax, 4                                  ; 077E _ C1. E0, 04
        mov     edx, eax                                ; 0781 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0783 _ 8B. 45, F8
        add     eax, edx                                ; 0786 _ 01. D0
        add     eax, cursor.1572                        ; 0788 _ 05, 00000080(d)
        movzx   eax, byte [eax]                         ; 078D _ 0F B6. 00
        cmp     al, 42                                  ; 0790 _ 3C, 2A
        jnz     ?_026                                   ; 0792 _ 75, 17
        mov     eax, dword [ebp-4H]                     ; 0794 _ 8B. 45, FC
        shl     eax, 4                                  ; 0797 _ C1. E0, 04
        mov     edx, eax                                ; 079A _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 079C _ 8B. 45, F8
        add     eax, edx                                ; 079F _ 01. D0
        mov     edx, eax                                ; 07A1 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 07A3 _ 8B. 45, 08
        add     eax, edx                                ; 07A6 _ 01. D0
        mov     byte [eax], 0                           ; 07A8 _ C6. 00, 00
?_026:  mov     eax, dword [ebp-4H]                     ; 07AB _ 8B. 45, FC
        shl     eax, 4                                  ; 07AE _ C1. E0, 04
        mov     edx, eax                                ; 07B1 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 07B3 _ 8B. 45, F8
        add     eax, edx                                ; 07B6 _ 01. D0
        add     eax, cursor.1572                        ; 07B8 _ 05, 00000080(d)
        movzx   eax, byte [eax]                         ; 07BD _ 0F B6. 00
        cmp     al, 79                                  ; 07C0 _ 3C, 4F
        jnz     ?_027                                   ; 07C2 _ 75, 17
        mov     eax, dword [ebp-4H]                     ; 07C4 _ 8B. 45, FC
        shl     eax, 4                                  ; 07C7 _ C1. E0, 04
        mov     edx, eax                                ; 07CA _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 07CC _ 8B. 45, F8
        add     eax, edx                                ; 07CF _ 01. D0
        mov     edx, eax                                ; 07D1 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 07D3 _ 8B. 45, 08
        add     eax, edx                                ; 07D6 _ 01. D0
        mov     byte [eax], 7                           ; 07D8 _ C6. 00, 07
?_027:  mov     eax, dword [ebp-4H]                     ; 07DB _ 8B. 45, FC
        shl     eax, 4                                  ; 07DE _ C1. E0, 04
        mov     edx, eax                                ; 07E1 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 07E3 _ 8B. 45, F8
        add     eax, edx                                ; 07E6 _ 01. D0
        add     eax, cursor.1572                        ; 07E8 _ 05, 00000080(d)
        movzx   eax, byte [eax]                         ; 07ED _ 0F B6. 00
        cmp     al, 46                                  ; 07F0 _ 3C, 2E
        jnz     ?_028                                   ; 07F2 _ 75, 1A
        mov     eax, dword [ebp-4H]                     ; 07F4 _ 8B. 45, FC
        shl     eax, 4                                  ; 07F7 _ C1. E0, 04
        mov     edx, eax                                ; 07FA _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 07FC _ 8B. 45, F8
        add     eax, edx                                ; 07FF _ 01. D0
        mov     edx, eax                                ; 0801 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0803 _ 8B. 45, 08
        add     edx, eax                                ; 0806 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0808 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 080C _ 88. 02
?_028:  add     dword [ebp-8H], 1                       ; 080E _ 83. 45, F8, 01
?_029:  cmp     dword [ebp-8H], 15                      ; 0812 _ 83. 7D, F8, 0F
        jle     ?_025                                   ; 0816 _ 0F 8E, FFFFFF5F
        add     dword [ebp-4H], 1                       ; 081C _ 83. 45, FC, 01
?_030:  cmp     dword [ebp-4H], 15                      ; 0820 _ 83. 7D, FC, 0F
        jle     ?_024                                   ; 0824 _ 0F 8E, FFFFFF45
        leave                                           ; 082A _ C9
        ret                                             ; 082B _ C3
                                                        ; init_mouse_cursor End of function

putblock:                                               ; Function begin
        push    ebp                                     ; 082C _ 55
        mov     ebp, esp                                ; 082D _ 89. E5
        sub     esp, 16                                 ; 082F _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 0832 _ C7. 45, FC, 00000000
        jmp     ?_034                                   ; 0839 _ EB, 50

?_031:  mov     dword [ebp-8H], 0                       ; 083B _ C7. 45, F8, 00000000
        jmp     ?_033                                   ; 0842 _ EB, 3B

?_032:  mov     edx, dword [ebp+1CH]                    ; 0844 _ 8B. 55, 1C
        mov     eax, dword [ebp-4H]                     ; 0847 _ 8B. 45, FC
        add     eax, edx                                ; 084A _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 084C _ 0F AF. 45, 0C
        mov     ecx, dword [ebp+18H]                    ; 0850 _ 8B. 4D, 18
        mov     edx, dword [ebp-8H]                     ; 0853 _ 8B. 55, F8
        add     edx, ecx                                ; 0856 _ 01. CA
        add     eax, edx                                ; 0858 _ 01. D0
        mov     edx, eax                                ; 085A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 085C _ 8B. 45, 08
        add     edx, eax                                ; 085F _ 01. C2
        mov     eax, dword [ebp-4H]                     ; 0861 _ 8B. 45, FC
        imul    eax, dword [ebp+24H]                    ; 0864 _ 0F AF. 45, 24
        mov     ecx, eax                                ; 0868 _ 89. C1
        mov     eax, dword [ebp-8H]                     ; 086A _ 8B. 45, F8
        add     eax, ecx                                ; 086D _ 01. C8
        mov     ecx, eax                                ; 086F _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 0871 _ 8B. 45, 20
        add     eax, ecx                                ; 0874 _ 01. C8
        movzx   eax, byte [eax]                         ; 0876 _ 0F B6. 00
        mov     byte [edx], al                          ; 0879 _ 88. 02
        add     dword [ebp-8H], 1                       ; 087B _ 83. 45, F8, 01
?_033:  mov     eax, dword [ebp-8H]                     ; 087F _ 8B. 45, F8
        cmp     eax, dword [ebp+10H]                    ; 0882 _ 3B. 45, 10
        jl      ?_032                                   ; 0885 _ 7C, BD
        add     dword [ebp-4H], 1                       ; 0887 _ 83. 45, FC, 01
?_034:  mov     eax, dword [ebp-4H]                     ; 088B _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 088E _ 3B. 45, 14
        jl      ?_031                                   ; 0891 _ 7C, A8
        leave                                           ; 0893 _ C9
        ret                                             ; 0894 _ C3
                                                        ; putblock End of function

intHandlerFromC:                                        ; Function begin
        push    ebp                                     ; 0895 _ 55
        mov     ebp, esp                                ; 0896 _ 89. E5
        sub     esp, 24                                 ; 0898 _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 089B _ A1, 00000100(d)
        mov     dword [ebp-14H], eax                    ; 08A0 _ 89. 45, EC
        movzx   eax, word [?_048]                       ; 08A3 _ 0F B7. 05, 00000104(d)
        cwde                                            ; 08AA _ 98
        mov     dword [ebp-10H], eax                    ; 08AB _ 89. 45, F0
        movzx   eax, word [?_049]                       ; 08AE _ 0F B7. 05, 00000106(d)
        cwde                                            ; 08B5 _ 98
        mov     dword [ebp-0CH], eax                    ; 08B6 _ 89. 45, F4
        sub     esp, 8                                  ; 08B9 _ 83. EC, 08
        push    32                                      ; 08BC _ 6A, 20
        push    32                                      ; 08BE _ 6A, 20
        call    io_out8                                 ; 08C0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08C5 _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 08C8 _ C6. 45, EB, 00
        sub     esp, 12                                 ; 08CC _ 83. EC, 0C
        push    96                                      ; 08CF _ 6A, 60
        call    io_in8                                  ; 08D1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08D6 _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 08D9 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 08DC _ 0F B6. 45, EB
        sub     esp, 8                                  ; 08E0 _ 83. EC, 08
        push    eax                                     ; 08E3 _ 50
        push    keyinfo                                 ; 08E4 _ 68, 00000108(d)
        call    fifo8_put                               ; 08E9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08EE _ 83. C4, 10
        nop                                             ; 08F1 _ 90
        leave                                           ; 08F2 _ C9
        ret                                             ; 08F3 _ C3
                                                        ; intHandlerFromC End of function

charToHexVal:                                           ; Function begin
        push    ebp                                     ; 08F4 _ 55
        mov     ebp, esp                                ; 08F5 _ 89. E5
        sub     esp, 4                                  ; 08F7 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 08FA _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 08FD _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 0900 _ 80. 7D, FC, 09
        jle     ?_035                                   ; 0904 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 0906 _ 0F B6. 45, FC
        add     eax, 55                                 ; 090A _ 83. C0, 37
        jmp     ?_036                                   ; 090D _ EB, 07

?_035:  movzx   eax, byte [ebp-4H]                      ; 090F _ 0F B6. 45, FC
        add     eax, 48                                 ; 0913 _ 83. C0, 30
?_036:  leave                                           ; 0916 _ C9
        ret                                             ; 0917 _ C3
                                                        ; charToHexVal End of function

charToHexStr:                                           ; Function begin
        push    ebp                                     ; 0918 _ 55
        mov     ebp, esp                                ; 0919 _ 89. E5
        sub     esp, 20                                 ; 091B _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 091E _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 0921 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0924 _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 092B _ 0F B6. 45, EC
        and     eax, 0FH                                ; 092F _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 0932 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 0935 _ 0F BE. 45, FB
        push    eax                                     ; 0939 _ 50
        call    charToHexVal                            ; 093A _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 093F _ 83. C4, 04
        mov     byte [?_047], al                        ; 0942 _ A2, 00000013(d)
        movzx   eax, byte [ebp-14H]                     ; 0947 _ 0F B6. 45, EC
        shr     al, 4                                   ; 094B _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 094E _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 0951 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 0955 _ 0F BE. C0
        push    eax                                     ; 0958 _ 50
        call    charToHexVal                            ; 0959 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 095E _ 83. C4, 04
        mov     byte [?_046], al                        ; 0961 _ A2, 00000012(d)
        mov     eax, keyval                             ; 0966 _ B8, 00000010(d)
        leave                                           ; 096B _ C9
        ret                                             ; 096C _ C3
                                                        ; charToHexStr End of function

wait_KBC_sendready:                                     ; Function begin
        push    ebp                                     ; 096D _ 55
        mov     ebp, esp                                ; 096E _ 89. E5
        sub     esp, 8                                  ; 0970 _ 83. EC, 08
?_037:  sub     esp, 12                                 ; 0973 _ 83. EC, 0C
        push    100                                     ; 0976 _ 6A, 64
        call    io_in8                                  ; 0978 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 097D _ 83. C4, 10
        and     eax, 02H                                ; 0980 _ 83. E0, 02
        test    eax, eax                                ; 0983 _ 85. C0
        jnz     ?_038                                   ; 0985 _ 75, 02
        jmp     ?_039                                   ; 0987 _ EB, 02

?_038:  jmp     ?_037                                   ; 0989 _ EB, E8

?_039:  leave                                           ; 098B _ C9
        ret                                             ; 098C _ C3
                                                        ; wait_KBC_sendready End of function

init_keyboard:                                          ; Function begin
        push    ebp                                     ; 098D _ 55
        mov     ebp, esp                                ; 098E _ 89. E5
        sub     esp, 8                                  ; 0990 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 0993 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0998 _ 83. EC, 08
        push    96                                      ; 099B _ 6A, 60
        push    100                                     ; 099D _ 6A, 64
        call    io_out8                                 ; 099F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09A4 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 09A7 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 09AC _ 83. EC, 08
        push    71                                      ; 09AF _ 6A, 47
        push    96                                      ; 09B1 _ 6A, 60
        call    io_out8                                 ; 09B3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09B8 _ 83. C4, 10
        nop                                             ; 09BB _ 90
        leave                                           ; 09BC _ C9
        ret                                             ; 09BD _ C3
                                                        ; init_keyboard End of function

enable_mouse:                                           ; Function begin
        push    ebp                                     ; 09BE _ 55
        mov     ebp, esp                                ; 09BF _ 89. E5
        sub     esp, 8                                  ; 09C1 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 09C4 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 09C9 _ 83. EC, 08
        push    212                                     ; 09CC _ 68, 000000D4
        push    100                                     ; 09D1 _ 6A, 64
        call    io_out8                                 ; 09D3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09D8 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 09DB _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 09E0 _ 83. EC, 08
        push    244                                     ; 09E3 _ 68, 000000F4
        push    96                                      ; 09E8 _ 6A, 60
        call    io_out8                                 ; 09EA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09EF _ 83. C4, 10
        nop                                             ; 09F2 _ 90
        leave                                           ; 09F3 _ C9
        ret                                             ; 09F4 _ C3
                                                        ; enable_mouse End of function

intHandlerForMouse:                                     ; Function begin
        push    ebp                                     ; 09F5 _ 55
        mov     ebp, esp                                ; 09F6 _ 89. E5
        sub     esp, 24                                 ; 09F8 _ 83. EC, 18
        sub     esp, 8                                  ; 09FB _ 83. EC, 08
        push    32                                      ; 09FE _ 6A, 20
        push    160                                     ; 0A00 _ 68, 000000A0
        call    io_out8                                 ; 0A05 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A0A _ 83. C4, 10
        sub     esp, 8                                  ; 0A0D _ 83. EC, 08
        push    32                                      ; 0A10 _ 6A, 20
        push    32                                      ; 0A12 _ 6A, 20
        call    io_out8                                 ; 0A14 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A19 _ 83. C4, 10
        sub     esp, 12                                 ; 0A1C _ 83. EC, 0C
        push    96                                      ; 0A1F _ 6A, 60
        call    io_in8                                  ; 0A21 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A26 _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 0A29 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0A2C _ 0F B6. 45, F7
        sub     esp, 8                                  ; 0A30 _ 83. EC, 08
        push    eax                                     ; 0A33 _ 50
        push    mouseinfo                               ; 0A34 _ 68, 00000120(d)
        call    fifo8_put                               ; 0A39 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A3E _ 83. C4, 10
        leave                                           ; 0A41 _ C9
        ret                                             ; 0A42 _ C3
                                                        ; intHandlerForMouse End of function

fifo8_init:                                             ; Function begin
        push    ebp                                     ; 0A43 _ 55
        mov     ebp, esp                                ; 0A44 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0A46 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0A49 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 0A4C _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0A4F _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 0A52 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 0A55 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0A57 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0A5A _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 0A5D _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0A60 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0A63 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 0A6A _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0A6D _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 0A74 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0A77 _ C7. 40, 08, 00000000
        nop                                             ; 0A7E _ 90
        pop     ebp                                     ; 0A7F _ 5D
        ret                                             ; 0A80 _ C3
                                                        ; fifo8_init End of function

fifo8_put:                                              ; Function begin
        push    ebp                                     ; 0A81 _ 55
        mov     ebp, esp                                ; 0A82 _ 89. E5
        sub     esp, 4                                  ; 0A84 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0A87 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0A8A _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0A8D _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0A90 _ 8B. 40, 10
        test    eax, eax                                ; 0A93 _ 85. C0
        jnz     ?_040                                   ; 0A95 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 0A97 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 0A9A _ 8B. 40, 14
        or      eax, 01H                                ; 0A9D _ 83. C8, 01
        mov     edx, eax                                ; 0AA0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0AA2 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 0AA5 _ 89. 50, 14
        mov     eax, 4294967295                         ; 0AA8 _ B8, FFFFFFFF
        jmp     ?_042                                   ; 0AAD _ EB, 50

?_040:  mov     eax, dword [ebp+8H]                     ; 0AAF _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0AB2 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0AB4 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0AB7 _ 8B. 40, 04
        add     edx, eax                                ; 0ABA _ 01. C2
        movzx   eax, byte [ebp-4H]                      ; 0ABC _ 0F B6. 45, FC
        mov     byte [edx], al                          ; 0AC0 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 0AC2 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0AC5 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 0AC8 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0ACB _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0ACE _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0AD1 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0AD4 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0AD7 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0ADA _ 8B. 40, 0C
        cmp     edx, eax                                ; 0ADD _ 39. C2
        jnz     ?_041                                   ; 0ADF _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0AE1 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0AE4 _ C7. 40, 04, 00000000
?_041:  mov     eax, dword [ebp+8H]                     ; 0AEB _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0AEE _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 0AF1 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 0AF4 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0AF7 _ 89. 50, 10
        mov     eax, 0                                  ; 0AFA _ B8, 00000000
?_042:  leave                                           ; 0AFF _ C9
        ret                                             ; 0B00 _ C3
                                                        ; fifo8_put End of function

fifo8_get:                                              ; Function begin
        push    ebp                                     ; 0B01 _ 55
        mov     ebp, esp                                ; 0B02 _ 89. E5
        sub     esp, 16                                 ; 0B04 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 0B07 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 0B0A _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0B0D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0B10 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0B13 _ 39. C2
        jnz     ?_043                                   ; 0B15 _ 75, 07
        mov     eax, 4294967295                         ; 0B17 _ B8, FFFFFFFF
        jmp     ?_045                                   ; 0B1C _ EB, 51

?_043:  mov     eax, dword [ebp+8H]                     ; 0B1E _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0B21 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0B23 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0B26 _ 8B. 40, 08
        add     eax, edx                                ; 0B29 _ 01. D0
        movzx   eax, byte [eax]                         ; 0B2B _ 0F B6. 00
        movzx   eax, al                                 ; 0B2E _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 0B31 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0B34 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0B37 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 0B3A _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0B3D _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0B40 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0B43 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0B46 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0B49 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0B4C _ 8B. 40, 0C
        cmp     edx, eax                                ; 0B4F _ 39. C2
        jnz     ?_044                                   ; 0B51 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0B53 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0B56 _ C7. 40, 08, 00000000
?_044:  mov     eax, dword [ebp+8H]                     ; 0B5D _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0B60 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 0B63 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0B66 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0B69 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 0B6C _ 8B. 45, FC
?_045:  leave                                           ; 0B6F _ C9
        ret                                             ; 0B70 _ C3
                                                        ; fifo8_get End of function

fifo8_status:                                           ; Function begin
        push    ebp                                     ; 0B71 _ 55
        mov     ebp, esp                                ; 0B72 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0B74 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 0B77 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0B7A _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0B7D _ 8B. 40, 10
        sub     edx, eax                                ; 0B80 _ 29. C2
        mov     eax, edx                                ; 0B82 _ 89. D0
        pop     ebp                                     ; 0B84 _ 5D
        ret                                             ; 0B85 _ C3
                                                        ; fifo8_status End of function


fontA:                                                  ; oword
        db 00H, 18H, 18H, 18H, 18H, 24H, 24H, 24H       ; 0000 _ .....$$$
        db 24H, 7EH, 42H, 42H, 42H, 0E7H, 00H, 00H      ; 0008 _ $~BBB...

keyval:                                                 ; byte
        db 30H, 58H                                     ; 0010 _ 0X

?_046:  db 00H                                          ; 0012 _ .

?_047:  db 00H, 00H, 00H, 00H, 00H                      ; 0013 _ .....

mousePos.1507:                                          ; dword
        dd 00000010H, 00000000H                         ; 0018 _ 16 0

table_rgb.1525:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0020 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0060 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0068 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0070 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0078 _ ........

cursor.1572:                                            ; byte
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH       ; 0080 _ ********
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2EH, 2EH       ; 0088 _ ******..
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0090 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 0098 _ OOOO*...
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00A0 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 00A8 _ OOO*....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00B0 _ *OOOOOOO
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00B8 _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00C0 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00C8 _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00D0 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00D8 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00E0 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00E8 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00F0 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00F8 _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2AH, 4FH       ; 0100 _ *OOOO**O
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0108 _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2AH       ; 0110 _ *OOO*..*
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0118 _ OOO*....
        db 2AH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0120 _ *OO*....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 0128 _ *OOO*...
        db 2AH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0130 _ *O*.....
        db 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH       ; 0138 _ .*OOO*..
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0140 _ **......
        db 2EH, 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH       ; 0148 _ ..*OOO*.
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0150 _ *.......
        db 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 4FH, 2AH       ; 0158 _ ...*OOO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0160 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 2AH       ; 0168 _ ....*OO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0170 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 2AH, 2AH       ; 0178 _ .....***


mcursor:                                                ; byte
        resb    256                                     ; 0000

bootInfo:                                               ; qword
        resb    4                                       ; 0100

?_048:  resw    1                                       ; 0104

?_049:  resw    1                                       ; 0106

keyinfo:                                                ; byte
        resb    24                                      ; 0108

mouseinfo:                                              ; byte
        resb    32                                      ; 0120

keybuf:                                                 ; yword
        resb    64                                      ; 0140

mousebuf:                                               ; byte
        resb    128                                     ; 0180

showPos.1498:                                           ; dword
        resd    1                                       ; 0200