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
	@r4 has the address of the 1st word in num1 array which is 0x03
	mov r5, #9
	loop:
		ldr r4,.L6
		mov r6,#9
	loop1:
		ldr r2,[r4]
		ldr r3,[r4,#4]
		cmp r3,r2
		strlt r3,[r4]
		strlt r2,[r4,#4]
		cmp r5,#1
		ldreq r1,[r4]
		bleq myPrint
		add r4,r4,#4
		subs r6,r6,#1
		bne loop1

	subs r5,r5,#1
	bne loop
	ldr r1,[r4]
	bl myPrint
	bl exit
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
