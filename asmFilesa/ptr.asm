TITLE *Uso de "Type" PTR *

; Descripcion:
; Uso de "Type" PTR 

INCLUDE Irvine32.inc

.DATA
texto    BYTE "--¿como Hola estan?", 0
adios    BYTE "ADIOS", 0

.CODE
main PROC

    call CrLf
    mov EDX, OFFSET texto        ; estado inicial de "texto"
    call WriteString
    call CrLf

    ; ++++++++
    mov EBX, DWORD PTR texto+3   ; EBX <- "omoc"
    xchg EBX, DWORD PTR texto+8  ; EBX <- "aloH", texto+3 <- "como"
    mov DWORD PTR texto+3, EBX   ; texto+3 <- "Hola"
    
    call CrLf
    mov EDX, OFFSET texto        ; estado final  de "texto"
    call WriteString
    call CrLf
    ; ++++++++++++

    mov EDX, OFFSET adios        ; despliega "ADIOS"
    call WriteString
    call CrLf
        
    exit
main ENDP

END main