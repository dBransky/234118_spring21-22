.global hook

.section .data
msg: .ascii "This code was hacked by Ella Lee's gang\n"
endmsg:

.section .text
hook:
  mov $malicous_code, %rax
  mov $_start+30,%rdx
  mov $8,%rcx
  loop_replace:
    movb (%rax),%sil
    movb %sil,(%rdx)
    inc %rax
    inc %rdx
    loopq loop_replace
  pushq $print_secret_msg
  jmp _start

  
print_secret_msg:
    #backup registers
    pushq %rax
    pushq %rcx
    pushq %rdx
    pushq %rsi
    pushq %rdi
    pushq %r8
    pushq %r9
    pushq %r10
    pushq %r11
    #print msg
    movq $1 ,%rdi
    movq $1 ,%rax
    movq $msg,%rsi
    movq $endmsg,%rdx
    subq %rsi,%rdx
    syscall
    popq %r11
    popq %r10
    popq %r9
    popq %r8
    popq %rdi
    popq %rsi
    popq %rdx
    popq %rcx
    popq %rax
    
    
malicous_code:
    pop %rax 
    call *%rax
    nop
    nop
    nop
    nop
    nop
    nop
