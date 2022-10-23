#
# Program Name: main2.s
# Author: Tim Chen
# Date: 10/23/2022
# Purpose: conversion functions for the assignment
# Outputs: the conversion result for c2f and inches2feet functions
#

.text
.global main

main:
    # push stack
    SUB sp, sp, #4
    STR lr, [sp]

    # prompt for testing the c2f function
    LDR r0, =promptTestValueC2f
    LDR r1, =numCelsius
    LDR r1, [r1]
    BL printf

    # conversion
    LDR r0, =numCelsius
    LDR r0, [r0]
    BL c2f
    MOV r1, r0

    # show the conversion result
    LDR r0, =promptResultC2f
    BL printf

    # prompt for testing the inches2feet function
    LDR r0, =promptTestValueInches2feet
    LDR r1, =numInches
    LDR r1, [r1]
    BL printf

    # conversion
    LDR r0, =numInches
    LDR r0, [r0]
    BL inches2feet
    MOV r2, r1
    MOV r1, r0

    # show the conversion result
    LDR r0, =promptResultInches2feet
    BL printf

    # pop stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    promptTestValueC2f: .asciz "The test value for c2f is: %d degree Celsius\n"
    promptResultC2f: .asciz "The conversion result is: %d degree Fahrenheit\n"
    promptTestValueInches2feet: .asciz "The test value for inches2feet is: %d inches\n"
    promptResultInches2feet: .asciz "The conversion result is: %d feet and %d inches\n"
    numCelsius: .word 25
    numInches: .word 75
