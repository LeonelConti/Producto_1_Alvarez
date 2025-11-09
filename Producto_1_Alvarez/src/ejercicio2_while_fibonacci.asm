.model small
.stack 100h
.data
    n     dw 5
    fant  dw 1
    f     dw 1
    i     dw 2
    faux  dw ?

.code
main proc
    mov     ax, @data
    mov     ds, ax

WHILE_:
    ; i <= n ?
    mov     ax, i
    cmp     ax, n
    ja      END_WHILE           ; si i > n, salir (como son positivos, JA vale)

    ; cuerpo: faux = f
    mov     ax, f
    mov     faux, ax

    ; f = f + fant
    add     ax, fant
    mov     f, ax

    ; fant = faux
    mov     ax, faux
    mov     fant, ax

    ; i = i + 1
    mov     ax, i
    inc     ax
    mov     i, ax

    jmp     WHILE_

END_WHILE:
    mov     ax, 4C00h
    int     21h
main endp
end main