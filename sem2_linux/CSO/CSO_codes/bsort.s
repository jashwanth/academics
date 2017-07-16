/* '@' symbol is used for single line comments 
*  This symbol could depend on the architecture. 
*  It is '#' for x86 */ 

.arm			@ For Thumb mode use .thumb directive

.data
numarray: .word 3,4,5,1,6,8,9,7,2,0

.text
.global main     @ 'main' function is mandatory.
main:
       ldr r3,=numarray
       mov r1,#10
.mloop:mov r0,r3
       mov r2,r1 
.bloop:ldr r4,[r0]
       ldr r5,[r0,#4]
       cmp r4,r5
       strhi r4,[r0,#4]
       strhi r5,[r0]    
       add r0,r0,#4
       subs r2,r2,#1
       bne .bloop
       subs r1,r1,#1
       bne .mloop

@int sys_exit(int status)
	mov r0, #0	@ Return code
	mov r7, #1	@ sys_exit
	svc 0x00000000

