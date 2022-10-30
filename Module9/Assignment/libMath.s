#
# Program Name: libConversion.s
# Author: Tim Chen
# Date: 10/23/2022
# Purpose: conversion functions for the assignment
#

.global findMaxOf3

.text
findMaxOf3:
    # push stack
    SUB sp, sp, #4
    STR lr, [sp]

    # convert miles into kilometers
    CMP r0, r1
    MOVLT r0, r1
    CMP r0, r2
    MOVLT r0, r2

    # pop stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data

# END findMaxOf3
