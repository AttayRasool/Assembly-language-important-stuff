org 100h
jmp start
Section .data
    msgchr db 'Enter a character (A-z or a-z):$'
    msgString db 10,'Enter your Name:$',10
    msgString2 db 10,'Entered Name: $'
    num dw 0

Section .code
printf:
    mov ah,9
    int 21h
ret

scanchr:
    ;Take Input
    mov ah,7
    int 21h           ;;input character will be stored in al
    mov [num],al

    ;print the entered character
    mov dx,num
    mov ah,9
    int 21h
ret

scanString:
    ;Take Input
    mov dx,answer
    mov ah,0x0a     
    int 21h           ;;input character will be stored in al
    xor bx,bx
    mov bl,[answer]   ;buffer size

    mov word[answer+bx +2] , '$' 
    mov ax,0
    mov dx,msgString2
    call printf
    mov dx,answer+2 
    mov ah,9
    int 21h
ret

start:
    ;mov dx,msgchr
    ;call printf
    ;call scanchr
    mov dx,msgString
    call scanString
    ;mov dx,msgchr
    mov ah,4ch              ; end of program
    int 21h
    answer: db 20,0
    resb 20
