TITLE Displaying Binary Bits                (WriteBin.asm)

; Display a 32-bit integer in binary.

INCLUDE Irvine32.inc

.DATA
binValue DWORD 1234ABCDh		; sample binary value
txtdw BYTE "binValue DWORD 1234ABCDh", 0
buffer BYTE 40 dup('x'),"..",0

.CODE
main PROC
    mov EDX, OFFSET txtdw		; display txtdw
    call WriteString
    call Crlf
	
    mov EAX, binValue	; 32-bit number to display
    mov ECX, 0          ; counter
    mov ESI, offset buffer
	mov EBX, 0	; counter to display a "-"

    .WHILE (ECX < 32 )
        mov BYTE PTR [ESI], '0'     ; choose char 0 as default digit;
        shl EAX, 1          ; shift high bit into Carry flag
        .IF ( CARRY? )
            mov BYTE PTR [ESI], '1'     ; else move char 1 to buffer
        .ENDIF
        inc ESI     ; next buffer position
		inc EBX
		.IF EBX == 4
		    mov BYTE PTR [ESI], '-'
			inc ESI     ; next buffer position
			mov EBX, 0
		.ENDIF
        inc ECX     ; shift another bit to left
    .ENDW       

    mov EDX, OFFSET buffer		; display the buffer
    call WriteString
    call Crlf
    
    EXIT
main ENDP

END main