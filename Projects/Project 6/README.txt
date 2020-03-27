Assignment Tasks:
PART A (50+ points)
Take countChars.asm and modify it to input the string to be searched
and to output the count with an appropriate output message.  Once it
runs, save your file as an *.asm file, and submit your name, your
*.asm file, a short explanation of what it does in the machine and a
screenshot of the final state of the LC-3 in a PDF or word document.
Please include a list of any modifications made to the start state of
the LC-3 if applicable.

PART B (50+ points)
Create your own original assembly language program, using input and
output, and submit according to the same instructions above.


PART A Change Log:
1) Included a label and fill pseudo-code for the input status registry
2) Included a label and fill pseudo-code for the input data resistry
3) Included a label and fill pseudo-code for the output status registry
4) Included a label and fill pseudo-code for the output data resistry
5) Applied CIN routine to pull character from keyboard:
    pulls INSTAT contents
    break check for input status, if false loops back to CIN
    if true, loads INREG into R0
    returns no START NOT address in memory using offset
6) Set START to use CIN instead of TRAP IN
7) Applied COUT routine to push character to monitor:
    pulls OUTSTAT contents
    break check for output status, if false loops back to COUT
    if true, loads OUTREG with ASCII value in R0
    returns no OUTPUT HALT address in memory using offset
8) Set OUTPUT to use COUT instead of TRAP OUT


3000 ASCII VAL
3001 INSTAT
3002 INREG
3003 STING
3004 
3005 
3006 N 70char
3007 
3008 
3009 
300A 
300B 
300C 
300D 
300E 
300F 
3010 
3011 
3012 
3013 
3014 
3015 
3016 
3017 
3018 
3019 
301A 
301B 
301C 
301D 
301E 
301F 
3020 
3021 
3022 
3023 
3024 
3025 
3026 
3027 
3028 
3029 
302A 
302B 
302C 
302D 
302E 
302F 
3030 
3031 
3032 
3033 
3034 
3035 
3036 
3037 
3038 
3039 
303A 
303B 
303C 
303D 
303E 
303F 
3040 
3041 
3042 
3043 
3044 
3045 
3046 
3047 
3048 
3049 
304A 
304B \N
304C cin ldi
304D br
304E ldi
304F br
3056 start
3051 lea
3052 cin
3053 not
3054 
3055 
3056 
3057 
3058 
3059 
305A 
305B 
305C 
305D 
305E 
305F 
3060 
3061 
3062 
3063 
3064 
3065 