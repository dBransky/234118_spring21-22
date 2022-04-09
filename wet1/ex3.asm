.global _start

.section .text
_start:
#your code here
    lea array1,%rax
    lea array2,%rbx
    lea mergedArray,%rcx
start_loop_HW1:
    movl (%rax),%r8D
    movl (%rbx),%r9D
    cmp $0,%r8D
    je assign2_HW1
    cmp $0,%r9D
    je assign1_HW1
    cmp %r8D,%r9D
    je assign3_HW1
    ja assign1_HW1
    jmp assign2_HW1
continue_HW1:
    addq $4,%rcx
    jmp start_loop_HW1
assign1_HW1:
    movl %r8D,(%rcx)
    cmp $0,%r8D
    je finish_HW1
    addq $4,%rax
    jmp continue_HW1
assign2_HW1:
    movl %r9D,(%rcx)
    cmp $0,%r9D
    je finish_HW1
    addq $4,%rbx
    jmp continue_HW1
assign3_HW1:
    movl %r8D,(%rcx)
    cmp $0,%r8D
    je finish_HW1
    addq $4,%rax
    addq $4,%rbx
    jmp continue_HW1
finish_HW1:
    