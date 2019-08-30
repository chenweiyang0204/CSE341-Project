    .data
first: .asciiz "input first num:"
second:.asciiz "input second num:"
result: .asciiz "the result is:"
skipLine: .asciiz "\n\n"

    .text
main:
inputFirstNumber:
    li $v0, 4
    la $a0, first
    syscall

    li $v0, 5
    syscall
    move $s0, $v0

    li $t0, 10
    li $t1, 99
    li $t2, 0

    blt $s0, $t0, inputFirstNumber
    bgt $s0, $t1, inputFirstNumber


inputSecondNumber:
    li $v0, 4
    la $a0, second
    syscall

    li $v0, 5
    syscall
    move $s1, $v0

    blt $s1, $t0, inputSecondNumber
    bgt $s1, $t1, inputSecondNumber

compareFirstInteger:
    div $a1, $s0, $t0
    div $a2, $s1, $t0

    bne $a1, $a2, addOneToResult

compareSecondInteger:
    mul $a1, $a1, $t0
    mul $a2, $a2, $t0

    sub $a1, $s0, $a1
    sub $a2, $s1, $a2

    bne $a1, $a2, addTwoToResult
    j resultReturn

addOneToResult:
    addi $t2, 1
    j compareSecondInteger

addTwoToResult:
    addi $t2, 1

resultReturn:
    move $s3, $t2

    li $v0, 4
    la $a0, result
    syscall

    li $v0, 1
    move $a0, $s3
    syscall

    li $v0, 4
    la $a0, skipLine
    syscall

    j inputFirstNumber

    li $v0, 10
    syscall
