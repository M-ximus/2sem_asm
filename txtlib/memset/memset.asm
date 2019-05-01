global _memset

		section .text
_memset:
		push rbp
		mov  rbp, rsp

		push rdi
		
		mov rdi, [rbp + 16]
		mov rbx, rdi
		mov rcx, [rbp + 24]
		xor al, al
		cld
		rep stosb

		pop rdi
		pop rbp

		mov rax, rbx

ret 0x10
		
