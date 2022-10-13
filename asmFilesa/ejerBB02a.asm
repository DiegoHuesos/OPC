TITLE ejerBB02a
  ; Desplegado de datos y manipulación de variables
  
; Irvine Library procedures and functions
INCLUDE Irvine32.inc

.DATA
Uvector		WORD 2002h, 4004h, 6006h, 7007h
Svector		SWORD -1, -2, -3, -4
msgu		BYTE 0Dh, 0Ah, "Uvector", 0    ; ASCII CR=0Dh, LF=0Ah
msgs		BYTE 0Dh, 0Ah, "Svector", 0

.CODE
main PROC
	;Imprimiendo el string "Uvector"
	; Impresion de los cuatro valores de Uvector por medio de DumpRegs

	;mov EAX, 0
	;mov EBX, 0
	;mov ECX, 0
	;mov EDX, 0
	;En lugar de hacer esto, se puede usar movzx para mover y convertir el tamaño implícitame 
	;y movsx para hacerlo con número signados (negativos)

	movzx EAX, Uvector
	movzx EBX, Uvector+2
	movzx ECX, Uvector+4
	movzx EDX, Uvector+6

	call DumpRegs       

	;Imprimiendo el string "Svector"
	movsx EAX, Svector
	movsx EBX, Svector+2
	movsx ECX, Svector+4
	movsx EDX, Svector+6

	call DumpRegs       



	exit
main ENDP

END main