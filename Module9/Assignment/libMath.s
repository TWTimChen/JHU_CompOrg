#
# Assignment: 3
# Program Name: libMath.s
# Author: Tim Chen
# Date: 10/30/2022
# Description: function that takes three integers as input and return the max one
#

.global findMaxOf3

.text
findMaxOf3:
    # push stack
    SUB sp, sp, #4
    STR lr, [sp]

    # compare three integers and move the maximum to r0
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
