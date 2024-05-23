.org 100h
.model small
.data
    A db 10
    B db 20
.code
main proc
    mov bl, A
    mov bh, B
    cmp bl, bh
    ja label1
    jb label2
    je label3
    
    label1:
        mov dl, 65
        jmp end
    label2:
        mov dl, 66
        jmp end
    label3:
        mov dl, 67
        
    end:
        mov ah, 2
        int 21h
        mov ah, 4ch
        int 21h
main endp
end main