#
# Program Name: main1.s
# Author: Tim Chen
# Date: 10/23/2022
# Purpose: conversion functions for the assignment
# Inputs: hours and miles for kph conversion
# Outputs: the conversion result
#

.text
.global main

main:
    # push stack
    SUB sp, sp, #4
    STR lr, [sp]

    # prompt for inputs of three integers
    LDR r0, =prompt1
    BL printf

    # scanf
    LDR r0, =input1
    LDR r1, =num1
    LDR r2, =num2
    LDR r3, =num3
    BL scanf

    # convert
    LDR r0, =num1
    LDR r0, [r0]
    LDR r1, =num2
    LDR r1, [r1]
    LDR r2, =num3
    LDR r2, [r2]
    BL findMaxOf3
    MOV r1, r0

    # print the maximum integer
    LDR r0, =format1
    BL printf

    # pop stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt1: .asciz "Enter three integers: "
    input1: .asciz "%d %d %d"
    format1: .asciz "The maximum integer is: %d\n"
    num1: .word 0
    num2: .word 0
    num3: .word 0
