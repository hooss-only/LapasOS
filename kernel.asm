[org 0]
[bits 16]
	
start:
	mov ax, cs
	mov ds, ax
	xor ax, ax ;set 0 to ax
	mov ss, ax

	lea esi, [msgKernel]
    mov ax,0xB800
	mov es, ax
	mov edi, 0

	call printf ;load 'print' kernel
	jmp $

printf:
	push eax ;push the stack
	add edi, 160

printf_loop:
	mov al,byte[esi]
	mov byte [es:edi], al
	or al, al
	jz printf_end ;jump if ZF=0
	inc edi
	mov byte[es:edi], 0x06
	inc esi
	inc edi
	jmp printf_loop

prinf_end:
	pop eax
	ret ;pop the stack

msgKernel db "We are in kernel program",0