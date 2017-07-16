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
	.file	"registersave3.c"
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
	stmfd	sp!, {r4, r5, r6, r7, fp, lr}
	add	fp, sp, #20
	mov	r3, #1
	mov	r2, #2
	mov	r1, #3
	mov	r0, #4
	mov	ip, #5
	mov	lr, #6
	mov	r4, #7
	mov	r5, #8
	mov	r6, #9
	mov	r7, #10
	add	r3, r3, r2
	add	r3, r3, r1
	add	r3, r3, r0
	add	r3, r3, ip
	add	r3, r3, lr
	add	r3, r3, r4
	add	r3, r3, r5
	add	r3, r3, r6
	add	r3, r3, r7
	mov	r0, r3
	ldmfd	sp!, {r4, r5, r6, r7, fp, pc}
	.size	sum, .-sum
	.ident	"GCC: (CodeSourcery Sourcery G++ Lite 2007q1-21) 4.2.0 20070413 (prerelease)"
	.section	.note.GNU-stack,"",%progbits
