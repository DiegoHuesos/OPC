TITLE Ejercicio 3tradejemWhile

; Descripcion:
; Ejemplo de implementacion de Estructuras Algoritmicas.
; 

INCLUDE Irvine32.inc

.DATA
; Textos para la Consola
mcr=0Dh
mlf=0Ah
mnul=0h
titulo BYTE mcr, mlf, "Traduccion de Estructuras algoritmicas.", mcr, mlf, mnul
prompt03 BYTE "WHILE.", mnul
prompt05 BYTE mcr, mlf, "ADIOS.", mcr, mlf, mnul

; Variables
uno    SDWORD ?
dos    SDWORD ?
tres   SDWORD ?
 
.CODE
; Procedimiento principal
main PROC
	mov edx,OFFSET titulo
	call WriteString
	call Crlf
	
	; WHILE con signo
	mov edx,OFFSET prompt03
	call WriteString
	call Crlf
	mov uno, 3   ; 3, luego 10
	mov dos, 9

       ; while( uno + 3 <= dos )
iniWh1:
	MOV EAX, uno
	ADD EAX, 3
	CMP EAX, dos
	JG finWh1    ; >
	    mov EBX, uno
	    add EBX, 5
	    mov tres, EBX
	    inc uno
	JMP iniWh1
finWh1:
	
	mov eax, uno
	call WriteInt  ; de eax
	call Crlf
	call Crlf

	
	; ADIOS
	mov edx,OFFSET prompt05
	call WriteString
	call Crlf
	call Crlf
	
       EXIT
main ENDP
; Termina el procedimiento principal

; Termina el area de Ensamble
END main