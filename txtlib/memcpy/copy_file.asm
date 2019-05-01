global _start

extern _memcpy

		section .text

_start:
		push 10
		push Orig
		push Copy
		call _memcpy

		mov rax, 60
		xor rdi, rdi
		syscall

		section .data
Copy: db "Nooooooooo"
Orig: db "Yessssssss"

