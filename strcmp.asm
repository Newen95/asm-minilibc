[BITS 64]
section .text
    global strcmp

strcmp:
    xor rcx, rcx

.loop:
    mov al, [rdi + rcx]
    mov bl, [rsi + rcx]

    cmp al, bl
    jne .different

    cmp al, 0
    je .done

    inc rcx
    jmp .loop

.different:
    sub al, bl
    movsx rax, al
    ret

.done:
    xor rax, rax
    ret