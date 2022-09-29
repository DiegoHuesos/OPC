TITLE Add and Subtract, Version 1         (AddSub1.asm)

; This program adds and subtracts 32-bit integers
; and stores the sum in the general register EAX.

.386
.model flat, stdcall
.stack 4096

; Windows function headers
ExitProcess PROTO, dwExitCode: DWORD
DumpRegs PROTO

.data

.code
main PROC
	mov	eax, 10000h			; EAX= 10000h
	INVOKE DumpRegs			; display the registers
	add	eax, 40000h			; EAX= 50000h
	INVOKE DumpRegs			; display the registers
	sub	eax, 20000h			; EAX= 30000h
	INVOKE DumpRegs			; display the registers

	INVOKE ExitProcess, 0
main ENDP

END main