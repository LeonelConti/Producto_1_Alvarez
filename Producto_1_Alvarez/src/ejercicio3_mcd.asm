.model small
.stack 100h
.data
    a   dw 5
    b   dw 15
    mcd dw ?

.code
main proc
    mov ax, @data
    mov ds, ax

WHILE_:
    ; while(a != b)
    mov ax, a
    mov bx, b
    cmp ax, bx
    je  FIN_WHILE       ; si son iguales ? salir del while

    ; if(a > b)
    ja  A_MAYOR         ; comparación sin signo porque son positivos

    ; else b = b - a
    sub bx, ax          ; bx = b - a
    mov b, bx
    jmp WHILE_

A_MAYOR:
    sub ax, bx          ; ax = a - b
    mov a, ax
    jmp WHILE_

FIN_WHILE:
    mov ax, a
    mov mcd, ax         ; mcd = a (o b, ambos son iguales)

    mov ax, 4C00h
    int 21h
main endp
end main