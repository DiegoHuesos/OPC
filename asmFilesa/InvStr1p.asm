TITLE Program Template          (InvStr.asm)

; Este programa invierte un String.

INCLUDE Irvine32.inc

.data
unaCade BYTE "Gabriel Garcia Marquez",0
tamCade DWORD LENGTHOF unaCade - 1

.code
main PROC
    ; Despliega el string en estado original.
	call Crlf
	mov EDX, OFFSET unaCade
	call Writestring
	call Crlf

    ; Guardar el nombre en el stack, caracter por caracter.
	mov ESI, 0 ; OFFSET unaCade
	mov ECX, 0    ; var de control
	.WHILE ECX < tamCade
    	movzx EBX, unaCade [ESI * TYPE unaCade]	; tomar caracter, alternativa  mov BL, [ESI]
	    push EBX	; push en stack
	    inc ESI   ; apunta al siguiente caracter
	    inc ECX   ; var. de control
	.ENDW

    ; Pop el nombre del stack, en reversa,
    ; y almacenarlo en el arreglo unaCade.
	mov ESI, 0 ; OFFSET unaCade
	mov ECX, 0    ; var de control
	.WHILE ECX < tamCade
	    pop EBX	; sacar caracter
	    mov unaCade[ESI * TYPE unaCade], BL
	    inc ESI   ; apunta al siguiente caracter
	    inc ECX   ; var. de control
	.ENDW

    ; Despliega el string invertido.
	call Crlf
	mov EDX, OFFSET unaCade
	call Writestring
	call Crlf

	EXIT
main ENDP
END main