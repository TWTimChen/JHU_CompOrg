.text
.global main
main:
    SUB sp, sp, #4
    STR lr, [sp]

    # here is the number stored in the register
    MOV r1, #15
    # the all-on bit mask
    MOV r2, #0xffffffff
    # the XOR operation
    EOR r1, r1, r2

    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
