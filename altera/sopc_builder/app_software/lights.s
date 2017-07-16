.include "nios_macros.s"

.equ switches, 0x00000000
.equ LED_S, 0x00000010

.global _start
_start:
	movia r2, switches
	movia r3, LED_S
loop: 	ldbio r4, 0(r2)
	stbio r4, 0(r3)
	br loop