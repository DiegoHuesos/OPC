TITLE *MASM Template	(slides12y13.asm)*

; Descripcion:
; BDslides12y13

INCLUDE Irvine32.inc

.CODE
; Procedimiento principal
main PROC
    ; IMUL Examples

    MOV EAX,4823424
    MOV EBX,-423
    IMUL EBX        ; EDX:EAX = FFFFFFFF86635D80h, OF=0, CF=0
    call DumpRegs
    call CrLf
    
    ; ++++++++
    ; Your turn ... 3
    MOV EAX, 0
    MOV EBX, 0
    MOV EDX, 0

    MOV AX,8760h
    MOV BX,100h
    IMUL BX
    call DumpRegs
    call CrLf
    
    exit

main ENDP
; Termina el procedimiento principal

; Termina el area de Ensamble
END main