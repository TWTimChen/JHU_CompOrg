#
# Program Name: final.s
# Author: Tim Chen
# Date: 12/11/2022
# Purpose: Write an ARM program that uses a looping structure to read integer values from a user until a "-1" is entered, 
#          and then print out the number of values entered, the total of all the value, and the average of the vales
#

.text
.global main
main:

    # Program dictionary:
    # r4 - user enter value
    # r5 - user enter count
    # r6 - user enter sum

    # Puch stack
    SUB sp, sp, #16
    STR lr, [sp, #0]
    STR r4, [sp, #4]
    STR r5, [sp, #8]
    STR r6, [sp, #12]

    # Initialize counter and summer
    MOV r5, #0
    MOV r6, #0

    # Initialize the loop
    startSentinelLoop:
        # read in the input
        LDR r0, =promptStart
        BL printf
        LDR r0, =decFormat
        LDR r1, =number
        BL scanf
        
        LDR r4, =number
        LDR r4, [r4]
        CMP r4, #-1
        BEQ endSentinelLoop

        ADD r5, r5, #1
        ADD r6, r6, r4
        B startSentinelLoop

    endSentinelLoop:

    # Print the result
    LDR r0, =promptCnt
    MOV r1, r5
    BL printf

    LDR r0, =promptSum
    MOV r1, r6
    BL printf

    # Prevent zero division
    CMP r5, #0
    ADDEQ r5, r5, #1

    MOV r0, r6
    MOV r1, r5
    BL __aeabi_idiv

    MOV r1, r0
    LDR r0, =promptAvg
    BL printf

    # Pop stack
    LDR lr, [sp, #0]
    LDR r4, [sp, #4]
    LDR r5, [sp, #8]
    LDR r6, [sp, #12]
    ADD sp, sp, #16
    MOV pc, lr

.data
    promptStart: .asciz "Enter a value or -1 to end: "
    promptCnt: .asciz "\nNumber of the values: %d\n"
    promptSum: .asciz "\nTotal of the values: %d\n"
    promptAvg: .asciz "\nAverage of the values: %d\n"
    decFormat: .asciz "%d"
    number: .word 0
