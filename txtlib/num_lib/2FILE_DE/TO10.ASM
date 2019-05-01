Public Num_to_dec

model tiny
.code

;------------------------------------------------------------------------------
;Entry: 
;	num - number
;	seg - segment
;	poiner of start
;	colour
;Exit:
;	ax - num of put byte
;Destr:
;	bx, cx, dx
;
;------------------------------------------------------------------------------



Num_to_dec proc	
		push bp
		mov bp, sp

		push si
		push es
		
		mov ax, [bp + 04h]
		mov dx, 0000h
		mov bx, [bp + 06h]
		mov es, bx

		mov cx, 0005h
		mov bx, 000ah	
			
		While_ram_dec:
		cmp ax, 0000h
		jbe break
		mov dx, 0000h
		div bx
		add dx, '0'
		push dx
		loop While_ram_dec	
		break:


		mov ax, 0005h
		sub ax, cx

		mov bx, [bp + 08h]
		mov si, [bp + 0ah]
		shl si, 8
		
		xor cx, cx
		
		while_pop_dec:
		pop dx
		or dx, si
		mov word ptr es:[bx], dx
		inc bx
		inc bx
		inc cx
		cmp cx, ax
		jb while_pop_dec


		pop si
		pop es
		pop bp

ret 08h	

endp

end 