[org 0]
[bits 16]
	jmp 0x07C0:start
start:
	mov ax, 0x1000 ; es:bx 1000:0000 => segment:offset
	mov es, ax ;set es to 1000
	mov bx, 0 ;set bx to 0

	mov ah, 2 ;fetch the es:bx address
	mov al, 1 ;read sector 1 => bootmaster Sector
	mov ch, 0
	mov cl, 2 ;read sector 2 => kernel Sector
	mov dh, 0 ;head to 0
	mov dl, 0
	int 0x13 ;read Sectors

	jc read;if Read error occur, re-start to read Kernel
	
	jmp 0x1000:0000 ;this is es:bx
