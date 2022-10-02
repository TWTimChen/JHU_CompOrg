.text
.global main
main:
    SUB sp, sp, #4
    STR lr, [sp]

    # print the prompt and scan the input inches value
    LDR r0, =prompt1
    BL printf
    LDR r0, =format1
    LDR r1, =inchVal
    BL scanf

    # convert inches feet
    LDR r0, =inchVal
    LDR r0, [r0]
    MOV r1, #12
    BL __aeabi_idiv
    MOV r2, r0

    # calculate the remain inches
    MUL r0, r0, r1
    MOV r3, r0
    LDR r4, =inchVal
    LDR r4, [r4]
    SUB r3, r4, r3

    # print the convertion result
    MOV r1, r2
    MOV r2, r3
    LDR r0, =output1
    BL printf

    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt1: .asciz "Enter the value of inches: "
    format1: .asciz "%d"
    inchVal: .word 0
    feetVal: .word 0
    output1: .asciz "The inch-to-foot convertion result is: %d' %d\"\n"
