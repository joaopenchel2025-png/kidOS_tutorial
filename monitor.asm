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

BackWidth dw 0000h
BackHeight dw 0000h
BackColor db 46
Paginatin db 0
CursorX db 15
Cursory db 12
State db 0
Key db 0
count dw 0

; Rotine Library _____________


; Define Video Mode __________

VGA.SetVideoMode:
	mov ah, 00h
	mov al, 13h
	int 10h


	




; End ________________________

%ENDIF


