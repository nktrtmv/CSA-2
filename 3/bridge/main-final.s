	.file	"main-split.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"\320\222\321\213 \320\276\320\261\321\217\320\267\320\260\320\275\321\213 \320\262\320\262\320\265\321\201\321\202\320\270 1,2 \320\270\320\273\320\270 3 \320\260\321\200\320\263\321\203\320\274\320\265\320\275\321\202\320\260 \320\272\320\276\320\274\320\260\320\275\320\264\320\275\320\276\320\271 \321\201\321\202\321\200\320\276\320\272\320\270:\n\320\237\320\265\321\200\320\262\321\213\320\271 - -f/-r/-c.\n\320\222\321\202\320\276\321\200\320\276\320\271 \320\270 \321\202\321\200\320\265\321\202\320\270\320\271 \320\276\320\277\321\206\320\270\320\276\320\275\320\260\320\273\321\214\320\275\321\213, \321\215\321\202\320\276 \320\260\320\261\321\201\320\276\320\273\321\216\321\202\320\275\321\213\320\271 \320\277\321\203\321\202\321\214 \320\272 \321\204\320\260\320\271\320\273\320\260\320\274 \320\262\320\262\320\276\320\264\320\260 \320\270 \320\262\321\213\320\262\320\276\320\264\320\260."
.LC4:
	.string	"\320\222\321\200\320\265\320\274\321\217 \320\262\321\213\320\277\320\276\320\273\320\275\320\265\320\275\320\270\321\217 \320\277\321\200\320\276\320\263\321\200\320\260\320\274\320\274\321\213: "
.LC5:
	.string	"%s"
.LC7:
	.string	"%.5lf"
.LC8:
	.string	"\321\201"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
	endbr64	
	push	r13
	push	r12
	mov	r12, rsi	# argv, tmp130
	push	rbp
	mov	ebp, edi	# argc, tmp129
	xor	edi, edi
# int main(int argc, char* argv[]) {
	push	rbx
	sub	rsp, 40
# rand(time(NULL));
	call	time@PLT
	mov	edi, eax	# _1, tmp131
	call	srand@PLT
# if (argc < 2 || argc > 4) {
	lea	eax, -2[rbp]	# tmp106
	cmp	eax, 2	# tmp106
	jbe	.L2
	lea	rdi, .LC1[rip]	# tmp107
	call	puts@PLT
# return 0;
	jmp	.L3
.L2:
# unsigned int start_time = clock();
	call	clock@PLT
	mov	rsi, r12	#, argv
	mov	edi, ebp	#, argc
	mov	r13, rax	# _5, tmp132
# double input = getNumber(argc, argv);
	call	getNumber@PLT
# double total = 1, total_temp = 0, n = 1;
	movsd	xmm1, QWORD PTR .LC0[rip]	# n
# double x = fabs(input);
	movaps	xmm5, xmm0	# x, tmp133
	andps	xmm5, XMMWORD PTR .LC2[rip]	# x
	movsd	QWORD PTR [rsp], xmm0	# %sfp, tmp133
	movaps	xmm2, xmm1	# total, n
.L4:
# total += pow(x, n) / factorial(n);
	movaps	xmm0, xmm5	#, x
	movsd	QWORD PTR 24[rsp], xmm2	# %sfp, total
	movsd	QWORD PTR 16[rsp], xmm5	# %sfp, x
	movsd	QWORD PTR 8[rsp], xmm1	# %sfp, n
	call	pow@PLT
	movsd	xmm1, QWORD PTR 8[rsp]	# n, %sfp
	movq	rbx, xmm0	# _6, tmp134
	movaps	xmm0, xmm1	#, n
	call	factorial@PLT
	movsd	xmm2, QWORD PTR 24[rsp]	# total, %sfp
	movsd	xmm1, QWORD PTR 8[rsp]	# n, %sfp
	movaps	xmm4, xmm0	# tmp135
	movq	xmm0, rbx	# _6, _6
	addsd	xmm1, QWORD PTR .LC0[rip]	# n
	movsd	xmm5, QWORD PTR 16[rsp]	# x, %sfp
	divsd	xmm0, xmm4	# _6, tmp135
	movaps	xmm3, xmm2	# total, total
	addsd	xmm2, xmm0	# total, tmp109
# while (total - total_temp > 0.000005) {
	movaps	xmm0, xmm2	# tmp111, total
	subsd	xmm0, xmm3	# tmp111, total
	comisd	xmm0, QWORD PTR .LC3[rip]	# tmp111
	ja	.L4
	movsd	QWORD PTR 8[rsp], xmm2	# %sfp, total
# unsigned int end_time = clock();
	call	clock@PLT
	lea	rdx, .LC4[rip]	# tmp113
	mov	edi, 1
	lea	rsi, .LC5[rip]	# tmp114
	mov	rbx, rax	# _9, tmp136
	xor	eax, eax
	call	__printf_chk@PLT
# printf("%.5lf", (double) (end_time - start_time) / CLOCKS_PER_SEC);
	sub	ebx, r13d	# tmp117, _5
	mov	edi, 1
	mov	al, 1
	cvtsi2sd	xmm0, rbx	# tmp116, tmp117
	lea	rsi, .LC7[rip]	# tmp123
	divsd	xmm0, QWORD PTR .LC6[rip]	# tmp121
	call	__printf_chk@PLT
	lea	rdi, .LC8[rip]	# tmp124
	call	puts@PLT
# outputNumber(input < 0 ? total : 1 / total, argc, argv);
	xorps	xmm0, xmm0	# tmp125
	comisd	xmm0, QWORD PTR [rsp]	# tmp125, %sfp
	movsd	xmm2, QWORD PTR 8[rsp]	# total, %sfp
	ja	.L7
	movsd	xmm6, QWORD PTR .LC0[rip]	# total
	divsd	xmm6, xmm2	# total, total
	movaps	xmm2, xmm6	# total, total
.L7:
	mov	rsi, r12	#, argv
	mov	edi, ebp	#, argc
	movaps	xmm0, xmm2	#, total
	call	outputNumber@PLT
.L3:
	add	rsp, 40
	xor	eax, eax
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	ret	
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC2:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC3:
	.long	-1998362383
	.long	1054144693
	.align 8
.LC6:
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
