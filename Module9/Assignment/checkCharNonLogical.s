#
# Program Name: libConversion.s
# Author: Tim Chen
# Date: 10/23/2022
# Purpose: conversion functions for the assignment
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

    # start the check
    CMP r4, #0x5a
    BGT checkLower
    CMP r4, #0x41
    BGT validCharacter
        B invalidCharacter

    checkLower:
        CMP r4, #0x7a
        BGT invalidCharacter
        CMP r4, #0x61
        BGT validCharacter
            B invalidCharacter 

    validCharacter:
        LDR r0, =promptValid
        MOV r1, r4
        BL printf
        B endCheck

    invalidCharacter:
        LDR r0, =promptInvalid
        MOV r1, r4
        BL printf
        B endCheck

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
