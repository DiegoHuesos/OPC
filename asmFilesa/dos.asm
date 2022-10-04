TITLE *MASM Template	(MasmTemplate.asm)*

; Descripcion:
;   PRUEBA DE DumpMem

; Libreria de Funciones de Irvine
INCLUDE Irvine32.inc

.DATA
    ; Directivas de almacenamineto y tipos de datos
    array DWORD 11, 12, 13

.CODE
; Procedimiento principal; inicia main()
main PROC
    ; Instrucciones, mnemónicos
    MOV ESI, OFFSET array
    MOV ECX, 3
    MOV EBX, 4
    CALL DumpMem
    EXIT
main ENDP
; Termina el procedimiento principal

; Pueden agregarse más procedimientos

; Termina el area de Ensamble
END main
