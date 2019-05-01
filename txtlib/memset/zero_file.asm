global _start

extern _memset

		section .text

_start:
		push 0x0a
		push Test_text
		call _memset

		mov rax, 60
		xor rcx, rcx
		syscall

		section .data

Test_text: db "Artem pido"
