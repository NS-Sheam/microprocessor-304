ORG 100H
.MODEL SMALL
.DATA
    msg_1 DB "Even!! $"
    msg_2 DB "Odd!! $"
.CODE
MAIN PROC
    MOV AH, 1
    INT 21H
    
    MOV BL, AL
    
    MOV AH, 1
    INT 21H
    
    MOV BH, AL
    
    MOV AL, BL
    MOV CL, 10
    MUL CL
    
    ADD AL, BH
    
    MOV CX, 2
    DIV CX
    
    MOV AH, 2
    ADD DX, 48
    INT 21H
    
    RET
    
MAIN ENDP
END MAIN