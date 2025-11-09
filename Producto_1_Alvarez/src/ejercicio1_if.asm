.model small
.stack 100h
.data
    x dw 10      ; ejemplo
    y dw 7       ; ejemplo

.code
main proc
    mov ax, @data
    mov ds, ax

    ; if (x >= y)  ? comparar x con y
    mov ax, x
    mov bx, y
    cmp ax, bx
    jge THEN_        ; si x >= y ? ir a THEN

ELSE_:
    sub ax, 2        ; x = x - 2
    mov x, ax
    sub bx, 2        ; y = y - 2
    mov y, bx
    jmp FIN

THEN_:
    add ax, 2        ; x = x + 2
    mov x, ax
    add bx, 2        ; y = y + 2
    mov y, bx

FIN:
    mov ax, 4C00h
    int 21h
main endp
end main
