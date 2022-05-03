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
  pushq %rbp
  movq %rsp, %rbp
  xor %r8, %r8 # INDEX FOR LOOP = 0
  xor %r9 , %r9 # COUNTER = 0
  xor %r10, %r10 # address = 0
  xor %r11, %r11 # INDEX FOR LOOP_8 = 0
  movq %rdi, %r10 # address = address of codeword
L1_HW2: 
    xor %r11, %r11
    movb (%r10), %cl
    addq %r8, %r10 # address = address + INDEX
LOOP_8_HW2:    
    shr %cl
    jb COUNTER_INC
BACK_L1_HW2:
    inc %r11    
    cmp $8, %r11
    jne LOOP_8_HW2
    inc %r8
    cmp %r8, %rsi
    je Finish_HW2
    jl L1_HW2
COUNTER_INC:
    inc %r9
    jl BACK_L1_HW2
Finish_HW2:    
    movq %r9 ,%rax        
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
  pushq %rbp
  movq %rsp, %rbp
  
  movq %rsi, %r10 # r10 = LENGTH
  xor %r8, %r8 # I in the alogoritem
  inc %r8
  xor %r9, %r9 # counter = 0
 
  movq %r8, %rdi
  
  ret
