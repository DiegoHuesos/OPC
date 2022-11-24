TITLE Program Template          (OpArrArg.asm)

; Ejercicio CB
; Este programa llama un procedimiento con pasaje por stack.

; Irvine Library procedures and functions
INCLUDE Irvine32.inc

;SIMBOLOS
mcr=0dh
mlf=0ah
mnul=0h

.DATA
; PROC main
arrayi SDWORD 40h, 20h, 30h, 50h, 15h
nuni DWORD LENGTHOF arrayi
arrayr SDWORD 5 DUP(?)
suma SDWORD ?


txti BYTE mcr,mlf,"DumpMem de arrayi.",mnul
txtr BYTE mcr,mlf,"DumpMem de arrayr.",mnul
txts BYTE mcr,mlf,"Suma de elementos de arrayr = ",mnul
adios BYTE mcr,mlf,"ADIOS.",mnul

.CODE
main PROC

    ; call sycArrdw(arrayi, nuni, arrayr)
    
    push offset arrayi
    push nuni
    push offset arrayr    
    call sycArrdw  ;call procedure
    pop suma

    ; Despliega un dump de memoria de arrayi.
    mov edx, OFFSET txti
    call WriteString
    mov ESI, OFFSET arrayi
    mov ECX, nuni
    mov EBX, TYPE arrayi
    call DumpMem
    call Crlf

    ; Despliega un dump de memoria de arrayr.
    mov edx, OFFSET txtr
    call WriteString
    mov ESI, OFFSET arrayr
    mov ECX, nuni
    mov EBX, TYPE arrayr
    call DumpMem
    call Crlf

    ; Despliega la suma total
    mov EDX, OFFSET txts
    call WriteString
    mov EAX, suma
    call WriteInt
    call CrLf

    ; Despliega adiós
    mov edx, OFFSET adios
    call WriteString
    call Crlf

    EXIT
main ENDP

.DATA
; PROC sycArrdw, variables locales
arr1d DWORD ?
unidades DWORD ?
arr2d DWORD ?
dirRet DWORD ?
sumaLocal SDWORD ?

.CODE
sycArrdw PROC
; sycArrdw(arr1d, unidades, arr2d)
; Copia un arreglo dw en otro, restandole 30h a cada elemento del segundo arreglo,
; ademas suma todos los elementos del segundo arreglo.
; Recibe
;     Stack: arr1d@, unidades, arr2d@
; Regresa
;     Stack: suma de los elementos del segundo arreglo
; Varibles automaticas y locales
; arr1d, unidades, arr2d, dirRet

;   A continuación vendría el código

    ;Get values from the stack
    pop dirRet
    pop arr2d
    pop unidades
    pop arr1d
    
    ;Mov offsets and initialize sum in 0
    mov ESI, arr1d
    mov EDI, arr2d
    mov sumaLocal, 0 

    ;For to iterate the arrays of the same size
    mov EBX, 0 ; i=0
    .WHILE (EBX < unidades)

        ;arr2d[j] = arr1d[k]
        mov ECX, DWORD PTR [ESI]            ;mov ECX, arr1d[ESI * TYPE arr1d]
        mov DWORD PTR [EDI], ECX            ;mov arr2d[EDI * 4], ECX

        ;arr2d[j] = arr2d[j] - 30
        sub DWORD PTR [EDI], 30h            ;sub arr2d[EDI * 4], 30h
        
        ;sumaLocal = sumaLocal + arr2d[j]
        mov EAX, SDWORD PTR [EDI]
        add sumaLocal, EAX                  ;add sumaLocal, arr2d[EDI * 4] 
        
        ;j++, k++, i++
        add ESI, 4
        add EDI, 4
        inc EBX ; i++
        
    .ENDW

    ;Return sumaLocal
    push sumaLocal
    push dirRet         ;Push of next instruction offset
	
    RET
sycArrdw ENDP

END main