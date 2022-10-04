TITLE *MASM Template	(MasmTemplate.asm)*

; Descripcion:
;   Mi programa asm.

; Libreria de Funciones de Irvine
INCLUDE Irvine32.inc

.DATA
    ; Directivas de almacenamineto y tipos de datos
    line1 BYTE "Enter data: ", 0
    valInt SDWORD ?
    line2 BYTE "The result is: ", 0

.CODE
; Procedimiento principal; inicia main()
main PROC

    ; Instrucciones, mnemónicos
    mov EDX, OFFSET line1
    call WriteString
    call ReadInt
    mov valInt, EAX 
    call CRLF

    add valInt, 2

    mov EDX, OFFSET line2
    call WriteString
    mov EAX, valInt
    call WriteInt
    call CRLF

    EXIT
main ENDP
; Termina el procedimiento principal

; Pueden agregarse más procedimientos

; Termina el area de Ensamble
END main
