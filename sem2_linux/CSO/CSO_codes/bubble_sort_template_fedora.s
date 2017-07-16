	.file	"array.c"
	.global	array
	.data
	.align	2
	.type	array, %object
	.size	array, 40
num1:
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
	.align	2
	.global	main
	.type	main, %function
main:
	@loading the address of the array num1 into register r4
	ldr r4, .L6
	@r4 has the address of the 1st word in num1 array which is 0x03
	mov r5, #10
	@start you code here
	main_loop:mov r0,r4
	     mov r1,r5
	sort:ldr r2,[r0]
	     ldr r3,[r0,#4]
	     cmp r2,r3
	     strgt r3,[r0]
	     strgt r2,[r0,#4]
	     add r0,r0,#4
	     subs r1,r1,#1
	     bne sort
	     subs r5,r5,#1
	     bne main_loop
	ldr r1, [r4, #0]
	bl myPrint
	ldr r1, [r4, #4]
	bl myPrint
	ldr r1, [r4, #8]
	bl myPrint
	ldr r1, [r4, #12]
	bl myPrint
	ldr r1, [r4, #16]
	bl myPrint
	ldr r1, [r4, #20]
	bl myPrint
	ldr r1, [r4, #24]
	bl myPrint
	ldr r1, [r4, #28]
	bl myPrint
	ldr r1, [r4, #32]
	bl myPrint
	ldr r1, [r4, #36]
	bl myPrint
	bl exit

	@end you code here
.L6:
	.word num1
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
