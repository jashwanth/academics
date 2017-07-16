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
	.file	"layout2.c"
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.text
.Ltext0:
	.global	num1
	.data
	.align	2
	.type	num1, %object
	.size	num1, 4
num1:
	.word	1
	.global	num2
	.align	2
	.type	num2, %object
	.size	num2, 4
num2:
	.word	1
	.global	sum1
	.align	2
	.type	sum1, %object
	.size	sum1, 4
sum1:
	.word	1
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB2:
	.file 1 "layout2.c"
	.loc 1 4 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
.LCFI0:
	add	fp, sp, #4
.LCFI1:
	.loc 1 5 0
	bl	sum
	.loc 1 6 0
	ldmfd	sp!, {fp, pc}
.LFE2:
	.size	main, .-main
	.align	2
	.global	sum
	.type	sum, %function
sum:
.LFB3:
	.loc 1 9 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
.LCFI2:
	add	fp, sp, #0
.LCFI3:
	@ lr needed for prologue
	.loc 1 10 0
	ldr	r2, .L5
	mov	r3, #1
	str	r3, [r2, #0]
	.loc 1 11 0
	ldr	r2, .L5+4
	mov	r3, #2
	str	r3, [r2, #0]
	.loc 1 12 0
	ldr	r3, .L5
	ldr	r2, [r3, #0]
	ldr	r3, .L5+4
	ldr	r3, [r3, #0]
	add	r2, r2, r3
	ldr	r3, .L5+8
	str	r2, [r3, #0]
	.loc 1 13 0
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
.L6:
	.align	2
.L5:
	.word	num1
	.word	num2
	.word	sum1
.LFE3:
	.size	sum, .-sum
	.section	.debug_frame,"",%progbits
.Lframe0:
	.4byte	.LECIE0-.LSCIE0
.LSCIE0:
	.4byte	0xffffffff
	.byte	0x1
	.ascii	"\000"
	.uleb128 0x1
	.sleb128 -4
	.byte	0xe
	.byte	0xc
	.uleb128 0xd
	.uleb128 0x0
	.align	2
.LECIE0:
.LSFDE0:
	.4byte	.LEFDE0-.LASFDE0
.LASFDE0:
	.4byte	.Lframe0
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.byte	0x4
	.4byte	.LCFI0-.LFB2
	.byte	0xe
	.uleb128 0x8
	.byte	0x8e
	.uleb128 0x1
	.byte	0x8b
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0xc
	.uleb128 0xb
	.uleb128 0x4
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.byte	0x4
	.4byte	.LCFI2-.LFB3
	.byte	0xe
	.uleb128 0x4
	.byte	0x8b
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI3-.LCFI2
	.byte	0xd
	.uleb128 0xb
	.align	2
.LEFDE2:
	.text
.Letext0:
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LFB2-.Ltext0
	.4byte	.LCFI0-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI0-.Ltext0
	.4byte	.LCFI1-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 8
	.4byte	.LCFI1-.Ltext0
	.4byte	.LFE2-.Ltext0
	.2byte	0x2
	.byte	0x7b
	.sleb128 4
	.4byte	0x0
	.4byte	0x0
.LLST1:
	.4byte	.LFB3-.Ltext0
	.4byte	.LCFI2-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI2-.Ltext0
	.4byte	.LCFI3-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 4
	.4byte	.LCFI3-.Ltext0
	.4byte	.LFE3-.Ltext0
	.2byte	0x2
	.byte	0x7b
	.sleb128 4
	.4byte	0x0
	.4byte	0x0
	.section	.debug_info
	.4byte	0xd8
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.ascii	"GNU C 4.2.0 20070413 (prerelease)\000"
	.byte	0x1
	.ascii	"layout2.c\000"
	.ascii	"/home/purini/cso2011/ARM/subroutines\000"
	.4byte	.Ltext0
	.4byte	.Letext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.ascii	"main\000"
	.byte	0x1
	.byte	0x4
	.4byte	0x83
	.4byte	.LFB2
	.4byte	.LFE2
	.4byte	.LLST0
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x1
	.ascii	"sum\000"
	.byte	0x1
	.byte	0x9
	.4byte	0x83
	.4byte	.LFB3
	.4byte	.LFE3
	.4byte	.LLST1
	.uleb128 0x4
	.ascii	"num1\000"
	.byte	0x1
	.byte	0x1
	.4byte	0x83
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	num1
	.uleb128 0x4
	.ascii	"num2\000"
	.byte	0x1
	.byte	0x1
	.4byte	0x83
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	num2
	.uleb128 0x4
	.ascii	"sum1\000"
	.byte	0x1
	.byte	0x1
	.4byte	0x83
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	sum1
	.byte	0x0
	.section	.debug_abbrev
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0x8
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1b
	.uleb128 0x8
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x2
	.uleb128 0x2e
	.byte	0x0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0x0
	.byte	0x0
	.uleb128 0x4
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x3a
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0xdc
	.4byte	0x6a
	.ascii	"main\000"
	.4byte	0x8a
	.ascii	"sum\000"
	.4byte	0xa2
	.ascii	"num1\000"
	.4byte	0xb5
	.ascii	"num2\000"
	.4byte	0xc8
	.ascii	"sum1\000"
	.4byte	0x0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0x0
	.2byte	0x0
	.2byte	0x0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0x0
	.4byte	0x0
	.ident	"GCC: (CodeSourcery Sourcery G++ Lite 2007q1-21) 4.2.0 20070413 (prerelease)"
	.section	.note.GNU-stack,"",%progbits
