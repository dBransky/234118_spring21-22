.global main

.data 
num: .quad 0x202
CountBits: .zero 4

.text
main:
mov $0x00000001, %rax # rax = 0x00000001
mov $64, %rbx # rbx = 64 (amount of loops)
mov $0x0, %rcx
Loop1: 
    cmp $0x0, %rbx
    jle end_Loop
    and (num), %rax
    shr %rax
    movq $0x1, %rax
    jge DO1 
Back:
    dec %rbx
    jmp Loop1 
DO1: 
    inc %rcx
    jmp Back
end_Loop: 
    
     
       
    
    
    
  
