TITLE Ejercicio

INCLUDE Irvine32.inc

;mis simbolos
mcr = 0Dh
mlf = 0Ah
mnul = 0h

.DATA
Val1 DWORD ?
Val2 DWORD ?

leeVal1 BYTE mcr, mlf, "Teclee el dato para Val1: ", mnul
leeVal2 BYTE mcr, mlf, "Teclee el dato para Val2: ", mnul
impVal1May BYTE mcr, mlf, "Val1 es mayor que Val2.", mnul
impVal2May BYTE mcr, mlf, "Val2 es mayor que Val1.", mnul
impAmbIgu BYTE mcr, mlf, "Teclee el dato para Val2: ", mnul
prompt05 BYTE mcr, mlf, "ADIOS.", mcr, mlf, mnul

.CODE
main PROC
	
    mov EDX, OFFSET leeVal1
    call WriteString
    call ReadInt
    mov Val1, EAX

    mov EDX, OFFSET leeVal2
    call WriteString
    call ReadInt
    mov Val2, EAX

    ;IF
    mov EBX, Val1
    cmp EBX, Val2
    jbe else1
        mov EDX, OFFSET impVal1May
        call WriteString
    jmp endif1

    else1:
        ;IF2
        mov EBX, val1
        cmp EBX, val2
        jne else2
            mov EDX, OFFSET impAmbIgu
            call WriteString
        jmp endif2
    else2:
        mov EDX, OFFSET impVal2May
        call WriteString
    endif2:
    endif1:

    mov EDX, OFFSET prompt05
    call WriteString

    exit
main ENDP

END main
