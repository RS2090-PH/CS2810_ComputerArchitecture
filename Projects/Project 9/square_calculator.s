// Author: Robby Stohel
//
// square_calculator.s
// A subroutine to calculates square of a value.
//
// Parameters: 
//     R0 Action Registry
//     R1 Value
//     R2 Counter
// Returns: 
//     Prints the result

                .global _startsqr

_startsqr:      push {R1,R2,lr}
                movs R1, #0
                movs R2, #0
                movs R1, R0
                movs R2, R0

multiply:       beq finish
                sub  R2, R2, #1
                add  R0, R0, R1
                adds R2, R2, #0
                b multiply

finish:         pop {R1,R2,lr}
                mov pc, lr

                .end
                