section .text
    global strpbrk

strpbrk:
    test rdi, rdi
    jz .done
    test rsi, rsi
    jz .done
    xor rax, rax

.loop_outer:
    cmp byte [rdi], 0
    je .done

    xor rcx, rcx
.testallchars:
    cmp byte [rsi + rcx], 0
    je .next_char
    cmp byte dil, [rsi + rcx]
    je .find
    inc rcx
    jmp .testallchars

.next_char:
    inc rdi
    jmp .loop_outer

.find:
    mov rax, rdi
    ret

.done:
    xor rax, rax
    ret
