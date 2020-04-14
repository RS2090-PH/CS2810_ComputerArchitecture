; This subroutine saves the contents of R7 (unnecessaryily as we won't be modifying it)
; Applies the invers of the value in R0 to R0, Adds 1 to the contents of R0, restores
; the original contents of R7 then returns the incremented value of R7 to the PC via RET.

; Registry Use: R0 Action/Return registry
;               R7

2sComp  ST      R7, SAVER7
    	NOT     R0, R0
        ADD     R0, R0, #1
		LD      R7, SAVER7
        RET

SAVER7  .FILL x0000








SAVER1	.FILL x0000
SAVER7  .FILL x0000
ENHEX   .FILL xFF9B
CkEncr	ST      R1, SAVER1
		ST      R7, SAVER7


		LD      R1, SAVER1
		LD      R7, SAVER7
		RET




SAVER1	.FILL x0000
SAVER7  .FILL x0000
DECHEX  .FILL xFF9C
CkDecr	ST      R1, SAVER1
		ST      R7, SAVER7



		LD      R1, SAVER1
		LD      R7, SAVER7
		RET