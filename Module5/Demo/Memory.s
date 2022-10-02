.text
.global main
main:
    SUB sp, sp, #4
    STR lr, [sp, #0]

    LDR r4, =num1
    LDR r0, [r4, #0]

    MOV r0, #7
    STR r0, [r4, #0]

    LDR lr, [sp, #0]
    ADD sp, sp, #4

.data
    num1: .word 25
