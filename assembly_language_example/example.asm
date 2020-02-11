;
; Program to count the number of occurances of a character in a string.
;

        .ORIG x3000
        AND R0, RO, #0
        LEA R3, STRING
        IN
        NOT R4, R0
        ADD R4, R4, #1
LOAD    LDR R1, R3, #0
        BRZ DONE
        ADD R1, R1, R4
        BRNP NEXT
        ADD R2, R2, #1
        NEXT           

        HALT

STRING  .STRINGZ 

        .END