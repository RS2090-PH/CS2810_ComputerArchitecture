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








EncHex  .FILL xFF9B
CkEncr	LD 		R1, EncHex
		Add 	R0, R0, R1
		BRz     EncStr	
		RET

DecHex  .FILL xFF9C
CkDecr	LD 		R1, DecHex
		Add 	R0, R0, R1
		BRz     DecStr	
		RET
		
		
		
		
EncStr	



		RET

DecStr



		RET
		
		
EndLn   .FILL x0A	
AddLn	LD		R0, EndLn
		OUT
		RET
		
WelMes  .STRINGZ "Thank you for using the Symetric Message Encryption Tool."
ASK     .STRINGZ "Do you want to Encrypt(e) or Decrypt(d)? "
PrIntro	LD		R0, WelMes
		OUT
		LD		R0, ASK
		OUT
		RET
		
Select  .STRINGZ "Do you want to Encrypt(e) or Decrypt(d)? "
GetOp	Ask	LD	R0, Select
		OUT
		RET
		
		
EncPro


DecPro
