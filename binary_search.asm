org 100h
.model small
.data
    
    myArray db 10,20,30,40,50
    arraySize dw 5
    searchValue db -30
    newline db 10, 13, '$'
    not_found_msg db 'Value not found in the array. $'
    found_msg db 'Value found in the array. $'
    
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov cx, 0 ; low index
    mov dx, arraySize ;high index
    
    binary_search:
        
        cmp cx, dx
        jg value_not_found
        
        mov si, cx
        add si, dx    
        shr si, 1
        
        mov al, [myArray + si]
        cmp al, searchValue
        
        je value_found
        
        jl update_low
        
        jg update_high
        
    update_low:
        inc si       ; mid + 1
        mov cx, si   ; update low
        jmp binary_search
    
    update_high:
        dec si       ; mid-1
        mov dx, si   ; update high
        jmp binary_search        
    
    value_found:
        mov ah, 9
        lea dx, found_msg
        int 21h
        jmp end_program
        
    value_not_found:
        mov ah, 9
        lea dx, not_found_msg
        int 21h
        
    end_program:
        mov ah, 4ch
        int 21h  
main endp
end main
        
        