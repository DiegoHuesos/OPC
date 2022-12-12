TITLE Tests

; Irvine Library procedures and functions
INCLUDE Irvine32.inc

; imprime una cadena sin modificar registros
PRINT MACRO str
	PUSH EDX
	MOV EDX, OFFSET str
	CALL WriteString
	POP EDX
ENDM

; imprime una cadena con salto de línea sin modificar registros
PRINTLN MACRO str
	PUSH EDX
	MOV EDX, OFFSET str
	CALL WriteString
	CALL CRLF
	POP EDX
ENDM

; imprime un entero sin modificar registros
PRINTLN_INT MACRO int
	PUSH EAX
	MOV EAX, int
	CALL WriteDec
	CALL CRLF
	POP EAX
ENDM

; imprime un arreglo sin modificar registros
DUMP_MEM MACRO array
	PUSH ESI
	PUSH ECX
	PUSH EBX
	
	MOV ESI, OFFSET array
	MOV ECX, LENGTHOF array
	MOV EBX, TYPE array
	CALL DUMPMEM
	
	POP EBX
	POP ECX
	POP ESI
ENDM

.DATA
arrayW WORD 1000h, 2000h, 3000h
array DWORD 12345678h, 9ABCDEF1h, 23456789h

.CODE
main PROC
	MOV ESI, 0
	SHR array[ESI + 8], 1
	DUMP_MEM array

	RCR array[ESI + 4], 1
	DUMP_MEM array
	
	RCR array[ESI], 1
	DUMP_MEM array
	
	PRINTLN adios

    EXIT
main ENDP

END main
