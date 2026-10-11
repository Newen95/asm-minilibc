[BITS 64]
section .text
    global strcmp

strcmp:
    xor rcx, rcx

.loop:
    mov al, [rdi + rcx]
    mov r8b, [rsi + rcx]

    cmp al, r8b
    jne .different

    cmp al, 0
    je .done

    inc rcx
    jmp .loop

.different:
    movzx eax, al
    movzx r8d, r8b
    sub eax, r8d
    ret

.done:
    xor rax, rax
    ret