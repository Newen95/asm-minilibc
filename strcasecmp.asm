[BITS 64]
section .text
    global strcasecmp

strcasecmp:
    xor rcx, rcx

.lowcase_al:
    mov al, [rdi + rcx]
    mov r8b, [rsi + rcx]

    cmp al, 'A'
    jb .lowcase_r8b
    cmp al, 'Z'
    ja .lowcase_r8b
    add al, 32

.lowcase_r8b:
    cmp r8b, 'A'
    jb .check
    cmp r8b, 'Z'
    ja .check
    add r8b, 32

.check:
    cmp al, r8b
    jne .different
    cmp al, 0
    je .done
    cmp r8b, 0
    je .done

    inc rcx
    jmp .lowcase_al

.different:
    movzx eax, al
    movzx r8d, r8b
    sub eax, r8d
    ret

.done:
    xor rax, rax
    ret