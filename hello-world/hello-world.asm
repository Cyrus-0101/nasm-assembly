; char.asm: displays the character ‘a’ on the screen
; Author: Cyrus Ndirangu
; Date: June 2023

section .data
    msg db 'Hello, World!', 0

section .text
    global _start

_start:
    ; write the message to stdout
    mov eax, 4         ; system call number (sys_write)
    mov ebx, 1         ; file descriptor (stdout)
    mov ecx, msg       ; pointer to the message
    mov edx, 13        ; message length
    int 0x80           ; call the kernel

    ; exit the program
    mov eax, 1         ; system call number (sys_exit)
    xor ebx, ebx       ; exit code 0
    int 0x80           ; call the kernel