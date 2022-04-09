.global _start


.section .text
_start:
#your code here
    movq $0x0, %rax
    movl (num), %eax
    cmp $0, %eax
    jge CONTINUE1_HW1
    imul $-1, %eax
    jmp CONTINUE2_HW1
CONTINUE1_HW1:
    movq $0x0, %rcx
    addl %eax, %ecx
    addq $source, %rcx
    addq $-1, %rcx
    #destination
    movq $0x0, %rbx
    addl %eax, %ebx
    addq $destination, %rbx
    addq $-1, %rbx
    jmp LOOP_HW1
CONTINUE2_HW1:
    #source
    movq $0x0, %rbx
    addl %eax, %ebx
    addq $source, %rbx
    addq $-1, %rbx
    #destination
    movq $0x0, %rcx
    addl %eax, %ecx
    addq $destination, %rcx
    addq $-1, %rcx
LOOP_HW1:
    cmp $0x0, %eax
    je EXIT
    movb (%rcx), %dl
    movb %dl, (%rbx)
    dec %rcx
    dec %rbx
    dec %eax
    jmp LOOP_HW1
EXIT:
