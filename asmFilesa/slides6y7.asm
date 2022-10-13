TITLE *MASM Template	(slides6y7.asm)*

; Descripcion:
; BDslides6y7

INCLUDE Irvine32.inc

.CODE
; Procedimiento principal
main PROC
    ; Your turn ... 1
    MOV EAX, 0
    MOV EBX, 0
    MOV EDX, 0

    MOV AX,1234h
    MOV BX,100h
    MUL BX
    call DumpRegs
    call CrLf
    
    ; ++++++++
    ; Your turn ... 2

    MOV EAX,00128765h
    MOV ECX,10000h
    MUL ECX
    call DumpRegs
    call CrLf
    
    exit

main ENDP
; Termina el procedimiento principal

; Termina el area de Ensamble
END main