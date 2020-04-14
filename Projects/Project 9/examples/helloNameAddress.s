.data
question:   	.asciz "What is your name? "
after_question:	.set question_length, after_question - question
question2:	.asciz "Where do you live? "
after2:		.set length2, after2 - question2
greeting:	.asciz "Hello, "
firstName: 	.space 25
after_name:	.set greeting_length, after_name - greeting
location:	.asciz "You live at "
address:	.space 50
after3:		.set length3, after3 - location

.text
.globl _start
 
_start:
 
	mov r0, #1                  	/* standard output */
	ldr r1, =question		/* r1 - prompt */
	mov r2, #question_length
	mov r7, #4			/* write system call*/
	svc #0

	mov r0, #0			/* standard input */
	ldr r1, =firstName		/* point to buffer */
	mov r2, #25			/* length of buffer */
	mov r7, #3			/* read system call */
	svc #0
	
	mov r0, #1
	ldr r1, =question2
	mov r2, #length2
	mov r7, #4
	svc #0

	mov r0, #0
	ldr r1, =address
	mov r2, #50
	mov r7, #3
	svc #0

	mov r0, #1			/* standard output */
    	ldr r1, =greeting    		/* r1 ← &greeting */
    	mov r2, #greeting_length   	/* r2 ← sizeof(greeting) */
     	mov r7, #4                  	/* select system call 'write' */
    	svc #0                      	/* perform the system call */
 
	mov r0, #1
	ldr r1, =location
	mov r2, #length3
	mov r7, #4
	svc #0

    	mov r0, #0
    	mov r7, #1
    	svc #0
 
	.end
