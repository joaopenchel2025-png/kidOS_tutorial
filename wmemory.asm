;=====================================================
;KidOS - Memory Library Rotines
;Created by JP
;Version 1.0.0
;=====================================================

%IFNDEF __WMEMORY_LIB__
%DEFINE __WMEMORY_LIB__

; Window Memory Configurations ______________________________

%DEFINE WindowAddress 0800h:0200h

%DEFINE Window_Bar 3000h
%DEFINE Window_Widht 3001h
%DEFINE Window_Height 3003h
%DEFINE Window_PositionX 3005h
%DEFINE Window_PositionY 3007h
%DEFINE Window_Bar_Color 3009h
%DEFINE Window_Border_Color 300Ah
%DEFINE Window_Back_Color 300Bh
%DEFINE ButtonClose 300Ch
%DEFINE ButtonMaximise 300Dh
%DEFINE ButtonMinimize 300Eh

M_InitialPositionX dw 0000h
M_InitialPositionY dw 0000h


StateWindowBar dw 0000h
SavePositionX dw 0000h
SavePositionY dw 0000h
SaveWidth dw 0000h
SaveHeight dw 0000h

%ENDIF


