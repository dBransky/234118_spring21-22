.global main

.data
destination: .quad 0x60000
source: .quad 0x50000

num: .long 0x5

.section .text
main:
    cmp $0, (num)
    jg MEM_MOVE
    jmp REV_MEM_MOVE
MEM_MOVE:
    movq $destination, %rbx
    movq $source, %rcx
    movl (num), %eax
    jmp LOOP1
REV_MEM_MOVE:
    movq $destination, %rcx
    movq $source, %rbx
    imul $-1, (num), %eax
    jmp LOOP1
LOOP1:
    cmp $0, %eax
    je END
    movb (%rcx), %dl
    movb %dl, (%rbx)
    add $1, %rbx
    add $1, %rcx
    dec %eax 
END:
    