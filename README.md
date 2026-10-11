# MiniLibC in x86-64 assembly

A shared library (`libasm.so`) that reimplements part of the C standard library in
x86-64 assembly (NASM, System V ABI). Because the symbols have the same names as
libc's, any C program can use it in place of the system implementation with
`LD_PRELOAD`.

## Functions

| Strings | Memory |
|---|---|
| `strlen`, `strchr`, `strrchr`, `index`, `rindex` | `memset` |
| `strcmp`, `strncmp`, `strcasecmp` | `memcpy` |
| `strstr`, `strpbrk`, `strcspn` | `memmove` (overlap-safe in both directions) |

Each function follows the System V calling convention: arguments in
`rdi`/`rsi`/`rdx`, result in `rax`, only caller-saved registers used.

## Build and use

Requires `nasm`, `ld` and `make`.

```sh
make                                   # builds libasm.so
LD_PRELOAD=./libasm.so ls -l           # run any program on top of it
```

The library was checked against glibc on edge cases (empty strings, searching
for `'\0'`, overlapping `memmove` copies in both directions, bytes above 127).
