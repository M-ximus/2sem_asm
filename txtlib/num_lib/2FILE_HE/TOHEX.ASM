Public Num_to_hex

model tiny

.code

;------------------------------------------------------------------------------
;Print hex number
;
;Entry:
;	num - number
;	seg - segment
;	pointer in segment 	
;	colour
;Exit:
;	none
;Destr:
;	ax, bx, cx, dx
;
;------------------------------------------------------------------------------


Num_to_hex proc 	
			push bp
			mov bp, sp
			
			push si
			push es

			mov bx, [bp + 06h] 
			mov es, bx

			mov dx, [bp + 04h]
			
			mov bx, offset Table_ASC
			xor cx, cx			
			
			mov si, [bp + 0ah]
			shl si, 8			
;------------------------------------------------------------------------------
;ax - will be change (register for operations)
;bx - address of special convert Table
;cx - 0000h - counter
;dx - original of number
;si - colour | ASCII
;------------------------------------------------------------------------------	
			While_push_hex:
			
			mov ax, dx
			shr ax, cl
			and ax, 000fh
			xlat Table_ASC
			or si, ax
			push si
			xor si, ax
			add cl, 04h
			cmp cl, 10h
			jb While_push_hex
;------------------------------------------------------------------------------
			
			mov bx, [bp + 08h]
			
			mov cx, bx
			add cx, 4 * 2;				cx += bx + 4 * 2 // hex number - 4 pixels
	
			While_print:

			pop ax
			mov word ptr es:[bx], ax
			add bx, 2
			cmp bx, cx
			jb While_print


			pop es
			pop si
			pop bp

			mov ax, 08h
			
ret 08h

endp

.data

Table_ASC db '0123456789ABCDEF'

end 
	