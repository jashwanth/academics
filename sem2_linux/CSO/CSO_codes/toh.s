.arm	@For Thumb mode use .thumb directive
.data
N:	.byte 0x2
.text
.align 2
.global main     @ 'main' function is mandatory.
main:
	ldr r1, =N     @ r1 = &N , N-no. of disks
	ldr r0, [r1]   @ r0 - No. of disks
	mov r1,#1      @ #1 - source
	mov r2,#3      @ #3 - destination
	mov r3,#2
	bl tower
	bl exit
.Lexit:
@int sys_exit(int status)
	mov r0, #0	@ Return code
	mov r7, #1	@ sys_exit
	@svc 0x00000000
tower:
	stmdb sp!,{r0,r1,r2,r3,lr}
	cmp r0, #1
	bleq func1
 	ldmeqia sp!,{r0,r1,r2,r3,pc}
	sub r0,r0,#1
	mov r4,r2
	mov r2,r3  @ swaping source and destination , moving n-1 disks frm A to B
	mov r3,r4
	bl tower
	mov r4,r1
	mov r1,r0  
	bl myPrint
	mov r1,r4
	ldmia sp!,{r0,r1,r2,r3, pc}
loop:	mov r4,r1
	mov r1,r0  @ stores the number of the disk present in register r0
	bl myPrint 
	mov r1,r4
	bl myPrint  @ prints the source rod
	mov r4,r1
	mov r1,r2
	bl myPrint  @ prints the destination rod
	mov r1,r4
	mov r4,r2
	mov r5,r3
	mov r3,r1
	mov r1,r4
	mov r2,r5
	bl tower
func1:
	stmdb sp!,{r1,r2,lr}
	mov r4,r1
	mov r1,r0  @stores the number/label of the disk present in register r0
	bl myPrint 
	mov r1,r4
	bl myPrint  @ prints the source rod
	mov r4,r1
	mov r1,r2
	bl myPrint  @ prints the destination rod
	mov r1,r4	
	ldmia sp!,{r1,r2,pc}
.global	myPrint
myPrint:
	@prints an integer present in r1
	stmfd	sp!,{r0,r1,r2,r3,r7,lr}
	add	r7, sp, #0
	adr 	r0, .LC0
	bl	printf
	mov	r0, #0
	ldmfd	sp!,{r0,r1,r2,r3,r7,pc}
.global myScan
myScan:
	@scans an integer and returns it in r1
	stmfd   sp!, {r0,r2,r3,r7,lr}
	sub 	sp, sp, #8
	add     r7, sp, #0
	adr     r0, .LC1
	add	r1, sp, #4
	bl      scanf
	ldr	r1, [sp, #4]
	mov     r0, #0
	add	sp, sp, #8
	ldmfd	sp!,{r0,r2,r3,r7, pc}
.LC0:
	.ascii	"%d\012\000"
	.align 2
.LC1:
	.ascii "%d\000"
	.align 2
