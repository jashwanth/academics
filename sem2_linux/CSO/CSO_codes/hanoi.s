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
	@start you code here
	mov r0,#5
	mov r1,#1
	mov r2,#2
	mov r3,#3
	bl hanoi
	bl exit
	hanoi:stmdb sp!,{r4,r5,r6,r7,lr}
	      cmp r0,#1
	      bleq hanoi_print
	      ldmeqia sp!,{r4,r5,r6,r7,pc}
	      mov r4,r0
	      mov r5,r1
	      mov r6,r2
	      mov r7,r3
	      mov r2,r7
	      mov r3,r6
	      sub r0,r0,#1
	      bl hanoi
	      mov r0,r4
	      mov r1,r5
	      mov r3,r7
	      bl hanoi_print
	      sub r0,r0,#1
	      mov r1,r6
	      mov r2,r5
	      bl hanoi
	      ldmia sp!,{r4,r5,r6,r7,pc}
	hanoi_print:stmdb sp!,{r0,r1,r3,r4,r5,r6,lr}
	            mov r4,r0
		    mov r5,r1
		    mov r6,r3
		    mov r1,r4
		    mov r2,r5
		    mov r3,r6
		    bl myPrint
		    ldmia sp!,{r0,r1,r3,r4,r5,r6,pc}
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
	.ascii	"%d %d %d\012\000"
	.align 2
.LC1:
	.ascii "%d\000"
	.align 2
