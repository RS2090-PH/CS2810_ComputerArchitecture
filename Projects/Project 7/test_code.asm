        .ORIG x3000

        AND     R0, R0, #0
        AND     R1, R1, #0
        LD      R1, VALUE
        NOT     R1, R1
        ADD     R1, R1, #1


        HALT

VALUE   .FILL x0064

        .END