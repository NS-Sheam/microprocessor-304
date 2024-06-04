org 100h
.model small
.stack 100h
.data
    a db "Enter two number $"
    b db 10, 13, "Result $"
.code 
main proc 
   input proc
    mov ah, 9
    lea dx, a
    int 21h
    
    mov ah, 1
    int 21h
    
    mov bl, al
    int 21h
    mov bh, al
    call sum
    ret
 input endp
 sum proc
    mov ah, 9
    lea dx, b
    int 21h
    
    add bl, bh
    sub bl, 48
    mov ah, 2
    mov dl, bl
    int 21h 
    ret
  sum endp
end main