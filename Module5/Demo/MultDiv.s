.text
.global main
main:
    SUB sp, sp, #4
    STR lr, [sp]

    MOV r4, #5
    LSL r5, r4, #2

    LSL r5, r4, #3
    ADD r5, r5, #5

    MOV r4, #7
    ASR r5, r4, #1

    MOV r4, #-7
    ASR r5, r4, #1

    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr
.data
