global _start

extern _printf

		section .text

_start:
		push '!'
		push 100
		push 3802
		push Love
		push 0xffff
		push 0x07
		push 3
		push Strings
		push Text
		call _printf
		add rsp, rax		

		mov rax, 0x3c
		xor rdi, rdi
		syscall
		
		section .data

Strings:	db "Stop singing!", 0x00
Love:		db "love", 0x00
Text:		db "Tema, f%%%%%%!%s It's %d am and I have pointer =  %x! No OS uses %b buffers! ", 0x0a, "and I %s %x %d %% %c", 0x00
