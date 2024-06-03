mov ax, num1
    mov bx, num2
    add ax, bx  
    mov dx, ax
    add dx, 48
    mov ah, 2
    int 21h
 
endm

org 100h

.data
    a dw 4
    b dw 5

.code
main proc 
    addition a, b
    
    mov ah, 4ch
    int 21h
main endp
end main