TITLE Ejercicio Procedimiento suma tres operandos

; Descripcion:
; Ejemplo de uso de un procedimiento.

INCLUDE Irvine32.inc

.DATA

.CODE
; Procedimiento principal
main PROC
	; Argumentos de Sum3
	mov EBX, 20
	mov ECX, 10
	mov EDX, 30
	call Sum3
	; Resultado en EAX
	mov EAX, EBX
	call WriteInt
	call CrLf

	EXIT
main ENDP
; Termina el procedimiento principal

;---------------------------------------------------------
Sum3 PROC    ; Sum3(EBX, ECX, EDX)
; Calculates and returns the sum of three 32-bit integers.
; Receives: EBX, ECX, EDX, the three integers. May be
; signed or unsigned.     Like Irvine
; Returns: EBX = sum, and the status flags (Carry,
; Overflow, etc.) are changed.    Like Irvine
; Requires: nothing
;---------------------------------------------------------
	ADD EBX,ECX
	ADD EBX,EDX
	RET
Sum3 ENDP

; Termina el area de Ensamble
END main