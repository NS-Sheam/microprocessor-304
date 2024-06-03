.model small
.stack 100h


.code
main proc
    mov ah, 3
    
    mov ah, 2
    mov dl, ah
    int 21h
    
    mov ah, 4ch
    int 21h
    main endp
end main
    
    