[BITS 64]
section .text
    global memset

memset:
    xor rcx, rcx

.loop:
    cmp rcx, rsi
    je .done
    mov byte [rdi + rcx], dil
    inc rcx
    jmp .loop

.done:
    mov rax, rdi
    ret
