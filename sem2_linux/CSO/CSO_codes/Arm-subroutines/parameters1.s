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
	.file	"parameters1.c"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #12
	mov	r0, #1
	mov	r1, #3
	bl	sum
	mov	r3, r0
	str	r3, [sp, #4]
	add	sp, sp, #12
	ldmfd	sp!, {pc}
	.size	main, .-main
	.align	2
	.global	sum
	.type	sum, %function
sum:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #16
	@ lr needed for prologue
	str	r0, [sp, #4]
	str	r1, [sp, #0]
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #0]
	add	r3, r2, r3
	str	r3, [sp, #12]
	ldr	r3, [sp, #12]
	mov	r0, r3
	add	sp, sp, #16
	bx	lr
	.size	sum, .-sum
	.ident	"GCC: (CodeSourcery Sourcery G++ Lite 2007q1-21) 4.2.0 20070413 (prerelease)"
	.section	.note.GNU-stack,"",%progbits
