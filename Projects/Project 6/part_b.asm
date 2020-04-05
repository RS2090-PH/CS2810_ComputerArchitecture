; This program asks a user if they would like to encrypt or decrypt
; a string. They enter 'e' or 'd' as their choice. Any other input
; loops them back to inputting their choice. After that, they are asked
; to input their string. The string is then encrypted/decrypted based on
; offsetting the alphabet one character so 'a' becomes 'b', 'b' becomes
; 'c', etc.. Decryption reverses that process. Once processed, a
; corresponding message prints to the monitor with their processed string.
; Will be further developing this for my final. Woot! Woot!

; encrypt ex. Input: test > Output: uftu
; decrypt ex. Input: uftu > Output: test

;Register Use:      R0: action registry
;                   R1: string pointer
;                   R2: null compliment
;                   R3: increment/increment compliment
;                   R4: ENHEX space
;                   R5: DECHEX space
;                   R6: Decision
;                   R7: 

        .ORIG x3000


START   AND     R0, R0, #0      ; START preps the registries
        AND     R1, R1, #0      ; sequences to GETPRO
        AND     R2, R2, #0
        AND     R3, R3, #0
        AND     R4, R4, #0
        AND     R5, R5, #0
        AND     R6, R6, #0
        AND     R7, R7, #0
        LEA     R1, STRSPC      
        LD      R3, INCR
        LD      R4, ENHEX
        LD      R5, DECHEX

GETPRO  LEA     R0, ASK         ; GETPRO prints a message to the monitor    
        PUTS                    ; asking the user to select 'e' or 'd',
                                ; then prints an endline character.
        GETC                    ; Sequences to CHKEN
        OUT  
        ADD     R6, R0 #0

        LD      R0, ENDLN       
        OUT                     

CHKEN   ADD     R0, R6, R4      
        BRz     ENSTR           ; CHKEN checks for 'e' to encrypt. Branches to
                                ; ENSTR if 'e', else sequences to CHKDEC
CHKDEC  ADD     R0, R6, R5      ; CHKDEC checks for 'd' to decrypt. Branches to
        BRz     DESTR           ; DESTR if 'd', else loop branches to GETPRO
        BR      GETPRO

DESTR   LEA     R0, INPRO       ; DESTR just to print INPRO message to monitor and
        PUTS                    ; branch to INCOMP
        BR      INCOMP
ENSTR   LEA     R0, INPRO       ; ENSTR just to print INPRO message to monitor and
        PUTS                    ; branch to ENCRI
        BR      ENCRI
INCOMP  NOT     R3, R3          ; Complimentt's the alphabet charater offest for
        ADD     R3, R3, #1      ; decryption only. Sequences to DECRI

DECRI   GETC                    ; Gets the string for processing via loop, and 
        OUT                     ; decrypts each character before saving it.
                                ; Loop branches to DECRI until null compliment is
        LD      R2, NULLC       ; found, then branches to DECOUT.
        ADD     R2, R2, R0

        BRz     DECOUT

        ADD     R0, R0, R3
        STR     R0, R1, #0
        ADD     R1, R1, #1

        BR     DECRI

ENCRI   GETC                    ; Gets the string for processing via loop, and 
        OUT                     ; encrypts each character before saving it.
                                ; Loop branches to ENCRI until null compliment is
        LD      R2, NULLC       ; found, then branches to ENCOUT.
        ADD     R2, R2, R0

        BRz     ENCOUT

        ADD     R0, R0, R3
        STR     R0, R1, #0
        ADD     R1, R1, #1
        
        BR      ENCRI

DECOUT  LEA     R0, OUTPROD     ; DECOUT prints OUTPROD message to monitor
        PUTS                    ; Branches to FINISH
        BR      FINISH
ENCOUT  LEA     R0, OUTPROE     ; ENCOUT prints OUTPROE message to monitor
        PUTS                    ; Branches to FINISH
        BR      FINISH


FINISH  LEA     R0, STRSPC      ; FINISH prints the processed string.
        PUTS
        

        HALT


; The following section prepares value/memory labeling during
; the first compiler passover. Accomplished with code labeling above.
ENDLN   .FILL x0A       ; Endline character             
NULLC   .FILL xFFF6      ; Null character
INCR    .FILL x01       ; Character offset value
ENHEX   .FILL xFF9B     ; Encrypt (e) value
DECHEX  .FILL xFF9C     ; Decrypt (d) value
ASK     .STRINGZ "Encrypt(e) or Decrypt(d)? "
INPRO   .STRINGZ "Type the string to process: "
OUTPROE .STRINGZ "Encrypted string: "
OUTPROD .STRINGZ "Decrypted string: "
STRSPC  .BLKW #100


        .END