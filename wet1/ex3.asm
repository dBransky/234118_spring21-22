.global _start

.section .text

_start:
#your code here
    lea array1,%rax
    lea array2,%rbx
    lea mergedArray,%rcx
    mov $0,%r10D
start_loop_HW1:
    movl (%rax),%r8D
    movl (%rbx),%r9D
    cmp $0,%r8D
    je assign2_HW1
    cmp $0,%r9D
    je assign1_HW1
    cmp %r8D,%r9D
    je assign3_HW1
    jb assign1_HW1
    jmp assign2_HW1
assign1_HW1:
    cmp $0,%r10D
    je save1_HW1
    cmpl %r8D,-4(%rcx)
    je continue_assign1_HW1
save1_HW1:
    movl %r8D,(%rcx)
    addq $4,%rcx
continue_assign1_HW1:
    cmp $0,%r8D
    je finish_HW1
    addq $4,%rax
    mov $1,%r10D
    jmp start_loop_HW1
assign2_HW1:
    cmp $0,%r10D
    je save2_HW1
    cmpl %r9D,-4(%rcx)
    je continue_assign2_HW1
save2_HW1:
    movl %r9D,(%rcx)
    addq $4,%rcx
continue_assign2_HW1:
    cmp $0,%r9D
    je finish_HW1
    addq $4,%rbx
    mov $1,%r10D
    jmp start_loop_HW1
assign3_HW1:
    cmp $0,%r10D
    je save3_HW1
    cmpl %r8D,-4(%rcx)
    je continue_assign3_HW1
save3_HW1:
    movl %r8D,(%rcx)
    addq $4,%rcx
continue_assign3_HW1:
    cmp $0,%r8D
    je finish_HW1
    addq $4,%rax
    addq $4,%rbx
    mov $1,%r10D
    jmp start_loop_HW1
finish_HW1:
    