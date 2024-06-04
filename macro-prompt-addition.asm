org 100h
.model small
.stack 100h
.data
    a dw ?
    b dw ?  
    result dw ?
    newline db 10, 13, '$'
    prompt_first db 'Enter the first number: $'    
    prompt_second db 'Enter the second number: $'
    prompt_result db 'Result: $'
    
prompt_input macro msg
    mov ah, 9
    lea dx, msg
    int 21h
endm
    
input_num macro num
    mov ah, 1
    int 21h 
    mov num, ax  
endm
    
output_num macro num
    sub num, 48  
        
    mov dx, num
    mov ah, 2
    int 21h
endm  

.code 
main proc 
    prompt_input prompt_first
    input_num a
    
    prompt_input prompt_second
    input_num b
    
    mov ax, a
    add ax, b
    mov result, ax
    
    prompt_input prompt_result
    output_num result
    
    mov ah, 4ch
    int 21h
main endp
end main
