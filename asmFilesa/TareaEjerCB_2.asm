TITLE TareaEjerCB_2          (OpArrArg.asm)

; TareaEjerCB_2
; Authors: Diego Hernández, Alexis Sánchez, Lucía Lizardi

; Este programa lee un string de la terminal y analiza cada uno de sus caracteres.
; Imprime en pantalla el número del caracter y si corresponde a una mayúscula, minúscula o si no es una letra.
; Por último,convierte las mayúsculas en minúisculas y las minúsculas en mayúsculas e imprime el string transformado.

; Irvine Library procedures and functions
INCLUDE Irvine32.inc

;SIMBOLOS
mcr=0dh
mlf=0ah
mnul=0h


; PROC main
.DATA
; Prompts
txtString BYTE mcr,mlf,"String: ",mnul
txtCaracter BYTE "   Caracter ",mnul
txtEnesimo BYTE "o: ",mnul
txtMayus BYTE  " - MAYUSCULA", mnul
txtMinus BYTE  " - minuscula", mnul
txtNoAlfa BYTE  " - Char no alfa.", mnul
txtConversion BYTE mcr, mlf, "Conversion:  ", mnul
adios BYTE mcr,mlf,"ADIOS.",mnul
; Variables
dirRet DWORD ?
bufferStr BYTE 31 DUP(0) ; 30 caracteres más uno del 0 final
charCount DWORD ?

.CODE
main PROC

    ; Lee String
    call LeeString
    pop charCount

    ; Análisis de cada caracter
    push charCount
    call CharAnalisis

    ; UpperCase <--> LowerCase
    push charCount
    call CaseInversor

    ; Adiós
    mov edx, OFFSET adios
    call WriteString
    call Crlf

    EXIT
main ENDP


;;;;Procedimiento-LeeString;;;;;;;
.DATA

.CODE
LeeString PROC
    ; Obtener y guardar dirección de retorno
    pop dirRet
    ; Imprimir prompt "String"
    mov edx, offset txtString
    call WriteString 
    ; Leer el string
    mov edx, offset bufferStr
    mov ecx, 31 
    call ReadString
    call Crlf

    ; Return
    push eax ; (cantidad de caracteres ingresados)
    push dirRet

    RET
LeeString ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;Procedimiento-CharAnalisis;;;;;;;
.DATA
i DWORD 0
charArr BYTE ?, 0   ; Array con una letra y 0 para poder imprimir fácilmente el  caracter.

.CODE
CharAnalisis PROC

    ; Obtener parámetros y dirección de retorno
    pop dirRet
    pop ecx                     ; charCount lenghtof string ->i (loop: i--)
    mov esi, OFFSET bufferStr

    .WHILE( i < ecx )           ; Iterar el String
        
        ; Print Caracter i:
        mov edx, offset txtCaracter
        call WriteString
        mov eax, i
        inc eax     ; incrementa el ínidce para que se imprima a partir de 1 y no de o
        call WriteInt
        mov edx, offset txtEnesimo
        call WriteString

        ; Get char of index esi
        mov al, BYTE PTR [esi]
        ; Print char
        mov charArr[0], al
        mov edx, offset charArr
        call WriteString

        ; Verify if it is Uppercase -> Si no es uppercase, se salta a notUppercase para validar si es lowercase.
        cmp A_Mayus, al      ; I want:      A_Mayus <= al
        ja  notAlphabetic    ; Jump if:     A_Mayus > al   
        cmp al, Z_Mayus      ; I want:      al <= Z_Mayus
        ja verifyLowercase       ; Jump if:     al > Z_Mayus
        ; Si pasa lo anterior, entonces, es Uppercase
        mov edx, offset txtMayus
        call WriteString
        jmp done


        ; Verify if it is Uppercase -> Si no es uppercase, se salta a notUppercase para validar si es lowercase.
        verifyLowercase:
        cmp a_minus, al      ; I want:      a_minus <= al
        ja  notAlphabetic    ; Jump if:     a_minus > al   
        cmp al, z_minus      ; I want:      al <= z_minus
        ja notAlphabetic       ; Jump if:     al > z_minus
        ; Si pasa lo anterior, entonces, es Lowercase
        mov edx, offset txtMinus
        call WriteString
        jmp done

        notAlphabetic:
        mov edx, offset txtNoAlfa
        call WriteString

        done:
        call Crlf
        ; Incrementa el contador y el índice
        inc i
        inc esi  
    .ENDW

    ; Return
    push dirRet

    RET
CharAnalisis ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;Conversion;;;;;;;
.DATA
j DWORD 0
A_Mayus BYTE 65 ; 'A' 
Z_Mayus BYTE 90 ; 'Z' 
a_minus BYTE 97 ; 'a' 
z_minus BYTE 122 ; 'z' 

.CODE
CaseInversor PROC
    
    ; Obtener parámetros y dirección de retorno
    pop dirRet
    pop ecx                     ; lenghtof string ->i (loop: i--)
    mov esi, OFFSET bufferStr
    

    .WHILE( j < ecx )           ; Iterar el String
        
        ; Get char of index esi
        mov al, BYTE PTR [esi]

        ; Verify if it is alphabetic -> Si no es uppercase, se salta a notUppercase para validar si es lowercase.
        cmp A_Mayus, al      ; I want:   A_Mayus <= al 
        ja notUppercase      ; Jump if:  A_Mayus > al  
        cmp Z_Mayus, al      ; I want:   Z_Mayus >= al
        jb notUppercase      ; Jump if:  Z_MAyus < al
        ; Si pasa las validaciones, entonces es Uppercase, por lo tanto, sí es alfabetico y se salta a isAlphabetic para cambiar de case.
        jmp isAlphabetic

        ; Si no fue mayúscula, se verifica si no es minúscula para saltar a notAlphabetic o se continua para llegar a isAlphabetic.
        notUppercase:
        cmp a_minus, al      ; I want:   a_minus <= al 
        ja notAlphabetic     ; Jump if:  a_minus > al
        cmp z_minus, al      ; I want:   z_minus >= al
        jb notAlphabetic     ; Jump if:  z_minus < al

        ; Si el char sí es alfabético, se procede a cambiar el case: Uppercase <--> Lowercase
        isAlphabetic:
        xor BYTE PTR [esi], 00100000b   ; 11'1'1 0101 <--> 11'0'1 0101
        
        notAlphabetic:
        ; Incrementa el contador y el índice
        inc j
        inc esi
        
    .ENDW

    ; Imprimir prompt "String"
    mov edx, offset txtConversion
    call WriteString 
    mov edx, offset bufferStr
    call WriteString 
    call Crlf

    ; Return
    push dirRet
    RET
CaseInversor ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

END main