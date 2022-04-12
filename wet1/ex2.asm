.global main

.section .data
source: .short 0xCAFE
destination: .quad 0xAABBCCDD
num: .long 0x3


.section .text
main:
    # write your code here
    movq $source, %rax
    movq $destination, %rbx
    movq $0x0, %rcx
    movl (num), %ecx
    cmp $0x0, %ecx
    jg POSITIVE_HW1
    imul $-1, %ecx
    movq $source, %rbx
    movq $destination, %rax
POSITIVE_HW1:
    movq %rax, %rsi
    movq %rbx, %rdi
    addl %ecx, %esi
    addl %ecx, %edi
    # rdi = destination + num
    # rsi = source + num
    cmp %rbx, %rsi
    jg IF2_HW1
    jmp FRONT_LOOP_HW1
IF2_HW1:
    cmp %rax, %rbx
    jg MY_UPDATE_HW1
    jmp FRONT_LOOP_HW1
MY_UPDATE_HW1:
    sub $1, %rsi
    sub $1, %rdi
BACK_LOOP_HW1:
    cmp $0x0, %ecx
    je EXIT_HW1
    movb (%rsi), %dl
    movb %dl, (%rdi)
    dec %rsi
    dec %rdi
    dec %ecx
    jmp BACK_LOOP_HW1
FRONT_LOOP_HW1:
    cmp $0x0, %ecx
    je EXIT_HW1
    movq $0x0, %rdx
    movb (%rax), %dl
    movb %dl, (%rbx)
    inc %rax
    inc %rbx
    dec %ecx
    jmp FRONT_LOOP_HW1
EXIT_HW1:
    
            



