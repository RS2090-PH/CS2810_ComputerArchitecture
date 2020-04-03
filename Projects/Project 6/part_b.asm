;Register Use:      R0: action registry
;                   R1: string pointer
;                   R2: null compliment
;                   R3: increment/increment compliment
;                   R4: ENHEX space
;                   R5: DECHEX space
;                   R6: Decision
;                   R7: 

        .ORIG x3000

START   AND     R0, R0, #0
        AND     R1, R1, #0
        AND     R2, R2, #0
        AND     R3, R3, #0
        AND     R4, R4, #0
        AND     R5, R5, #0
        AND     R6, R6, #0
        AND     R7, R7, #0
        LEA     R1, STRSPC      ; pointer to string storage
        LEA     R3, INCR
        LEA     R4, ENHEX
        NOT     R4, R4
        ADD     R4, R4, #1
        LEA     R5, DECHEX
        NOT     R5, R5 
        ADD     R5, R5, #1

GETPRO  LEA     R0, ASK         ; save initial prompt to R0 to print
        PUTS 

        GETC                    ; get character to R0
        OUT  
        ADD     R6, R0 #0

        LD      R0, ENDLN       ; loads the end line character into R0
        OUT                     ; prints end line

CHKEN   ADD     R0, R6, R4
        BRz     INCRI

CHKDEC  ADD     R0, R6, R5
        BRz     INCOMP
        BR      GETPRO
INCOMP  NOT     R2, R2
        ADD     R2, R2, #0

DECRI
        BRz     FINISH

INCRI   GETC
        OUT     
        ADD     R0, R0, #1
        STR     R0, R1, #0
        ADD     R1, R1, #1

        LD      R2, NULLC
        ADD     R2, R2, R0

        BRz     FINISH

        ST      R0, STRSPC
        BR      INCRI

FINISH  LD      R0, ENDLN       ; loads the end line character into R0
        OUT                     ; prints end line

        LEA     R0, STRSPC
        PUTS
        

        HALT



ENDLN   .FILL x0A       ; Endline character
NULLC   .FILL x30       ; Null character
INCR    .FILL x01       ; Character offset value
ENHEX   .FILL x0101       ; Encrypt (e) value
DECHEX  .FILL x0100       ; Decrypt (d) value
ASK     .STRINGZ "Encrypt(e) or Decrypt(d)?: "
INPRO   .STRINGZ "Type the string to process: "
OUTPROE .STRINGZ "Encrypted string: "
OUTPROD .STRINGZ "Decrypted string: "
STRSPC  .BLKW #100





        .END