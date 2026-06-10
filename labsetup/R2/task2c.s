section .text
global _start

_start:
BITS 64
jmp short two

one:
    pop rbx

    xor rax,rax

    ; argv[0] = "/bin/sh"
    mov [rbx+31],rbx

    ; argv[1] = "-c"
    lea rcx,[rbx+8]
    mov [rbx+39],rcx

    ; argv[2] = "echo hello; ls -la"
    lea rcx,[rbx+11]
    mov [rbx+47],rcx

    ; argv[3] = NULL
    mov [rbx+55],rax

    ; ubah terminator 0xff menjadi 0x00
    mov [rbx+7],al
    mov [rbx+10],al
    mov [rbx+29],al

    ; execve arguments
    mov rdi,rbx
    lea rsi,[rbx+31]

    xor rdx,rdx

    xor rax,rax
    mov al,59

    syscall

two:
    call one

    db '/bin/sh',0xff
    db '-c',0xff
    db 'echo hello; ls -la',0xff

    db 'AAAAAAAA'
    db 'BBBBBBBB'
    db 'CCCCCCCC'
    db 'DDDDDDDD'
