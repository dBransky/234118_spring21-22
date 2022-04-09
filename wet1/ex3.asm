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
    je assign2
    cmp $0,%r9D
    je assign1
    cmp %r8D,%r9D
    je assign3
    ja assign1
    jmp assign2
continue_HW1:
    addq $4,%rcx
    jmp start_loop
assign1_HW1:
    movl %r8D,(%rcx)
    cmp $0,%r8D
    je finish
    addq $4,%rax
    jmp continue
assign2_HW1:
    movl %r9D,(%rcx)
    cmp $0,%r9D
    je finish
    addq $4,%rbx
    jmp continue
assign3_HW1:
    movl %r8D,(%rcx)
    cmp $0,%r8D
    je finish
    addq $4,%rax
    addq $4,%rbx
    jmp continue
finish_HW1:
    