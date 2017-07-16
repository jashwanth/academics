	.global num1	@an array called num1 which can be accessed globally
	.data
	.align 2

	.type   num1, %object	@its as object or data
	.size   num1, 40	@it needs 40 bytes of main memory

num1:	@allocate 10 words whose values are specified as follows
	.word 0x03
	.word 0x04
	.word 0x01
	.word 0x7FFFFFFE
	.word 0x80000000
	.word 0xFF
	.word 0xEF
	.word 0xFFFFFFFF
	.word 0x07
	.word 0x09

.text
.align 2
.arm
.global main
main:
	
	@loading the address of the array num1 into register r4
	movw r4, #:lower16:num1
	movt r4, #:upper16:num1
	mov r5, #10
	@r4 has the address of the 1st word in num1 array which is 0x03
	@r5= number of words in the array
	
	@start your code here
	@ldr r1, [r4,#0]
	@bl myPrint
	@ldr r1, [r4,#4]
	@bl myPrint
	@end code
	bl exit


.global	myPrint
myPrint:
	@prints an integer present in r1
	stmfd	sp!,{r0,r1,r2,r3,r7, lr}
	add	r7, sp, #0
	adr 	r0, .LC0
	bl	printf
	mov	r0, #0
	ldmfd	sp!,{r0,r1,r2,r3,r7, pc}


.global myScan
myScan:
	@scans an integer and returns it in r1
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


.LC0:
	.ascii	"%d\012\000"
	.align 2
.LC1:
	.ascii "%d\000"
	.align 2
