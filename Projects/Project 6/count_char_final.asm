; This program attemps to read a string and then output it

        .orig   x3000

START   AND     R0, R0, #0  ; clears R0 for action registry
        AND     R1, R1, #0  ; clears R1 for first character in string
        AND	    R2, R2, #0  ; clears R2 for character count
        AND     R3, R3, #0  ; clears R3 for string storage pointer
        AND     R4, R4, #0  ; clears R4 for counted character
        AND     R5, R5, #0
        AND     R6, R6, #0
        AND     R7, R7, #0  ; clears R7 for 
        LEA     R3, STRSPC  ; pointer to string storage
        LEA     R0, PROMPT  ; save propert to R0
        PUTS                ; prints prompt

SLOOP   GETC                ; input character -> r0
        OUT                ; r0 -> console
        STR     R0, R3, #0  ; r0 -> ( memory address stored in r1 + 0 )
        ADD     R3, R3, #1  ; increments memory pointer 
        
        LD      R7, NULCH   ; loads null compliment to R7
        ADD     R7, R7, R0  ; tests character for null character

        BRz     TESTCH     ; if null was present, zero flag branches

        ST      R0, STRSPC  ; if no zero, store value to string storage
        BR      SLOOP       ; loop back to get next character
        
TESTCH  ;LEA     R0, ENDLN   ; loads the end line character into R0
        ;PUTS                ; prints end line
        LEA     R0, CHARPR  ; save character prompt to R0
        PUTS   
        GETC				; R0 gets character input
        OUT
        AND     R3, R3, #0
        LEA     R3, STRSPC


        NOT     R0, R0		; Calculate two's complement
        ADD     R0, R0, #1
        ADD     R4, R0, #0
		LDR	    R1, R3, #0	; R1 gets first character in string 

TEST	BRz	    FINISH		; If R1=0, prepare the output
		ADD     R1, R1, R4	; Compare characters
		BRnp 	GETCHAR		; If no match, do not increment
		ADD	    R2, R2, #1	; Otherwise, increment count

GETCHAR	ADD	    R3, R3, #1		; Point to next character.
		LDR	    R1, R3, #0		; R1 gets next char to test
        BR      TEST

FINISH  LD      R0, ENDLN   ; loads the end line character into R0
        OUT                ; prints end line

        AND     R0, R0, #0
	    LD	    R0, ASCII	; Load the ASCII offset
		ADD	    R0, R0, R2	; Covert binary count to ASCII
		OUT				    ; ASCII code in R0 is displayed.

        LEA R0, RSLTS     ; loads the string into R0
        PUTS               ; prints string to console

        HALT                ; Halt machine

ASCII	.FILL   x30			; offset to convert to ascii
ASCCOMP .FILL   xFFE2
NULCH   .FILL   xfff6 
ENDLN   .FILL   xA
STRSPC  .BLKW #75         ; declares string storage reserve
PROMPT  .STRINGZ "Enter your string: "
CHARPR  .STRINGZ "Enter character to count: "
RSLTS   .STRINGZ " occurances of selected character"


        .END


;Failed Characters:
;
;
;
;
;
;
;
;
;
;
;
;
;