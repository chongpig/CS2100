
# arrayCount.asm
.data
arrayA: .word 11, 0, 31, 22, 9, 17, 6, 9   # 8 integers
count:  .word 999                          # placeholder, will be updated

prompt: .asciiz "Enter a power-of-two integer X: "
result: .asciiz "\nNumber of multiples = "

.text
main:
    # Print prompt
    li   $v0, 4
    la   $a0, prompt
    syscall

    # Read integer X
    li   $v0, 5
    syscall
    move $s0, $v0          # $s0 = X

    # Compute mask = X - 1
    addi $t5, $s0, -1      # $t5 = mask

    # Setup array base and count
    la   $t0, arrayA       # $t0 = base address of arrayA
    la   $t8, count        # $t8 = address of count
    li   $t1, 0            # loop index i = 0
    li   $t2, 8            # array size = 8
    li   $t9, 0            # $t9 will store count

loop:
    beq  $t1, $t2, done    # if i == size, end loop

    lw   $t3, 0($t0)       # load arrayA[i] into $t3
    andi $t4, $t3, 0xFFFFFFFF  # just ensure $t3 is treated as int

    and  $t4, $t3, $t5     # remainder = value & mask
    bne  $t4, $zero, not_multiple

    addi $t9, $t9, 1       # count++

not_multiple:
    addi $t1, $t1, 1       # i++
    addi $t0, $t0, 4       # move to next element
    j loop

done:
    # Save count into memory
    sw   $t9, 0($t8)

    # Print result message
    li   $v0, 4
    la   $a0, result
    syscall

    # Print count
    li   $v0, 1
    move $a0, $t9
    syscall

    # Exit
    li   $v0, 10
    syscall
