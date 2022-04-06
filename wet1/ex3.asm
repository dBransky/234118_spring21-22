.global main

.data
array1: .long 0x1,0x2,0x4,0
array2: .long 0x3,0
mergedArray: .zero 32

.section .text
main:
    lea array1,%rax
    lea array2,%rbx
    lea mergedArray,%rcx
start_loop:
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
continue:
    addq $4,%rcx
    jmp start_loop
assign1:
    movl %r8D,(%rcx)
    cmp $0,%r8D
    je finish
    addq $4,%rax
    jmp continue
assign2:
    movl %r9D,(%rcx)
    cmp $0,%r9D
    je finish
    addq $4,%rbx
    jmp continue
assign3:
    movl %r8D,(%rcx)
    cmp $0,%r8D
    je finish
    addq $4,%rax
    addq $4,%rbx
    jmp continue
finish:
    