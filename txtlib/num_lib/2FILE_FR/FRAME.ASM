Public Frame
model tiny
.code

LHX = 10
LHY = 10
RLX = 70
RLY = 20
;-------------------------------------------------------------------------------
;Print colour frame
;
;Entry:
;	lx - x coordinate of left top point
;	ly - y coordinate of left top point
;	rx - x coordinate of right bottom point
;	ry - y coordinate of right bottom point
;	colour
;Exit:
;	no exit param
;Distr:
;	ax, bx, cx, dx
;
;-------------------------------------------------------------------------------
Frame proc
	
		push bp
		mov bp, sp
		
		push si
		push es;				save registers
;-------------------------------------------------------------------------------		
	
		mov ax, 0b800h;				address of video mem 
		mov es, ax
	
		mov cx, [bp + 08h];			rx	
		mov ax, [bp + 04h];			lx		
		sub cx, ax;				cx = rx - lx
		shl cx, 1;				cx = (rx - lx) * 2

		mov bx, [bp + 06h];			ly
		mov dx, bx
		shl dx, 7
		shl bx, 5
		add bx, dx;				bx = ly*160

		mov ax, [bp + 0ah]
		mov dx, ax
		shl ax, 7
		shl dx, 5
		add dx, ax;				dx = ry*160
	
		mov ax, [bp + 04h]
		shl ax, 1;				ax = lx * 2
		add bx, ax; 				bx = 160*ly + 2*lx
		
		mov ax, [bp + 0ch];			ax = colour		
		shl ax, 8	
		mov al, 0bah;				ax = colour + symbol

;-------------------------------------------------------------------------------
;ax colour | symbol
;bx = 160*ly + 2*lx - start position
;cx = 2 * (rx - lx) - right line
;dx = ry * 160 	    - stop position
;-------------------------------------------------------------------------------
		while_g: 
		mov word ptr es:[bx], ax
		add bx, cx
		mov word ptr es:[bx], ax
		sub bx, cx
		add bx, 160
		cmp bx, dx
		jb while_g
;-------------------------------------------------------------------------------	

		mov bx, [bp + 06h]
		mov ax, bx
		shl ax, 5
		shl bx, 7
		add bx, ax;					bx = 160 * ly 
		
		mov ax, [bp + 04h]
		shl ax, 1
		add bx, ax;					bx = 160 * ly + 2 * lx * 

		mov dx, bx
		sub dx, ax
		mov ax, [bp + 08h]
		shl ax, 1
		add dx, ax;					dx = 160 * ly + 2 * rx

		mov cx, [bp + 0ah]
		mov ax, [bp + 06h]
		add cx, ax
		mov cx, ax
		shl cx, 7
		shl ax, 5
		add cx, ax;					cx = 160 * (ry - ly)		
	
		mov ax, [bp + 0ch]
		shl ax, 8
		mov al, 0cdh;	ax = colour | symbol

;------------------------------------------------------------------------------
;ax - colour | symbol
;bx = 160 * ly + 2 * lx - start pixel
;cx = 160 * (ry - ly)   - jump to bottom line
;dx = 160 * ly + 2 * rx - stop pixel
;------------------------------------------------------------------------------		
		while_h:
		mov word ptr es:[bx], ax
		add bx, cx
		mov word ptr es:[bx], ax
		sub bx, cx
		add bx, 2
		cmp bx, dx
		jb while_h	
;------------------------------------------------------------------------------	
	
		mov al, 0c9h;					new symbol	

		mov bx, [bp + 04h]
		shl bx, 1;					bx = lx * 2

		mov cx, [bp + 06h]
		mov dx, cx
		shl dx, 5
		shl cx, 7
		add cx, dx;					cx = ly * 160

		add bx, cx		

		mov word ptr es:[bx], ax
;------------------------------------------------------------------------------		
	
		mov al, 0bbh
		
		mov bx, cx;					bx = ly * 160
		mov dx, [bp + 08h]
		shl dx, 1;					dx = rx * 2
		add bx, dx
		
		mov word ptr es:[bx], ax
;------------------------------------------------------------------------------
		mov al, 0c8h	

		mov cx, [bp + 0ah]
		mov dx, cx
		shl dx, 5
		shl cx, 7
		add cx, dx;					cx = ry * 160 

		mov bx, [bp + 04h]
		shl bx, 1
		add bx, cx

		mov word ptr es:[bx], ax
;------------------------------------------------------------------------------
		
		mov al, 0bch		
	
		mov bx, [bp + 08h]
		shl bx, 1
		add bx, cx;					bx = ry * 160 + rx * 2

		mov word ptr es:[bx], ax
;------------------------------------------------------------------------------
		
		mov bx, [bp + 06h]
		add bx, 1
		mov dx, bx
		shl dx, 5
		shl bx, 7
		add bx, dx	
		
		mov cx, [bp + 04h]
		shl cx, 1
		
		add bx, cx;					bx = ly * 160 + lx * 2
		add bx, 2

		mov dx, [bp + 0ah]
		mov cx, dx
		shl dx, 7
		shl cx, 5
		add dx, cx;					dx = ry * 160 
		
		mov cx, [bp + 06h]
		add cx, 1
		mov ax, cx
		shl ax, 7
		shl cx, 5
		add cx, ax
		mov ax, [bp + 08h]
		shl ax, 1
		add cx, ax;					cx = ly * 160 + rx * 2

		mov ax, [bp + 0ch]
		shl ax, 8
		

		mov si, bx
		
		while_space_horiz:
		

		while_space_vertic:
		mov word ptr es:[bx], ax
		add bx, 2
		cmp bx, cx
		jb while_space_vertic

		add si, 160
		mov bx, si
		add cx, 160
		cmp bx, dx
		jb while_space_horiz

;------------------------------------------------------------------------------

		pop es
		pop si
		pop bp
ret 0ah 
	
endp

end