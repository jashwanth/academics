.LC0:
	.ascii	"%d\000%d\012\000"
	.align	2

.LC1:
	.ascii	"%d\000"
	.align	2

.global myPrint
myPrint:
	stmfd	sp!,{r0,r1, r2, r3, r7, lr}	@1
	add	r7,sp,#0			@2
	adr	r0,.LC0				@3
	bl	printf				@4
	ldmfd	sp!,{r0,r1, r2, r3, r7, pc}	@5

.global myScan
myScan:
	stmfd   sp!, {r0,r2,r3,r7, lr}
	sub 	sp, sp, #8
	add     r7, sp, #0
	adr     r0, .LC1
	add	r1, sp, #4
	bl      scanf
	ldr	r1, [sp, #4]
	mov     r0, #0
	add	sp, sp, #8
	ldmfd	sp!,{r0,r2,r3,r7, pc}

.global main
main:
	@Always revisit r0 for original no. of disks, r7 can have changing values
	@Use r4,r5,r6 as pegs
	bl	myScan
	mov	r0,r1
	mov	r7,r1	
	
