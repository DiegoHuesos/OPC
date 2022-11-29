TITLE Multiple Doubleword Shift            (MultiShift.asm)

; Demonstration of multi-doubleword shift, using
; SHR and RCR instructions.

INCLUDE Irvine32.inc

ArraySize = 3

.DATA
txtdw3 BYTE ";exprintgr DWORD3 234567899ABCDEF112345678h ;3 DWORDs long", 0
array DWORD 12345678h, 9ABCDEF1h, 23456789h
before BYTE "Before",0 
after BYTE "After",0 

.CODE
main PROC
    mov EDX, OFFSET txtdw3
	call WriteString
	call CrLf
    ; BEFORE: display the array, HEXADECIMAL
    mov EDX, OFFSET before
    call WriteString
    call CrLf
	;DisplayHex (offset array)
	push OFFSET array
	call DisplayHex

    ; BEFORE: display the array, BINARY
	;DisplayHex (offset array)
	push OFFSET array
	call DisplayBin

    ; Shift the doublewords 1 bit to the right:
    mov ESI, 0
    shr array[ESI+2*TYPE DWORD], 1          ; highest dword
    rcr array[ESI+TYPE DWORD], 1            ; middle dword, include Carry flag
    rcr array[ESI],1     	                ; low dword, include Carry flag

    ; AFTER: display the array, HEXADECIMAL
    mov EDX, OFFSET after
    call WriteString
    call CrLf
	;DisplayHex (offset array)
	push OFFSET array
	call DisplayHex

    ; AFTER: display the array, BINARY
	;DisplayHex (offset array)
	push OFFSET array
	call DisplayBin

    EXIT
main ENDP

.DATA
dirRet DWORD ?

.CODE
DisplayHex PROC
	pop dirRet  ; direccion de retorno
	pop ESI     ; direccion del arreglo
	
	add ESI, 2*TYPE DWORD
    mov EAX, [ESI]
    call WriteHex
    mov AL, '-'
    call WriteChar
	
	sub ESI, TYPE DWORD
    mov EAX, [ESI]
    call WriteHex
    mov AL, '-'
    call WriteChar
	
	sub ESI, TYPE DWORD
    mov EAX, [ESI]
    call WriteHex
    mov AL, 'h'
    call WriteChar
    call CrLf	
	
	push dirRet
	RET
DisplayHex ENDP

DisplayBin PROC
	pop dirRet  ; direccion de retorno
	pop ESI     ; direccion del arreglo
	
	add ESI, 2*TYPE DWORD
    mov EAX, [ESI]
    call WriteBin
    mov AL, '-'
    call WriteChar
	
	sub ESI, TYPE DWORD
    mov EAX, [ESI]
    call WriteBin
    mov AL, '-'
    call WriteChar
	
	sub ESI, TYPE DWORD
    mov EAX, [ESI]
    call WriteBin
    mov AL, 'b'
    call WriteChar
    call CrLf
	
	push dirRet
	RET
DisplayBin ENDP

END main