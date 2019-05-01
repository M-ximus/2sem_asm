global _strrchr

;------------------------------------------------------------------------------
;Entry:
;	char* string (pointer to the string start, string must have EOF
;	char  symbol - symbol that you need to find
;Exit:
;	char* symbol - pointer to the last symbol like your
;Distr:
;	bl, dx
;Flags
;	
;------------------------------------------------------------------------------

		section .text

_strrchr:
		push rbp
		mov  rbp, rsp

		push rdi
		mov  rdi, [rbp + 16]
		xor  rax, rax
		mov  dx , [rbp + 24]
		mov  dh , 0x00
		
check_symb:	
		mov  bl , [rdi]
		cmp  bl , dl
		jne  not_symb
		mov  rax, rdi
not_symb:
		inc  rdi
		cmp  bl , dh
		jne  check_symb

		pop  rdi
		pop  rbp
			
ret 0x10	
