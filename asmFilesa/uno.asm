TITLE *MASM Template	(MasmTemplate.asm)*

; Descripcion:
;   Mi programa asm.

; Libreria de Funciones de Irvine
INCLUDE Irvine32.inc

.DATA
    ; Directivas de almacenamineto y tipos de datos

.CODE
; Procedimiento principal; inicia main()
main PROC

    ; Instrucciones, mnemónicos
    call DumpRegs
    mov ECX, 0
    call DumpRegs
    mov EAX, 8FH
    add ECX, 3
    call DumpRegs

    EXIT
main ENDP
; Termina el procedimiento principal

; Termina el area de Ensamble
END main
