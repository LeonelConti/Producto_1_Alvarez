.model small
.stack 100h
.data
    a   dw 13
    b   dw 16

.code
main proc
    mov     ax, @data
    mov     ds, ax

; ------------------- WHILE (a > 10) -------------------
WHILE_:
    mov     ax, a          ; ax = a
    cmp     ax, 10
    jg      BODY           ; si a > 10 -> entra
    jmp     END_WHILE      ; si a <= 10 -> termina el while

BODY:
    dec     ax             ; a = a - 1
    mov     a, ax

    mov     bx, b          ; bx = b
    add     bx, 2          ; b = b + 2
    mov     b, bx

    jmp     WHILE_         ; volver a evaluar condición

END_WHILE:

; ------------------- if (a < b) swap(a,b); else b = a - 1; -------------------
    mov     ax, a
    mov     bx, b
    cmp     ax, bx
    jl      DO_SWAP        ; a < b ? -> swap
    ; else: b = a - 1
    dec     ax             ; ax = a - 1
    mov     b, ax
    jmp     FIN

DO_SWAP:
    mov     cx, ax     ; CX = a   (guardar el valor original de 'a')
    mov     ax, bx     ; AX = b
    mov     a,  ax     ; a = b   (guardar nuevo 'a' en memoria)

    mov     bx, cx     ; BX = a_original
    mov     b,  bx     ; b = a_original   (guardar nuevo 'b')
    jmp     FIN

FIN:
    mov     ax, 4C00h
    int     21h
main endp

end main
