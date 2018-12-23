; 8字节数据结构用来查32位地址,字节2,3,4,7组成32位地址
; 字节0,1,及6的前4bits组成20位表示内存长度
; 需要传入3个参数,%1为第一个参数，表明内存地址,与上面2,3,4,7对应
; %2内存长度, 与字节0,1,6h对应
%macro Descriptor 3
    dw    %2  &  0FFFFh
    dw    %1  &  0FFFFh
    db   (%1>>16) & 0FFh
    dw   ((%2 >> 8) & 0F00h) | (%3 & 0F0FFh)
    db   (%1 >> 24) & 0FFh
%endmacro


DA_32		EQU	4000h	; 32 位段
DA_C		EQU	98h	; 存在的只执行代码段属性值
DA_DRW		EQU	92h	; 存在的可读写数据段属性值