.model small
.stack 100h

.data
    msg db 10, 13, "Enter a number: $"
    pos_msg db 10, 13, "Positive number.$"
    neg_msg db 10, 13, "Negative number.$"
    buffer db 6, 0   

.code
main:
    mov ax, @data
    mov ds, ax

    mov ah, 09h        
    lea dx, msg
    int 21h

    mov ah, 0Ah         
    lea dx, buffer
    int 21h

    mov si, offset buffer + 2  
    mov al, [si]              
    sub al, 30h              

    cmp al, 0                  
    jge positive               
    jmp negative               

positive:
    mov ah, 09h         
    lea dx, pos_msg
    int 21h
    jmp exit_program

negative:
    mov ah, 09h         
    lea dx, neg_msg
    int 21h 
    jmp exit_program

exit_program:
    mov ah, 4Ch        
    int 21h
end main
