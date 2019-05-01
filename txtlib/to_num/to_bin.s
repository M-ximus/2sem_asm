global _to_bin

;------------------------------------------------------------------------------
;Entry:
;	char* buff - buffer for saving bin num
;	int(long - max 64 bit) - num that you need bin form
;Exit:
;	rax - length of new num
;Destr:
;
;------------------------------------------------------------------------------

		section .text
_to_bin:
		push rbp
		mov rbp, rsp

		push rdi
		push rsi

		mov rdi, [rbp + 16]
		mov rax, [rbp + 24]

		mov bl, 00000001b
		xor rcx, rcx

while_size_bin:
		mov rdx, rax
		shr rdx, cl
		inc cl
		cmp rdx, 0
		jne while_size_bin

;------------------------------------------------------------------------------
;cl = size of new string

		dec rcx;		for addressing
		mov rsi, rcx
		xor rcx, rcx

while_no_zero_bin:
		mov rdx, rax
		shr rdx, cl
		dec rsi	

		and dl, bl
		add dl, '0'
		mov [rdi + rsi], dl
		inc cl
		cmp rsi, 0
		jne while_no_zero_bin

		mov rax, rcx

		pop rsi
		pop rdi
		pop rbp

ret 0x10
