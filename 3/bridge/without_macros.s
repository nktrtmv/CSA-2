	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	getRandomNumber
	.type	getRandomNumber, @function
getRandomNumber:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	mov	QWORD PTR -16[rbp], rsi
	call	rand@PLT
	cdqe
	mov	rdx, QWORD PTR -16[rbp]
	add	rdx, 1
	mov	rcx, rdx
	sub	rcx, QWORD PTR -8[rbp]
	cqo
	idiv	rcx
	mov	rax, rdx
	mov	edx, eax
	mov	rax, QWORD PTR -8[rbp]
	add	eax, edx
	leave
	ret
	.size	getRandomNumber, .-getRandomNumber
	.section	.rodata
.LC0:
	.string	"-f"
.LC1:
	.string	"r"
.LC2:
	.string	"in.txt"
	.align 8
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
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	DWORD PTR -36[rbp], edi
	mov	QWORD PTR -48[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	QWORD PTR -16[rbp], 0
	mov	rax, QWORD PTR -48[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC0[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L4
	cmp	DWORD PTR -36[rbp], 2
	jle	.L5
	mov	rax, QWORD PTR -48[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC1[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax
	jmp	.L6
.L5:
	lea	rax, .LC1[rip]
	mov	rsi, rax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax
.L6:
	cmp	QWORD PTR -16[rbp], 0
	jne	.L4
	lea	rax, .LC3[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	edi, 1
	call	exit@PLT
.L4:
	pxor	xmm0, xmm0
	movsd	QWORD PTR -24[rbp], xmm0
	mov	rax, QWORD PTR -48[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC5[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L7
	mov	esi, 53
	mov	rdi, -78
	call	getRandomNumber
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	movsd	QWORD PTR -24[rbp], xmm0
	jmp	.L8
.L7:
	mov	rax, QWORD PTR -48[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC0[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L9
	lea	rdx, -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	lea	rcx, .LC6[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	jmp	.L8
.L9:
	lea	rax, -24[rbp]
	mov	rsi, rax
	lea	rax, .LC7[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
.L8:
	mov	rax, QWORD PTR -48[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC0[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L10
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	QWORD PTR -16[rbp], 0
.L10:
	movsd	xmm0, QWORD PTR -24[rbp]
	movq	rax, xmm0
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L12
	call	__stack_chk_fail@PLT
.L12:
	movq	xmm0, rax
	leave
	ret
	.size	getNumber, .-getNumber
	.section	.rodata
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
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	movsd	QWORD PTR -24[rbp], xmm0
	mov	DWORD PTR -28[rbp], edi
	mov	QWORD PTR -40[rbp], rsi
	mov	QWORD PTR -8[rbp], 0
	mov	rax, QWORD PTR -40[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC8[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	je	.L14
	cmp	DWORD PTR -28[rbp], 4
	jne	.L15
	mov	rax, QWORD PTR -40[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC9[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L14
.L15:
	lea	rax, .LC9[rip]
	mov	rsi, rax
	lea	rax, .LC10[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -8[rbp], rax
.L14:
	mov	rax, QWORD PTR -40[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC8[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L16
	mov	rax, QWORD PTR -24[rbp]
	movq	xmm0, rax
	lea	rax, .LC11[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	jmp	.L17
.L16:
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC11[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
.L17:
	mov	rax, QWORD PTR -40[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC8[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	je	.L19
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	fclose@PLT
.L19:
	nop
	leave
	ret
	.size	outputNumber, .-outputNumber
	.globl	factorial
	.type	factorial, @function
factorial:
	endbr64
	push	rbp
	mov	rbp, rsp
	movsd	QWORD PTR -24[rbp], xmm0
	movsd	xmm0, QWORD PTR .LC12[rip]
	movsd	QWORD PTR -16[rbp], xmm0
	movsd	xmm0, QWORD PTR .LC12[rip]
	movsd	QWORD PTR -8[rbp], xmm0
	jmp	.L21
.L22:
	movsd	xmm0, QWORD PTR -16[rbp]
	mulsd	xmm0, QWORD PTR -8[rbp]
	movsd	QWORD PTR -16[rbp], xmm0
	movsd	xmm1, QWORD PTR -8[rbp]
	movsd	xmm0, QWORD PTR .LC12[rip]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
.L21:
	movsd	xmm0, QWORD PTR -24[rbp]
	comisd	xmm0, QWORD PTR -8[rbp]
	jnb	.L22
	movsd	xmm0, QWORD PTR -16[rbp]
	movq	rax, xmm0
	movq	xmm0, rax
	pop	rbp
	ret
	.size	factorial, .-factorial
	.section	.rodata
	.align 8
.LC13:
	.string	"\320\222\321\213 \320\276\320\261\321\217\320\267\320\260\320\275\321\213 \320\262\320\262\320\265\321\201\321\202\320\270 1,2 \320\270\320\273\320\270 3 \320\260\321\200\320\263\321\203\320\274\320\265\320\275\321\202\320\260 \320\272\320\276\320\274\320\260\320\275\320\264\320\275\320\276\320\271 \321\201\321\202\321\200\320\276\320\272\320\270:\n\320\237\320\265\321\200\320\262\321\213\320\271 - -f/-r/-c.\n\320\222\321\202\320\276\321\200\320\276\320\271 \320\270 \321\202\321\200\320\265\321\202\320\270\320\271 \320\276\320\277\321\206\320\270\320\276\320\275\320\260\320\273\321\214\320\275\321\213, \321\215\321\202\320\276 \320\260\320\261\321\201\320\276\320\273\321\216\321\202\320\275\321\213\320\271 \320\277\321\203\321\202\321\214 \320\272 \321\204\320\260\320\271\320\273\320\260\320\274 \320\262\320\262\320\276\320\264\320\260 \320\270 \320\262\321\213\320\262\320\276\320\264\320\260."
	.align 8
.LC16:
	.string	"\320\222\321\200\320\265\320\274\321\217 \320\262\321\213\320\277\320\276\320\273\320\275\320\265\320\275\320\270\321\217 \320\277\321\200\320\276\320\263\321\200\320\260\320\274\320\274\321\213: "
.LC17:
	.string	"%s"
.LC19:
	.string	"%.5lf"
.LC20:
	.string	"\321\201"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	push	rbx
	sub	rsp, 72
	mov	DWORD PTR -68[rbp], edi
	mov	QWORD PTR -80[rbp], rsi
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	cmp	DWORD PTR -68[rbp], 1
	jle	.L25
	cmp	DWORD PTR -68[rbp], 4
	jle	.L26
.L25:
	lea	rax, .LC13[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 1
	jmp	.L27
.L26:
	call	clock@PLT
	mov	DWORD PTR -64[rbp], eax
	mov	rdx, QWORD PTR -80[rbp]
	mov	eax, DWORD PTR -68[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	getNumber
	movq	rax, xmm0
	mov	QWORD PTR -32[rbp], rax
	movsd	xmm0, QWORD PTR -32[rbp]
	movq	xmm1, QWORD PTR .LC14[rip]
	andpd	xmm0, xmm1
	movsd	QWORD PTR -24[rbp], xmm0
	movsd	xmm0, QWORD PTR .LC12[rip]
	movsd	QWORD PTR -56[rbp], xmm0
	pxor	xmm0, xmm0
	movsd	QWORD PTR -48[rbp], xmm0
	movsd	xmm0, QWORD PTR .LC12[rip]
	movsd	QWORD PTR -40[rbp], xmm0
	jmp	.L28
.L29:
	movsd	xmm0, QWORD PTR -56[rbp]
	movsd	QWORD PTR -48[rbp], xmm0
	movsd	xmm0, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -24[rbp]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	pow@PLT
	movq	rbx, xmm0
	mov	rax, QWORD PTR -40[rbp]
	movq	xmm0, rax
	call	factorial
	movq	xmm1, rbx
	divsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR -56[rbp]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -56[rbp], xmm0
	movsd	xmm1, QWORD PTR -40[rbp]
	movsd	xmm0, QWORD PTR .LC12[rip]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -40[rbp], xmm0
.L28:
	movsd	xmm0, QWORD PTR -56[rbp]
	subsd	xmm0, QWORD PTR -48[rbp]
	comisd	xmm0, QWORD PTR .LC15[rip]
	ja	.L29
	call	clock@PLT
	mov	DWORD PTR -60[rbp], eax
	lea	rax, .LC16[rip]
	mov	rsi, rax
	lea	rax, .LC17[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR -60[rbp]
	sub	eax, DWORD PTR -64[rbp]
	mov	eax, eax
	test	rax, rax
	js	.L30
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	jmp	.L31
.L30:
	mov	rdx, rax
	shr	rdx
	and	eax, 1
	or	rdx, rax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rdx
	addsd	xmm0, xmm0
.L31:
	movsd	xmm1, QWORD PTR .LC18[rip]
	divsd	xmm0, xmm1
	movq	rax, xmm0
	movq	xmm0, rax
	lea	rax, .LC19[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	lea	rax, .LC20[rip]
	mov	rdi, rax
	call	puts@PLT
	pxor	xmm0, xmm0
	comisd	xmm0, QWORD PTR -32[rbp]
	jbe	.L36
	mov	rax, QWORD PTR -56[rbp]
	jmp	.L34
.L36:
	movsd	xmm0, QWORD PTR .LC12[rip]
	divsd	xmm0, QWORD PTR -56[rbp]
	movq	rax, xmm0
.L34:
	mov	rcx, QWORD PTR -80[rbp]
	mov	edx, DWORD PTR -68[rbp]
	mov	rsi, rcx
	mov	edi, edx
	movq	xmm0, rax
	call	outputNumber
	mov	eax, 0
.L27:
	mov	rbx, QWORD PTR -8[rbp]
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC12:
	.long	0
	.long	1072693248
	.align 16
.LC14:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
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
