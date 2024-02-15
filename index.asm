[BITS 64]
section .text
    global index

index:
    mov rax, rdi

    test rdi, rdi
    je .done

.loop:
    cmp byte [rdi], 0
    je .done
    cmp byte [rdi], sil
    je .find
    inc rdi
    jmp .loop

.find:
    mov rax, rdi
    ret

.done:
    xor rax, rax
    ret