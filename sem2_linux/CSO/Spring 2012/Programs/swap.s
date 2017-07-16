/*
 

*/
.arm			@ For Thumb mode use .thumb directive

.data

vara:	.byte 0xaa
varb:	.byte 0xbb

.text
.global main     @ 'main' function is mandatory.


main:
	ldr r0, =vara     @ r0 = &vara
        ldr r1, =varb     @ r1 = &varb 
	bl swap

.Lexit:
@int sys_exit(int status)
	mov r0, #0	@ Return code
	mov r7, #1	@ sys_exit
	svc 0x00000000

swap:
	stmdb sp!, {r2, r3}
	ldrb r2, [r0]	@ r2 = vara
	ldrb r3, [r1]	@ r3 = varb
	strb r3, [r0]   @ vara = r3	
	strb r2, [r1]   @ varb = r2	
	ldmia sp!, {r2, r3}
	mov pc, lr
