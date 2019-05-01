global _to_dec

;------------------------------------------------------------------------------
;Entry:
;	char* buff - buffer for saving string of dec num
;	int (long - max 64 bits) - num that you what to export to dec
;Exit:
;	size_t - num of symbols
;Destr:
;
;Flags:
;
;------------------------------------------------------------------------------

		section .text
_to_dec:
		push rbp
		mov rbp, rsp

		push rdi
		push rsi

		mov rsi, [rbp + 16];	pointer to buff
		mov rax, [rbp + 24]

		xor rdx, rdx
		cmp rax, rdx
		jne no_zero_dec

		mov dl, '0'
		mov [rsi], dl
		mov rax, 1
		jmp finish_dec

no_zero_dec:
		
		xor rdi, rdi
		mov rbx, 0x0a

while_size_dec:
		inc rdi
		xor rdx, rdx
		div rbx 
		cmp rax, 0
		jne while_size_dec

		mov rcx, rdi		

		mov rax, [rbp + 24]		

while_print_dec:
		dec rdi
		xor rdx, rdx
		div rbx
		add rdx, '0'
		mov [rsi + rdi], dl
		cmp rdi, 0
		jne while_print_dec

		mov rax, rcx

finish_dec:
		pop rsi
		pop rdi
		pop rbp

ret 0x10
