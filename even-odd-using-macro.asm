.model small
.stack 100h
.data
    number db ?
    prompt db "Enter a number $"
    even_msg db 10, 13, "The number is even $"
    odd_msg db 10, 13, "The number is odd $"
.code

check_even_odd macro num
    mov al, num
    and al, 1
    jz even
    jmp odd
    
even:
    lea dx, even_msg
    jmp display
odd:
    lea dx, odd_msg
display:
    mov ah, 9
    int 21h
endm   

main proc

    mov ax, @data
    mov ds, ax
                  
    mov ah, 9
    lea dx, prompt
    int 21h
     
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    
    mov ah, 1
    int 21h
    mov number, al
    add al, "0"
    
    check_even_odd number
    
    mov ah, 4ch
    int 21h
endp
end main
    