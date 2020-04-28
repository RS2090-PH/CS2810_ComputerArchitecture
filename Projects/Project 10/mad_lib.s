// Author: Robby Stohel
// File: mad_lib.s
// Purpose: This file displays arm assembly input/output using mad libs. A random mad lib was used from
//     http://www.fairfaxfundamentals.com/actvitiesoftheday/2017/3/20/mad-libs-for-some-handwriting-fun
//
// Arguements:
//
//
// Returns:
//
//

                .data

// Section reserves input space
adj1:           .space 26, ' '
nat1:           .space 26, '\n'
per1:           .space 25
nou1:           .space 25
adj2:           .space 25
nou2:           .space 25
adj3:           .space 25
adj4:           .space 25
pln1:           .space 25
nou3:           .space 25
num1:           .space 2, '\n'
sha1:           .space 25
foo1:           .space 25
foo2:           .space 25
num2:           .space 1
nlc:            .space 1, '\n'

// Section reserves output question space
adj_que:        .asciz "Please provide an Adjective: "
after_adj_que:	.set len_adj_que, after_adj_que - adj_que
nat_que:        .asciz "Please provide a Nationality: "
after_nat_que:	.set len_nat_que, after_nat_que - nat_que
nam_que:        .asciz "Please provide a Name: "
after_nam_que:	.set len_nam_que, after_nam_que - nam_que
nou_que:        .asciz "Please provide a Noun: "
after_nou_que:	.set len_nou_que, after_nou_que - nou_que
pln_que:        .asciz "Please provide an Plural Noun: "
after_pln_que:	.set len_pln_que, after_pln_que - pln_que
num_que:        .asciz "Please provide a Number: "
after_num_que:	.set len_num_que, after_num_que - num_que
sha_que:        .asciz "Please provide a Shape: "
after_sha_que:	.set len_sha_que, after_sha_que - sha_que
foo_que:        .asciz "Please provide a type of Food: "
after_foo_que:	.set len_foo_que, after_foo_que - foo_que

// Section reserves output message space
l11:            .asciz "Pizza was inveted by a "
sp1:	        .set len_1, sp1 - l11
l21:            .asciz "chef named "
sp2:	        .set len_2, sp2 - l21
l22:            .asciz ". To make a pizza, you need\n"
sp3:	        .set len_3, sp3 - l22
l31:            .asciz "to take a lump of "
sp4:	        .set len_4, sp4 - l31
l32:            .asciz ", and make a thin, round\n"
sp5:	        .set len_5, sp5 - l32
l41:            .asciz ". Then you cover it with\n"
sp6:	        .set len_6, sp6 - l41
l51:            .asciz " sauce, "
sp7:	        .set len_7, sp7 - l51
l52:            .asciz " cheese, and fresh\n"
sp8:	        .set len_8, sp8 - l52
l61:            .asciz "chopped "
sp9:	        .set len_9, sp9 - l61
l62:            .asciz ". Next you have to bake it in a very\n"
spa:	        .set len_a, spa - l61
l71:            .asciz "hot "
spb:	        .set len_b, spb - l71
l72:            .asciz ". When it is done, cut it into "
spc:	        .set len_c, spc - l72
l81:            .asciz " .Some people like "
spd:	        .set len_d, spd - l81
l82:            .asciz " pizza the\n"
spe:	        .set len_e, spe - l82
l91:            .asciz "best, but my favorite is the "
spf:	        .set len_f, spf - l91
l92:            .asciz " pizza. If I could, I\n"
spg:	        .set len_g, spg - l92
lA1:            .asciz "would eat pizza "
sph:	        .set len_h, sph - lA1
lA2:            .asciz " times a day!\n"
spi:	        .set len_i, spi - lA2



                .text
                .global _start
 
_start:
                mov r0, #1                  /* standard output */
	            ldr r1, =adj_que		    /* r1 - prompt */
	            mov r2, #after_adj_que
	            mov r7, #4			        /* write system call*/
	            svc #0 

	            mov r0, #0			        /* standard input */
	            ldr r1, =adj1		        /* point to buffer */
	            mov r2, #25			        /* length of buffer */
	            mov r7, #3			        /* read system call */
	            svc #0

                mov r0, #1                  /* standard output */
	            ldr r1, =nat_que		    /* r1 - prompt */
	            mov r2, #after_nat_que
	            mov r7, #4			        /* write system call*/
	            svc #0 

	            mov r0, #0			        /* standard input */
	            ldr r1, =nat1		        /* point to buffer */
	            mov r2, #25			        /* length of buffer */
	            mov r7, #3			        /* read system call */
	            svc #0

                mov r0, #1                  /* standard output */
	            ldr r1, =nam_que		    /* r1 - prompt */
	            mov r2, #after_nam_que
	            mov r7, #4			        /* write system call*/
	            svc #0 

	            mov r0, #0			        /* standard input */
	            ldr r1, =per1		        /* point to buffer */
	            mov r2, #25			        /* length of buffer */
	            mov r7, #3			        /* read system call */
	            svc #0

                mov r0, #1                  /* standard output */
	            ldr r1, =nou_que		    /* r1 - prompt */
	            mov r2, #after_nou_que
	            mov r7, #4			        /* write system call*/
	            svc #0 

	            mov r0, #0			        /* standard input */
	            ldr r1, =nou1		        /* point to buffer */
	            mov r2, #25			        /* length of buffer */
	            mov r7, #3			        /* read system call */
	            svc #0

                mov r0, #1                  /* standard output */
	            ldr r1, =adj_que		    /* r1 - prompt */
	            mov r2, #after_adj_que
	            mov r7, #4			        /* write system call*/
	            svc #0 

	            mov r0, #0			        /* standard input */
	            ldr r1, =adj2		        /* point to buffer */
	            mov r2, #25			        /* length of buffer */
	            mov r7, #3			        /* read system call */
	            svc #0

                mov r0, #1                  /* standard output */
	            ldr r1, =nou_que		    /* r1 - prompt */
	            mov r2, #after_nou_que
	            mov r7, #4			        /* write system call*/
	            svc #0 

	            mov r0, #0			        /* standard input */
	            ldr r1, =nou2		        /* point to buffer */
	            mov r2, #25			        /* length of buffer */
	            mov r7, #3			        /* read system call */
	            svc #0

                mov r0, #1                  /* standard output */
	            ldr r1, =adj_que		    /* r1 - prompt */
	            mov r2, #after_adj_que
	            mov r7, #4			        /* write system call*/
	            svc #0 

	            mov r0, #0			        /* standard input */
	            ldr r1, =adj3		        /* point to buffer */
	            mov r2, #25			        /* length of buffer */
	            mov r7, #3			        /* read system call */
	            svc #0

                mov r0, #1                  /* standard output */
	            ldr r1, =adj_que		    /* r1 - prompt */
	            mov r2, #after_adj_que
	            mov r7, #4			        /* write system call*/
	            svc #0 

	            mov r0, #0			        /* standard input */
	            ldr r1, =adj4		        /* point to buffer */
	            mov r2, #25			        /* length of buffer */
	            mov r7, #3			        /* read system call */
	            svc #0

                mov r0, #1                  /* standard output */
	            ldr r1, =pln_que		    /* r1 - prompt */
	            mov r2, #after_pln_que
	            mov r7, #4			        /* write system call*/
	            svc #0 

	            mov r0, #0			        /* standard input */
	            ldr r1, =pln1		        /* point to buffer */
	            mov r2, #25			        /* length of buffer */
	            mov r7, #3			        /* read system call */
	            svc #0

                mov r0, #1                  /* standard output */
	            ldr r1, =nou_que		    /* r1 - prompt */
	            mov r2, #after_nou_que
	            mov r7, #4			        /* write system call*/
	            svc #0 

	            mov r0, #0			        /* standard input */
	            ldr r1, =nou3		        /* point to buffer */
	            mov r2, #25			        /* length of buffer */
	            mov r7, #3			        /* read system call */
	            svc #0

                mov r0, #1                  /* standard output */
	            ldr r1, =num_que		    /* r1 - prompt */
	            mov r2, #after_num_que
	            mov r7, #4			        /* write system call*/
	            svc #0 

	            mov r0, #0			        /* standard input */
	            ldr r1, =num1		        /* point to buffer */
	            mov r2, #6 		        /* length of buffer */
	            mov r7, #3			        /* read system call */
	            svc #0

                mov r0, #1                  /* standard output */
	            ldr r1, =sha_que		    /* r1 - prompt */
	            mov r2, #after_sha_que
	            mov r7, #4			        /* write system call*/
	            svc #0 

	            mov r0, #0			        /* standard input */
	            ldr r1, =sha1		        /* point to buffer */
	            mov r2, #25			        /* length of buffer */
	            mov r7, #3			        /* read system call */
	            svc #0

                mov r0, #1                  /* standard output */
	            ldr r1, =foo_que		    /* r1 - prompt */
	            mov r2, #after_foo_que
	            mov r7, #4			        /* write system call*/
	            svc #0 

	            mov r0, #0			        /* standard input */
	            ldr r1, =foo1		        /* point to buffer */
	            mov r2, #25			        /* length of buffer */
	            mov r7, #3			        /* read system call */
	            svc #0

                mov r0, #1                  /* standard output */
	            ldr r1, =foo_que		    /* r1 - prompt */
	            mov r2, #after_foo_que
	            mov r7, #4			        /* write system call*/
	            svc #0 

	            mov r0, #0			        /* standard input */
	            ldr r1, =foo2		        /* point to buffer */
	            mov r2, #25			        /* length of buffer */
	            mov r7, #3			        /* read system call */
	            svc #0

                mov r0, #1                  /* standard output */
	            ldr r1, =num_que		    /* r1 - prompt */
	            mov r2, #after_num_que
	            mov r7, #4			        /* write system call*/
	            svc #0 

	            mov r0, #0			        /* standard input */
	            ldr r1, =num2		        /* point to buffer */
	            mov r2, #6			        /* length of buffer */
	            mov r7, #3			        /* read system call */
	            svc #0

                mov r0, #1                  /* standard output */
	            ldr r1, =nlc		        /* r1 - prompt */
	            mov r2, #1
	            mov r7, #4			        /* write system call*/
	            svc #0 
 

// Printing mad lib:
// Line One
                mov r0, #1                  /* standard output */
	            ldr r1, =l11		        /* r1 - prompt */
	            mov r2, #sp1
	            mov r7, #4			        /* write system call*/
	            svc #0 

                mov r0, #1                  /* standard output */
	            ldr r1, =adj1		    /* r1 - prompt */
	            mov r2, #26
	            mov r7, #4			        /* write system call*/
	            svc #0 

                mov r0, #1                  /* standard output */
	            ldr r1, =nat1		    /* r1 - prompt */
	            mov r2, #26
	            mov r7, #4			        /* write system call*/
	            svc #0 

// Line Two
                mov r0, #1                  /* standard output */
	            ldr r1, =l21		    /* r1 - prompt */
	            mov r2, #sp2
	            mov r7, #4			        /* write system call*/
	            svc #0 

                mov r0, #1                  /* standard output */
	            ldr r1, =per1		    /* r1 - prompt */
	            mov r2, #25
	            mov r7, #4			        /* write system call*/
	            svc #0 

                mov r0, #1                  /* standard output */
	            ldr r1, =l22		    /* r1 - prompt */
	            mov r2, #sp3
	            mov r7, #4			        /* write system call*/
	            svc #0 

// Line Three
                mov r0, #1                  /* standard output */
	            ldr r1, =l31		    /* r1 - prompt */
	            mov r2, #sp4
	            mov r7, #4			        /* write system call*/
	            svc #0 

                mov r0, #1                  /* standard output */
	            ldr r1, =nou1		    /* r1 - prompt */
	            mov r2, #25
	            mov r7, #4			        /* write system call*/
	            svc #0 

                mov r0, #1                  /* standard output */
	            ldr r1, =l32		    /* r1 - prompt */
	            mov r2, #sp5
	            mov r7, #4			        /* write system call*/
	            svc #0 

// Line Four
                mov r0, #1                  /* standard output */
	            ldr r1, =adj2		    /* r1 - prompt */
	            mov r2, #25
	            mov r7, #4			        /* write system call*/
	            svc #0 

                mov r0, #1                  /* standard output */
	            ldr r1, =nou2		    /* r1 - prompt */
	            mov r2, #25
	            mov r7, #4			        /* write system call*/
	            svc #0 

                mov r0, #1                  /* standard output */
	            ldr r1, =l41		    /* r1 - prompt */
	            mov r2, #sp6
	            mov r7, #4			        /* write system call*/
	            svc #0 

// Line Five
                mov r0, #1                  /* standard output */
	            ldr r1, =adj3		    /* r1 - prompt */
	            mov r2, #25
	            mov r7, #4			        /* write system call*/
	            svc #0 

                mov r0, #1                  /* standard output */
	            ldr r1, =l51		    /* r1 - prompt */
	            mov r2, #sp7
	            mov r7, #4			        /* write system call*/
	            svc #0 

                mov r0, #1                  /* standard output */
	            ldr r1, =adj4		    /* r1 - prompt */
	            mov r2, #25
	            mov r7, #4			        /* write system call*/
	            svc #0 

                mov r0, #1                  /* standard output */
	            ldr r1, =l52		    /* r1 - prompt */
	            mov r2, #sp8
	            mov r7, #4			        /* write system call*/
	            svc #0 

// Line Six
                mov r0, #1                  /* standard output */
	            ldr r1, =l61		    /* r1 - prompt */
	            mov r2, #sp9
	            mov r7, #4			        /* write system call*/
	            svc #0 

                mov r0, #1                  /* standard output */
	            ldr r1, =pln1		    /* r1 - prompt */
	            mov r2, #25
	            mov r7, #4			        /* write system call*/
	            svc #0 

                mov r0, #1                  /* standard output */
	            ldr r1, =l62		    /* r1 - prompt */
	            mov r2, #spa
	            mov r7, #4			        /* write system call*/
	            svc #0 

// Line Seven
                mov r0, #1                  /* standard output */
	            ldr r1, =l71		    /* r1 - prompt */
	            mov r2, #spb
	            mov r7, #4			        /* write system call*/
	            svc #0 

                mov r0, #1                  /* standard output */
	            ldr r1, =nou3		    /* r1 - prompt */
	            mov r2, #25
	            mov r7, #4			        /* write system call*/
	            svc #0 

                mov r0, #1                  /* standard output */
	            ldr r1, =l72		    /* r1 - prompt */
	            mov r2, #spc
	            mov r7, #4			        /* write system call*/
	            svc #0 

                mov r0, #1                  /* standard output */
	            ldr r1, =num1		    /* r1 - prompt */
	            mov r2, #2
	            mov r7, #4			        /* write system call*/
	            svc #0 

// Line Eight
                mov r0, #1                  /* standard output */
	            ldr r1, =sha1		    /* r1 - prompt */
	            mov r2, #25
	            mov r7, #4			        /* write system call*/
	            svc #0 

                mov r0, #1                  /* standard output */
	            ldr r1, =l81		    /* r1 - prompt */
	            mov r2, #spd
	            mov r7, #4			        /* write system call*/
	            svc #0 

                mov r0, #1                  /* standard output */
	            ldr r1, =foo1		    /* r1 - prompt */
	            mov r2, #25
	            mov r7, #4			        /* write system call*/
	            svc #0 

                mov r0, #1                  /* standard output */
	            ldr r1, =l82		    /* r1 - prompt */
	            mov r2, #spe
	            mov r7, #4			        /* write system call*/
	            svc #0 

// Line Nine
                mov r0, #1                  /* standard output */
	            ldr r1, =l91		    /* r1 - prompt */
	            mov r2, #spf
	            mov r7, #4			        /* write system call*/
	            svc #0 

                mov r0, #1                  /* standard output */
	            ldr r1, =foo2		    /* r1 - prompt */
	            mov r2, #25
	            mov r7, #4			        /* write system call*/
	            svc #0 

                mov r0, #1                  /* standard output */
	            ldr r1, =l92		    /* r1 - prompt */
	            mov r2, #spg
	            mov r7, #4			        /* write system call*/
	            svc #0 

// Line Ten
                mov r0, #1                  /* standard output */
	            ldr r1, =lA1		    /* r1 - prompt */
	            mov r2, #sph
	            mov r7, #4			        /* write system call*/
	            svc #0 

                mov r0, #1                  /* standard output */
	            ldr r1, =num2		    /* r1 - prompt */
	            mov r2, #1
	            mov r7, #4			        /* write system call*/
	            svc #0 

                mov r0, #1                  /* standard output */
	            ldr r1, =lA2		    /* r1 - prompt */
	            mov r2, #spi
	            mov r7, #4			        /* write system call*/
	            svc #0 


    	        mov r0, #0              //exit
    	        mov r7, #1
    	        svc #0
 
	            .end
