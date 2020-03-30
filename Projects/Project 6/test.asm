		.ORIG	x3000
		BR START

CIN     IN
        STR     R0      R1 #0
        ADD     R1      R1 #1
        BRp CIN


START   LEA R1 INSTR
        BR CIN
        BR ENDPR

INSTR	.BLKW #15

ENDPR    HALT
		.END
	
