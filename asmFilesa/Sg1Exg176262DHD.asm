TITLE Segundo examen

;DIEGO HERNANDEZ DELGADO
;176262

; Display <=N strings.

; Irvine Library procedures and functions
INCLUDE Irvine32.inc

.DATA
arrCade	BYTE "u1n1o1", 12
	BYTE "d2o2s2", 23
	BYTE "t3r3e3", 34
	BYTE "c4u4a4", 45
	BYTE "c5i5n5", 56
	BYTE "s6e6i6", 67
	BYTE "s7i7e7", 78
	BYTE "o8c8h8", 89
	BYTE "n9u9e9", 90
	BYTE "dAiAeA", 101
	BYTE "oBnBcB", 112
	BYTE "dCoCcC", 123
N	SDWORD 12	; Total de strings
T	SDWORD ?	; Tamaño de cada string
CU BYTE "176262DHD", 0
long BYTE "Longitud de cadena string: ", 0
lista BYTE "Lista de strings:==========", 0
stringN BYTE "String ", 0
dosPuntos BYTE ": ", 0
adios BYTE "ADIOS", 0
i DWORD 0

.CODE
main PROC

	;Clave Unica
	call Crlf
	MOV EDX, OFFSET CU
	call WriteString
	call Crlf

	;Longitud de cada string
	MOV EDX, OFFSET long
	call WriteString
	MOV T, LENGTHOF arrCade
	DEC T
	MOV EAX, T
	call WriteInt
	call Crlf

	;Lista de strings
	MOV EDX, OFFSET lista
	call WriteString
	call Crlf

	MOV EBX, 0  ; ebx = i = 0
	MOV ESI, OFFSET arrCade
	.WHILE EBX < N
		
		;Cambia los numeros del final por 0
		MOV EDI, ESI
		ADD EDI, T
		MOV BYTE PTR [EDI], 0

		;Imprime nuumero de string y los dos puntos
		MOV EDX, OFFSET stringN
		call WriteString
		MOV EAX, EBX ; EAX = i
		INC EAX
		call WriteInt
		MOV EDX, OFFSET dosPuntos
		call WriteString
		
		;Imprime el string desedo
		MOV EDX, ESI
		call WriteString
		call Crlf
		
		;INcrementa el offset y el contador
		ADD ESI, T
		INC ESI
		INC EBX ; i++
	.ENDW
		
	;ADIOS
	MOV EDX, OFFSET adios
	call Crlf
	call WriteString
	call Crlf

    EXIT
main ENDP

END main