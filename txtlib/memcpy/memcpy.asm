global _memcpy

		section .text
_memcpy:
		push rbp
		mov  rbp, rsp
		
		push rdi
		push rsi

		mov  rdi, [rbp + 16]
		mov  rax, rdi
		mov  rsi, [rbp + 24]
		mov  rcx, [rbp + 32]
		cld
		rep  movsb

		pop rsi
		pop rdi
		pop rbp

ret 0x18 	
