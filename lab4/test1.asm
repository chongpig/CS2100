
# task1.asm
.data
str: .asciiz "the answer = "

.text
main:
    li   $v0, 5
    syscall

    move $t0, $v0

    li   $v0, 4
    la   $a0, str
    syscall

    li   $v0, 1
    move $a0, $t0
    syscall

    li   $v0, 10
    syscall

