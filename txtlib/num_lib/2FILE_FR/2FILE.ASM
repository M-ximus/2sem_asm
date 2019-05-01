model tiny
.code

extrn Frame:near

org 100h

start: 	
	
	push 004eh	
	push 0014h
	push 0070d
	push 000ah
	push 000ah
	nop
	nop
	nop
	nop
	nop
	call Frame

	mov ax, 4c00h
	int 21h

end start