global _strcpy

;------------------------------------------------------------------------------
;Entry:
;	char* destptr - pointer to string where you want to copy
;	char* srcptr  - pointer to the source
;Exit:
;	pointer to destptr
;Destr:
;	rbx, rcx
;	Flags
;
;------------------------------------------------------------------------------
		section .txt

_strcpy:

		push rbp
		mov  rbp, rsp
		
		push rdi
		push rsi
		
		xor al, al
		mov rbx, [rbp + 24]
		mov rdi, rbx
		xor rcx, rcx
		dec rcx
		cld
		repne scasb

		sub rdi, rbx
		mov rcx, rdi
		mov rsi, rbx
		mov rax, [rbp + 16]
		mov rdi, rax
		rep movsb

		pop rsi
		pop rdi
		pop rbp

ret 0x10
