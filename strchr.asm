[BITS 64]
section .text
    global strchr
    global index



strchr:
    xor rax, rax

    test rdi, rdi
    je .done

.loop:
    cmp byte [rdi], sil
    je .find
    cmp byte [rdi], 0
    je .done
    inc rdi
    jmp .loop

.find:
    mov rax, rdi
    ret

.done:
    ret



index:
    xor rax, rax

    test rdi, rdi
    je .done

.loop:
    cmp byte [rdi], sil
    je .find
    cmp byte [rdi], 0
    je .done
    inc rdi
    jmp .loop

.find:
    mov rax, rdi
    ret

.done:
    ret
