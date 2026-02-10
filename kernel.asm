;=====================================================
;KidOS - Kernel Library Rotines
;Created by JP
;Version 1.0.0
;=====================================================

[bits 16]
[org 0x0000]

jmp OSMain

;Directives and Inclusions

%INCLUDE "monitor.lib"
%INCLUDE "wmemory.lib"
; %INCLUDE "disk.lib"

;Starting the System 

OSMain:
	call ConfigSegment
	call ConfigStack
	call VGA.SetVideoMode
	call DrawBackground
	call EffectInit
	call GraphicInterface
	;call WindowAddress ; 0800h:0200h
	;jmp 0800h:0200h	
	jmp END

;Kernel Functions

GraphicInterface:
	mov byte[Window_Bar], 0
	
	mov byte[Window_PositionX], 5
	mov byte[Window_PositionY], 5
	mov byte[Window_Widht], 100
	mov byte[Window_Height], 150
	mov byte[Window_Border_Color], 55
	call WindowAddress
	mov byte[Window_PositionX], 110
	mov byte[Window_PositionY], 5
	mov byte[Window_Widht], 100
	mov byte[Window_Height], 150
	mov byte[Window_Border_Color], 0
	call WindowAddress
	ret

; 	mov byte[Sector], 3
; 	mov byte[Drive], 80h
; 	mov byte[NumSectors], 1
; 	mov word[SegmentAddr], 0800h
; 	mov word[OffsetAddr], 0500h
; 	call ReadDisk
; 	call WindowAddress
; 	ret

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

; jmp $
	
times 512 - ($-$$) db 0

