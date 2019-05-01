Public Num_to_bin

model tiny
.code

;------------------------------------------------------------------------------
;Print bin number
;
;Entry:
;	num - number
;	seg - segment
;	pointer 
;	colour 
;Exit:
;	ax - num of put bytes
;Destr:
;	bx, cx, dx
;
;------------------------------------------------------------------------------


Num_to_bin proc
	
		push bp
		mov bp, sp

		push si
		push es
		
	
		mov bx, [bp + 06h]
		mov es, bx
		
		mov ax, [bp + 04h]

		mov bx, [bp + 08h]
		add bx, 20h
		
		xor cx, cx
		mov si, [bp + 0ah]
		shl si, 8

		While_convert:
		mov dx, ax;
		shr dx, cl;				copy 
		and dx, 0001h
		add dx, '0';				% 2 (ASCII)
		or dx, si;				Colouor
		mov word ptr es:[bx], dx
		sub bx, 2
		add cl, 1
		cmp cl, 10h
		jb While_convert

		pop es
		pop si
		pop bp

		mov ax, 20h
ret 08h

endp

end