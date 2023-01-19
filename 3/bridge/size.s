	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	getRandomNumber
	.type	getRandomNumber, @function
getRandomNumber:
.LFB36:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rdi
	push	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	mov	rbx, rsi
	push	rax
	.cfi_def_cfa_offset 32
	call	rand@PLT
	lea	rsi, 1[rbx]
	cdqe
	sub	rsi, rbp
	cqo
	idiv	rsi
	lea	eax, [rdx+rbp]
	pop	rdx
	.cfi_def_cfa_offset 24
	pop	rbx
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE36:
	.size	getRandomNumber, .-getRandomNumber
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"-f"
.LC1:
	.string	"r"
.LC2:
	.string	"in.txt"
.LC3:
	.string	"\320\236\321\210\320\270\320\261\320\272\320\260! \320\244\320\260\320\271\320\273 \320\262\320\262\320\276\320\264\320\260 \320\275\320\265 \320\274\320\276\320\266\320\265\321\202 \320\261\321\213\321\202\321\214 \320\276\321\202\320\272\321\200\321\213\321\202.\n\320\244\320\260\320\271\320\273 \320\264\320\276\320\273\320\266\320\265\320\275 \321\201\321\203\321\211\320\265\321\201\321\202\320\262\320\276\320\262\320\260\321\202\321\214 \320\270 \320\261\321\213\321\202\321\214 \321\204\320\276\321\200\320\274\320\260\321\202\320\260 txt."
.LC5:
	.string	"-r"
.LC6:
	.string	"%lf\n"
.LC7:
	.string	"%lf"
	.text
	.globl	getNumber
	.type	getNumber, @function
getNumber:
.LFB37:
	.cfi_startproc
	endbr64
	push	r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	push	r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	lea	r12, .LC0[rip]
	push	rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	mov	ebp, edi
	push	rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	mov	rbx, rsi
	sub	rsp, 24
	.cfi_def_cfa_offset 64
	mov	rdi, QWORD PTR 8[rsi]
	mov	rsi, r12
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 8[rsp], rax
	xor	eax, eax
	call	strcmp@PLT
	test	eax, eax
	jne	.L12
	cmp	ebp, 2
	lea	rdi, .LC2[rip]
	lea	rsi, .LC1[rip]
	jle	.L14
	mov	rdi, QWORD PTR 16[rbx]
.L14:
	call	fopen@PLT
	mov	rbp, rax
	test	rax, rax
	jne	.L4
	lea	rdi, .LC3[rip]
	call	puts@PLT
	mov	edi, 1
	call	exit@PLT
.L12:
	xor	ebp, ebp
.L4:
	mov	r13, QWORD PTR 8[rbx]
	lea	rsi, .LC5[rip]
	mov	QWORD PTR [rsp], 0x000000000
	mov	rdi, r13
	call	strcmp@PLT
	test	eax, eax
	jne	.L7
	call	rand@PLT
	mov	ecx, 132
	cdqe
	cqo
	idiv	rcx
	sub	edx, 78
	cvtsi2sd	xmm0, edx
	movsd	QWORD PTR [rsp], xmm0
	jmp	.L8
.L7:
	mov	rsi, r12
	mov	rdi, r13
	call	strcmp@PLT
	mov	rdx, rsp
	test	eax, eax
	jne	.L9
	lea	rsi, .LC6[rip]
	mov	rdi, rbp
	call	__isoc99_fscanf@PLT
	jmp	.L8
.L9:
	mov	rsi, rdx
	lea	rdi, .LC7[rip]
	xor	eax, eax
	call	__isoc99_scanf@PLT
.L8:
	mov	rdi, QWORD PTR 8[rbx]
	mov	rsi, r12
	call	strcmp@PLT
	test	eax, eax
	jne	.L10
	mov	rdi, rbp
	call	fclose@PLT
.L10:
	movsd	xmm0, QWORD PTR [rsp]
	mov	rax, QWORD PTR 8[rsp]
	sub	rax, QWORD PTR fs:40
	je	.L11
	call	__stack_chk_fail@PLT
.L11:
	add	rsp, 24
	.cfi_def_cfa_offset 40
	pop	rbx
	.cfi_def_cfa_offset 32
	pop	rbp
	.cfi_def_cfa_offset 24
	pop	r12
	.cfi_def_cfa_offset 16
	pop	r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE37:
	.size	getNumber, .-getNumber
	.section	.rodata.str1.1
.LC8:
	.string	"-c"
.LC9:
	.string	"w"
.LC10:
	.string	"out.txt"
.LC11:
	.string	"%.23lf\n"
	.text
	.globl	outputNumber
	.type	outputNumber, @function
outputNumber:
.LFB38:
	.cfi_startproc
	endbr64
	push	r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movq	r14, xmm0
	push	r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	mov	r13d, edi
	push	r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	lea	r12, .LC8[rip]
	push	rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	xor	ebp, ebp
	push	rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	mov	rdi, QWORD PTR 8[rsi]
	mov	rbx, rsi
	mov	rsi, r12
	call	strcmp@PLT
	test	eax, eax
	je	.L17
	cmp	r13d, 4
	lea	rdi, .LC10[rip]
	lea	rsi, .LC9[rip]
	jne	.L25
	mov	rdi, QWORD PTR 24[rbx]
.L25:
	call	fopen@PLT
	mov	rbp, rax
.L17:
	mov	rdi, QWORD PTR 8[rbx]
	mov	rsi, r12
	call	strcmp@PLT
	movq	xmm0, r14
	lea	rdx, .LC11[rip]
	test	eax, eax
	jne	.L19
	mov	rsi, rdx
	mov	edi, 1
	mov	al, 1
	call	__printf_chk@PLT
	jmp	.L20
.L19:
	mov	esi, 1
	mov	rdi, rbp
	mov	al, 1
	call	__fprintf_chk@PLT
.L20:
	mov	rdi, QWORD PTR 8[rbx]
	mov	rsi, r12
	call	strcmp@PLT
	test	eax, eax
	je	.L16
	pop	rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	mov	rdi, rbp
	pop	rbp
	.cfi_def_cfa_offset 32
	pop	r12
	.cfi_def_cfa_offset 24
	pop	r13
	.cfi_def_cfa_offset 16
	pop	r14
	.cfi_def_cfa_offset 8
	jmp	fclose@PLT
.L16:
	.cfi_restore_state
	pop	rbx
	.cfi_def_cfa_offset 40
	pop	rbp
	.cfi_def_cfa_offset 32
	pop	r12
	.cfi_def_cfa_offset 24
	pop	r13
	.cfi_def_cfa_offset 16
	pop	r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE38:
	.size	outputNumber, .-outputNumber
	.globl	factorial
	.type	factorial, @function
factorial:
.LFB39:
	.cfi_startproc
	endbr64
	movsd	xmm1, QWORD PTR .LC12[rip]
	movaps	xmm2, xmm0
	movaps	xmm3, xmm1
	movaps	xmm0, xmm1
.L27:
	comisd	xmm2, xmm1
	jb	.L29
	mulsd	xmm0, xmm1
	addsd	xmm1, xmm3
	jmp	.L27
.L29:
	ret
	.cfi_endproc
.LFE39:
	.size	factorial, .-factorial
	.section	.rodata.str1.1
.LC13:
	.string	"\320\222\321\213 \320\276\320\261\321\217\320\267\320\260\320\275\321\213 \320\262\320\262\320\265\321\201\321\202\320\270 1,2 \320\270\320\273\320\270 3 \320\260\321\200\320\263\321\203\320\274\320\265\320\275\321\202\320\260 \320\272\320\276\320\274\320\260\320\275\320\264\320\275\320\276\320\271 \321\201\321\202\321\200\320\276\320\272\320\270:\n\320\237\320\265\321\200\320\262\321\213\320\271 - -f/-r/-c.\n\320\222\321\202\320\276\321\200\320\276\320\271 \320\270 \321\202\321\200\320\265\321\202\320\270\320\271 \320\276\320\277\321\206\320\270\320\276\320\275\320\260\320\273\321\214\320\275\321\213, \321\215\321\202\320\276 \320\260\320\261\321\201\320\276\320\273\321\216\321\202\320\275\321\213\320\271 \320\277\321\203\321\202\321\214 \320\272 \321\204\320\260\320\271\320\273\320\260\320\274 \320\262\320\262\320\276\320\264\320\260 \320\270 \320\262\321\213\320\262\320\276\320\264\320\260."
.LC16:
	.string	"\320\222\321\200\320\265\320\274\321\217 \320\262\321\213\320\277\320\276\320\273\320\275\320\265\320\275\320\270\321\217 \320\277\321\200\320\276\320\263\321\200\320\260\320\274\320\274\321\213: "
.LC17:
	.string	"%s"
.LC19:
	.string	"%.5lf"
.LC20:
	.string	"\321\201"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB40:
	.cfi_startproc
	endbr64
	push	r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	push	r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	mov	r12, rsi
	push	rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	mov	ebp, edi
	xor	edi, edi
	push	rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	sub	rsp, 40
	.cfi_def_cfa_offset 80
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	lea	eax, -2[rbp]
	cmp	eax, 2
	jbe	.L31
	lea	rdi, .LC13[rip]
	call	puts@PLT
	mov	eax, 1
	jmp	.L30
.L31:
	call	clock@PLT
	mov	rsi, r12
	mov	edi, ebp
	mov	r13, rax
	call	getNumber
	movsd	xmm1, QWORD PTR .LC12[rip]
	movaps	xmm6, xmm0
	andps	xmm6, XMMWORD PTR .LC14[rip]
	movsd	QWORD PTR 8[rsp], xmm0
	movaps	xmm2, xmm1
	movq	rbx, xmm6
.L33:
	movq	xmm0, rbx
	movsd	QWORD PTR 24[rsp], xmm2
	movsd	QWORD PTR 16[rsp], xmm1
	call	pow@PLT
	movsd	xmm1, QWORD PTR 16[rsp]
	movaps	xmm4, xmm0
	movaps	xmm0, xmm1
	call	factorial
	movsd	xmm2, QWORD PTR 24[rsp]
	movsd	xmm1, QWORD PTR 16[rsp]
	divsd	xmm4, xmm0
	addsd	xmm1, QWORD PTR .LC12[rip]
	movaps	xmm3, xmm2
	addsd	xmm2, xmm4
	movaps	xmm0, xmm2
	subsd	xmm0, xmm3
	comisd	xmm0, QWORD PTR .LC15[rip]
	ja	.L33
	movsd	QWORD PTR 16[rsp], xmm2
	call	clock@PLT
	lea	rdx, .LC16[rip]
	mov	edi, 1
	lea	rsi, .LC17[rip]
	mov	rbx, rax
	xor	eax, eax
	call	__printf_chk@PLT
	sub	ebx, r13d
	mov	edi, 1
	mov	al, 1
	cvtsi2sd	xmm0, rbx
	lea	rsi, .LC19[rip]
	divsd	xmm0, QWORD PTR .LC18[rip]
	call	__printf_chk@PLT
	lea	rdi, .LC20[rip]
	call	puts@PLT
	xorps	xmm0, xmm0
	comisd	xmm0, QWORD PTR 8[rsp]
	movsd	xmm2, QWORD PTR 16[rsp]
	ja	.L36
	movsd	xmm7, QWORD PTR .LC12[rip]
	divsd	xmm7, xmm2
	movaps	xmm2, xmm7
.L36:
	mov	rsi, r12
	mov	edi, ebp
	movaps	xmm0, xmm2
	call	outputNumber
	xor	eax, eax
.L30:
	add	rsp, 40
	.cfi_def_cfa_offset 40
	pop	rbx
	.cfi_def_cfa_offset 32
	pop	rbp
	.cfi_def_cfa_offset 24
	pop	r12
	.cfi_def_cfa_offset 16
	pop	r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE40:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC12:
	.long	0
	.long	1072693248
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC14:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC15:
	.long	-1998362383
	.long	1054144693
	.align 8
.LC18:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
