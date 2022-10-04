TITLE *MASM Template	(MasmTemplate.asm)*

; Descripcion:
;   Prueba de ReadString

; Libreria de Funciones de Irvine
INCLUDE Irvine32.inc

.DATA
    ; Directivas de almacenamineto y tipos de datos
    bufferR BYTE 81 DUP(0) ; 80 caracteres más uno del 0 final
    charCount DWORD ?
.CODE
; Procedimiento principal; inicia main()
main PROC

    ; Instrucciones, mnemónicos
    mov EDX, OFFSET bufferR
    mov ECX, 81
    call ReadString
    mov charCount, EAX

    call CRLF
    call WriteInt
    call CRLF
    
    add bufferR+1, 1

    mov EDX, OFFSET bufferR
    call WriteString
    call CRLF
    
    EXIT
main ENDP
; Termina el procedimiento principal

; Pueden agregarse más procedimientos

; Termina el area de Ensamble
END main
