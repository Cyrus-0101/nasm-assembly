; add.asm: Adding two numbers (user input) and return the sum
; Author: Cyrus Ndirangu
; Date: June 2023

section .data
    msg1 db 'Enter the first number: ', 0
    len1 equ $ - msg1

    msg2 db 'Enter the second number: ', 0
    len2 equ $ - msg2

    msg3 db 'The result is: ', 0
    len3 equ $- msg3

section .bss
    num1 resb 3 ; buffer to store the first number
    num2 resb 3 ; buffer to store the second number
    res resb 3 ; buffer to store the result

section .text
    global _start

_start:

    ; Prompt for the first number
    mov edx, len1
    mov ecx, msg1
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Read the first number from the user
    mov edx, 3
    mov ecx, num1
    mov ebx, 0
    mov eax, 3
    int 0x80

    ; Prompt for the second number
    mov edx, len2
    mov ecx, msg2
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Read the second number from the user
    mov edx, 3
    mov ecx, num2
    mov ebx, 0
    mov eax, 3
    int 0x80

    ; Move the first number to the eax register and the second number to ebx
    mov eax, dword [num1]
    sub eax, 0x3030 ; convert ASCII to decimal (subtract 0x30 twice)
    mov ebx, dword [num2]
    sub ebx, 0x3030

    add eax, ebx
    add eax, 0x3030 ; convert decimal back to ASCII (add 0x30 twice)

    mov dword [res], eax ; store the sum in the 'res' memory location

    ; Print the "The sum is: " message
    mov edx, len3
    mov ecx, msg3
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Print the result
    mov edx, 3
    mov ecx, res
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Exit the program
    mov ebx, 0
    mov eax, 1
    int 0x80

section .data
newline db 0xa ; newline character