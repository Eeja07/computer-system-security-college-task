section .text
global _start

_start:
    BITS 64
    jmp short two

one:
    pop rbx

    xor rax, rax

    ; argv[0] = "/usr/bin/env"
    mov [rbx+49], rbx

    ; argv[1] = NULL
    mov [rbx+57], rax

    ; env[0] = "aaa=hello"
    lea rcx, [rbx+13]
    mov [rbx+65], rcx

    ; env[1] = "bbb=world"
    lea rcx, [rbx+23]
    mov [rbx+73], rcx

    ; env[2] = "ccc=hello world"
    lea rcx, [rbx+33]
    mov [rbx+81], rcx

    ; env[3] = NULL
    mov [rbx+89], rax

    ; ubah terminator 0xff menjadi 0x00
    mov [rbx+12], al
    mov [rbx+22], al
    mov [rbx+32], al
    mov [rbx+48], al

    ; filename
    mov rdi, rbx

    ; argv
    lea rsi, [rbx+49]

    ; envp
    lea rdx, [rbx+65]

    ; execve syscall
    xor rax, rax
    mov al, 59

    syscall

two:
    call one

    db '/usr/bin/env',0xff

    db 'aaa=hello',0xff
    db 'bbb=world',0xff
    db 'ccc=hello world',0xff

    db 'AAAAAAAA'
    db 'BBBBBBBB'

    db 'CCCCCCCC'
    db 'DDDDDDDD'
    db 'EEEEEEEE'
    db 'FFFFFFFF'
