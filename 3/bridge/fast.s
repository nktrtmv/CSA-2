	.file	"main.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	getRandomNumber
	.type	getRandomNumber, @function
getRandomNumber:
.LFB51:
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
	sub	rsp, 8
	.cfi_def_cfa_offset 32
	call	rand@PLT
	lea	rsi, 1[rbx]
	add	rsp, 8
	.cfi_def_cfa_offset 24
	cdqe
	sub	rsi, rbp
	pop	rbx
	.cfi_def_cfa_offset 16
	cqo
	idiv	rsi
	lea	eax, [rdx+rbp]
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE51:
	.size	getRandomNumber, .-getRandomNumber
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"r"
.LC1:
	.string	"in.txt"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"\320\236\321\210\320\270\320\261\320\272\320\260! \320\244\320\260\320\271\320\273 \320\262\320\262\320\276\320\264\320\260 \320\275\320\265 \320\274\320\276\320\266\320\265\321\202 \320\261\321\213\321\202\321\214 \320\276\321\202\320\272\321\200\321\213\321\202.\n\320\244\320\260\320\271\320\273 \320\264\320\276\320\273\320\266\320\265\320\275 \321\201\321\203\321\211\320\265\321\201\321\202\320\262\320\276\320\262\320\260\321\202\321\214 \320\270 \320\261\321\213\321\202\321\214 \321\204\320\276\321\200\320\274\320\260\321\202\320\260 txt."
	.section	.rodata.str1.1
.LC4:
	.string	"%lf\n"
.LC5:
	.string	"%lf"
	.text
	.p2align 4
	.globl	getNumber
	.type	getNumber, @function
getNumber:
.LFB52:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	push	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	mov	rbx, rsi
	sub	rsp, 24
	.cfi_def_cfa_offset 48
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 8[rsp], rax
	mov	rax, QWORD PTR 8[rsi]
	cmp	BYTE PTR [rax], 45
	jne	.L18
	cmp	BYTE PTR 1[rax], 102
	jne	.L18
	cmp	BYTE PTR 2[rax], 0
	jne	.L18
	cmp	edi, 2
	jle	.L7
	mov	rdi, QWORD PTR 16[rsi]
	lea	rsi, .LC0[rip]
	call	fopen@PLT
	mov	rbp, rax
.L8:
	test	rbp, rbp
	je	.L9
	mov	rax, QWORD PTR 8[rbx]
	mov	QWORD PTR [rsp], 0x000000000
	movzx	edx, BYTE PTR [rax]
	cmp	edx, 45
	je	.L20
.L14:
	mov	rsi, rsp
	lea	rdi, .LC5[rip]
	xor	eax, eax
	call	__isoc99_scanf@PLT
.L12:
	mov	rax, QWORD PTR 8[rbx]
	cmp	BYTE PTR [rax], 45
	jne	.L16
	cmp	BYTE PTR 1[rax], 102
	jne	.L16
	cmp	BYTE PTR 2[rax], 0
	jne	.L16
	mov	rdi, rbp
	call	fclose@PLT
.L16:
	movsd	xmm0, QWORD PTR [rsp]
	mov	rax, QWORD PTR 8[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L21
	add	rsp, 24
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	pop	rbx
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L18:
	.cfi_restore_state
	mov	QWORD PTR [rsp], 0x000000000
	movzx	edx, BYTE PTR [rax]
	xor	ebp, ebp
	cmp	edx, 45
	jne	.L14
.L20:
	cmp	BYTE PTR 1[rax], 114
	je	.L22
.L11:
	cmp	edx, 45
	jne	.L14
	cmp	BYTE PTR 1[rax], 102
	jne	.L14
	cmp	BYTE PTR 2[rax], 0
	jne	.L14
	mov	rdx, rsp
	lea	rsi, .LC4[rip]
	mov	rdi, rbp
	xor	eax, eax
	call	__isoc99_fscanf@PLT
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L7:
	lea	rsi, .LC0[rip]
	lea	rdi, .LC1[rip]
	call	fopen@PLT
	mov	rbp, rax
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L22:
	cmp	BYTE PTR 2[rax], 0
	jne	.L11
	call	rand@PLT
	pxor	xmm0, xmm0
	movabs	rdx, 1117984489315730401
	movsx	rcx, eax
	mov	rax, rcx
	imul	rdx
	mov	rax, rcx
	sar	rax, 63
	sar	rdx, 3
	sub	rdx, rax
	mov	rax, rdx
	sal	rax, 5
	add	rax, rdx
	sal	rax, 2
	sub	rcx, rax
	sub	ecx, 78
	cvtsi2sd	xmm0, ecx
	movsd	QWORD PTR [rsp], xmm0
	jmp	.L12
.L21:
	call	__stack_chk_fail@PLT
.L9:
	lea	rdi, .LC2[rip]
	call	puts@PLT
	mov	edi, 1
	call	exit@PLT
	.cfi_endproc
.LFE52:
	.size	getNumber, .-getNumber
	.section	.rodata.str1.1
.LC6:
	.string	"w"
.LC7:
	.string	"out.txt"
.LC8:
	.string	"%.23lf\n"
	.text
	.p2align 4
	.globl	outputNumber
	.type	outputNumber, @function
outputNumber:
.LFB53:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	push	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	mov	rbx, rsi
	sub	rsp, 24
	.cfi_def_cfa_offset 48
	mov	rdx, QWORD PTR 8[rsi]
	cmp	BYTE PTR [rdx], 45
	jne	.L34
	cmp	BYTE PTR 1[rdx], 99
	jne	.L34
	xor	ebp, ebp
	cmp	BYTE PTR 2[rdx], 0
	jne	.L34
.L25:
	lea	rsi, .LC8[rip]
	mov	edi, 1
	mov	eax, 1
	call	__printf_chk@PLT
	mov	rdx, QWORD PTR 8[rbx]
	cmp	BYTE PTR [rdx], 45
	je	.L38
.L35:
	add	rsp, 24
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	mov	rdi, rbp
	pop	rbx
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	jmp	fclose@PLT
	.p2align 4,,10
	.p2align 3
.L34:
	.cfi_restore_state
	movsd	QWORD PTR 8[rsp], xmm0
	cmp	edi, 4
	je	.L39
	lea	rsi, .LC6[rip]
	lea	rdi, .LC7[rip]
	call	fopen@PLT
	movsd	xmm0, QWORD PTR 8[rsp]
	mov	rbp, rax
.L27:
	mov	rax, QWORD PTR 8[rbx]
	cmp	BYTE PTR [rax], 45
	jne	.L29
	cmp	BYTE PTR 1[rax], 99
	je	.L40
.L29:
	lea	rdx, .LC8[rip]
	mov	esi, 1
	mov	rdi, rbp
	mov	eax, 1
	call	__fprintf_chk@PLT
	mov	rdx, QWORD PTR 8[rbx]
	cmp	BYTE PTR [rdx], 45
	jne	.L35
.L38:
	cmp	BYTE PTR 1[rdx], 99
	jne	.L35
	cmp	BYTE PTR 2[rdx], 0
	jne	.L35
	add	rsp, 24
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	pop	rbx
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L39:
	.cfi_restore_state
	mov	rdi, QWORD PTR 24[rbx]
	lea	rsi, .LC6[rip]
	call	fopen@PLT
	movsd	xmm0, QWORD PTR 8[rsp]
	mov	rbp, rax
	jmp	.L27
	.p2align 4,,10
	.p2align 3
.L40:
	cmp	BYTE PTR 2[rax], 0
	je	.L25
	jmp	.L29
	.cfi_endproc
.LFE53:
	.size	outputNumber, .-outputNumber
	.p2align 4
	.globl	factorial
	.type	factorial, @function
factorial:
.LFB54:
	.cfi_startproc
	endbr64
	movsd	xmm3, QWORD PTR .LC9[rip]
	comisd	xmm0, xmm3
	movapd	xmm1, xmm3
	movapd	xmm2, xmm3
	jb	.L41
	.p2align 4,,10
	.p2align 3
.L44:
	mulsd	xmm2, xmm1
	addsd	xmm1, xmm3
	comisd	xmm0, xmm1
	jnb	.L44
.L41:
	movapd	xmm0, xmm2
	ret
	.cfi_endproc
.LFE54:
	.size	factorial, .-factorial
	.section	.rodata.str1.8
	.align 8
.LC10:
	.string	"\320\222\321\213 \320\276\320\261\321\217\320\267\320\260\320\275\321\213 \320\262\320\262\320\265\321\201\321\202\320\270 1,2 \320\270\320\273\320\270 3 \320\260\321\200\320\263\321\203\320\274\320\265\320\275\321\202\320\260 \320\272\320\276\320\274\320\260\320\275\320\264\320\275\320\276\320\271 \321\201\321\202\321\200\320\276\320\272\320\270:\n\320\237\320\265\321\200\320\262\321\213\320\271 - -f/-r/-c.\n\320\222\321\202\320\276\321\200\320\276\320\271 \320\270 \321\202\321\200\320\265\321\202\320\270\320\271 \320\276\320\277\321\206\320\270\320\276\320\275\320\260\320\273\321\214\320\275\321\213, \321\215\321\202\320\276 \320\260\320\261\321\201\320\276\320\273\321\216\321\202\320\275\321\213\320\271 \320\277\321\203\321\202\321\214 \320\272 \321\204\320\260\320\271\320\273\320\260\320\274 \320\262\320\262\320\276\320\264\320\260 \320\270 \320\262\321\213\320\262\320\276\320\264\320\260."
	.align 8
.LC13:
	.string	"\320\222\321\200\320\265\320\274\321\217 \320\262\321\213\320\277\320\276\320\273\320\275\320\265\320\275\320\270\321\217 \320\277\321\200\320\276\320\263\321\200\320\260\320\274\320\274\321\213: "
	.section	.rodata.str1.1
.LC14:
	.string	"%s"
.LC16:
	.string	"%.5lf"
.LC17:
	.string	"\321\201"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB55:
	.cfi_startproc
	endbr64
	push	r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	push	r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	push	r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	mov	r12, rsi
	push	rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	mov	ebp, edi
	xor	edi, edi
	push	rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	sub	rsp, 16
	.cfi_def_cfa_offset 64
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	lea	eax, -2[rbp]
	cmp	eax, 2
	ja	.L67
	call	clock@PLT
	mov	rsi, r12
	mov	edi, ebp
	mov	rbx, rax
	call	getNumber
	movsd	xmm4, QWORD PTR .LC9[rip]
	movapd	xmm6, xmm0
	andpd	xmm6, XMMWORD PTR .LC11[rip]
	movq	r14, xmm0
	movapd	xmm1, xmm4
	movapd	xmm5, xmm4
	movq	r13, xmm6
	.p2align 4,,10
	.p2align 3
.L55:
	movq	xmm0, r13
	movsd	QWORD PTR 8[rsp], xmm5
	movsd	QWORD PTR [rsp], xmm1
	call	pow@PLT
	movsd	xmm1, QWORD PTR [rsp]
	mov	rax, QWORD PTR .LC9[rip]
	movsd	xmm5, QWORD PTR 8[rsp]
	movq	xmm4, rax
	movq	xmm2, rax
	movq	xmm3, rax
	comisd	xmm1, xmm4
	jb	.L52
	.p2align 4,,10
	.p2align 3
.L54:
	mulsd	xmm3, xmm2
	addsd	xmm2, xmm4
	comisd	xmm1, xmm2
	jnb	.L54
.L52:
	divsd	xmm0, xmm3
	addsd	xmm1, xmm4
	comisd	xmm0, QWORD PTR .LC12[rip]
	addsd	xmm5, xmm0
	ja	.L55
	movsd	QWORD PTR [rsp], xmm5
	call	clock@PLT
	lea	rdx, .LC13[rip]
	mov	edi, 1
	lea	rsi, .LC14[rip]
	mov	r13, rax
	xor	eax, eax
	call	__printf_chk@PLT
	sub	r13d, ebx
	pxor	xmm0, xmm0
	lea	rsi, .LC16[rip]
	cvtsi2sd	xmm0, r13
	mov	edi, 1
	mov	eax, 1
	mulsd	xmm0, QWORD PTR .LC15[rip]
	call	__printf_chk@PLT
	lea	rdi, .LC17[rip]
	call	puts@PLT
	movq	xmm7, r14
	movsd	xmm5, QWORD PTR [rsp]
	comisd	xmm7, QWORD PTR .LC3[rip]
	jb	.L58
	mov	rax, QWORD PTR .LC9[rip]
	movq	xmm4, rax
	divsd	xmm4, xmm5
	movapd	xmm5, xmm4
.L58:
	mov	rsi, r12
	mov	edi, ebp
	movapd	xmm0, xmm5
	call	outputNumber
	xor	eax, eax
.L49:
	add	rsp, 16
	.cfi_remember_state
	.cfi_def_cfa_offset 48
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
.L67:
	.cfi_restore_state
	lea	rdi, .LC10[rip]
	call	puts@PLT
	mov	eax, 1
	jmp	.L49
	.cfi_endproc
.LFE55:
	.size	main, .-main
	.set	.LC3,.LC11+8
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC9:
	.long	0
	.long	1072693248
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC11:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC12:
	.long	-1998362383
	.long	1054144693
	.align 8
.LC15:
	.long	-1598689907
	.long	1051772663
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
