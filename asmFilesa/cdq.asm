TITLE *MASM Template	(MasmTemplate.asm)*

INCLUDE Irvine32.inc

.DATA
   
.code

main PROC

    

    mov eax, -48
    call DumpRegs 
    cdq

    call DumpRegs

    mov ecx, 5

    call DumpRegs


    idiv ecx

    call DumpRegs
    
    EXIT
main ENDP

END main
