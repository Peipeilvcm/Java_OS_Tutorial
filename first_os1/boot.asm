org  0x7c00     ;org �����7c00 �������ڴ��ַ

;��ʼ������
jmp  entry      ;��ת,����ռ3�ֽ�
db   0x90       ;memory[0x7c00+3] = 0x90,1�ֽ�
DB   "OSKERNEL" ;strcpy(memory + 0x7c00 + 3 + 1, ��OSKERNEL��)
DW   512        ;512>256,2�ֽڲ��ܴ�
DB   1          ;
DW   1
DB   2
DW   224
DW   2880
DB   0xf0
DW   9
DW   18
DW   2
DD   0
DD   2880
DB   0,0,0x29   ;�����ֽ�
DD   0xFFFFFFFF ;�洢��4���ֽ���
DB   "MYFIRSTOS  "
DB   "FAT12   "
RESB  18        ;��������18�ֽڶ���ֵΪ0

entry:
    mov  ax, 0  ; ax���ֽڣ��൱��java�е�char
    mov  ss, ax ; �൱��char ss = ax
    mov  ds, ax
    mov  es, ax
    mov  si, msg    ;msg��ַ����si,char *si=msg

putloop:
    mov  al, [si]   ;char al = *si,ȡ��ַ��һ�ֽڳ���,ֱ������0
    add  si, 1      ;��ַ��1�ֽ�
    cmp  al, 0      ; �ж��Ƿ�Ϊ0
    je   fin
    mov  ah, 0x0e   ;ahΪ0e,����ַ�asciiֵ����al,bhΪ0,�ַ���ɫ��blֵ��
    mov  bx, 15
    int  0x10       ;��ӡ�жϣ��൱�ں������ã��⺯�����ŵ�һ�������ȡ��0x10������
    jmp  putloop

fin:
    HLT     ;CPU����,������ѭ��
    jmp  fin

;����һ���ڴ�
msg:
    DB    0x0a,  0x0a
    db    "hello, world"
    db    0x0a
    db    0