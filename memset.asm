[BITS 64]
section .text
    global memset

memset:
    test rdi, rdi
    jz .done
    test rsi, rsi
    jz .done
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
