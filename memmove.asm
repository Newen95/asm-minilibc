[BITS 64]
section .text
    global memmove

memmove:
    mov rax, rdi
    test rdi, rdi
    jz .done
    test rsi, rsi
    jz .done
    cmp rdi, rsi
    je .done
    ja .backward
    xor rcx, rcx

.forward:
    cmp rcx, rdx
    jae .done
    mov r8b, byte [rsi + rcx]
    mov byte [rdi + rcx], r8b
    inc rcx
    jmp .forward

.backward:
    test rdx, rdx
    jz .done
    dec rdx
    mov r8b, byte [rsi + rdx]
    mov byte [rdi + rdx], r8b
    jmp .backward

.done:
    ret
