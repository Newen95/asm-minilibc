section .text
    global strcspn

strcspn:
    xor rax, rax
    test rdi, rdi
    jz .done
    test rsi, rsi
    jz .done

.loop:
    mov r8b, byte [rdi + rax]
    test r8b, r8b
    je .done
    xor rcx, rcx

.testallchars:
    mov r9b, byte [rsi + rcx]
    test r9b, r9b
    je .notin
    cmp r8b, r9b
    je .done
    inc rcx
    jmp .testallchars

.notin:
    inc rax
    jmp .loop

.done:
    ret
