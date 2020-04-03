; This program reads a string provided by the user. It then requests a 
; character to be counted. It then count's the character occurances in
; the string and outputs the result to the terminal.

;Original countChar.asm Bugs:
;search 'n' puts out 2, when 3 are present.
;Also if the char count gets too high it breaks
;ex. replace countCar string with 'ddddddddddd' and 
;count 'd'. It returns '<'. 
;These flaws carried over into my program
;as a fix would entail another lengthy loop and binary masks
;for value checking a binary number.

;Register Use:   R0: action registry
;                R1: first character in string
;        	 R2: character count
;                R3: string storage pointer
;                R4: character to count
;                R5: null character compliment
;                R6:
;                R7: 

        .orig   x3000

START   AND     R0, R0, #0
        AND     R1, R1, #0
        AND	R2, R2, #0
        AND     R3, R3, #0
        AND     R4, R4, #0
        AND     R5, R5, #0
        LEA     R3, STRSPC      ; pointer to string storage
        LEA     R0, PROMPT      ; save initial prompt to R0 to print
        PUTS                    

SLOOP   GETC                    ; get character to R0
        OUT                     
        STR     R0, R3, #0      ; increment string storage pointer
        ADD     R3, R3, #1      ; increments memory pointer 
        
        LD      R5, NULCH       ; loads null compliment to R7
        ADD     R5, R5, R0      ; tests character for null character

        BRz     TESTCH          ; if null was present, zero flag branches

        ST      R0, STRSPC      ; if no zero, store value to string storage
        BR      SLOOP           ; loop back to get next character
        
TESTCH  LEA     R0, CHARPR      ; save character prompt to R0
        PUTS   
        GETC                    ; R0 gets character to count
        OUT
        AND     R3, R3, #0      ; clear R3
        LEA     R3, STRSPC      ; reset R3 to point at string start


        NOT     R0, R0		; Calculate count character two's complement
        ADD     R0, R0, #1
        ADD     R4, R0, #0      ; saves count character compliment to R4
	LDR     R1, R3, #0	; R1 gets first character in string 

TEST	BRz	FINISH		
	ADD     R1, R1, R4	; Compare characters
	BRnp 	GETCHAR		; If no match, do not increment
	ADD	R2, R2, #1	; Otherwise, increment count

GETCHAR	ADD	R3, R3, #1	; Point to next character.
	LDR	R1, R3, #0	; R1 gets next char to test
        BR      TEST

FINISH  LD      R0, ENDLN       ; loads the end line character into R0
        OUT                     ; prints end line

        AND     R0, R0, #0
	LD	R0, ASCII	; Load the ASCII offset
	ADD	R0, R0, R2	; Covert binary count to ASCII
	OUT			; ASCII code in R0 is displayed.

        LEA     R0, RSLTS       ; loads the string into R0
        PUTS                    ; prints string to console

        HALT                    

ASCII	.FILL   x30		; offset to convert to ascii
NULCH   .FILL   xfff6           ; declares null compliment
ENDLN   .FILL   xA              ; declares end line character
STRSPC  .BLKW   #75             ; declares string storage reserve
PROMPT  .STRINGZ "Enter your string: "
CHARPR  .STRINGZ "Enter character to count: "
RSLTS   .STRINGZ " occurances of selected character"

        .END
