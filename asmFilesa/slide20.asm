TITLE *MASM Template	(slide20.asm)*

; Descripcion:
; Prueba de Status Flags

; Funciones de libreria
INCLUDE Irvine32.inc

.DATA
valB BYTE 1, 0
valC SBYTE -128

.CODE
; Procedimiento principal
main PROC
    mov EBX, 0
    call DumpRegs

    mov EBX, 1
	mov EAX, 0
	mov AL, -128
    neg AL
    call DumpRegs

    mov EBX, 2
	mov AX, 8000h
    add AX, 2
    call DumpRegs

    mov EBX, 3
	mov AX, 0
    sub AX, 2
    call DumpRegs
    
    mov EBX, 4
	mov AX, 0
	mov AL, -5
    sub AL, +125
    call DumpRegs

    exit
main ENDP
; Termina el procedimiento principal

; Termina el area de Ensamble
END main
