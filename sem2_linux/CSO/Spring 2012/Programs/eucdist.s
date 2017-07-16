	.global	num1
	.data
	.align	2
	.type	num1, %object
	.size	num1, 40
	.type	num2, %object
	.size	num2, 40
num1:
	.word 0x03
	.word 0x04
	.word 0x01
	.word 0x07
	.word 0x09
	.word 0xFF
	.word 0xEF
	.word 0xFF
	.word 0x07
	.word 0x09
num2:
	.word 0x13
	.word 0x02
	.word 0xAB
	.word 0x7F
	.word 0x80
	.word 0xF1
	.word 0x4F
	.word 0xCD
	.word 0x04
	.word 0x29
.text
.global	main
main:
					@loading the address of the array num1 into register r4
	ldr r4, labelnum1
					@loading the address of the array num2 into register r5
	ldr r5, labelnum2
					@r4 has the address of the 1st word in num1 array which is 0x03 
					@store in r2 the number of dimensions of each vector
	mov r2, #10 
	@start you code here
	mov r3,#0
	mov r7,#0
loop:	ldr r0,[r4],#4
	ldr r1,[r5],#4
	sub r6,r0,r1
	mul r7,r6,r6
	add r8,r8,r7	
	add r3,r3,#1
	cmp r3,r2
	bmi loop

	mov r9,#1
loop1:	mul r10,r9,r9
	cmp r10,r8
	add r9,r9,#1
	bmi loop1
	bpl loop3

loop3:	sub r11,r9,#2
	mov r1,r11
	bl myPrint
	@end here
	bl exit

			@template for defining functions
.global template_func
	template_func:
	@start function definition

	@end function definition
	mov pc, lr @return back to the caller function

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
labelnum1:
.word num1
labelnum2:
.word num2

