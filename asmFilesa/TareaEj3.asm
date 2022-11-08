TITLE Ejercicio EjerBG_3

INCLUDE Irvine32.inc

.DATA
; Símbolos
mcr=0Dh
mlf=0Ah
mnul=0h

; Textos para la Consola
txtval1 BYTE mcr, mlf, "Error: ", mnul ; ahorra usar a call clrf para el salto de línea
txtval2 BYTE ", ", mnul
txtval3 BYTE mcr, mlf, "Producto: (", mnul
txtval4 BYTE ")*(", mnul
txtval5 BYTE "): ", mnul
txtDato BYTE mcr, mlf, "Teclee el dato M: ", mcr, mlf, mnul
txtDato2 BYTE mcr, mlf, "Teclee el dato N: ", mcr, mlf, mnul
prompt05 BYTE mcr, mlf, "ADIOS.", mcr, mlf, mnul

; Variables
val1  DWORD ?  ;valM
val2   DWORD ? ;valN
res DWORD 0
cont DWORD 1
 
.CODE
; Procedimiento principal
main PROC
	mov edx,OFFSET txtDato
	call WriteString
	call ReadInt
	mov val1, EAX
	
	mov edx,OFFSET txtDato2 ; Imprime letrero
	call WriteString
	call ReadInt ; Lee dato y lo guarda
	mov val2, EAX
	
	;Checar ambos sean mayores a 0
	mov EBX, val1
	CMP EBX, 0
	JL Error1; si es menor a 0

	mov EBX, val2
	CMP EBX, 0
	JL Error1; si es menor a 0
	
	; Identifica el valor mayor
	mov EBX, val1
	; IF(val1>val2) then y else
	CMP EBX, val2 
	JAE outIf ;Dice val1>=val2 sin signo
	; val1<val2
	xchg EBX, val2 ; val2 queda con val1 
	mov val1, EBX
	outIf:
	
	; While suma
	mov ECX, val1
	
	cicloWhile:
	Mov edx, cont
	CMP edx, val2
	JA FinWhile
	add res,ecx
	inc cont
	JMP cicloWhile
	
	FinWhile:
	mov edx, OFFSET txtval3
	call WriteString
	mov eax, val1
	call WriteInt
	mov edx, OFFSET txtval4
	call WriteString
	mov eax, val2
	call WriteInt
	mov edx, OFFSET txtval5
	call WriteString
	mov eax, res
	call WriteInt
	
	JMP Fin
	
	Error1:
    mov edx,OFFSET txtval1 
	call WriteString
	mov eax, val1
	call WriteInt
	mov edx,OFFSET txtval2
	call WriteString
	mov eax, val2
	call WriteInt
	
	Fin:
	; ADIOS
	mov edx,OFFSET prompt05
	call WriteString
	call Crlf
	call Crlf
	
    exit
main ENDP


END main