[org 0x0100]

mov  ax, 0xb800         ; video memory base
mov  es, ax             ; cannot move to es through IMM
mov  di, 0              ; top left location 

balck: 

    mov  word [es:di], 0x0000    ;; 00 for balck
    add  di, 2
    cmp  di, 1920
    jne  balck

magenta:

    mov  word [es:di], 0x5000
    add di,2
    cmp di,4000
    jne magenta


jmp start
message : db 'p180046'
length:      dw   7
star : db '*'


printstr:
    push bp
    mov  bp, sp
    push es
    push ax
    push cx 
    push si 
    push di 

    mov ax, 0xb800 ; video memory base
    mov es, ax 
    mov di, 1994               


    mov si, [bp + 6]
    mov cx, [bp + 4]
    mov ah, 0x07 ; only need to do this once ; for color, 07 is code of  Dark gray

    nextchar: 
        mov al, [si]
        mov [es:di], ax 
        add di, 2 
        add si, 1 
        
        ; dec cx 
        ; jnz nextchar     

        ; alternatively 
        loop nextchar 


    pop di 
    pop si 
    pop cx 
    pop ax 
    pop es 
    pop bp 
    ret 4 


start: 

    mov ax, message 
    push ax 
    push word [length]
    call printstr

    ; wait for keypress 
    mov ah, 0x1        ; input char is 0x1 in ah 
    int 0x21 

    mov  ax, 0x4c00
    int  0x21