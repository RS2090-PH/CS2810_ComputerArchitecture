// Author: Robby Stohel
//
// test_square_calculator.s
// A program to test the square_calculator.s subroutine.
//
// Parameters: 
//     R0 Action Registry
//     R1 Value
//     R2 Value Address
//     R3
//     R4
//     R5
//     R6
//     R7
// Returns: 
//     Prints resulting value

                .data
                .extern _startsqr
value:          .space 4, '\n'
                .text
                .global _start

_start:         push {R1,R2,R3,R4,R5,R6,R7,ip,lr}
                movs R0, #0
                b    _startsqr
                add  R0, R0, 0x030
                ldr  R1, =value
                STRB R1, [R0]
                mov  R7, #4
                svc  #0

                movs R0, #1
                b    _startsqr
                add  R0, R0, 0x030
                ldr  R1, =value
                STRB R1, [R0]
                mov  R7, #4
                svc  #0

                movs R0, #2
                b    _startsqr
                add  R0, R0, 0x030
                ldr  R1, =value
                STRB R1, [R0]
                mov  R7, #4
                svc  #0

                movs R0, #3
                b    _startsqr
                add  R0, R0, 0x030
                ldr  R1, =value
                STRB R1, [R0]
                mov  R7, #4
                svc  #0

                movs R0, #4
                b    _startsqr
                add  R0, R0, 0x030
                ldr  R1, =value
                STRB R1, [R0]
                mov  R7, #4
                svc  #0

                movs R0, #5
                b    _startsqr
                add  R0, R0, 0x030
                ldr  R1, =value
                STRB R1, [R0]
                mov  R7, #4
                svc  #0


finish:         pop {R1,R2,R3,R4,R5,R6,R7,ip,lr}

                .end
                
// Look at countChar.s to some good examples of printing the value