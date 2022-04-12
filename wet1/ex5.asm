.global _start

.section .text
_start:
#your code here
    lea head,%r11D
    mov (%r11D),%eax
    xor %ebx,%ebx
    xor %ecx,%ecx
loop_start_HW1:
    movl (%eax),%edx
    jmp search_src_HW1
next_node_HW1:
    mov 8(%eax),%eax
    mov (%r11D),%r11D
    add $8,%r11D
    cmp $0,%eax
    je end_of_array_HW1
    jmp loop_start_HW1
    
end_of_array_HW1:
    cmp $0,%ebx
    je finish_HW1
    cmp $0,%ecx
    je finish_HW1
    mov %ebx,%r10D
    add $8,%r10D
    cmp %r10D,%r13D
    je adjacent_swap_src_HW1
    mov %ecx,%r10D
    add $8,%r10D
    cmp %r10D,%r12D
    je adjacent_swap_dst_HW1
    jne normal_swap_HW1
adjacent_swap_src_HW1:
    mov %ecx,(%r12D)
    mov 8(%ecx),%r15D
    mov %r15D,(%r13D)
    mov %ebx,8(%ecx)
    jmp finish_HW1
adjacent_swap_dst_HW1:
    mov %ebx,(%r13D)
    mov 8(%ebx),%r15D
    mov %r15D,(%r12D)
    mov %ecx,8(%ebx)
    jmp finish_HW1
normal_swap_HW1:
    mov 8(%ebx),%r14D
    mov 8(%ecx),%r15D
    mov %r14D,8(%ecx)
    mov %r15D,8(%ebx)
    mov %ecx,(%r12D)
    mov %ebx,(%r13D)
    jmp finish_HW1
search_src_HW1:
    cmp %edx,(src)
    je found_src_HW1
search_dst_HW1:    
    cmp %edx,(dst)
    je found_dst_HW1
    jmp next_node_HW1
found_src_HW1:
    cmp $0,%ebx
    jne finish_HW1
    movl %eax,%ebx
    movl %r11D,%r12D
    jmp search_dst_HW1
found_dst_HW1:
    cmp $0,%ecx
    jne finish_HW1
    movl %eax,%ecx
    movl %r11D,%r13D
    jmp next_node_HW1
finish_HW1:
