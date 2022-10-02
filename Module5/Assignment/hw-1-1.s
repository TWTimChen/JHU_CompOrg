.text
.global main
main:
    SUB sp, sp, #4
    STR lr, [sp]

    # print the prompt and scan the input feet value
    LDR r0, =prompt1
    BL printf
    LDR r0, =format1
    LDR r1, =feetVal
    BL scanf

    # convert feet to inches
    LDR r0, =feetVal
    LDR r0, [r0]
    MOV r1, #12
    MUL r0, r0, r1

    # print the convertion result
    MOV r1, r0
    LDR r0, =output1
    BL printf

    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt1: .asciz "Enter the value of feet: "
    format1: .asciz "%d"
    feetVal: .word 0
    output1: .asciz "The foot-to-inch convertion result is: %d\n"
