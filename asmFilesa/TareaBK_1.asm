TITLE Ejercicio TareaBk Ej1

INCLUDE Irvine32.inc

mcr = 0Dh
mlf = 0Ah
mnul = 00h


.DATA

;ints
i DWORD 1
signo DWORD -1
sumaTotal DWORD 0

;Strings
leeVal BYTE mcr, mlf, "Teclee el dato N: ", mnul
errorMsg BYTE  "   ERROR: ", mnul 
terminoA BYTE mcr, mlf, "   Termino [", mnul
terminoB BYTE "]: ", mnul
total BYTE  mcr, mlf, "SUMA TOTAL SERIE: ", mnul
adios BYTE  mcr, mlf, "ADIOS.", mnul


.CODE

main PROC
    
    LEER_N:
    ;Imprime leyenda para teclear N
    mov EDX, OFFSET leeVal
    call WriteString
    ;Lee valor N y  lo guarda en ECX
    call ReadInt
    mov ECX, EAX

    ;Checar que si el valor es negativo y enviar mensaje de error
	CMP ECX, 0
	JL Error; si es menor a 0

    ;Inicializa la num en 1  (num := EBX)
    mov EBX, 1    


    .WHILE i <= ECX ;(i <= n)

        ;IMPRIME TERMINO
        ;Imprime "Termino[+"
        mov EDX, OFFSET terminoA
        call WriteString
        ;Imprime el contador
        mov EAX, i
        call WriteInt
        ;Imprime""]:"
        mov EDX, OFFSET terminoB
        call WriteString
        ;Imprime el valor de num
        mov EAX, EBX
        mul signo
        call WriteInt
    
        ADD sumaTotal, EAX
        
        mul signo
        mov EBX,EAX
        neg signo 

        inc i       ;incrementa al contador/indice
        add EBX, i  ;incrementar num

    .ENDW

    jmp Fin

    Error:
    mov edx, OFFSET errorMsg 
	call WriteString
	mov eax, ecx
	call WriteInt
    jmp LEER_N


    Fin:
    ;Imprime "TOTAL: "
    mov EDX, OFFSET total
    call WriteString
    ;Imprime la suma total
    mov EAX, sumaTotal
    call WriteInt

    ;Imprime "ADIOS."
    mov EDX, OFFSET adios
    call WriteString


    

    exit
main ENDP

END main
