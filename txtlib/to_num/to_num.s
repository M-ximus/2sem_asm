global _to_bin
global _to_hex
global _to_dec

		section .text
;------------------------------------------------------------------------------
;Entry:
;	char* buff - buffer for saving bin num
;	int(long - max 64 bit) - num that you need bin form
;Exit:
;	rax - length of new num
;Destr:
;
;------------------------------------------------------------------------------

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

;------------------------------------------------------------------------------
;Entry:
;	char* buff - buffer for saving hex num
;	int(long - max 64 bit) - num that you need  hex form
;Exit:
;	rax - length of new num
;Destr:
;
;------------------------------------------------------------------------------


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
		jne no_zero_hex

		mov cl, '0'
		mov [rdi], cl
		inc rax;		return 1// ONE SYMBOL
		jmp finishing_hex
;------------------------------------------------------------------------------

no_zero_hex:
		mov bl, 0x0f;		matrix of last 4 bits
		xor rcx, rcx
		xor rsi, rsi

while_size_hex:
		mov rdx, rax
		shr rdx, cl
		add cl, 4
		inc rsi
		cmp rdx, 0
		jne while_size_hex

;------------------------------------------------------------------------------
;rsi  = size of new string for addressing
		
		dec rsi;		for addressing in array	
		xor rcx, rcx
		mov r10, rax;		copy of num
		mov rdx, rbx;		matrix
		mov rbx, Hex_table

while_no_zero_hex:
		mov rax, r10
		shr rax, cl
		dec rsi		

		and al, dl
		xlatb
		mov [rdi + rsi], al
		add cl, 4
		cmp rsi, 0
		jne while_no_zero_hex

		shr rcx, 2
		mov rax, rcx

finishing_hex:
		pop r10
		pop rsi
		pop rdi
		pop rbp

ret 0x10

		section .data

Hex_table:	db "0123456789abcdef"

