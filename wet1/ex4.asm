.global main

.data 
Root: .quad A
A: 
    .quad 20
    .quad B
    .quad C
B:
    .quad 10
    .quad 0
    .quad D
C:
    .quad 26	
    .quad 0
    .quad 0
D:
    .quad 13
    .quad 0
    .quad 0

new_node: .quad 267, 0 ,0

.text
main:
    movq (new_node), %rdx # rdx = new_node.value
    cmp $0, (Root) #if (root == NULL)
    je First # go to first label.
    movq (Root), %rcx # rcx = address of current node
L1:
    movq (%rcx), %rbx # rbx = value of current node
    cmp %rdx, %rbx # if new_node.value == value of current node
    je END # jump to END if yes
    cmp %rbx, %rdx # if new_node.value == value of current node
    jg COND1 # jump to COND if new_node.value > value of current node  
    jmp COND2
COND1:   
    movq %rcx, %rax
    add $16, %rax
    cmp $0, (%rax)
    je PLAY
    jmp CONTINUE1
COND2:
    movq %rcx, %rax
    add $8, %rax
    cmp $0, (%rax)
    je PLAY
    jmp CONTINUE2
PLAY:
    movq $new_node, (%rax)
    jmp END
CONTINUE1:
    add $16, %rcx
    movq (%rcx), %rcx
    jmp L1 
CONTINUE2:
    add $8, %rcx
    movq (%rcx), %rcx
    jmp L1
First:
    movq $new_node, (Root) # make root to point to new_node adress...
END:

       
