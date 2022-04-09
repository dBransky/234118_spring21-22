.global _start

.section .text
_start:
#your code here
    movl (head),%eax
    xor %ebx,%ebx
    xor %ecx,%ecx
loop_start_HW1:
    movl (%eax),%edx
    jmp search_src_HW1
next_node_HW1:
    mov 4(%eax),%eax
    cmp $0,%eax
    je end_of_array_HW1
    jmp loop_start_HW1
    
end_of_array_HW1:
    cmp $0,%ebx
    je finish_HW1
    cmp $0,%ecx
    je finish_HW1
    movl (%ebx),%r8D
    movl (%ecx),%r9D
    movl %r8D,(%ecx)
    movl %r9D,(%ebx)
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
    jmp search_dst_HW1
found_dst_HW1:
    cmp $0,%ecx
    jne finish_HW1
    movl %eax,%ecx
    jmp next_node_HW1
finish_HW1:
