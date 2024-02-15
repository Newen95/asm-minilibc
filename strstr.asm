section .text
    global strstr

strstr:
    test rdi, rdi
    jz .done

    xor rax, rax
    xor rcx, rcx

.loop:
    cmp byte [rdi], 0
    je .done
    cmp byte [rdi], sil
    je .isstr
    inc rdi
    jmp .loop

.isstr:
    mov rax, rdi
    xor rcx, rcx
    jmp .loopstr

.loopstr:
    inc rdi
    inc rsi
    inc rcx
    cmp byte [rsi], 0
    je .find
    cmp byte [rdi], sil
    je .loopstr
    sub rdi, rcx
    mov rsi, rax
    jmp .loop

.find:
    ret

.done:
    xor rax, rax
    ret