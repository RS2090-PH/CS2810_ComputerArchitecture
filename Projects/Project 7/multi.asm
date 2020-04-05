; This subroutine Takes two values and multiplies them together.
; This is done by adding the first value (R1) to R0 and decrimienting
; the value in R2. A check takes place at the beginning of the Loop
; to prevent adding R1 to R0 if R2 is zero.

; Registry Use: R0 Action Registry, Return
;               R1 OP1
;               R2 OP2, Rep Counter
;               R7 Post routine instruction


Multi   ST      R1, SAVER1  ; Multi stores initial registry contents and
        ST      R2, SAVER2  ; clears R0 for use
        ST      R7, SAVER7
        AND     R0, R0, #0
Loop    ADD     R2, R2, #1  ; Loop checks the second character for zero and
        ADD     R2, R2, #-1 ; skips multiplication if true. If false, it adds
        BRnz    Cont        ; the value of R1 to R0, then decriments R2. If
        ADD     R0, R0, R1  ; R2 becomes negative or zero the loop stops
        ADD     R2, R2, #-1
        BRp     Loop  
Cont    LD      R1, SAVER1  ; After Loop finishes, Cont reloads the registers
        LD      R2, SAVER2  ; the next instruction address to the PC via RET
	LD      R7, SAVER7
        RET
SAVER1  .FILL x0000
SAVER2  .FILL x0000
SAVER7  .FILL x0000