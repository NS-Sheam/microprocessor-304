org 100h
.model small
.stack 100h
.data
    m db 'I Love BD ?'
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, m
    int 21h
    
    mov ah, 1
    int 21h
    mov bl, al
    
    
    mov ah, 2
    int 21h
    mov dl, bl
    
    mov ah, 4ch
    int 21h
    main endp
end main
