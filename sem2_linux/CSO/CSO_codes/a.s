.LC0:
	.ascii	"%d %d %d\012\000"
	.align 2

.LC1:
	.ascii "%d\000"
	.align 2
.text
.global main
main:
        bl myScan
	mov r5,r1
	mov r8,#1
	mov r9,#3
	mov r10,#2
	bl toh

	bl exit

.global toh
toh:
    stmdb sp!,{r0,r5,r7,r8,r9,r10,lr} 
   
    cmp r5,#1
    bne here
    mov r1,r5
    mov r2,r8
    mov r3,r9
    bl myPrint
    ldmia sp!,{r0,r5,r7,r8,r9,r10, pc}
    
  here:  
   
   sub r5,r5,#1
   mov r11,r10
   mov r10,r9
   mov r9,r11
   bl toh
   mov r11,r9
   mov r9,r10
   mov r10,r11


   mov r1,r5
   add r1,r1,#1
   mov r2,r8
   mov r3,r9
   bl myPrint

   mov r11,r8
   mov r8,r10
   mov r10,r11
   bl toh

  ldmia sp!,{r0,r5,r7,r8,r9,r10, pc}

.global	myPrint
myPrint:
	@prints an integer present in r1
	stmfd	sp!,{r0,r2,r3,r7, lr}
	add	r7, sp, #0
	adr 	r0, .LC0
	bl	printf
	mov	r0, #0
	ldmfd	sp!,{r0,r2,r3,r7, pc}


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

