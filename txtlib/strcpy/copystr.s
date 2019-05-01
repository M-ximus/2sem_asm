global _start

extern _strcpy

		section .text

_start:
		push From
		push Copy
		call _strcpy

		mov rax, 60
		xor rdi, rdi
		syscall

		section .data

From: 	db "Tema the best!", 0x00
Copy:	db "Artem pidoras!", 0x00
