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

.DATA
    finp SDWORD ?
    dirRet DWORD ?

.CODE
;---------------------------------------------------------
; Passing a label argument content using stack, adding it with 15h.
; Receives: via stack the argument, an int value. A signed one.
; Returns: result via stack 
; Requires: nothing
nomPro PROC    ;nomPro(finp)
    pop dirRet
    pop finp
	add finp, 15h
	push finp
	push dirRet
	RET   ;return finp
nomPro ENDP

; Termina el area de Ensamble
END main