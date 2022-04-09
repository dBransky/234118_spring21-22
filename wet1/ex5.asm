.global _start

.section .text
_start:
#your code here
    movl (head),%eax
    xor %ebx,%ebx
    xor %ecx,%ecx
loop_start_HW1:
    movl (%eax),%edx
    jmp search_src
next_node_HW1:
    mov 4(%eax),%eax
    cmp $0,%eax
    je end_of_array
    jmp loop_start
    
end_of_array_HW1:
    cmp $0,%ebx
    je finish
    cmp $0,%ecx
    je finish
    movl (%ebx),%r8D
    movl (%ecx),%r9D
    movl %r8D,(%ecx)
    movl %r9D,(%ebx)
    jmp finish
    
search_src_HW1:
    cmp %edx,(src)
    je found_src
search_dst_HW1:    
    cmp %edx,(dst)
    je found_dst
    jmp next_node
found_src_HW1:
    cmp $0,%ebx
    jne finish
    movl %eax,%ebx
    jmp search_dst
found_dst_HW1:
    cmp $0,%ecx
    jne finish
    movl %eax,%ecx
    jmp next_node
finish_HW1:
   jmp finish