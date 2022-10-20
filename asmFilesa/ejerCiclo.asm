TITLE Ejercicio

INCLUDE Irvine32.inc

;mis simbolos
mcr = 0Dh
mlf = 0Ah
mnul = 00h

.DATA

num SDWORD ?
cont DWORD 1

;Strings
leeVal BYTE mcr, mlf, "Teclee el dato ", mnul
twoPoints BYTE ": ", mnul
msgPos BYTE "   Valor positivo ", mcr, mlf, mnul
msgNeg BYTE "   Valor negativo ", mcr, mlf, mnul
prompt05 BYTE mcr, mlf, "ADIOS.", mcr, mlf, mnul


.CODE

main PROC

	mov ECX, 5  ;tope
    mov EBX, 0  ;cero
    

    WHILE1:
        cmp cont, ECX
        jae ENDWHILE1
        

        ;Imprime leyenda y contador
        mov EDX, OFFSET leeVal
        call WriteString
        mov EAX, cont
        call WriteInt
        mov EDX, OFFSET twoPoints
        call WriteString

        ;Lee valor
        call ReadInt
        mov num, EAX

        ;Compara valor con cero
        cmp num, EBX

        ;Si es negativo
        ;IF1
        jge ELSE1
            ;Print negativo
            mov EDX, OFFSET msgNeg
            call WriteString
            jmp ENDIF1
        ;ELSE1
        ELSE1:
            ;Print positivo
            mov EDX, OFFSET msgPos
            call WriteString
        ENDIF1:

        inc cont     ;incrementa al contador
        jmp WHILE1  ;regresa al inicio del while para comparar

    ENDWHILE1:

    ;Imprime ADIOS
    mov EDX, OFFSET prompt05
    call WriteString

    exit

main ENDP

END main
