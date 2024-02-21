[BITS 64]
section .text
    global memset

memset:
    test rdi, rdi
    jz .done
    xor rcx, rcx

.loop:
    cmp rdx, 0
    jle .done
    cmp rcx, rdx
    je .done
    mov byte [rdi + rcx], sil
    inc rcx
    jmp .loop

.done:
    mov rax, rdi
    ret
