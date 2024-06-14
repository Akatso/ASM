#include <unistd.h>
#include <stdio.h>

int len(char *s)
{
    int i = 0;
    while (s[i])
        i++;
    return (i);
}

void put(char *s)
{
    write(1, s, len(s));
}

int main ()
{
    char *s = "helloooo";

    put(s);
    return (0);
}

//////////////////////

[200~len:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-24], rdi
        mov     DWORD PTR [rbp-4], 0
        jmp     .L2
.L3:
        add     DWORD PTR [rbp-4], 1
.L2:
        mov     eax, DWORD PTR [rbp-4]
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-24]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        test    al, al
        jne     .L3
        mov     eax, DWORD PTR [rbp-4]
        pop     rbp
        ret
put:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    len
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, 1
        call    write
        nop
        leave
        ret
.LC0:
        .string "helloooo"
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], OFFSET FLAT:.LC0
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    put
        mov     eax, 0
        leave
        ret
