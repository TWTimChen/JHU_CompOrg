.text
.global main
main:
    SUB sp, sp, #4   
    STR lr, [sp]

    MVN r4, #0
    MOV r5, #0x0000000f
    MOV r6, #1
    AND r1, r4, r5
    ORR r2, r1, r4
    AND r1, r2, r6

    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr
.data
