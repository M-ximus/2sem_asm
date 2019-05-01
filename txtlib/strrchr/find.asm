global _start

extern _strrchr

		section .text
_start:
		push 0x0061
		push Test_text
		call _strrchr

		mov rax, 60
		xor rdi, rdi
		syscall

		section .data
Test_text:	db "artem a ddhb a A", 0x0a, 0x00
