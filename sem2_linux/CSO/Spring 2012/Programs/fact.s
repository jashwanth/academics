/*
 

*/
.arm			@ For Thumb mode use .thumb directive

.data

N:	.byte 0x5
factN:	.word 

.text
.global main     @ 'main' function is mandatory.


main:
	ldr r1, =N     @ r1 = &N
	ldr r0, [r1]
	bl fact        @ pass parameter through r0. Return value comes through r0
        ldr r1, =factN     @ r1 = &factN 
	str r0, [r1]

.Lexit:
@int sys_exit(int status)
	mov r0, #0	@ Return code
	mov r7, #1	@ sys_exit
	svc 0x00000000

fact:
	stmdb sp!, {r1, r2, lr}
	cmp r0, #1
	ldmeqia sp!, {r1, r2, pc}
	mov r1, r0	@ store n in r1
	sub r0, r0, #1
	bl fact
	mul r2, r0, r1     @ why not use mul r0, r0, r1
	mov r0, r2
	ldmia sp!, {r1, r2, pc}