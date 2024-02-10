[BITS 64]
section .text
    global strrchr

strrchr:
	jmp len

decrease:
	dec rcx

strrchrloop:
	mov al, byte [rdi + rcx]
	cmp al, 0
	je done
	cmp al, sil
	jne decrease
	mov rax, rdi
	add rax, rcx
	jmp done

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

.done:
    ret