TITLE EjerBL

; Uso de instrucciones selectivas y repetitivas.

; Irvine Library procedures and functions
INCLUDE Irvine32.inc

; SÍMBOLOS
micr = 0Dh
milf = 0Ah
minu = 00h

.DATA
n	DWORD 4

txtn	BYTE "Teclee el siguiente dato: ", minu
txtst	BYTE "Siguiente valor en reversa: ", minu
adios BYTE micr, milf, "ADIOS.", micr, milf, minu


.CODE
main PROC
; Escriba comentarios

	; Lectura de los cuatro valores enteros decimales
	
	; Escritura de los cuatro valores en orden inverso

	mov EDX, OFFSET adios
	call WriteString
	exit
main ENDP

END main