.global _start

.section .text
_start:
#your code here
    movq (new_node), %rdx # rdx = new_node.value
    cmp $0, (Root) #if (root == NULL)
    je First # go to first label.
    movq (Root), %rcx # rcx = address of current node
L1_HW1:
    movq (%rcx), %rbx # rbx = value of current node
    cmp %rdx, %rbx # if new_node.value == value of current node
    je END # jump to END if yes
    cmp %rbx, %rdx # if new_node.value == value of current node
    jg COND1 # jump to COND if new_node.value > value of current node  
    jmp COND2
COND1_HW1:   
    movq %rcx, %rax
    add $16, %rax
    cmp $0, (%rax)
    je PLAY
    jmp CONTINUE1
COND2_HW1:
    movq %rcx, %rax
    add $8, %rax
    cmp $0, (%rax)
    je PLAY
    jmp CONTINUE2
PLAY_HW1:
    movq $new_node, (%rax)
    jmp END
CONTINUE1_HW1:
    add $16, %rcx
    movq (%rcx), %rcx
    jmp L1 
CONTINUE2_HW1:
    add $8, %rcx
    movq (%rcx), %rcx
    jmp L1
First_HW1:
    movq $new_node, (Root) # make root to point to new_node adress...
END_HW1:

       