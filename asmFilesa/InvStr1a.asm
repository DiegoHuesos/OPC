TITLE Invierte String     (InvStr.asm)

; Este programa invierte un String.
; Diego Hernández Delgado
; 176262

INCLUDE Irvine32.inc

.data
unaCade BYTE "Gabriel Garcia Marquez",0
tamCade DWORD LENGTHOF unaCade - 1
endCade DWORD ?


.code
main PROC

	; Define la dirección donde termina el arreglo en la variable endCade = offset unaCade + tamCade
	mov eax, offset unaCade
	add endCade, eax
	mov eax, tamCade
	add endCade, eax

	;Imprime la cadena original
	call Crlf
	call Crlf
	mov edx, OFFSET unaCade
	call Writestring
	call Crlf

	;Push the elements of the array into the stack
	mov esi, OFFSET unaCade		;Recordar que ESI y EDI se usan para guardar direcciones de memoria
	.WHILE( esi < endCade )
		mov ax, [esi]	
		push ax					;La unidad mínima que maneja el stack son 2 bytes (word)--> ax
		inc esi
	.ENDW

	;Pop and move the elements of the stack into the array in the new order
	mov esi, OFFSET unaCade
	.WHILE( esi < endCade )
		pop ax	
		mov [esi], al		;Aunque popeamos ax (2 bytes), el valor que nos interesa (1 byte) está en al
		inc esi 
	.ENDW


	;Imprime la cadena ya invertida
	call Crlf
	mov edx, OFFSET unaCade
	call Writestring
	call Crlf
	call Crlf

	EXIT
main ENDP
END main