TITLE *MASM Template	(slide19.asm)*

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
    mov EAX, 0
    call DumpRegs

    mov EAX, 1
	mov EBX, 0
    neg valB
	mov BL, valB
    call DumpRegs

    mov EAX, 2
    neg valB+1
	mov BL, valB+1
    call DumpRegs

    mov EAX, 3
    neg valC
	mov BL, valC
    call DumpRegs
    
    exit
main ENDP
; Termina el procedimiento principal

; Termina el area de Ensamble
END main
