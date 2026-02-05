;=====================================================
;KidOS - Monitor Library Rotines
;Created by JP
;Version 1.0.0
;=====================================================

%IFNDEF __MONITOR_LIB__
%DEFINE __MONITOR_LIB__

; Main Strings _______________________________________

NameSystem db "KidOS",0

; Window Configurations ______________________________

Count dw 0

BackWidth dw 0000h
BackHeight dw 0000h
BackColor db 46
Pagination db 0
CursorX db 15
CursorY db 12
State db 0

; Rotine Library _____________


; Define Video Mode and cursor standard position_________

VGA.SetVideoMode:
	mov ah, 00h
	mov al, 13h
	int 10h
	mov ax, 320
	mov WORD[BackWidth], ax
	mov ax, 200
	mov WORD[BackHeight], ax
	call DrawPixelConfig
	ret

;Function paint pixel

DrawPixelConfig:
	mov ah, 0ch
	mov al, [BackColor]
	mov cx, 0
	mov dx, 0
	ret
	
;Paint Background

DrawBackground:
	int 10h
	inc cx
	cmp cx, WORD[BackWidth]
	jne DrawBackground
	mov cx, 0
	inc dx
	cmp dx, WORD[BackHeight]
	jne DrawBackground
	mov dx, 0
	ret

;Print Functions

PrintString:
        mov ah, 09h
        mov bh, [Pagination]
        ;mov bl, 1111_0001b
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

; Effect Initialization

EffectInit:
	mov bl, 44
	start:
		mov dh, [CursorY]
		mov dl, [CursorX]
		call MoveCursor
		mov si, NameSystem
		call PrintString
		pusha
		mov bl, [State]
		cmp bl, 0
		je Increment
	Increment:
		popa
		inc bl
		call Waiting
		cmp bl, 50
		jne start
		pusha
		mov bl, 1
		mov byte[State], bl
		popa
	Decrement:
		popa
		dec bl
		call Waiting
		cmp bl, 44
		jne start
		pusha
		mov bl, 0
		mov [State], bl
		mov bx, [Count]
		inc bx
		mov [Count], bx
		cmp bx, 5000
		jne ReturnLoop
		jmp ReturnProg
	ReturnLoop:
		popa
		jmp start
	ReturnProg:
		popa
		ret
	ret

Waiting:
	pusha
	mov bx, 0
	time:
		inc bx
		cmp bx, 50000
		jne time
	popa
	ret






; End ________________________

%ENDIF


