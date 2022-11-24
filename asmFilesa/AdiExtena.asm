; Ejemplo de Adicion Extendida           (AdiExtena.asm)

; Este programa calcula la suma de dos enteros de 3 dwords de longitud.
; Estos enteros estan almacenados como arreglos ("op1" y "op2"),
; con el dword menos significativo almacenado en la direccion mas baja.
; El resultado quedara en el arreglo "suma". 

INCLUDE Irvine32.inc

.DATA
;op1 DWORD3   0A2B2A4067498123420h
;op2 DWORD3    801087000023450230h
;suma DWORD3 0123132B0674DB573650h

op1 SDWORD 0A2h, 0B2A40674h, 98123420h
op2 SDWORD  80h,  60870000h, 43450230h

suma SDWORD 3 dup(0) 	; = 0123132B0674DB573650h
; El almacenamiento para esta variable "suma" debe ser de un
; dword mas largo que el de los operandos "op1" y "op2"

.code
main PROC

; Calcula la adicion extendida
	mov EDI, (LENGTHOF suma)-1
	mov EBX, 0
	.WHILE EDI > 0
		add EBX, op1[EDI*TYPE op1]
	.END
	
; Despliega la suma.
	mov ESI, OFFSET suma
	mov ECX, LENGTHOF suma
	mov EBX, TYPE suma
	call DumpMem
	call CRLF




	EXIT
main ENDP

END main