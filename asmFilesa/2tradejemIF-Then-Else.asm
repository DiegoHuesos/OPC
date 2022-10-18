TITLE Ejercicio 2tradejemIF-Then-Else

; Descripcion:
; Ejemplo de implementacion de Estructuras Algoritmicas. 

INCLUDE Irvine32.inc

.DATA
; Textos para la Consola
mcr=0Dh
mlf=0Ah
mnul=0h
titulo BYTE mcr, mlf, "Traduccion de Estructuras algoritmicas.", mcr, mlf, mnul
prompt02 BYTE "IF-THEN-ELSE con signo.", mnul
prompt05 BYTE mcr, mlf, "ADIOS.", mcr, mlf, mnul

; Variables
uno    SDWORD 8    ; 8, luego 15
dos    SDWORD 9
 
.CODE
; Procedimiento principal
main PROC
	mov edx,OFFSET titulo
	call WriteString
	call Crlf
	
	; IF-THEN-ELSE uno y dos con signo
	mov edx,OFFSET prompt02
	call WriteString
	call Crlf

       ; if ( uno > dos+3 )
	MOV  EAX, dos
	ADD eax, 3
	CMP  uno, EAX
	JLE  else1    ; <=
          mov eax, uno
          MOV  dos, EAX
	JMP finSI2
else1:
	   mov  EAX, dos
	   mov  uno, EAX
finSi2:
	
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