.global _start

.section .text
_start:
#your code here
mov $0x00000001, %rax # rax = 0x00000001
mov $64, %rbx # rbx = 64 (amount of loops)
mov $0x0, %ecx
mov (num), %rdx
Loop1_HW1: 
    mov $0x00000001, %rax 
    cmp $0x0, %rbx
    jle end_Loop_HW1
    and %rdx, %rax
    shr %rdx
    cmp $0x1, %rax
    jge DO1_HW1
Back_HW1:
    dec %rbx
    jmp Loop1_HW1 
DO1_HW1: 
    inc %ecx
    jmp Back_HW1
end_Loop_HW1: 
    movl %ecx, (CountBits)
