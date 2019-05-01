global myprintf

extern _printf

		section .text
myprintf:
		pop r14;	save address 
		
		push r9
		push r8
		push rcx
		push rdx
		push rsi
		push rdi;	parametres like cdcl

		call _printf

		add rsp, 0x30
		sub rax, 0x30;	for stack in caller
		push r14;	address for return

ret
