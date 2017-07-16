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
	.file	"layout1.c"
@ GNU C (CodeSourcery Sourcery G++ Lite 2007q1-21) version 4.2.0 20070413 (prerelease) (arm-none-linux-gnueabi)
@	compiled by GNU C version 3.4.4.
@ GGC heuristics: --param ggc-min-expand=97 --param ggc-min-heapsize=127144
@ options passed:  -iprefix -isysroot -auxbase -fverbose-asm
@ -fomit-frame-pointer
@ options enabled:  -falign-loops -fargument-alias -fbranch-count-reg
@ -fcommon -fearly-inlining -feliminate-unused-debug-types
@ -femit-class-debug-always -ffunction-cse -fgcse-lm -fident
@ -finline-functions-called-once -fivopts -fkeep-static-consts
@ -fleading-underscore -fmath-errno -fmove-loop-invariants
@ -fomit-frame-pointer -fpeephole -freg-struct-return -fsched-interblock
@ -fsched-spec -fsched-stalled-insns-dep -fshow-column
@ -fsplit-ivs-in-unroller -ftoplevel-reorder -ftrapping-math -ftree-loop-im
@ -ftree-loop-ivcanon -ftree-loop-optimize -ftree-vect-loop-version
@ -fverbose-asm -fzero-initialized-in-bss -mglibc -mlittle-endian
@ -msched-prolog

@ Compiler executable checksum: 2a67eb7217b732743350e8a18796f97f

	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!	@,
	sub	sp, sp, #4	@,,
	bl	sum	@
	add	sp, sp, #4	@,,
	ldmfd	sp!, {pc}
	.size	main, .-main
	.align	2
	.global	sum
	.type	sum, %function
sum:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #16	@,,
	@ lr needed for prologue	@
	mov	r3, #1	@ tmp134,
	str	r3, [sp, #4]	@ tmp134, num1
	mov	r3, #2	@ tmp135,
	str	r3, [sp, #8]	@ tmp135, num2
	ldr	r2, [sp, #4]	@ num1, num1
	ldr	r3, [sp, #8]	@ num2, num2
	add	r3, r2, r3	@ tmp138, num1, num2
	str	r3, [sp, #12]	@ tmp138, sum1
	add	sp, sp, #16	@,,
	bx	lr
	.size	sum, .-sum
	.ident	"GCC: (CodeSourcery Sourcery G++ Lite 2007q1-21) 4.2.0 20070413 (prerelease)"
	.section	.note.GNU-stack,"",%progbits
