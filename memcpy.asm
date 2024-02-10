[BITS 64]
section .text
    global memcpy

memcpy:
    xor rcx, rcx

.loop:
    cmp rcx, rdx
    je .done

    mov al, [rsi + rcx]
    mov [rdi + rcx], al

    inc rcx
    jmp .loop

.done:
    mov rax, rdi
    ret