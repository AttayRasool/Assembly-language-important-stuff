org 100h
jmp start

data:db 'I Love Pakistan'
length:dw 16

data1:db 'Assembly Language - Course, FAST University Peshawer Campus'
length1:dw 50

data2:db '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
length2:dw 70


clearscreen:
    mov ah, 06h         ;scroll up function
    xor al, al          ;0 - mean white screen
    mov ch, 0           ; row top left
    mov cl, 0           ;column top left

    mov dh, 24          ;bottom right row
    mov dl, 79          ;bottom right column

    mov bh, 07h         ;white on black

    int 10h
    ret

settopborder
    mov ah, 06h         ;scroll up function
    xor al, al          ;0 - mean white screen
    mov ch, 0           ; row top left
    mov cl, 0           ;column top left

    mov dh, 0           ;bottom right row
    mov dl, 79          ;bottom right column

    mov bh, 50h         ;magenta on black

    int 10h
    ret

setbottomborder
    mov ah, 06h         ;scroll up function
    xor al, al          ;0 - mean white screen
    mov ch, 24          ; row top left
    mov cl, 0           ;column top left

    mov dh, 24          ;bottom right row
    mov dl, 79          ;bottom right column

    mov bh, 50h         ;magenta on black

    int 10h
    ret

setleftborder
    mov ah, 06h         ;scroll up function
    xor al, al          ;0 - mean white screen
    mov ch, 0           ; row top left
    mov cl, 0           ;column top left

    mov dh, 24           ;bottom right row
    mov dl, 0          ;bottom right column

    mov bh, 50h         ;magenta on black

    int 10h
    ret
setrightborder
    mov ah, 06h         ;scroll up function
    xor al, al          ;0 - mean white screen
    mov ch, 0           ; row top left
    mov cl, 79          ;column top left

    mov dh, 24          ;bottom right row
    mov dl, 79          ;bottom right column

    mov bh, 50h         ;magenta on black

    int 10h
    ret
setwhite
    mov ah, 06h         ;scroll up function
    xor al, al          ;0 - mean white screen
    mov ch, 7           ; row top left
    mov cl, 15          ;column top left

    mov dh, 15          ;bottom right row
    mov dl, 23          ;bottom right column

    mov bh, 70h         ;white on black

    int 10h
    ret

setgreen
    mov ah, 06h         ;scroll up function
    xor al, al          ;0 - mean white screen
    mov ch,  7          ; row top left
    mov cl,  24         ;column top left

    mov dh,  15         ;bottom right row
    mov dl,  60         ;bottom right column

    mov bh, 20h         ;white on black

    int 10h
    ret


printstr:
    mov cx, length1-data1
    mov al, 1

    mov bh, 0
    
    mov dh, 5 ;row
    mov dl, 12;column

    mov bl, 07 ;color

    push cs
    pop es

    mov bp, data1
    mov ah, 13h ;print string
    int 10h

    ret

printstr2:
    mov cx, length-data
    mov al, 1

    mov bh, 0
    
    mov dh, 11 ;row
    mov dl, 30;column

    mov bl, 07 ;color

    push cs
    pop es

    mov bp, data
    mov ah, 13h ;print string
    int 10h

    ret

printstr3:
    mov cx, length2-data2
    mov al, 1

    mov bh, 0

    
    mov dh, 0 ;row
    mov dl, 3;column


    mov bl, 07 ;color

    push cs
    pop es


    mov bp, data2
    mov ah, 13h ;print string
    int 10h

    ret
printstr4:
    mov cx, length2-data2
    mov al, 1

    mov bh, 0

    
    mov dh, 24 ;row
    mov dl, 3;column


    mov bl, 07 ;color

    push cs
    pop es


    mov bp, data2
    mov ah, 13h ;print string
    int 10h

    ret


start:
    call clearscreen
    call settopborder
    call setbottomborder
    call setleftborder
    call setrightborder
    call setwhite
    call setgreen
    call printstr
    call printstr2
    call printstr3
    call printstr4
    mov ah, 0h
    int 16h

    mov ax,0x4c00
    int 21h