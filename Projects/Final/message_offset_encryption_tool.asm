; Author: Robby Stohel
; File: message_offset_encryption_tool.asm

; This program asks a user if they would like to encrypt or decrypt
; a string. They enter 'e' or 'd' as their choice. Any other input
; loops them back to inputting their choice. After that, they are asked
; to input their string. The string is then encrypted/decrypted based on
; offsetting the alphabet one character so 'a' becomes 'b', 'b' becomes
; 'c', etc.. Decryption reverses that process. Once processed, a
; corresponding message prints to the monitor with their processed string.
; Will be further developing this for my final. Woot! Woot!

; encrypt ex. Input: "test" > Output: "uftu"
; decrypt ex. Input: "uftu" > Output: "test"

;Register Use:      R0: first action registry
;                   R1: second action registry
;                   R2: sub-routine address registry
;                   R3: operation
;                   R4: 
;                   R5: 
;                   R6: message string pointer
;                   R7: return addresses




; Program Start -------------------------------------------------------------
; This section initializes the registries, prints the intro message and
; calls the sub-routine to get and test the desired operation. 

                .ORIG x3000

StrSpace        .BLKW #100                      ; Message memory pointer
Initialize      AND     R0, R0, #0
                AND     R1, R1, #0
                AND     R2, R2, #0
                AND     R3, R3, #0
                AND     R4, R4, #0
                AND     R5, R5, #0
                AND     R6, R6, #0
                AND     R7, R7, #0

Start           JSR     PrIntro
                JSR     PrEndLn
                JSR     GetOp



; Program Encryption --------------------------------------------------------
; This section asks the user to input their plaintext message. The
; message is then encrypted and the post encryption prompt is printed. In
; the end, the user is branched to the last program section, "FInish".
Encrypt         LEA     R0, InProm
                PUTS 
                JSR     Encri
                JSR     EncOut
                BR      Finish



; Program Decryption --------------------------------------------------------
; This section asks the user to input their plaintext message. The
; message is then decrypted and the post decryption prompt is printed. In
; the end, the user is branched to the last program section, "FInish".
Decrypt         LEA     R0, InProm
                PUTS 
                JSR     Decri
                JSR     DecOut
                BR      Finish
        


; Program Finish ------------------------------------------------------------
; This section prints the final results of either encryption or decryption
; and stops the program.
Finish          LEA     R0, StrSpace
                PUTS

                HALT




; Sub-routines --------------------------------------------------------------
; Any sub-routines called during program run are hosted here.
PrEndLn	        ST      R7, SaveR7              ; Prints a new line

                LD	    R0, EndLn
	            OUT

                LD      R7, SaveR7
	            RET

PrIntro	        ST      R7, SaveR7              ; Prints intro message

                LEA	    R0, WelMes
	            PUTS

                LD      R7, SaveR7
                RET

GetOp		    LEA	R0, Select              ; Gets user's desired operation
		        PUTS                            ; via input, and verifies input
                                                ; by calling CkEncr an CkDecr
                GETC                            ; before proceeding.
                OUT
                ADD     R3, R0, #0

                LD      R0, EndLn       
                OUT  

                ADD     R0, R3, #0
                JSR     CkEncr
                ADD     R0, R3, #0
                JSR     CkDecr

                LEA     R0, Invalid
                PUTS
                JSR     PrEndLn
                JSR     PrEndLn
                BR      GetOp

CkEncr	        ST      R7, SaveR7              ; Verifies input as 'e'. Returns
                                                ; if false, branches to Encrypt
                LD 	    R1, EncHex              ; section if true.
	            Add 	R0, R0, R1
	            BRz     Encrypt	

                LD      R7, SaveR7
	            RET

CkDecr	        ST      R7, SaveR7              ; Verifies input as 'd'. Returns
                                                ; if false, branches to Encrypt
                LD 	    R1, DecHex              ; section if true.
	            Add 	R0, R0, R1
	            BRz     Decrypt	

                LD      R7, SaveR7
	            RET

Encri           LEA     R6, StrSpace            ; Encrypts the message with Encri
                ST      R0, SaveR0              ; as a parent sub-routine to ELoop
                ST      R7, SaveR7              ; and CutEnc. ELoop loops to retreive
ELoop           GETC                            ; the message and CutEnc breaks out
                OUT                             ; of the subroutine once complete.

                LD      R1, NullCh
                ADD     R1, R1, R0

                BRz     CutEnc

                LD      R1, Incre
                ADD     R0, R0, R1
                STR     R0, R6, #0
                ADD     R6, R6, #1
        
                BR      ELoop
CutEnc          LD      R0, SaveR0
                LD      R7, SaveR7
                RET

Decri           LEA     R6, StrSpace            ; Decrypts the message with Decri
                ST      R0, SaveR0              ; as a parent sub-routine to DLoop
                ST      R7, SaveR7              ; and CutDec. DLoop loops to retreive
DLoop           GETC                            ; the message and CutDec breaks out
                OUT                             ; of the subroutine once complete.

                LD      R1, NullCh
                ADD     R1, R1, R0

                BRz     CutDec

                LD      R1, Incre
                NOT     R1, R1
                ADD     R1, R1, #1

                ADD     R0, R0, R1
                STR     R0, R6, #0
                ADD     R6, R6, #1
        
                BR      DLoop
CutDec          LD      R0, SaveR0
                LD      R7, SaveR7
                RET

EncOut          ST      R7, SaveR7              ; Prints post-encrption prompt

                LEA     R0, OutProdE
                PUTS

                LD      R7, SaveR7
                RET

DecOut          ST      R7, SaveR7              ; Prints post-decryption prompt
                
                LEA     R0, OutProdD
                PUTS

                LD      R7, SaveR7
                RET



; Stored Values -------------------------------------------------------------
; Any values used by the program are hosted here.
SaveR0          .FILL x0000
SaveR7          .FILL x0000
EndLn           .FILL x0A               ; Endline character	
EncHex          .FILL xFF9B             ; 'e' compliment character
DecHex          .FILL xFF9C             ; 'd' compliment character
NullCh          .FILL xFFF6             ; Null character
Incre           .FILL x01               ; Character offset value
OutProdE        .STRINGZ "Encrypted message: "
OutProdD        .STRINGZ "Decrypted message: "
WelMes          .STRINGZ "Thank you for using the Message Offset Encryption Tool."
Select          .STRINGZ "Do you want to Encrypt(e) or Decrypt(d)? "
InProm          .STRINGZ "Please enter the message to process: "
Invalid         .STRINGZ "Invalid input. Must be 'e' to encrypt or 'd' to decrypt."


                .END
