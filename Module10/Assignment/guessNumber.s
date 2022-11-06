.text
.global main
main:

    # Program dictionary:
    # r4 - user input max number
    # r5 - generated number
    # r6 - user guess count
    # r7 - user guess number

    # Puch stack
    SUB sp, sp, #20
    STR lr, [sp, #0]
    STR r4, [sp, #4]
    STR r5, [sp, #8]
    STR r6, [sp, #12]
    STR r7, [sp, #16]

    # Get the maximum value and generate answer
    LDR r0, =promptMax
    BL printf
    LDR r0, =decFormat
    LDR r1, =number
    BL scanf

    LDR r4, =number
    LDR r4, [r4]

    BL rand
    MOV r5, r0
    MOV r1, r4
    BL __aeabi_idiv
    MUL r0, r0, r4
    SUB r5, r5, r0

    # set the user guess count
    MOV r6, #0

    # Initialize the loop
    startSentinelLoop:
        # read in the input
        LDR r0, =promptNumber
        BL printf
        LDR r0, =decFormat
        LDR r1, =number
        BL scanf

        ADD r6, r6, #1
        
        LDR r7, =number
        LDR r7, [r7]
        CMP r7, r5
        BEQ endSentinelLoop

        BGT numberGreater
        BLT numberLesser

        numberGreater:
            LDR r0, =promptGreater
            MOV r1, r7
            BL printf
            B startSentinelLoop
        numberLesser:
            LDR r0, =promptLesser
            MOV r1, r7
            BL printf
            B startSentinelLoop

    endSentinelLoop:

    LDR r0, =promptResult
    MOV r1, r6
    BL printf

    # Pop stack
    LDR lr, [sp, #0]
    LDR r4, [sp, #4]
    LDR r5, [sp, #8]
    LDR r6, [sp, #12]
    LDR r7, [sp, #16]
    ADD sp, sp, #20
    MOV pc, lr

.data
    promptMax: .asciz "Enter a number for maximum value of generated answer: "
    promptNumber: .asciz "\nEnter a guessed number: "
    promptGreater: .asciz "\nNumber %d is too high."
    promptLesser: .asciz "\nNumber %d is too low."
    promptResult: .asciz "\nTotal guess time: %d\n"
    decFormat: .asciz "%d"
    number: .word 0
