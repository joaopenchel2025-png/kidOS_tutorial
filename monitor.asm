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

Count db 0

BackWidth dw 0000h
BackHeight dw 0000h
BackColor db 1
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
	mov bl, 0
	start:
		mov dh, [CursorY]
		mov dl, [CursorX]
		call MoveCursor
		mov si, NameSystem
		call PrintString
		pusha
		mov bl, [State]
		cmp bl, 0
		jne Decrement
	Increment:
		popa
		inc bl
		call Waiting
		cmp bl, 255
		jne start
		pusha
		mov bl, 1
		mov byte[State], bl
	Decrement:
		popa
		dec bl
		call Waiting
		cmp bl, 0
		jne start
		pusha
		mov bl, 0
		mov [State], bl
		mov bl, [Count]
		inc bl
		mov [Count], bl
		cmp bl, 5
		jne start
		popa
		ret	


 Waiting:
 	pusha
 	mov ah, 86h
 	mov cx, 0000h
 	mov dx, 2000
 	int 15h
 	popa
 	ret
	
; End ________________________

%ENDIF


