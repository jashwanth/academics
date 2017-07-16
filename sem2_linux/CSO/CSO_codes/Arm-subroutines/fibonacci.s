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
	.file	"fibonacci.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%d\000"
	.align	2
.LC1:
	.ascii	"Nth Fibonacci Number: %d\012\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	ldr	r0, .L3
	ldr	r1, .L3+4
	bl	scanf
	ldr	r3, .L3+4
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	fib
	mov	r3, r0
	ldr	r0, .L3+8
	mov	r1, r3
	bl	printf
	ldmfd	sp!, {fp, pc}
.L4:
	.align	2
.L3:
	.word	.LC0
	.word	n
	.word	.LC1
	.size	main, .-main
	.align	2
	.global	fib
	.type	fib, %function
fib:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bne	.L6
	mov	r3, #1
	str	r3, [fp, #-28]
	b	.L8
.L6:
	ldr	r3, [fp, #-24]
	cmp	r3, #1
	bne	.L9
	mov	r3, #1
	str	r3, [fp, #-28]
	b	.L8
.L9:
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	mov	r0, r3
	bl	fib
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	sub	r3, r3, #2
	mov	r0, r3
	bl	fib
	mov	r3, r0
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-28]
.L8:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.size	fib, .-fib
	.comm	n,4,4
	.ident	"GCC: (CodeSourcery Sourcery G++ Lite 2007q1-21) 4.2.0 20070413 (prerelease)"
	.section	.note.GNU-stack,"",%progbits
