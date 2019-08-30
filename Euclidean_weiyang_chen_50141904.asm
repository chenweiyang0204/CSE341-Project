    .data
firstA: .asciiz "Input corrdinate_x of Point A:"
firstB: .asciiz "Input corrdinate_y of Point A:"
secondA: .asciiz "Input corrdinate_x of Point B:"
secondB: .asciiz "Input corrdinate_y of Point B:"

result: .asciiz "Result:"
skipLine: .asciiz "\n\n"

    .text
main:
program:
      li $v0, 4
      la $a0, firstA
      syscall

      li $v0, 5
      syscall
      move $s0, $v0

      li $v0, 4
      la $a0, firstB
      syscall

      li $v0, 5
      syscall
      move $s1, $v0

      li $v0, 4
      la $a0, secondA
      syscall

      li $v0, 5
      syscall
      move $s2, $v0

      li $v0, 4
      la $a0, secondB
      syscall

      li $v0, 5
      syscall
      move $s3, $v0

calculator:
      sub $t0, $s0, $s2
      sub $t1, $s1, $s3

      mul $t0, $t0, $t0
      mul $t1, $t1, $t1

      add $t2, $t0, $t1

      li $t3, 0
      li $t4, 1

compareLowerBound:
      mul $t5, $t3, $t3
      mul $t6, $t4, $t4

      bgt $t2, $t5, compareUpperBound
      beq $t2, $t5, returnResult
      addi $t3, 1
      addi $t4, 1
      j compareLowerBound

compareUpperBound:
      blt $t2, $t6, returnResult
      addi $t3, 1
      addi $t4, 1
      j compareLowerBound

returnResult:
      li $v0, 4
      la $a0, result
      syscall

      li $v0, 1
      move $a0, $t3
      syscall

      li $v0, 4
      la $a0, skipLine
      syscall

      j program

      li $v0, 10
      syscall
