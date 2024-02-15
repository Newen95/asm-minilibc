section .text
    global strcspn

strcspn:
    test rdi, rdi
    jz .done
    xor rax, rax
    xor rcx, rcx

.loop:
    cmp byte [rdi], 0
    je .done
    jmp .testallchars

.testallchars:
    cmp byte sil, 0
    je .notin
    cmp byte [rdi], sil
    je .isin
    inc rsi
    inc rcx
    jmp .testallchars

.isin:
    xor r8b, r8b
    inc rdi
    jmp .loop

.notin:
    sub rsi, rcx
    ret

.done:
    xor rax, rax
    ret
