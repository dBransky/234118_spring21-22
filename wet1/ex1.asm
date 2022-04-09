.global _start

.text
_start:
mov $0x00000001, %rax # rax = 0x00000001
mov $64, %rbx # rbx = 64 (amount of loops)
mov $0x0, %ecx
mov (num), %rdx
Loop1: 
    mov $0x00000001, %rax 
    cmp $0x0, %rbx
    jle end_Loop
    and %rdx, %rax
    shr %rdx
    cmp $0x1, %rax
    jge DO1 
Back:
    dec %rbx
    jmp Loop1 
DO1: 
    inc %ecx
    jmp Back
end_Loop: 
    movl %ecx, (CountBits)