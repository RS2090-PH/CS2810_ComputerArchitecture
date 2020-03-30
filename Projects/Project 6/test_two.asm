        .ORIG   x3000
        BR START

OUTSTAT	.FILL xFE04			; label monitor status registry
OUTREG	.FILL xFE06			; label monitor data registry
STRING  .STRINGZ "Test String."

COUT	LDI R7, OUTSTAT		; Gets character from R0 and
		BRzp COUT			; outputs to monitor when the
		STI R0, OUTREG		; monitor is ready.
        ADD R0 R0 #1
        
		BR x03

START   LEA R0 STRING
        BR COUT        





        HALT
        .END