[BITS 64]
section .text
    global strcasecmp

strcasecmp:
    xor rcx, rcx

.upcase_al:
    mov al, [rdi + rcx]
    mov bl, [rsi + rcx]

    cmp al, 'a'
    jb .upcase_bl
    cmp al, 'z'
    ja .upcase_bl
    sub al, 32

.upcase_bl:
    cmp bl, 'a'
    jb .check
    cmp bl, 'z'
    ja .check
    sub bl, 32

.check:
    cmp al, bl
    jne .different
    cmp al, 0
    je .done
    cmp bl, 0
    je .done

    inc rcx
    jmp .upcase_al

.different:
    sub al, bl
    movsx rax, al
    ret

.done:
    xor rax, rax
    ret