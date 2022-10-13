TITLE *LABEL DIRECTIVE*

; Descripcion:
;   
INCLUDE Irvine32.inc

.DATA
    texto1 BYTE "++++ Representacion de ALFA en DWORD",0
    texto2 BYTE "++++ Representacion de ALFA (DELTA) en BYTE",0
    Delta LABEL BYTE
    Beta LABEL WORD
    Alfa DWORD 12345678h
    adios BYTE "ADIOS", 0

.CODE
    main PROC

        call CRLF
        mov EDX, OFFSET texto1
        call WriteString

        mov ESI, OFFSET Alfa
        mov ECX, LENGTHOF Alfa
        mov EBX, TYPE Alfa
        call DumpMem
        call CRLF

        ; +++++++
        call CRLF
        mov EDX, OFFSET texto1
        call WriteString

        mov ESI, OFFSET Delta
        mov ECX, LENGTHOF Delta + 3
        mov EBX, TYPE Delta
        call DumpMem
        call CRLF
        ; +++++++

        EXIT
    main ENDP
    END main
