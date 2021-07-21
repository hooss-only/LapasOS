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
	
read:
	mov ax, 0x1000	;Es:BX 1000:0000
	mov es, ax
	mov bx, 0
	
	mov ah, 2	;디스크에 있는 데이터를 es:bx의 주소로
	mov al, 1	;1섹터를 읽을 것이다.
	mov ch, 0	;0번째 실린더
	mov cl, 2	;2번째 섹터부터 읽기 시작한다.
	mov dh, 0	;헤드는 0
	mov dl, 0	;드라이브 = 0, A:드라이브
	int 0x13	;Read
	
	jc read
	
	jmp 0x1000:0000
	
msgBack db '.', 0xF0
	times 510 - ($ - $$) db 0
	dw 0xAA55