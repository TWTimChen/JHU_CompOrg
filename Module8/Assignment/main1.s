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

    # prompt for inputs of miles and hours
    LDR r0, =prompt1
    BL printf

    # scanf
    LDR r0, =input1
    LDR r1, =numMiles
    LDR r2, =numHours
    BL scanf

    # convert
    LDR r0, =numHours
    LDR r0, [r0]
    LDR r1, =numMiles
    LDR r1, [r1]
    BL kph
    MOV r1, r0

    # print kph
    LDR r0, =format1
    BL printf

    # pop stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt1: .asciz "Enter the value of miles and hours: "
    input1: .asciz "%d %d"
    format1: .asciz "The kph is: %d\n"
    numMiles: .word 0
    numHours: .word 0
