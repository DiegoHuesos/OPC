TITLE Add and Subtract, Version 2         (AddSub2.asm)

; This program adds and subtracts 32-bit integers
; and stores the sum in a variable.

; Definitions of the author
INCLUDE Irvine32.inc

.data
val1     dword  10000h
val2     dword  40000h
val3     dword  20000h
finalVal dword  ?

.code
main PROC
	mov	eax, val1			; start with 10000h
	Call DumpRegs			; display the registers
	add	eax, val2			; add 40000h
	Call DumpRegs			; display the registers
	sub	eax, val3			; subtract 20000h
	Call DumpRegs			; display the registers
	mov	finalVal, eax		; store the result (30000h)
	Call DumpRegs			; display the registers

	Exit
main ENDP

END main