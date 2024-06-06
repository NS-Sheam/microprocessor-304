.model small
.stack 100h 
.data 
    arr db 5, 4, 3, 2, 1
    len dw 5
    
.code
 main proc
    mov ax, @data
    mov ds, ax
    
    mov cx, len
    mov si, 0
    
    outer_loop:
        cmp si, cx
        jge finished
        
        mov di, si
        
    inner_loop:
        cmp di, cx
        jge next_iter
        
        mov al, arr[di]
        mov bl, arr[si]
        cmp al, bl
        jb update_min
        
        inc di
        jmp inner_loop
        
        update_min:
            mov arr[di], bl
            mov arr[si], al
            inc di
            jmp inner_loop
            
        next_iter:
            inc si
            jmp outer_loop
            
        finished:
            mov ah, 2
            mov dl, arr 
            add dl, 48
            int 21h         
            inc si
        
    
    
    
    mov ah, 4ch
    int 21h
    main endp
 end main
