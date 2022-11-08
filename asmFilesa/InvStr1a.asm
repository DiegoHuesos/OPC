TITLE Program Template          (InvStr.asm)

; Este programa invierte un String.

INCLUDE Irvine32.inc

.data
unaCade BYTE "Gabriel Garcia Marquez",0
tamCade DWORD LENGTHOF unaCade - 1

.code
main PROC


    ; Despliega el string invertido.
	call Crlf
	mov edx, OFFSET unaCade
	movzx eax, edx 
	.WHILE( )
	.ENDW
	call Writestring
	call Crlf

	EXIT
main ENDP
END main