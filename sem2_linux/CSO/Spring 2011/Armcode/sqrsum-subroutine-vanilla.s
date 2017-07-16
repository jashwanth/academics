/*

int square(int num)
{
   return num*num;
}

main()
{
  ..........loop begin.........
  sqrsum = sqrsum + square(array[i]);
  ..........loop end...........
}
*/

.arm			@ For Thumb mode use .thumb directive

.data

arraysize:	.word 10
array:		.word 1, -2, 3, -4, 5, -6, 8, -7, 9, -10
sqrsum:	.word

inputparameter:	.word		@ Memory for square function parameter
retval:	.word			@ Memory for return value

.text
.global main     @ 'main' function is mandatory.

@ r0 = arraysize; r1 = &array; r3 = sum; r2 = array[i], r4 = &inputparameter
@ r5 = &retval, r6 = retval

main:
	ldr r0, =arraysize     @ r0 = &arraysize
        ldr r0, [r0]           @ r0 = *r0. We are immediately reusing r0.
        ldr r1, =array
        mov r3, #0
	cmp r0, #0
	beq .Lexit
.Lloop: ldr r2, [r1], #4		@ r2 = array[i]
	ldr r4, =inputparameter		@ Pass array[i] as parameter
	str r2, [r4]
	bl square			@ Call Square. Important: We assume square doesn't
					@ change any register values.
	ldr r5, =retval
	ldr r6, [r5]			@ Read the return value
	add r3, r3, r6
        subs r0, r0, #1
        bne .Lloop
	ldr r6, =sqrsum        @ r6 = &sqrsum
 	str r3, [r6]           @ *r6 = r3	

.Lexit:
@int sys_exit(int status)
	mov r0, #0	@ Return code
	mov r7, #1	@ sys_exit
	svc 0x00000000

@ r9 = {&inputparameter, &retval} , r8 = inputparameter 
@ Other Registers Used: r10

square:
	ldr r9, =inputparameter
	ldr r8, [r9]
 	mul r10, r8, r8
	ldr r9, =retval
	str r10, [r9] 
	mov pc, lr
	
