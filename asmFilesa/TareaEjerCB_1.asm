TITLE TareaEjerCB          (OpArrArg.asm)

; TareaEjerCB_1
; Authors: Diego Hernández, Alexis Sánchez, Lucía Lizardi

; Este programa llama procedimientos de forma iterada y utiliza el procedimiento Gotoxy, Clrscr, GetMaXY.
; Primero, se lee un dato n que indica el número de salarios. 
; Después, se leen los n salarios y se suman. 
; Por último, se imprime el resultado de la suma de los salarios en pantalla. 

; Irvine Library procedures and functions
INCLUDE Irvine32.inc

;SIMBOLOS
mcr=0dh
mlf=0ah
mnul=0h


;;;;; PROC main ;;;;;
.DATA
cont DWORD 0
resultado SDWORD ?

txtLeeN BYTE mcr,mlf,"Teclee el dato n: ",mnul
txtTeclee BYTE mcr,mlf,"Teclee el ",mnul
txtSalario BYTE " salario: ",mnul
txtResultado BYTE mcr,mlf, "Resultado: ", mnul
adios BYTE mcr,mlf,"ADIOS.",mnul

.CODE
main PROC
    ; Colocar el cursos en la posicion deseada
    call GetMaxXY
    call Clrscr
    mov dh, 8      ; row
    mov dl, 14      ; column
    call Gotoxy     ; locate cursor

    ;Solicitar N:
    mov EDX, offset txtLeeN
    call WriteString
    call ReadInt ; N-> EAX

    ;call Salarios(N)
    push EAX
    call Salarios  ;call procedure
    pop resultado

    ; Despliega el resultado (la suma total)
    mov EDX, OFFSET txtResultado
    call WriteString
    mov EAX, resultado
    call WriteInt
    call CrLf

    ; Despliega adiós
    mov edx, OFFSET adios
    call WriteString
    call Crlf

    EXIT
main ENDP


;;;;SALRIOS;;;;;;;
.DATA
; PROC sycArrdw, variables locales
n DWORD ?
dirRet DWORD ?
suma SDWORD ?

.CODE
Salarios PROC
; Salarios(N)
; Lee N salarios y los suma 
; Recibe
;     Stack: N
; Regresa
;     Stack: suma de los elementos del arreglo
; Varibles automaticas y locales
; n, suma, dirRet

    ;Get values (parameters) from the stack
    pop dirRet
    pop n
    
    ;Initialize sum in 0
    mov suma, 0 

    ;Iterate N times to read the number by calling Possal Procedure
    mov EBX, 0 ; i=0
    .WHILE (EBX < n)
        push EBX        ; pass parameter i:=EBX
        call Possal     ; call procedure to print "Teclee" and get salario
        pop ECX         ; get salario

        add suma, ECX  ; suma += salario

        inc EBX ; i++
    .ENDW

    ;Return suma
    push suma           ; Push suma
    push dirRet         ; Push of next instruction offset
    RET
Salarios ENDP
;;;;;;END SALARIOS;;;;;;;;;


;;;;POSSAL;;;;;;;
.DATA
i DWORD ?
dirRetP DWORD ?

.CODE
Possal PROC
; Psossal(i)
; Imprime en pantalla el texto "Salario " + i + ": " y lee la cantidad de pantalla
; Recibe
;     Stack: i
; Regresa
;     Stack: el valor leído STDIN por la terminal
; Varibles automaticas y locales
; suma

    ;Get values (parameters) from the stack
    pop dirRetP
    pop i
    
    ; Imprime "Teclee el "
    mov EDX, offset txtTeclee
    call WriteString
    ; Imprime el índice
    inc i
    mov EAX, i
    call WriteInt
    ; Imprime " salario: "
    mov EDX, offset txtSalario
    call WriteString
    ; Lee el número entero del salario
    call ReadInt

    ;Return suma
    push EAX
    push dirRetP         ;Push of next instruction offset

    RET
Possal ENDP
;;;;;;END SALARIOS;;;;;;;;;


END main
;;; End Program ;;;