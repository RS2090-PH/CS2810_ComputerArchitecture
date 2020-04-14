.data
question:   	.asciz "What is your name? "
after_question:	.set question_length, after_question - question
greeting:		.asciz "Hello, "
firstName: 		.space 25
			.space 1, '\n'
after_name:		.set greeting_length, after_name - greeting


.text
.globl _start
 
_start:
 
    mov r0, #1                  /* standard output */
	ldr r1, =question			/* r1 - prompt */
	mov r2, #question_length
	mov r7, #4					/* write system call*/
	svc #0

	mov r0, #0					/* standard input */
	ldr r1, =firstName			/* point to buffer */
	mov r2, #25					/* length of buffer */
	mov r7, #3					/* read system call */
	svc #0
	
	mov r0, #1					/* standard output */
    ldr r1, =greeting    		/* r1 ← &greeting */
    mov r2, #greeting_length   	/* r2 ← sizeof(greeting) */
 
    mov r7, #4                  /* select system call 'write' */
    svc #0                      /* perform the system call */
 
    mov r0, #0
    mov r7, #1
    svc #0
 
    .end
