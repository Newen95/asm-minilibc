section .text
    global strpbrk

strpbrk:
    test rdi, rdi
    jz .done
    test rsi, rsi
    jz .done
    xor rax, rax
    xor rcx, rcx

.loop:
    sub rsi, rcx
    xor rcx, rcx
    cmp byte [rdi], 0
    je .done
    jmp .testallchars
    inc rdi
    jmp .loop

.testallchars:
    cmp byte sil, 0
    je .loop
    cmp byte [rdi], sil
    je .find
    inc rsi
    inc rcx
    jmp .testallchars

.find:
    mov rax, rdi
    ret

.done:
    xor rax, rax
    ret