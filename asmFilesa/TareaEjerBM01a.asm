TITLE Ejercicio 1 de Tarea Ejercicio BM indir

; Descripcion:
; Ejemplo de empleo de Macro Directivas que implementan Estructuras Algoritmicas. 
; Empleo de direccionamiento indirecto con OPERANDOS INDIRECTOS.

; Irvine Library procedures and functions
INCLUDE Irvine32.inc

.DATA
; Textos para la Consola
prompt01 BYTE "Dato n: ",0
prompt02 BYTE "Teclee la ",0
prompt03 BYTE " temperatura: ",0
prompt04 BYTE "Minimo de las temperaturas: ",0
prompt04a BYTE ", posicion: ",0
prompt05 BYTE "Temperatura ",0
prompt05a BYTE ": ",0
prompt05p BYTE ", P",0
prompt05i BYTE ", I",0
prompt07 BYTE "ADIOS.",0
prompt08 BYTE "ERROR por n<0 o n>10. ADIOS.",0

; Variables
n      SDWORD ?
min    SDWORD ?
posmin    SDWORD ?
arrTmp SDWORD 10 DUP(?)
 
.CODE
; Procedimiento principal
main PROC
	call Clrscr

	;a)
	mov EDX, OFFSET prompt01
	call WriteString 
	call ReadInt;  >EAX
	mov n, EAX
	call Crlf

	; b)
	.IF( (n<1) || (n>10) )
		mov EDX, OFFSET prompt08
		call WriteString
		call Crlf
	.ELSE
		;c)
		mov EBX, 1  ;contador
		mov EDX, OFFSET prompt02
		call WriteString
		mov EAX, EBX
		call WriteInt
		mov EDX, OFFSET prompt03
		call WriteString
		call ReadInt  ;1era temperatura --> EAX

		mov min, EAX
		mov posmin, EBX
		mov ESI, OFFSET arrTmp
		mov [ESI], EAX   ;1era temperatura en arreglo
		add ESI, TYPE arrTmp	;apunta el 2do 
		inc EBX		;cuenta para el 2do

		; d) lectura y almacenaje del resto de las temperaturas
		.WHILE( EBX <= n )
			mov EDX, OFFSET prompt02
			call WriteString
			mov EAX, EBX
			call WriteInt

			mov EDX, OFFSET prompt03
			call WriteString
			call ReadInt  ;1era temperatura --> EAX
			mov [ESI], EAX
			add ESI, TYPE arrTmp ; apunta al siguiente
			;calcular el mínimo
			.IF (EAX < min)
				mov min, EAX
				mov posmin, EBX
			.ENDIF

			inc EBX

		.ENDW

		; e) Imprimiendo el mínimo y su posición
		call CRLF 
		mov edx, offset prompt04
		call WriteString 
		mov eax, min
		call WriteInt

		mov edx, offset prompt04a
		call WriteString 
		mov eax, posmin
		call WriteInt
		call Crlf
		call Crlf

		; f) Imprimiendo arrTmp en reversa y calculando P
		mov ebx, n
		mov esi, ebx
		imul esi, TYPE arrTmp  ; n * 4
		add esi, offset arrTmp
		.while (ebx >= 1)
			mov edx, offset prompt05
			call WriteString 
			mov eax, ebx
			call WriteInt

			mov edx, offset prompt05a
			call WriteString 
			; Imprimir temp
			sub esi, type arrTmp
			mov eax, [esi]
			call WriteInt

			;temp par o impar
			and eax, 1  ; ultimo bit
			.if (eax == 0)
				mov edx, offset prompt05p
			.else
				mov edx, offset prompt05i
			.endif
			
			call WriteString 
			call crlf
			dec EBX

		.endw

	.ENDIF
		
	; ADIOS
    	call Crlf
	mov edx,OFFSET prompt07
	call WriteString
	call Crlf



	EXIT
main ENDP
; Termina el procedimiento principal

; Termina el area de Ensamble
END main