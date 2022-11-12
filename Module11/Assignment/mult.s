#
# Assignment: 1
# Program Name: mult.s
# Author: Tim Chen
# Date: 11/12/2022
# Purpose: Calculate multiplication by resursive function
# Description: enter the multiplicand and multiplier in the form of ${multiplicand}*${multiplier}
#              then get the multiplication
#

.text
.global main
main:
    SUB sp, sp, #4
    STR lr, [sp]

    LDR r0, =prompt
    BL printf
    LDR r0, =format
    LDR r1, =m
    LDR r2, =n
    BL scanf

    LDR r0, =m
    LDR r0, [r0]
    LDR r1, =n
    LDR r1, [r1]
    BL mult
    MOV r1, r0

    LDR r0, =output
    BL printf

    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt: .asciz "\nEnter a multiplication in the form of m*n: "
    output: .asciz "\nYour multiplication is %d\n"
    format: .asciz "%d*%d"
    m: .word 0
    n: .word 0

# END main

.text
mult:
    SUB sp, sp, #12
    STR lr, [sp]
    STR r4, [sp, #4]
    STR r5, [sp, #8]

    MOV r4, r0
    MOV r5, r1

    CMP r4, #1
    BNE else
        MOV r0, r5
        B return
    else:
        SUB r0, r4, #1
        MOV r1, r5
        BL mult
        ADD r0, r5, r0
        B return
    endif:

    return:
    LDR lr, [sp]
    LDR r4, [sp, #4]
    LDR r4, [sp, #8]
    ADD sp, sp, #12
    MOV pc, lr

.data

#END mult
