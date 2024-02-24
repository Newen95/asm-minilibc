[BITS 64]
section .text
    global strrchr
    global rindex



rindex:
    test rdi, rdi
    je emptystring

    jmp len

strrchr:
    test rdi, rdi
    je emptystring

    jmp len

decrease:
    dec rcx

strrchrloop:
    mov al, byte [rdi + rcx]
    cmp al, 0
    je emptystring
    cmp al, sil
    jne decrease
    mov rax, rdi
    add rax, rcx
    jmp done

emptystring:
    xor rax, rax
    ret

done:
    ret

len:
    xor rcx, rcx

lenloop:
    cmp byte [rdi + rcx], 0
    je endlenloop

    inc rcx
    jmp lenloop

endlenloop:
    dec rcx
    jmp strrchrloop

