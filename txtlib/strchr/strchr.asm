		global _strchr

		section .text

;------------------------------------------------------------------------------
;Entry:
;		char* string
;		char  symbol
;Exit:
;		rax - address of first symbol or Null if it didn't find symbol
;Distr:
;		rbx, rcx, dl
;------------------------------------------------------------------------------

_strchr:	
		push rbp
		mov rbp, rsp
		
		push rdi

		
		mov rdi, [rbp + 16]
		xor rcx, rcx			;rcx = 0
		mov al, [rbp + 24]

find_symbol:
		mov dl, [rdi]
		cmp al, dl
		je ret_address

find_zero:
		cmp cl, dl 
		je break
		inc rdi
		jmp find_symbol
		
break:
		xor rdi, rdi
		

ret_address:
		mov rax, rdi
			
		pop rdi
		pop rbp 

ret	0x10
