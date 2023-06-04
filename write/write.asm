; write.asm: Takes Input and returns the output on the screen
; Author: Cyrus Ndirangu
; Date: June 2023

section .data
    prompt db 'Enter a string: ', 0
    output_msg db 'You entered: ', 0

section .bss
    input resb 50   ; Allocate 50 bytes for the input buffer

section .text
    global _start

_start:
    ; Prompt the user to enter a string
    mov eax, 4         ; system call number (sys_write)
    mov ebx, 1         ; file descriptor (stdout)
    mov ecx, prompt    ; pointer to the prompt message
    mov edx, 16        ; prompt message length
    int 0x80           ; call the kernel

    ; Read user input
    mov eax, 3         ; system call number (sys_read)
    mov ebx, 0         ; file descriptor (stdin)
    mov ecx, input     ; buffer to store the input
    mov edx, 50        ; maximum number of bytes to read
    int 0x80           ; call the kernel

    ; Print the output message
    mov eax, 4         ; system call number (sys_write)
    mov ebx, 1         ; file descriptor (stdout)
    mov ecx, output_msg ; pointer to the output message
    mov edx, 14        ; output message length
    int 0x80           ; call the kernel

    ; Print the input string
    mov eax, 4         ; system call number (sys_write)
    mov ebx, 1         ; file descriptor (stdout)
    mov ecx, input     ; pointer to the input string
    mov edx, 50        ; length of the input string
    int 0x80           ; call the kernel

    ; Exit the program
    mov eax, 1         ; system call number (sys_exit)
    xor ebx, ebx       ; exit code 0
    int 0x80           ; call the kernel