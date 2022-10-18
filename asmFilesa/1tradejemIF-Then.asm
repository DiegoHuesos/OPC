TITLE Ejercicio 1tradejemIF-Then

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
prompt05 BYTE mcr, mlf, "ADIOS.", mcr, mlf, mnul

; Variables
cinco  DWORD 5   ; 5, luego 7
seis   DWORD 3
 
.CODE
; Procedimiento principal
main PROC
	mov edx,OFFSET titulo
	call WriteString
	call Crlf

	; Texto IF-THEN cinco y seis, sin signo
	mov edx,OFFSET prompt01
	call WriteString
	call Crlf	
    
	; if ( cinco-2 > seis ) then
	MOV eax, cinco
	SUB eax, 2
	CMP eax, seis
	JBE finSi1    ; <=
	    mov eax, cinco
	    mov seis, eax
finSi1:
	
	mov eax, seis
	call WriteInt  ; de eax
	call Crlf
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