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
	.file	"layout4.c"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #4
	bl	sum
	add	sp, sp, #4
	ldmfd	sp!, {pc}
	.size	main, .-main
	.data
	.align	2
	.type	sum1.1644, %object
	.size	sum1.1644, 4
sum1.1644:
	.word	1
	.text
	.align	2
	.global	sum
	.type	sum, %function
sum:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
	@ lr needed for prologue
	mov	r3, #1
	str	r3, [sp, #0]
	mov	r3, #2
	str	r3, [sp, #4]
	ldr	r2, [sp, #0]
	ldr	r3, [sp, #4]
	add	r2, r2, r3
	ldr	r3, .L5
	str	r2, [r3, #0]
	add	sp, sp, #8
	bx	lr
.L6:
	.align	2
.L5:
	.word	sum1.1644
	.size	sum, .-sum
	.ident	"GCC: (CodeSourcery Sourcery G++ Lite 2007q1-21) 4.2.0 20070413 (prerelease)"
	.section	.note.GNU-stack,"",%progbits
