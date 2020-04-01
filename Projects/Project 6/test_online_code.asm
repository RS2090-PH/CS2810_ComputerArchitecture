; This program attemps to read a string and then output it

        .orig   x3000
        AND     R1, R1, #0  ; clears R1
        LEA     R1, STRSPC  ; pointer to string storage
        LEA     R0, PROMPT  ; save propert to R0
        PUTS                ; prints prompt

LOOP    GETC                ; input character -> r0
        OUT                ; r0 -> console
        STR R0, R1, #0      ; r0 -> ( memory address stored in r1 + 0 )
        ADD R1, R1, #1      ; increments memory pointer 
        
        LD  R7, NULCH       ; loads null compliment to R7
        ADD R7, R7, R0      ; tests character for null character

        BRz     FINISH      ; if null was present, zero flag branches

        ST  R0, STRSPC      ; if no zero, store value to string storage
        BR  LOOP            ; loop back to get next character

FINISH  LEA R0, STRSPC      ; loads the string into R0
        PUTS                ; prints string to console

        HALT

STRSPC  .BLKW #100      ; declares string storage reserve
PROMPT  .STRINGZ "Enter your string: "
NULCH  .FILL   xfff6 

        .END