.text

.global print_arguments
print_arguments:
	stmfd sp!, {r4,lr }
	mov r4, r1
	mov r1, r0
	bl printInteger
	mov r1, r4
	bl printCharacter
	mov r1, r2
	bl printString
	mov r1, r3
	bl printInteger

	ldmfd sp!, {r4, pc}


.global	printInteger
printInteger:
	@prints an integer present in r1
	stmfd	sp!,{r0,r1,r2,r3,r7, lr}
	add	r7, sp, #0
	adr 	r0, .LC0
	bl	printf
	ldmfd	sp!,{r0,r1,r2,r3,r7, pc}

.global	printString
printString:
	@prints an integer present in r1
	stmfd	sp!,{r0,r1,r2,r3,r7, lr}
	add	r7, sp, #0
	adr 	r0, .LC1
	bl	printf
	ldmfd	sp!,{r0,r1,r2,r3,r7, pc}

.global	printCharacter
printCharacter:
	@prints an integer present in r1
	stmfd	sp!,{r0,r1,r2,r3,r7, lr}
	add	r7, sp, #0
	adr 	r0, .LC2
	bl	printf
	ldmfd	sp!,{r0,r1,r2,r3,r7, pc}


.LC0:
	.ascii	"%d\n\0"
	.align 2
.LC1:
	.ascii "%s\n\0"
	.align 2
.LC2:
	.ascii "%c\n\0"
	.align 2
