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
  movq %rsp,%rbp
  xor %r8, %r8 # INDEX FOR LOOP = 0
  xor %r9 , %r9 # COUNTER = 0
  xor %r10, %r10 # address = 0
  xor %r11, %r11 # INDEX FOR LOOP_8 = 0
  movq %rdi, %r10 # address = address of codeword
  imul $8, %rsi, %rax
L1_HW2: 
    xor %r11, %r11
    xor %rcx, %rcx
    movq %rdi, %r10
    addq %r8, %r10 # address = address + INDEX
    movb (%r10), %cl
LOOP_8_HW2:    
    shr %cl
    jb COUNTER_INC
BACK_L1_HW2:
    inc %r11    
    cmp $8, %r11
    jne LOOP_8_HW2
    inc %r8
    cmp %r8, %rax
    je Finish_HW2
    jne L1_HW2
COUNTER_INC:
    inc %r9
    je BACK_L1_HW2
    jne BACK_L1_HW2
Finish_HW2:    
    movq %r9 ,%rax  
    popq %rbp     
  ret


negate_first_k:
    pushq %rbp
    movq %rsp,%rbp
    movq %rdi,%rax
    xor %rcx,%rcx
    xor %rdx,%rdx
loop_negate:
    cmp %rcx,%rsi
    je flip_num
    sal %rdx
    shr %rax
    jae got_zero
    inc %rcx
    jmp loop_negate
got_zero:
    inc %rdx
    inc %rcx
    jmp loop_negate
flip_num:
    xor %r8,%r8
    xor %rcx,%rcx
loop_flip:
    cmp %rcx,%rsi
    je finish
    sal %r8
    shr %rdx
    jb got_one
    inc %rcx
    jmp loop_flip
got_one:
    inc %r8
    inc %rcx
    jmp loop_flip
finish:
    sal %cl,%rax
    add %r8,%rax
    movq %rbp, %rsp
    popq %rbp
  ret

bring_balance_to_the_word:
  pushq %rbp
  pushq %rbx
  pushq %r12
  pushq %r13
  pushq %r14
    
  #reset all
  xor %rdx, %rdx #rdx = 0
  xor %rbx, %rbx #rbx = 0
  xor %r12, %r12 #r12 = 0
  xor %r13, %r13 #r13 = 0
  
  movq %rsp,%rbp #convention
  movq %rsi, %r13 #r13 is the LEN parameter - const!!!
  movq %rdi, %r12 #r12 is the address (orginal) - const!!!
  movq $8, %rbx #rbx is value 8 - const!!!
  
  #r10 = total of bits in the word
  movq %rsi, %r10 
  imul  $64, %r10, %r10 # r10 = amount of bits in the world
  
  #r9 = the index that will be returned
  xor %r9, %r9 # r9 = 0

 
  #Checking Label  
  Final_Check_HW2:

   #rax = 0
   xor %rax, %rax
   
   #save regitser
   pushq %rdi
   pushq %rsi
   pushq %r8
   pushq %r9
   pushq %r11
   pushq %r10
   
   #ready parameters
   movq %r12, %rdi
   movq %r13, %rsi
       
   #call function
   call hamming_weight
   
   #back from function
   popq %r10
   popq %r11
   popq %r9
   popq %r8
   popq %rsi
   popq %rdi
   
   #rax is the value returend
   add %rax, %rax
   
   #check if is balance
   cmp %r10, %rax
   je Finish_Check_HW2
   
   
   cmp $0, %r9
   je Negate_HW2_TEMP
   #check if not balance
   movq $8, %rbx
   xor %rdx, %rdx # rdx = 0
   movq %r9, %rax
   div %rbx
   movq %r12, %rdi
   addq %rax, %rdi
  
   jmp Negate_HW2_TEMP
   
Back_TEMP_HW2:
   movq $8, %rbx
   inc %r9
   xor %rdx, %rdx # rdx = 0
   movq %r9, %rax
   div %rbx
   cmp $0, %rdx
   jg CON2_HW2
   movq $8, %rdx
   dec %rax
CON2_HW2:
   movq %r12, %rdi
   addq %rax, %rdi
  
   jmp Negate_HW2
   
 Negate_HW2_TEMP:

   #save regitser
   pushq %rdi
   pushq %rsi
   pushq %r8
   pushq %r9
   pushq %r11
   pushq %r10 
   
   #ready parameters
   xor %r14, %r14
   movb (%rdi), %r14b
   movq %r14, %rdi
   movq %rdx, %rsi
    
   #call function
   call negate_first_k
   
   #back from function
   popq %r10
   popq %r11
   popq %r9
   popq %r8
   popq %rsi
   popq %rdi

   #back from function
   movb %al, (%rdi)
   
   jmp Back_TEMP_HW2
  
      
 Negate_HW2:

   #save regitser
   pushq %rdi
   pushq %rsi
   pushq %r8
   pushq %r9
   pushq %r11
   pushq %r10 
   
   #ready parameters
   xor %r14, %r14
   movb (%rdi), %r14b
   movq %r14, %rdi
   movq %rdx, %rsi
    
   #call function
   call negate_first_k
   
   #back from function
   popq %r10
   popq %r11
   popq %r9
   popq %r8
   popq %rsi
   popq %rdi

   #back from function
   movb %al, (%rdi)
   
   #go back and check the result
   jmp Final_Check_HW2
 
 Finish_Check_HW2:

    movq %r9, %rax
    
    #conventions
    movq %rbp, %rsp
    
    #back the orgnial values of the registers
    pop %r14
    popq %r13
    popq %r12
    popq %rbx
    popq %rbp
    
    #go back to caller function
    ret
