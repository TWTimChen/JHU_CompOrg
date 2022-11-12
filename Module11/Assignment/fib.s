#
# Assignment: 2
# Program Name: checkPrime.s
# Author: Tim Chen
# Date: 11/12/2022
# Purpose: Generate the nth number of Fibonacci sequence
# Description: Given the definition of fib(0) = 1 and fib(1) = 1,
#              we can induct that fib(2) = 2 and the following numbers would have the same index pattern
#

.text
.global main
main:
    SUB sp, sp, #4
    STR lr, [sp]

    LDR r0, =prompt
    BL printf
    LDR r0, =format
    LDR r1, =n
    BL scanf

    LDR r0, =n
    LDR r0, [r0]
    BL fib
    MOV r2, r0

    LDR r0, =output
    LDR r1, =n
    LDR r1, [r1]
    BL printf

    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt: .asciz "\nEnter a value to get nth number of Fibonacci sequence: "
    output: .asciz "\nThe %dth number of Fibonacci sequence is %d\n"
    format: .asciz "%d"
    n: .word 0

# END main

.text
fib:
    SUB sp, sp, #16
    STR lr, [sp]
    STR r4, [sp, #4]
    STR r5, [sp, #8]
    STR r6, [sp, #12]

    MOV r4, r0
    MOV r5, #0

    CMP r4, #0
    ADDEQ r5, r5, #1
    CMP r4, #1
    ADDEQ r5, r5, #1

    CMP r5, #1
    BLT else
        MOV r0, #1
        B return
    else:
        SUB r0, r4, #1
        BL fib
        MOV r6, r0
        SUB r0, r4, #2
        BL fib
        ADD r0, r6, r0
        B return
    endif:

    return:
    LDR lr, [sp]
    LDR r4, [sp, #4]
    LDR r5, [sp, #8]
    LDR r6, [sp, #12]
    ADD sp, sp, #16
    MOV pc, lr

.data

#END fib
