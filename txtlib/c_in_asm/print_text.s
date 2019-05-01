global main

extern printf

		section .text
main:
		push r10
		push r9

		mov rdi, Format
		mov rsi, Text
		mov rdx, 123
		xor rax, rax

		call printf 

		pop r9
		pop r10

		mov rax, 0x3c
		xor rdi, rdi
ret

		section .data
Format:	db "Tema %s %d!", 0x0a, 0x00
Text:	db "the best", 0x00
		
