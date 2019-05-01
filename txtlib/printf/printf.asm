global _printf

;------------------------------------------------------------------------------
;Entry:
;	char* string - pointer to the format string
;	params
;
;------------------------------------------------------------------------------
		
extern _strchr
extern _strlen
extern _to_bin
extern _to_hex
extern _to_dec

		section .text

_printf:	
		push rbp
		mov  rbp, rsp

		push rdi
		push rsi
		
		xor  r8, r8
		mov  r9, [rbp + 16];	rsi = string
		add  r8, 0x18
		
find_proc:
		push '%'
		push r9
		call _strchr;		find '%'
		cmp rax, 0x00
		jne no_end
		
		push r9
		call _strlen
		
		mov rsi, r9
		mov rdx, rax
		mov rax, 1
		mov rdi, 1
		syscall;	print end of string

		jmp ending
			
no_end:	
		sub rax, r9
		mov rsi, r9
		add r9 , rax;	r9 = strchr(r9, '%')
		mov rdx, rax
		mov rax, 1
		mov rdi, 1
		syscall;	print string before %
			
		inc r9
		mov rax, [r9]; 	param in al
		inc r9;		next possition 

;--------------start of switch-------------------------------------------------

		cmp al, '%'
		jne no_proc
		
		mov rsi, r9
		dec rsi
		mov rax, 1
		mov rdi, 1
		mov rdx, 1
		syscall;	print %
		
		jmp find_proc
no_proc:
		mov rdx, [rbp + r8]
		add r8, 0x08;		param in rdx

		cmp al, 's'
		jne no_str

		push rdx
		call _strlen
		
		mov rsi, rdx
		mov rdi, 1
		mov rdx, rax
		mov rax, 1
		syscall;		print string from param

		jmp find_proc
no_str:

		cmp al, 'c'
		jne no_chr

		mov [buff], rdx;	char in buff
		
		mov rax, 1
		mov rdx, 1
		mov rdi, 1
		mov rsi, buff
		syscall;		print char

		jmp find_proc

no_chr:

		cmp al, 'b'
		jne no_bin

		push rdx;		param in rdx(see no_proc)
		push buff
		call _to_bin

		mov rdx, rax;		length of bin num
		mov rax, 1
		mov rsi, buff
		mov rdi, 1
		syscall;		print buff with bin num

		jmp find_proc


no_bin:
		cmp al, 'd'
		jne no_dec

		push rdx
		push buff
		call _to_dec
		
		mov rdx, rax;		length of dec num
		mov rdi, 1
		mov rsi, buff
		mov rax, 1
		syscall;		print dec num

		jmp find_proc
		
no_dec:
		cmp al, 'x'
		jne no_hex

		push rdx
		push buff
		call _to_hex

		mov rdx, rax
		mov rsi, buff
		mov rax, 1
		mov rdi, 1
		syscall;		print hex num

		jmp find_proc

no_hex:		
ending:
		pop rsi
		pop rdi
		pop rbp

		sub r8, 0x10
		mov rax, r8
ret 

		section .bss
buff:		resb 65

