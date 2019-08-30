       .data
first: .asciiz "input first num:"
second:.asciiz "input second num:"
operation: .asciiz "input a vaild operation(1~4,1:+,2:-,3:*,4:/):"
outOfBound: .asciiz "please choose a vaild operation!!!!"
result: .asciiz "the result is:"
error: .asciiz "in the div the second number can not be 0. Please enter again."
skipLine: .asciiz "\n\n"

       .text
main:
program:
      li $v0, 4
      la $a0, first
      syscall

      li $v0, 5
      syscall
      move $s0, $v0

      li $v0, 4
      la $a0, second
      syscall

      li $v0, 5
      syscall
      move $s1, $v0

      li $t0 ,1
      li $t1 ,2
      li $t2 ,3
      li $t3 ,4

      j OptInput

OptInput:
      li $v0, 4
      la $a0, operation
      syscall

      li $v0, 5
      syscall
      move $s2, $v0

      beq $s2,$t0,OptAdd
      beq $s2,$t1,OptSub
      beq $s2,$t2,OptMul
      beq $s2,$t3,OptDiv

      j outOfBounds

outOfBounds:
      li $v0, 4
      la $a0, outOfBound
      syscall

      li $v0, 4
      la $a0, skipLine
      syscall

      j OptInput
OptAdd:
      add $s3, $s0, $s1

      li $v0, 4
      la $a0, result
      syscall

      li $v0, 1
      move $a0, $s3
      syscall

      j returnResult
OptSub:
      sub $s3, $s0, $s1

      li $v0, 4
      la $a0, result
      syscall

      li $v0, 1
      move $a0, $s3
      syscall

      j returnResult
OptMul:
      mul $s3, $s0, $s1

      li $v0, 4
      la $a0, result
      syscall

      li $v0, 1
      move $a0, $s3
      syscall

      j returnResult
OptDiv:
      li $t4, 0
      beq $t4, $s1, ErrorHappen

      div $s3, $s0, $s1

      li $v0, 4
      la $a0, result
      syscall

      li $v0, 1
      move $a0, $s3
      syscall

      j returnResult

ErrorHappen:
      li $v0, 4
      la $a0, error
      syscall

      li $v0, 4
      la $a0, skipLine
      syscall

      j program

returnResult:
      li $v0, 4
      la $a0, skipLine
      syscall

      j program

      li $v0, 10
      syscall
