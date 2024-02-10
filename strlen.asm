[BITS 64]
section .text
    global strlen

strlen:
    xor rax, rax

.loop:
    cmp byte [rdi], 0
    je .done

    inc rax
    inc rdi
    jmp .loop

.done:
    ret
