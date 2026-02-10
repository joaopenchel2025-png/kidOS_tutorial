;=====================================================
;KidOS - Disk Memory Rotines
;Created by JP
;Version 1.0.0
;=====================================================

%IFNDEF __DISK_LIB__
%DEFINE __DISK_LIB__

;Disk and Memory Configurations______________________

SegmentAddr dw 0000h
OffsetAddr dw 0000h
Sector db 0
Track db 0
Head db 0
Drive db 0
NumSectors db 0

Reader db 02h
Writer db 03h

SectorPerTrack db 0
TrackPerHead db 0

; Rotine Libraries ___________________________________

ReadDisk:
    mov ah, byte[Reader]
    call DiskOperations
    ret

WriteDisk:
    mov ah, byte[Writer]
    call DiskOperations

DiskOperations:
    mov al, byte[NumSectors]
    mov ch, byte[Track]
    mov cl, byte[Sector]
    mov dh, byte[Head]
    mov dl, byte[Drive]
    mov bx, word[SegmentAddr]
    mov cx, word[OffsetAddr]
    int 13h

%ENDIF


