TITLE fpu00a						(fpu00a.asm)

; Floating point unit use

INCLUDE Irvine32.inc

.DATA
txt1 BYTE "Enter the Real value: ",0
alfa real4 235.49
beta real4 800.92

.CODE
main PROC
	finit   ; starts up the FPU
	call ShowFPUStack
	call Crlf
	mov edx, offset txt1

	call WriteString
	call ReadFloat

	fld alfa

	call WriteFloat
	call Crlf
	call ShowFPUStack	
	call Crlf

	fsub beta

	call ShowFPUStack	
	call Crlf

	EXIT
main ENDP

END main 