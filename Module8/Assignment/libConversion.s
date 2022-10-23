#
# Program Name: libConversion.s
# Author: Tim Chen
# Date: 10/23/2022
# Purpose: conversion functions for the assignment
#

.global miles2kilometers
.global kph
.global c2f
.global inches2feet

.text
miles2kilometers:
    # push stack
    SUB sp, sp, #4
    STR lr, [sp]

    # convert miles into kilometers
    MOV r1, #16
    MUL r0, r0, r1
    MOV r1, #10
    # we multiply by 16 and dividing by 10 
    # because the __aeabi_idiv function only take integers as inputs
    BL __aeabi_idiv

    # pop stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data

# END miles2kilometers

.text
kph:
    # push stack
    SUB sp, sp, #4
    STR lr, [sp]

    # calculate kph from given miles and hours
    MOV r4, r0
    MOV r0, r1
    BL miles2kilometers
    MOV r1, r4
    BL __aeabi_idiv

    # pop stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data

# END kph

.text
c2f:
    # push stack
    SUB sp, sp, #4
    STR lr, [sp]

    # convert from celsius to fahrenheit
    MOV r1, #9
    MUL r0, r0, r1
    MOV r1, #5
    BL __aeabi_idiv
    MOV r1, #32
    ADD r0, r0, r1

    # pop stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data

# END c2f

.text
inches2feet:
    # push stack
    SUB sp, sp, #4
    STR lr, [sp]

    # convert from inches to feet
    MOV r4, r0
    MOV r1, #12
    BL __aeabi_idiv
    
    # calculate the remain inches
    MOV r1, #12
    MUL r1, r0, r1
    SUB r1, r4, r1

    # pop stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data

# END inches2feet
