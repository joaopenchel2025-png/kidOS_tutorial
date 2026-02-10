[bits 16]
[org 0200h]




pusha
    call DefineWindow
popa
    jmp ReturnKernel

; Inclusion Files

%INCLUDE "wmemory.lib"

DefineWindow:
    mov ah, 0ch
    mov al, byte[Window_Border_Color]
    mov cx, word[Window_PositionX]
    mov dx, word[Window_PositionY]
    cmp byte[Window_Bar], 0
    je WindowNoBar
    jmp Rets

WindowNoBar:
    mov bx, [Window_Widht]
    add bx, cx
    LineRight:
        int 10h
        inc cx
        cmp cx, bx
        jne LineRight
        mov bx, [Window_Height]
        add bx, dx
    LineDown:
        int 10h
        inc dx
        cmp dx, bx
        jne LineDown
        mov bx, [Window_PositionX]
    LineLeft:
        int 10h
        dec cx
        cmp cx, bx
        jne LineLeft
        mov bx, [Window_PositionY]
    LineUp:
        int 10h
        dec dx
        cmp dx, bx
        jne LineUp
    ret

Rets:
    ret

ReturnKernel:
    ret
