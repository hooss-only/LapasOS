[org 0]
[bits 16]
	jmp 0x07C0:start
start:
	mov ax, 0xb800
	mov es, ax
	mov byte[es:0], 'L'
	mov byte[es:1], 0x0F
	mov byte[es:2], 'A'
	mov byte[es:3], 0x0F
	mov byte[es:4], 'P'
	mov byte[es:5], 0x0F
	mov byte[es:6], 'A'
	mov byte[es:7], 0x0F
	mov byte[es:8], 'S'
	mov byte[es:9], 0x0F

	jmp $

	times 510 - ($ - $$) db 0
	dw 0xAA55