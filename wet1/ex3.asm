.global main

.data
array1: .long 0x1,0x2,0x4,0
array2: .long 0x3,0
mergedArray: .zero 32

.section .text
main:
    movl array1,%eax
    movl array2,%ebx
    lea mergedArray,%ecx
    cmp %eax,%ebx
    je assign3
    ja assign1
    jmp assign2
continue:
    addl $4,%ecx
assign1:
    movl %eax,(%ecx)
    addl $4,%eax
    jmp continue
assign2:
    movl %ebx,(%ecx)
    addl $4,%ebx
    jmp continue
assign3:
    movl %eax,(%ecx)
    cmp $0,%eax
    je finish
    addl $4,%eax
    addl $4,%ebx
    jmp continue
finish:
    