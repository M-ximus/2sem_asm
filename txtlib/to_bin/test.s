global _start

extern _to_bin

		section .text

_start:
		push 0x0f0f
		push buff
		call _to_bin

		mov rax, 0x3c
		xor rdi, rdi
		syscall

		section .data

buff:	db "------------------------------------------------------------------"

