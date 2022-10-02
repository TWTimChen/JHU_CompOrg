.text
.global main
main:
    SUB sp, sp, #4
    STR lr, [sp]

    # print the prompt and scan the input integer value
    LDR r0, =prompt1
    BL printf
    LDR r0, =format1
    LDR r1, =int1
    BL scanf

    # calculate the two's complement result
    LDR r0, =int1
    LDR r0, [r0]
    MVN r0, r0
    ADD r0, r0, #1

    # print the convertion result
    MOV r1, r0
    LDR r0, =output1
    BL printf

    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt1: .asciz "Enter an interger value: "
    format1: .asciz "%d"
    int1: .word 0
    output1: .asciz "The two's complement result is: %d\n"
