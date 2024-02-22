[BITS 64]
section .text
    global strpbrk

global strpbrk:function
strpbrk:
    test rdi, rdi
    jz .done
    test rsi, rsi
    jz .done
    xor rax, rax
    xor rcx, rcx

.loop:
    xor rdx, rdx
    cmp byte [rdi], 0
    je .done

    mov rdx, rsi
.testallchars:
    cmp byte [rdx], 0
    je .suiteloop

    mov al, [rdi]
    mov cl, [rdx]
    cmp al, cl
    je .find
    inc rdx
    jmp .testallchars

.find:
    mov rax, rdi
    ret

.suiteloop:
    inc rdi
    jmp .loop

.done:
    xor rax, rax
    ret
