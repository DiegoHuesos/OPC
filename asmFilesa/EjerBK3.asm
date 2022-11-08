TITLE Ejercicio

INCLUDE Irvine32.inc

;mis simbolos
mcr = 0Dh
mlf = 0Ah
mnul = 00h

.DATA

cha BYTE ?

;Strings
leeVal BYTE mcr, mlf, "Teclee el caracter: ", mnul
txtChar BYTE mcr, mlf,"   Caracter: ",mcr, mlf
prompt05 BYTE mcr, mlf, "ADIOS.", mcr, mlf, mnul


.CODE

main PROC
	mov edx, OFFSET leeVal
	call WriteString
	call ReadChar
	call CrLf
	mov cha,AL
	
	mov edx, OFFSET txtChar
	call WriteChar
	call CrLf

	.if AL == 'D'
		inc AL
		mov edx, OFFSET txtChar
		call WriteChar
	.else
		.if AL== 'G'
			sub AL,1
			mov edx, OFFSET txtChar
			call WriteChar
		.else 
			mov edx, OFFSET txtChar
			call WriteChar
		.endif
	.endif

	

main ENDP

END main
