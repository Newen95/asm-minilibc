[BITS 64]
section .text
    global memmove

loop:
    mov al, byte [rsi + rcx]
    mov byte [rdi + rcx], al
    inc rcx

isend:
    cmp rdx, rcx
    jg loop
    mov rax, rdi
    ret

memmove:
    xor rcx, rcx
    jmp isend
