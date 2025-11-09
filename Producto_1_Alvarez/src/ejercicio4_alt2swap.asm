.model small
.stack 100h
.data
    a   dw 13
    b   dw 16
.code
main proc
    mov ax, @data
    mov ds, ax

; -------- while (a > 10) { a=a-1; b=b+2; } --------
WHILE_:
    mov ax, a
    cmp ax, 10
    jle  END_WHILE        ; si a <= 10, salir del while

    dec ax                ; a = a - 1
    mov a, ax

    mov bx, b
    add bx, 2             ; b = b + 2
    mov b, bx

    jmp WHILE_

END_WHILE:
; -------- if (a < b) swap(a,b); else b = a - 1; --------
    mov ax, a
    mov bx, b
    cmp ax, bx
    jl  DO_SWAP

    ; else: b = a - 1
    dec ax
    mov b, ax
    jmp FIN

DO_SWAP:
    
    xchg ax, bx
    mov a, ax
    mov b, bx
    jmp FIN

FIN:
    mov ax, 4C00h
    int 21h
main endp
end main
