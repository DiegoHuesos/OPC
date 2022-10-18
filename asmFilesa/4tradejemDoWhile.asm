TITLE Ejercicio 4tradejemDoWhile

; Descripcion:
; Ejemplo de implementacion de Estructuras Algoritmicas. 

INCLUDE Irvine32.inc

.DATA
; Textos para la Consola
mcr=0Dh
mlf=0Ah
mnul=0h
titulo BYTE mcr, mlf, "Traduccion de Estructuras algoritmicas.", mcr, mlf, mnul
prompt01 BYTE "IF-THEN sin signo.", mnul
prompt02 BYTE "IF-THEN-ELSE con signo.", mnul
prompt03 BYTE "WHILE.", mnul
prompt04 BYTE "DO-WHILE.", mnul
prompt05 BYTE mcr, mlf, "ADIOS.", mcr, mlf, mnul

; Variables
uno    SDWORD 8   ; 8, luego 12
dos    SDWORD 9
cuatro SDWORD ?
 
.CODE
; Procedimiento principal
main PROC
	mov edx,OFFSET titulo
	call WriteString
	call Crlf

	
	; DO-WHILE con signo
	mov edx,OFFSET prompt04
	call WriteString
	call Crlf

       ; do - while( uno + 3 <= dos )
iniDo1:
	    mov EAX, uno
	    sub EAX, 7
	    mov cuatro, EAX
	    inc uno
	MOV EBX, uno
	ADD EBX, 3
	CMP EBX, dos
	JLE iniDo1    ; <=

	mov eax, uno
	call WriteInt  ; de eax
	call Crlf

	
	; ADIOS
	mov edx,OFFSET prompt05
	call WriteString
	call Crlf
	call Crlf
	
       exit
main ENDP
; Termina el procedimiento principal

; Termina el area de Ensamble
END main