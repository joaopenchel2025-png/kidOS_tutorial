[bits 16]
[org 0x0000]

jmp OSMain

;Directives and Inclusions

%INCLUDE "monitor.lib"



;Starting the System 

OSMain:
	call ConfigSegment
	call ConfigStack
	call VGA.SetVideoMode
	call DrawBackground
	call EffectInit
	jmp END

;Kernel Functions

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
	mov ah, 00h
	int 16h
	mov ax, 0040h
	mov ds, ax
	mov ax, 1234h
	mov [0072], ax
	jmp 0ffffh:0000h
	


