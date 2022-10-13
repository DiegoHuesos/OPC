TITLE *MASM Template	(MasmTemplate.asm)*

; Descripcion:
;   Mi programa asm.

; Libreria de Funciones de Irvine
INCLUDE Irvine32.inc

.DATA
    ; Directivas de almacenamineto y tipos de datos
    uno BYTE 1, 2 
    dos WORD 3, 4
    tres DWORD 5, 6
    txt1 BYTE "Total: ", 0
.CODE
; Procedimiento principal; inicia main()
main PROC

    ; Instrucciones, mnemónicos
    mov ESI, OFFSET uno
    mov ECX, 14                     ; Cantidad de elementos
    mov EBX, 1                      ; Tipo de elemento (1 BYTE)
    call DumpMem
    call CRLF
    call CRLF

    ;Total 
    ; Registros DX y DL como auxiliares (1 byte)
    mov EDX, 0
    mov DL, uno
    add DL, uno+1
    add DX, dos
    add DX, dos+2
    add EDX, tres
    add EDX, tres+4

    mov EAX, EDX
    mov EDX, OFFSET txt1

    call WriteString
    call WriteInt
    call CRLF


    EXIT
main ENDP
; Termina el procedimiento principal

; Termina el area de Ensamble
END main
