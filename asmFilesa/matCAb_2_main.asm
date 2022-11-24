TITLE Ejercicio Procedimiento.

; Descripcion:
; Ejemplo de uso de un procedimiento.
;     Pasaje de argumentos via stack, y returno tambien.
;     Estiquetas locales (?) al procedimiento.

INCLUDE Irvine32.inc

.DATA
    egm SDWORD 2002h
    resul DWORD ?

.CODE
; Procedimiento principal
main PROC
	;.
	;resul=call nomPro(egm)
	push egm
	CALL nomPro
	pop resul
	;.
	mov EAX, resul
	call WriteHex
	call CrLf

	EXIT
main ENDP
; Termina el procedimiento principal

include matCAb_2_proc.asm

; Termina el area de Ensamble
END main

