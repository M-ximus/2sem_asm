global _strlen 

		section .text
;------------------------------------------------------------------------------
;Entry:
;	char* string
;Exit:
;	rax - length
;Distr:
;	rax, rbx
;------------------------------------------------------------------------------

_strlen:	
		push rbp
		mov rbp, rsp
		
		push rdi

		
		mov rbx, [rbp + 16]
		mov rdi, rbx			;rdi = string
		xor rcx, rcx			;rcx = 0
		dec rcx			    	;rcx = 2^64 - 1
		xor ax, ax			;ax  = /0
		cld
		repne scasb
		
		sub rdi, rbx
		mov rax, rdi	

		pop rdi
		pop rbp 

ret	0x08
