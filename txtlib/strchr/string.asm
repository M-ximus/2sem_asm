global _start

extern _strchr

		section .text

_start:
		push 0x0061
		push Test_string
		call _strchr

		mov rax, 0x3c
		xor rdi, rdi
		syscall

		section .data
Test_string: db "Artem the best!", 0x0a, 0x00
