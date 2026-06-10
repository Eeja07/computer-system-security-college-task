section .text
global _start

_start:

    xor rdx, rdx

    ; command string: "echo hello; ls -la"
    push rdx

    ; "la"
    mov ax, 0x616c
    push rax

    ; "lo; ls -"
    mov rax, 0x2d20736c203b6f6c
    push rax

    ; "echo hel"
    mov rax, 0x6c6568206f686365
    push rax

    mov rbx, rsp


    ; "-c"
    push rdx
    push word 0x632d
    mov rcx, rsp

    ; "/bin//sh"
    push rdx
    mov rax, '/bin//sh'
    push rax
    mov rdi, rsp

    ; argv[]
    push rdx
    push rbx
    push rcx
    push rdi

    mov rsi, rsp

    xor rax, rax
    mov al, 59
    syscall
