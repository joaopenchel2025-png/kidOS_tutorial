[bits 16]
[org 0x0000]

jmp OSMain

;_____________________________
;Directives and Inclusions____





;_____________________________
;Starting the System _________

OSMain:
	call ConfigSegment
	call ConfigStack


;_____________________________
;Kernel Functions ____________

ConfigSegment:
	mov ax, es
	mov ds, ax
	ret

ConfigStack:
	mov ax, 7d00h
	mov ss, ax
	mov sp, 03feh
	ret

END:
	int 19h


;_____________________________
;System Functions ____________

PrintString:
	mov ah, 09h
	mov bh, [Pagination]
	mov bl, 1111_0001b
	mov cx, 1
	mov al, [si]
	print:
		int 10h
		inc si
		call MoveCursor
		mov ah, 09h
		mov al, [si]
		cmp al, 0
		jne print
	ret

MoveCursor:
	mov ah, 02h
	mov bh, [Pagination]
	inc dl
	int 10h
	ret

