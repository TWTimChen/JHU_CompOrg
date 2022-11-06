#
# Assignment: 2
# Program Name: checkPrime.s
# Author: Tim Chen
# Date: 11/06/2022
# Purpose: check if a number is within valid range and is prime
#

.text
.global main
main:

    # Program dictionary:
    # r4 - counter for prime check loop
    # r5 - limit for prime check loop
    # r6 - number to check

    # Puch stack
    SUB sp, sp, #16
    STR lr, [sp, #0]
    STR r4, [sp, #4]
    STR r5, [sp, #8]
    STR r6, [sp, #12]

    # Initialize the loop
    startSentinelLoop:
        # read in the input
        LDR r0, =promptNumber
        BL printf
        LDR r0, =decFormat
        LDR r1, =number
        BL scanf
        
        LDR r6, =number
        LDR r6, [r6]
        CMP r6, #-1
        BEQ endSentinelLoop

        # check if the number is valid
        CMP r6, #2
        BLE errorNumber
            B endError
        errorNumber:
            LDR r0, =error
            BL printf
            B startSentinelLoop
        endError:

        # Initialize the check prime loop
        MOV r4, #2
        MOV r5, r6, lsr #1

        startCheckLoop:
            CMP r4, r5
            BGT endCheckLoop

            # check if remainder equal zero
            MOV r0, r6
            MOV r1, r4
            BL __aeabi_idiv
            MUL r0, r0, r4
            CMP r6, r0
            BEQ isNotPrime
                ADD r4, r4, #1
                B startCheckLoop
            isNotPrime:
                LDR r0, =promptIsNotPrime
                MOV r1, r6
                BL printf
                B endCheckLoop

        endCheckLoop:

        CMP r4, r5
        BGT isPrime
            B endIsPrime
        isPrime:
            LDR r0, =promptIsPrime
            MOV r1, r6
            BL printf
        endIsPrime:

        B startSentinelLoop

    endSentinelLoop:

    # Pop stack
    LDR lr, [sp, #0]
    LDR r4, [sp, #4]
    LDR r5, [sp, #8]
    LDR r6, [sp, #12]
    ADD sp, sp, #16
    MOV pc, lr

.data
    promptNumber: .asciz "\nEnter -1 to end the program, any other number to check: "
    promptIsPrime: .asciz "\nNumber %d is prime."
    promptIsNotPrime: .asciz "\nNumber %d is not prime."
    error: .asciz "\nThis is not a valid number."
    decFormat: .asciz "%d"
    number: .word 0
