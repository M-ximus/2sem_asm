global _to_hex

;------------------------------------------------------------------------------
;Entry:
;	char* buff - buffer for saving hex num
;	int(long - max 64 bit) - num that you need  hex form
;Exit:
;	rax - length of new num
;Destr:
;
;------------------------------------------------------------------------------

		section .text
_to_hex:
		push rbp
		mov rbp, rsp

		push rdi
		push rsi
		push r10

		mov rdi, [rbp + 16]
		mov rax, [rbp + 24]
		
		xor rcx, rcx
;-----------------------------------------------------------------------------
		cmp rax, rcx
		jne no_zero_num

		mov cl, '0'
		mov [rdi], cl
		inc rax;		return 1// ONE SYMBOL
		jmp finishing
;------------------------------------------------------------------------------

no_zero_num:
		mov bl, 0x0f;		matrix of last 4 bits
		xor rcx, rcx
		xor rsi, rsi

while_size:
		mov rdx, rax
		shr rdx, cl
		add cl, 4
		inc rsi
		cmp rdx, 0
		jne while_size

;------------------------------------------------------------------------------
;rsi  = size of new string for addressing
		
		dec rsi;		for addressing in array	
		xor rcx, rcx
		mov r10, rax;		copy of num
		mov rdx, rbx;		matrix
		mov rbx, Hex_table

while_no_zero:
		mov rax, r10
		shr rax, cl
		dec rsi		

		and al, dl
		xlatb
		mov [rdi + rsi], al
		add cl, 4
		cmp rsi, 0
		jne while_no_zero

		shr rcx, 2
		mov rax, rcx

finishing:
		pop r10
		pop rsi
		pop rdi
		pop rbp

ret 0x10

		section .data

Hex_table:	db "0123456789abcdef"

