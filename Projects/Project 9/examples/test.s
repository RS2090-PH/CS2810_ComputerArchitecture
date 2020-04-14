@ a program to test the convert, divide and printn subroutines
@ number is entered as a text string
@ string is converted to a binary number
@ number is doubled, then converted back to a text string and printed out
.data
question:       .asciz "Enter a positive number less than 1,000,000,000>\n"
after_question: .set question_length, after_question - question
number:         .space 25
errorMsg:       .asciz "Illegal character in string.\n"
after_error:    .set errorLength, after_error - errorMsg

.text
.globl _start
.extern convert
.extern printn

_start:

        mov r0, #1                      /* standard output */
        ldr r1, =question               /* r1 - prompt */
        mov r2, #question_length
        mov r7, #4                      /* write system call*/
        svc #0

        mov r0, #0                      /* standard input */
        ldr r1, =number                 /* point to buffer */
        mov r2, #25                     /* length of buffer */
        mov r7, #3                      /* read system call */
        svc #0

        mov r1, r0                      /* save number of characters read */
        sub r1, r1, #1
        ldr r0, =number                 /* point to buffer */
        bl convert                      /* call convert subroutine */

        subs r2, r0, #-1                /* check for error */
        beq error

	add r0, r0, r0			// double value in r0
	ldr r1, =number			// point to buffer
	mov r2, #25			// set buffer size
	bl printn			// call printn subroutine

	mov r2, r1			// copy character count
	mov r1, r0			// copy string address
	add r6, r2, r1			// point to end of string
	mov r7, #'\n'			// put newline into r7
	strb r7, [r6]			// insert newline to end of string
	add r2, r2, #1			// increment character count
	mov r0, #1			// print to screen
	mov r7, #4			// write command
	svc #0				// make system call
	b exit

error: 	mov r0, #1                      /* standard output */
        ldr r1, =errorMsg
        mov r2, #errorLength
	mov r7, #4			// write
	svc #0

exit:	mov r7, #1
    	svc #0
 
    .end
