.global hamming_weight, negate_first_k, bring_balance_to_the_word, read_input

.section .bss
.lcomm path, 1024
.section .data
.section .text
read_input:
    pushq %rbp
    movq %rsp,%rbp
    movq %rdi,%rbx
    pushq %rdi
    lea path,%rdi
    call get_path
    mov $2,%rax
    mov $0,%rsi
    syscall
    mov %rax, %rdi
    xor %rcx,%rcx
    subq $8,%rsp
count_n_hw2:
    mov $0, %rax
    lea -16(%rbp),%rsi
    mov $1, %rdx
    push %rcx
    syscall
    pop %rcx
    cmp $0xa,-16(%rbp)
    inc %rcx
    je finish_count_hw2
    jp count_n_hw2
finish_count_hw2:
    mov $3, %rax
    push %rcx
    syscall
    pop %rcx
    mov $2,%rax
    mov $0,%rsi
    push %rcx
    syscall
    pop %rcx
    xor %r8,%r8
    imul $8,%rcx,%r8
    subq %r8,%rsp
    mov %rax, %rdi
    mov $0, %rax 
    lea -24(%rbp),%rsi
    mov %rcx, %rdx
    push %r8
    push %rcx
    syscall
    pop %rcx
    pop %r8
    movq %rbp,%r9
    sub %r9,%r8
    movq $0,(%r9)
    mov $3, %rax
    syscall
    lea -24(%rbp),%rdi
    call atam_atol
    pushq %rax
    mov $2,%rax
    mov $0,%rsi
    syscall
    mov %rax, %rdi
    pop %rax
    mov %rax, %rdx
    mov $0, %rax
    lea -8(%rbp),%rsi
    syscall
    movq %rbp, %rsp
    popq %rbp
    
    
    
    

    

  ret

hamming_weight:
  ret

negate_first_k:
    pushq %rbp
    movq %rsp,%rbp
    movq %rdi,%rax
    xor %rcx,%rcx
    xor %rdx,%rdx
loop_negate:
    cmp %rcx,%rsi
    je finish
    sal %rdx
    shr %rax
    jae got_zero
    inc %rcx
    jl loop_negate
got_zero:
    inc %rdx
    inc %rcx
    jl loop_negate
finish:
    sal %cl,%rax
    add %rax,%rdx
    movq %rbp, %rsp
    popq %rbp
  ret

bring_balance_to_the_word:
  ret
