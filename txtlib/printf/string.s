global _start

extern myprintf 

		section .text

_start:
		push r10
		push r11

		push '!'
		push 100
		push 3802
		mov r9,  Love
		mov r8,  0xffff
		mov rcx, 0x07
		mov rdx, 3
		mov rsi, Strings
		mov rdi, Text

		call myprintf

		add rsp, rax		

		pop r11
		pop r10

		mov rax, 0x3c
		xor rdi, rdi
		syscall
		
		section .data

Strings:	db "Stop singing!", 0x00
Love:		db "love", 0x00
Text:		db "Tema, f%%%%%%!%s It's %d am and I have pointer =  %x! No OS uses %b buffers! ", 0x0a, "and I %s %x %d %% %c", 0x00
