global  say_hi
section .text
say_hi:
    mov rax,rdi
    push rax
    ;print name
    mov rax,1
    mov rdi,1
    mov rsi,hello
    mov rdx,helloln-hello
    syscall                                             ;interupt   
    pop rax                                             ;pop parameter
    inc rax                                             ;increment in it
    ret                                                 ;result will be in rax
    section .data
hello:  db 'Hi,FASTIAN Welcome back from Assembly :)',10  ;10 for new line
helloln:
;nasm -f elf64 Lab14c.asm -o Lab14c.o
;gcc -no-pie Lab14c.c Lab14c.o -o hello
