.model small
.data
myArray DB 'E', 'D', 'C', 'B', 'A' ; Array to sort
arraySize DW 5                     ; Size of the array
newline DB 10, 13, '$'              ; Newline and carriage return characters for formatting
sorted_msg DB 'Sorted array elements: $'

.code
main PROC
    mov ax, @data
    mov ds, ax

    ; Perform Bubble Sort
    mov cx, arraySize           ; Initialize the loop counter

outer_loop:
    dec cx                      ; Decrement the outer loop counter
    jz end_sort                 ; If cx becomes zero, end the sorting

    mov si, 0                   ; Initialize the inner loop index

inner_loop:
    mov al, [myArray + si]      ; Load the current element
    mov ah, [myArray + si + 1]  ; Load the next element

    cmp al, ah                  ; Compare the current and next elements
    jbe no_swap                 ; If al <= ah, no swap needed

    ; Swap the elements
    mov [myArray + si], ah
    mov [myArray + si + 1], al

no_swap:
    inc si                      ; Move to the next pair of elements
    cmp si, cx                  ; Compare with the remaining elements
    jb inner_loop               ; If si < cx, continue inner loop

    jmp outer_loop              ; Jump to the next iteration of the outer loop

end_sort:
    ; Print the sorted array
    mov ah, 09h
    lea dx, sorted_msg
    int 21h

    mov si, 0                   ; Reset the index for printing

print_sorted_array:
    mov ah, 02h                 ; Function to print a character
    mov dl, [myArray + si]      ; Load the current character from the array
    int 21h                     ; Print the character

    inc si                      ; Move to the next element

    ; Check if we've reached the end of the array
    cmp si, arraySize
    je end_program

    ; Print a space for formatting
    mov dl, ' '                 
    int 21h

    jmp print_sorted_array

end_program:
    ; Exit the program
    mov ah, 4Ch
    int 21h

main ENDP
end main
