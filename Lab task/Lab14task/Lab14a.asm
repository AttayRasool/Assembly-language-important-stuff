[org 0x0100]
jmp start

clearscreen:
    push es
    push ax
    push di

    mov  ax, 0xb800
    mov  es, ax
    xor di,di
    

    nextloc:
        mov  word [es:di], 0x0720
        add  di, 2
        cmp  di, 4000
        jne  nextloc

    pop  di 
    pop  ax
    pop  es
    ret
