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

    # read the student's name and grade
    LDR r0, =promptName
    BL printf
    LDR r0, =formatName
    LDR r1, =name
    BL scanf

    LDR r0, =promptGrade
    BL printf
    LDR r0, =formatGrade
    LDR r1, =grade
    BL scanf

    LDR r4, =grade
    LDR r4, [r4]

    # check if the grade is between 0 to 1000
    MOV r5, #0
    CMP r4, #0
    ADDGE r5, r5, #1
    MOV r6, #0
    CMP r4, #100
    ADDLE r6, r6, #1
    AND r0, r5, r6

    CMP r0, #1
    BNE invalidGrade
        B printGrade

    invalidGrade:
        LDR r0, =promptInvalid
        MOV r1, r4
        BL printf
        B endCheck

    # print the grade level
    printGrade:
        LDR r0, =promptPrintName
        LDR r1, =name
        BL printf
       
        # set F as defaul grade 
        MOV r5, #0x46
        CMP r4, #70
        SUBGE r5, r5, #3
        CMP r4, #80
        SUBGE r5, r5, #1
        CMP r4, #90
        SUBGE r5, r5, #1

        LDR r0, =promptPrintGrade
        MOV r1, r5
        BL printf

    endCheck:

    # pop stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    promptName: .asciz "\nEnter a student's name: "
    promptGrade: .asciz "\nEnter the student\'s grade: "
    formatName: .asciz "%s"
    formatGrade: .asciz "%d"
    name: .asciz "                    "
    grade: .word 0
    promptInvalid: .asciz "\n%d is an invalid grade.\n"
    promptPrintName: .asciz "\nThe student\'s name is %s\n"
    promptPrintGrade: .asciz "The student's grade level is %c\n"

# END main
