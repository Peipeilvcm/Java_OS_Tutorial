ckernel_u.asm : ckernel.o
	/home/baohua/Desktop/objconv/./objconv  -fnasm ckernel.o ckernel.asm
ckernel.o : main.o win_sheet.o mem_util.o
	ld -m elf_i386 -r main.o mem_util.o win_sheet.o -o ckernel.o
main.o : main.c win_sheet.c win_sheet.h mem_util.c mem_util.h
	gcc -m32 -fno-asynchronous-unwind-tables -s -c -o main.o main.c
win_sheet.o : win_sheet.c win_sheet.h
	gcc -m32 -fno-asynchronous-unwind-tables -s -c -o win_sheet.o win_sheet.c
mem_util.o : mem_util.h mem_util.c
	gcc -m32 -fno-asynchronous-unwind-tables -s -c -o mem_util.o mem_util.c
