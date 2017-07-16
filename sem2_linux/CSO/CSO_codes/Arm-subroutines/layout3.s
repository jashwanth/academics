	.cpu arm10tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"layout3.c"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	bl	sum
	ldmfd	sp!, {fp, pc}
	.size	main, .-main
	.align	2
	.global	sum
	.type	sum, %function
sum:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	@ lr needed for prologue
	ldr	r2, .L5
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r2, .L5+4
	mov	r3, #2
	str	r3, [r2, #0]
	ldr	r3, .L5
	ldr	r2, [r3, #0]
	ldr	r3, .L5+4
	ldr	r3, [r3, #0]
	add	r2, r2, r3
	ldr	r3, .L5+8
	str	r2, [r3, #0]
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
.L6:
	.align	2
.L5:
	.word	num1
	.word	num2
	.word	sum1
	.size	sum, .-sum
	.comm	num1,4,4
	.comm	num2,4,4
	.comm	sum1,4,4
	.ident	"GCC: (CodeSourcery Sourcery G++ Lite 2007q1-21) 4.2.0 20070413 (prerelease)"
	.section	.note.GNU-stack,"",%progbits
