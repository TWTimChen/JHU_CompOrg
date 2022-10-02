.text
.global main
main:
    SUB sp, sp ,#4
    STR lr, [sp]

    LDR r0, =prompt1
    BL printf
    LDR r0, =format1
    LDR r1, =uid
    BL scanf

    LDR r0, =prompt2
    BL printf
    LDR r0, =format1
    LDR r1, =pass
    BL scanf

    LDR r0, =uid
    LDR r0, [r0]
    LDR r1, =pass
    LDR r1, [r1]

    EOR r2, r0, r1
    EOR r2, r2, r0

    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr
.data
    prompt1: .asciz "\nEnter the user id: "
    prompt2: .asciz "\nEnter the passkey: "
    format1: .asciz "%d"
    uid:  .word 0
    pass: .word 0
