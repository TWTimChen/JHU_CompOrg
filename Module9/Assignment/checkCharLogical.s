#
# Assignment: 1-1
# Program Name: checkCharLogical.s
# Author: Tim Chen
# Date: 10/30/2022
# Purpose: check if the input character is an English character
#          this is the version with logical variables
#

.global main
.text
main:
    # push stack
    SUB sp, sp, #4
    STR lr, [sp]

    # read the input character
    LDR r0, =prompt
    BL printf
    LDR r0, =format
    LDR r1, =char
    BL scanf

    LDR r4, =char
    LDR r4, [r4]

    # check if the character is with the upper case code range
    MOV r5, #0
    CMP r4, #0x5a
    ADDLE r5, r5, #1
    MOV r6, #0
    CMP r4, #0x41
    ADDGT r6, r6, #1
    AND r0, r5, r6

    # store the check result in a register
    MOV r7, #0
    CMP r0, #1
    ADDEQ r7, r7, #1

    # check if the character is with the lower case code range
    MOV r5, #0
    CMP r4, #0x7a
    ADDLE r5, r5, #1
    CMP r4, #0x61
    MOV r6, #0
    ADDGT r6, r6, #1
    AND r0, r5, r6

    # final check for the result
    ORR r0, r0, r7
    CMP r0, #1
    BNE invalidCharacter
        LDR r0, =promptValid
        MOV r1, r4
        BL printf
        B endCheck

    invalidCharacter:
        LDR r0, =promptInvalid
        MOV r1, r4
        BL printf

    endCheck:

    # pop stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt: .asciz "Enter an arbitrary character: "
    format: .asciz "%c"
    char: .word 0
    promptValid: .asciz "\n%c is a valid character.\n"
    promptInvalid: .asciz "\n%c is an invalid character.\n"

# END main
