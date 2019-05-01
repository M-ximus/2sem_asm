model tiny
.code

extrn Num_to_hex:near

org 100h

start:
	push 004eh
	push 0640h
	push 0b800h
	push 0f0fh
	call Num_to_hex

	mov dl, 43h
	mov ax, 0200h
	int 21h

	mov ax, 4c00h
	int 21h

end start