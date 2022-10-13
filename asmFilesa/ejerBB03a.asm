TITLE ejerBB03a

; Uso de instrucciones, DumpMem, 
;     directivas data y operadores, y símbolos.

; Irvine Library procedures and functions
INCLUDE Irvine32.inc

; SÍMBOLOS
miCr = 0Dh	; Carriage return symbol
miLf = 0Ah	; Line feed symbol

.DATA
rever1  DWORD 2, 11h, 18
    ; falta ...
txtr1	BYTE miCr, miLf, "Contenido de rever1: ", 0
adios   BYTE miCr, miLf, "ADIOS.", miCr, miLf, 0

.CODE
main PROC
	; Imprimir el contenido de la lista rever1	
	mov EDX, OFFSET txtr1
	call WriteString
	mov ESI, OFFSET rever1

	; Desplegar con DumpMem, pasandole el valor a los argumentos
	;    con las directivas operador
	mov ESI, OFFSET rever1
	mov ECX, LENGTHOF rever1
	mov EBX, TYPE rever1

	call DumpMem

	mov EDX, OFFSET adios
	call WriteString
	exit
main ENDP

END main