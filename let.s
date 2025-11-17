	.file	"let.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
 #APP
	.global _var16k 
_var16k:
 .space 16384
 #NO_APP
	.align	1
	.globl	_start
	.type	_start, @function
_start:
	addi	sp,sp,-32
	sd	s0,24(sp)
	addi	s0,sp,32
	lui	a5,%hi(_var16k)
	ld	a5,%lo(_var16k)(a5)
	sd	a5,-24(s0)
	li	a5,0
	mv	a0,a5
	ld	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	_start, .-_start
	.ident	"GCC: (13.2.0-11ubuntu1+12) 13.2.0"
