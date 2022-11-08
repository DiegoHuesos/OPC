TITLE Ejercicio TareaBG 2

INCLUDE Irvine32.inc

;mis simbolos
mcr = 0Dh
mlf = 0Ah
mnul = 00h

.DATA

M SDWORD ?
N SDWORD ?

;Strings
datoM BYTE mcr, mlf, "Teclee el dato M: ", mnul
datoN BYTE mcr, mlf, "Teclee el dato N: ", mnul
error BYTE mcr, mlf, "ERROR: ", mnul
adios BYTE mcr, mlf, mcr, mlf, "ADIOS.", mnul


.CODE
main PROC
    
    ;Imprime leyenda para teclear M
    mov EDX, OFFSET datoM
    call WriteString

    ;Lee valor M y  lo guarda en EAX
    call ReadInt
    mov ECX, EAX
    inc ECX

    ;Inicializa la num en 0
    mov EBX, 1    


    WHILE1:
        cmp i, ECX              ; EAX == N
        jae ENDWHILE1
        

        ;Imprime "Siguiente termino:"
        mov EDX, OFFSET sigTermino
        call WriteString

        ;Imprime el término
        mov EAX, EBX
        call WriteInt

        inc i
        ADD sumaTotal, EBX
        ADD EBX, 3     ;incrementa al contador
        jmp WHILE1  ;regresa al inicio del while para comparar

    ENDWHILE1:

    ;Imprime "TOTAL: "
    mov EDX, OFFSET total
    call WriteString
    ;Imprime la suma total
    mov EAX, sumaTotal
    call WriteInt

    exit

main ENDP

END main
