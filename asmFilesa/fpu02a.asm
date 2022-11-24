TITLE fpu02a						(fpu02a.asm)

; Floating point unit use

INCLUDE Irvine32.inc

.DATA
Alfa REAL8 300.0
Beta REAL8 -400.0
Ce REAL8 500.0

strt BYTE "Prueba de 8 push (load) en el FPU stack",0
str9 BYTE "Ahora agregamos al FPU stack un 9no valor",0

.CODE
main PROC
	finit   ; starts up the FPU

    mov EDX, OFFSET strt
	call WriteString

    fld alfa
    fld beta
    fld alfa
    fld beta
    fld alfa
    fld beta
    fld alfa
    fld beta
    
    call ShowFPUStack
    call CrLf



    mov EDX, OFFSET str9
	call WriteString

    fld Ce

    call ShowFPUStack
    call CrLf
	   
	
	EXIT
main ENDP

END main