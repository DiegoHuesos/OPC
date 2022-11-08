TITLE EjerBKa
; Uso de macro condicionales selectivas y repetitivas.

; Irvine Library procedures and functions
INCLUDE Irvine32.inc

; SÍMBOLOS
micr = 0Dh
milf = 0Ah
minul = 00h

.DATA
n	SDWORD ?
res DWORD ?
valNeg SDWORD 0
cont SDWORD 1
; Textos para despliegue
txtn	BYTE micr, milf,"Teclee el dato N: ",minul
fact BYTE micr, milf," !"
dp BYTE micr, milf," : "
no_def BYTE "No definido", minul
adios BYTE micr, milf, "ADIOS.", minul

.CODE
main PROC
	mov EDX, OFFSET txtn
	call WriteString
	call ReadDec        ; Dato en EAX, sin signo
	call Crlf

	.if eax<0
		call WriteInt
		mov EDX, OFFSET fact
		call WriteString

		mov EDX, OFFSET dp
		call WriteString

		mov EDX, OFFSET no_def
		call WriteString
		call Crlf
	.else
		.if eax==0
			mov res, 1
			mov EDX, OFFSET fact
			call WriteString

			mov EDX, OFFSET dp
			call WriteString

			mov eax,res
			call WriteInt
			call Crlf
		.else
			mov ebx,1
			call WriteInt
			.while cont<=eax
				imul ebx,cont
				inc cont
			.endw 
			mov EDX, OFFSET fact
			call WriteString

			mov EDX, OFFSET dp
			call WriteString
			mov eax,ebx
			call WriteInt
			call Crlf
		.endif
	.endif

	mov EDX, OFFSET adios
	call WriteString
	EXIT
main ENDP

END main