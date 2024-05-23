.ORG 100H
.MODEL SMALL
.DATA
    A DB 30
    B DB 40
.CODE
MAIN PROC
    MOV BL, 30
    MOV BH, 40
    CMP BL, BH
    JA LABEL1
    JB LABEL2
        MOV DL, 67
        JMP END
    LABEL1:
        MOV DL, 65
        JMP END
    LABEL2:
        MOV DL, 66
        JMP END
    END:
        MOV AH, 2
        INT 21H
        MOV AH, 4CH
        INT 21H
 MAIN ENDP
END MAIN