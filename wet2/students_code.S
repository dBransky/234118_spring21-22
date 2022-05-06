.global hamming_weight, negate_first_k, bring_balance_to_the_word, read_input

.section .bss
.lcomm path, 1024
.section .text
read_input:
    pushq %rbp
    movq %rsp,%rbp
    movq %rdi,(%rbp)
    subq $8,%rsp
    leaq path(%rip),%rdi
    call get_path
    mov $2,%rax
    mov $0,%rsi
    syscall
    mov %rax, %rdi
    xor %rcx,%rcx
    subq $8,%rsp
count_n_hw2:
    mov $0, %rax
    lea -8(%rbp),%rsi
    mov $1, %rdx
    pushq %rcx
    syscall
    popq %rcx
    cmpb $0xa,-8(%rbp)
    je finish_count_hw2
    inc %rcx
    jmp count_n_hw2
finish_count_hw2:
    inc %rcx
    addq $8,%rsp
    mov $3, %rax
    push %rcx
    syscall
    popq %rcx
    mov $2,%rax
    mov $0,%rsi
    leaq path(%rip),%rdi
    push %rcx
    syscall
    popq %rcx
    xor %r8,%r8
    imul $8,%rcx,%r8
    subq %r8,%rsp
    mov %rax, %rdi
    mov $0, %rax 
    lea -8(%rbp),%rsi
    mov %rcx, %rdx
    pushq %r8
    pushq %rcx
    syscall
    popq %rcx
    popq %r8
    movq %rbp,%r9
    sub %r8,%r9
    movq $0,(%r9)
    pushq %rdi
    push %r8
    lea -8(%rbp),%rdi
    call atam_atol
    popq %r8
    popq %rdi
    add %r8,%rsp
    mov %rax, %rdx
    mov $0, %rax
    movq (%rbp),%rsi
    addq $8,%rsp
    syscall
    pushq %rdx
    movq $3,%rax
    syscall
    popq %rax
    shr $3,%rax
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

  xor %r9, %r9 # J in second loop
 
L1_VER1_HW2:
    call hamming_weight
    add %rax, %rax # rax = amount of 1 bits * 2.
    xor %r11, %r11 # r11 = 0
    imul $64, %rsi, %r11 # r11 = 64 * LEN
    cmp %r11, %rax # if (64LEN = 2AMOUNTOF1BITS)
    je Finish_VER_HW2
    inc %r8 # I++
    xor %r9, %r9 # r9 = 0
    xor %r10, %r10 # r10 = 0
    movq %r8, %r10 # r10 = I index
    xor %r11, %r11 # r11 = 0 = COUNTER
L2_VER_HW2:
     cmp %r9, %rsi # if r9 == LENGTH
     je L1_VER1_HW2
     cmp $0, %r10
     je L1_VER1_HW2
     cmp $64, %r10 # if r8 >= 64
     jge UPDATE1_VER_HW2
     ja UPDATE2_VER_HW2
UPDATE1_VER_HW2:
    pushq %rdi
    pushq %rsi
    addq %r11, %rdi
    movq $64, %rsi
    call negate_first_k
    popq %rsi
    popq %rdi
    addq %r11, %rdi
    movq %rax,(%rdi) 
    sub $64, %r10
    inc %r11
    ja L2_VER_HW2
UPDATE2_VER_HW2:
    pushq %rdi
    pushq %rsi
    addq %r11, %rdi
    movq %r10, %rsi
    call negate_first_k
    popq %rsi
    popq %rdi
    addq %r11, %rdi
    movq %rax,(%rdi) 
    sub %r10, %r10
    inc %r11
    ja L2_VER_HW2
Finish_VER_HW2:
    movq %r8, %rax
  ret
