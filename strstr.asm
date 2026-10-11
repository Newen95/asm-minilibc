section .text
    global strstr

strstr:
    xor rax, rax
    test rdi, rdi
    jz .done
    test rsi, rsi
    jz .done

.loop:
    xor rcx, rcx

.loopstr:
    mov r8b, byte [rsi + rcx]
    test r8b, r8b
    je .find
    cmp byte [rdi + rcx], r8b
    jne .next
    inc rcx
    jmp .loopstr

.next:
    cmp byte [rdi], 0
    je .done
    inc rdi
    jmp .loop

.find:
    mov rax, rdi
    ret

.done:
    ret
