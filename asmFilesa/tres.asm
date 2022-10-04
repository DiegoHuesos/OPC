TITLE *MASM Template	(MasmTemplate.asm)*

; Descripcion:
;   Mi programa asm.

; Libreria de Funciones de Irvine
INCLUDE Irvine32.inc

.DATA
    ; Directivas de almacenamineto y tipos de datos
    valInt SDWORD -317432     
    valHex DWORD 6ABCh          
.CODE
; Procedimiento principal; inicia main()
main PROC

    ; Instrucciones, mnemónicos
    MOV EAX, valInt
    CALL WriteInt
    CALL CRLF
    CALL WriteHex
    CALL CRLF

    MOV EAX, valHex
    CALL WriteHex
    CALL CRLF
    CALL WriteInt
    CALL CRLF


    EXIT
main ENDP
; Termina el procedimiento principal

; Pueden agregarse más procedimientos

; Termina el area de Ensamble
END main
