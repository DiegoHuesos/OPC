
TITLE EjerCEg2						(EjerCEg2.asm)

; Ejercicio CEg2
; Atuhor: Diego Hernández Delgado

; Description: 

INCLUDE Irvine32.inc

.DATA
txtFactor BYTE "Ingrese el factor: ",0
txtN BYTE "Ingresa N: ",0
txtDato BYTE "Ingresa dato ", 0
txtPuntoComa BYTE ": ", 0
adios BYTE mcr,mlf,"ADIOS.",mnul

arrLista REAL8 ?
factor DWORD ?
n DWORD ?
dirRet DWORD ?

.CODE
main PROC
    ; Pide factor 
    mov edx, offset txtFactor 
    call WriteString
    call ReadInt
    mov factor, eax

    ; Pide n 
    mov edx, offset txtN 
    call Crlf
    call WriteString
    call ReadInt
    mov n, eax

    ; Lee lista
    push n
    push offset arrLista
    call LeerLista

    ; 
    call FacLista
    pop factor

    call Imprime 

    ; Adiós
    mov edx, OFFSET adios
    call WriteString
    call Crlf

	EXIT
main ENDP

;; LeerLista ;;
.DATA
arr DWORD ?
nLocal DWORD ?

.CODE
LeerLista PROC
    pop dirRet
    pop arr
    pop nLocal

    mov ebx, 0
    .WHILE( ebx < nLocal )
        call crlf
	    mov edx, offset txtDato
	    call WriteString
	    call ReadFloat

        fstp [arr+ebx]

        inc ebx
    .ENDW

    push nLocal
    push arr
    push dirRet
	RET
LeerLista ENDP

;; FacLista ;;
.DATA
.CODE
FacLista PROC
    pop dirRet
    push dirRet
	RET
FacLista ENDP

;; Imprime ;; 
.DATA
.CODE
Imprime PROC
    pop dirRet
    push dirRet
	RET
Imprime ENDP

END main 