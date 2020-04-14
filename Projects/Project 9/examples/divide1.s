@ divide.s
@ a subroutine that implements integer division and modulus
@ PARAMETERS: 
@ R0 - dividend
@ R1 - divisor
@ RETURN VALUES
@ R0 - quotient
@ R1 - modulus (remainder)
@ LIMITATIONS:
@ Only works with positive numbers
@ ERROR CHECKING:
@ If either dividend or divisor is negative, or divisor is zero, returns -1

.globl divide
divide:	
	push {r2,r6,lr}	// save registers and return address
	movs r2, r0		// copy dividend to R2
	bmi error		// check dividend < 0
	mov r0, #0		// clear r0 to initialize quotient
	movs r6, r1		// copy divisor to r6
	ble error		// check divisor <= 0
	mov r1, r2		// copy dividend to r1
again:
	subs r1, r1, r6		// subtract divisor
	bmi done		// if negative, stop
	add r0, r0, #1		// count successful subtractions
	b again			// subtract again
error:
	mov r0, #-1		// error code
done:
	add r1, r1, r6		// normalize remainder
return:
	pop {r2,r6,pc}		// recover registers and return
	.end
