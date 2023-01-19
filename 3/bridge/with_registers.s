	.file	"main.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	getRandomNumber
	.type	getRandomNumber, @function
getRandomNumber:
	endbr64	
	push	rbp
	mov	rbp, rdi	# start, tmp100
	push	rbx	#
	mov	rbx, rsi	# end, tmp101
	sub	rsp, 8
# return rand() % (end + 1 - start) + start;
	call	rand@PLT
	lea	rsi, 1[rbx]	# tmp95
	add	rsp, 8
	cdqe
	sub	rsi, rbp	# tmp96, start
	pop	rbx
	cqo
	idiv	rsi	# tmp96
	lea	eax, [rdx+rbp]	# tmp93
	pop	rbp
	ret	
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
	endbr64	
	push	rbp
	push	rbx
	mov	rbx, rsi	# argv, tmp143
	sub	rsp, 24
# if (!strcmp(argv[1], "-f")) {
	mov	rax, QWORD PTR fs:40	# tmp147
	mov	QWORD PTR 8[rsp], rax	# D.4747, tmp147
	mov	rax, QWORD PTR 8[rsi]	# tmp147
	cmp	BYTE PTR [rax], 45
	jne	.L18
	cmp	BYTE PTR 1[rax], 102
	jne	.L18
	cmp	BYTE PTR 2[rax], 0
	jne	.L18
# if (argc > 2) {
	cmp	edi, 2	# argc
	jle	.L7
# file = fopen(argv[2], "r");
	mov	rdi, QWORD PTR 16[rsi]
	lea	rsi, .LC0[rip]	# tmp105
	call	fopen@PLT
	mov	rbp, rax	# file, tmp144
.L8:
# if (file == NULL) {
	test	rbp, rbp	# file
	je	.L9
# if (!strcmp(argv[1], "-r")) {
	mov	rax, QWORD PTR 8[rbx]	# _1
# double number = 0;
	mov	QWORD PTR [rsp], 0x000000000	# number
	movzx	edx, BYTE PTR [rax]
	cmp	edx, 45
	je	.L20
.L14:
# scanf("%lf", &number);
	mov	rsi, rsp	# tmp133
	lea	rdi, .LC5[rip]	# tmp134
	xor	eax, eax
	call	__isoc99_scanf@PLT
.L12:
# if (!strcmp(argv[1], "-f")) {
	mov	rax, QWORD PTR 8[rbx]
	cmp	BYTE PTR [rax], 45
	jne	.L16
	cmp	BYTE PTR 1[rax], 102
	jne	.L16
	cmp	BYTE PTR 2[rax], 0
	jne	.L16
# fclose(file);
	mov	rdi, rbp	#, file
	call	fclose@PLT
.L16:
# return number;
	movsd	xmm0, QWORD PTR [rsp]	# <retval>, number
	mov	rax, QWORD PTR 8[rsp]	# tmp149, D.4747
	sub	rax, QWORD PTR fs:40	# tmp149
	jne	.L21
	add	rsp, 24
	pop	rbx
	pop	rbp
	ret	
	.p2align 4,,10
	.p2align 3
.L18:
# double number = 0;
	mov	QWORD PTR [rsp], 0x000000000	# number
# if (!strcmp(argv[1], "-r")) {
	movzx	edx, BYTE PTR [rax]
# FILE* file = NULL;
	xor	ebp, ebp	# file
	cmp	edx, 45
	jne	.L14
.L20:
	cmp	BYTE PTR 1[rax], 114
	je	.L22
.L11:
# else if (!strcmp(argv[1], "-f")) {
	cmp	edx, 45
	jne	.L14
	cmp	BYTE PTR 1[rax], 102
	jne	.L14
	cmp	BYTE PTR 2[rax], 0
	jne	.L14
# fscanf(file, "%lf\n", &number);
	mov	rdx, rsp	# tmp131
	lea	rsi, .LC4[rip]	# tmp132
	mov	rdi, rbp	#, file
	xor	eax, eax
	call	__isoc99_fscanf@PLT
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L7:
#  file = fopen("in.txt", "r");
	lea	rsi, .LC0[rip]	# tmp107
	lea	rdi, .LC1[rip]	# tmp108
	call	fopen@PLT
	mov	rbp, rax	# file, tmp145
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L22:
# if (!strcmp(argv[1], "-r")) {
	cmp	BYTE PTR 2[rax], 0
	jne	.L11
# return rand() % (end + 1 - start) + start;
	call	rand@PLT	#
# number = (double)getRandomNumber(-78, 53);
	pxor	xmm0, xmm0	# tmp127
	movabs	rdx, 1117984489315730401	# tmp118
	movsx	rcx, eax	# _31, tmp146
	mov	rax, rcx	# tmp148, _31
	imul	rdx	# tmp118
	mov	rax, rcx	# tmp120, _31
	sar	rax, 63	# tmp120
	sar	rdx, 3	# tmp119
	sub	rdx, rax	# tmp116, tmp120
	mov	rax, rdx	# tmp122, tmp116
	sal	rax, 5	# tmp122
	add	rax, rdx	# tmp123, tmp116
	sal	rax, 2	# tmp124
	sub	rcx, rax	# tmp125, tmp124
	sub	ecx, 78	# tmp126,
	cvtsi2sd	xmm0, ecx	# tmp127, tmp126
	movsd	QWORD PTR [rsp], xmm0	# number, tmp127
	jmp	.L12
.L21:
	call	__stack_chk_fail@PLT
.L9:
	lea	rdi, .LC2[rip]	# tmp110
	call	puts@PLT
# exit(1);
	mov	edi, 1
	call	exit@PLT
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
	endbr64	
	push	rbp
	push	rbx
	mov	rbx, rsi	# argv, tmp115
	sub	rsp, 24
# if (strcmp(argv[1], "-c")) {
	mov	rdx, QWORD PTR 8[rsi]
	cmp	BYTE PTR [rdx], 45
	jne	.L34	#,
	cmp	BYTE PTR 1[rdx], 99
	jne	.L34	#,
# FILE* file = NULL;
	xor	ebp, ebp	# file
	cmp	BYTE PTR 2[rdx], 0
	jne	.L34
.L25:
	lea	rsi, .LC8[rip]	# tmp107
	mov	edi, 1
	mov	eax, 1
	call	__printf_chk@PLT
	mov	rdx, QWORD PTR 8[rbx]
	cmp	BYTE PTR [rdx], 45
	je	.L38
.L35:
	add	rsp, 24
# fclose(file);
	mov	rdi, rbp	#, file
	pop	rbx
	pop	rbp
	jmp	fclose@PLT
	.p2align 4,,10
	.p2align 3
.L34:
	movsd	QWORD PTR 8[rsp], xmm0	# %sfp, total
# if (argc == 4) {
	cmp	edi, 4	# argc
	je	.L39
# file = fopen("out.txt", "w");
	lea	rsi, .LC6[rip]	# tmp100
	lea	rdi, .LC7[rip]	# tmp101
	call	fopen@PLT
	movsd	xmm0, QWORD PTR 8[rsp]	# total, %sfp
	mov	rbp, rax	# file, tmp117
.L27:
# if (!strcmp(argv[1], "-c")) {
	mov	rax, QWORD PTR 8[rbx]
	cmp	BYTE PTR [rax], 45
	jne	.L29
	cmp	BYTE PTR 1[rax], 99
	je	.L40
.L29:
	lea	rdx, .LC8[rip]	# tmp108
	mov	esi, 1
	mov	rdi, rbp	#, file
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
	pop	rbx
	pop	rbp
	ret	
	.p2align 4,,10
	.p2align 3
.L39:
# file = fopen(argv[3], "w");
	mov	rdi, QWORD PTR 24[rbx]
	lea	rsi, .LC6[rip]	# tmp98
	call	fopen@PLT
	movsd	xmm0, QWORD PTR 8[rsp]	# total, %sfp
	mov	rbp, rax	# file, tmp116
	jmp	.L27
	.p2align 4,,10
	.p2align 3
.L40:
# if (!strcmp(argv[1], "-c")) {
	cmp	BYTE PTR 2[rax], 0
	je	.L25
	jmp	.L29
	.size	outputNumber, .-outputNumber
	.p2align 4
	.globl	factorial
	.type	factorial, @function
factorial:
	endbr64	
# for (double i = 1; i <= num; i++) {
	movsd	xmm3, QWORD PTR .LC9[rip]	# tmp88
	comisd	xmm0, xmm3	# num, <retval>
	movapd	xmm1, xmm3	# i, tmp88
# double res = 1;
	movapd	xmm2, xmm3	# <retval>, tmp88
	jb	.L41
	.p2align 4,,10
	.p2align 3
.L44:
# res *= i;
	mulsd	xmm2, xmm1	# <retval>, i
# for (double i = 1; i <= num; i++) {
	addsd	xmm1, xmm3	# i, tmp88
	comisd	xmm0, xmm1	# num, i
	jnb	.L44
.L41:
	movapd	xmm0, xmm2	#, <retval>
	ret	
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
	endbr64	
	push	r13
	push	r12
	mov	r12, rsi	# argv, tmp134
	push	rbp
	mov	ebp, edi	# argc, tmp133
	xor	edi, edi
# int main(int argc, char* argv[]) {
	push	rbx
	sub	rsp, 40
# srand(time(NULL));
	call	time@PLT
	mov	edi, eax	# _1, tmp135
	call	srand@PLT
# if (argc < 2 || argc > 4) {
	lea	eax, -2[rbp]	# tmp107
	cmp	eax, 2	# tmp107
	ja	.L65
# unsigned int start_time = clock();
	call	clock@PLT
# double input = getNumber(argc, argv);
	mov	rsi, r12	#, argv
	mov	edi, ebp	#, argc
	mov	rbx, rax	# _5, tmp136
	call	getNumber
# double total = 1, total_temp = 0, n = 1;
	movsd	xmm4, QWORD PTR .LC9[rip]	# tmp131
# double input = getNumber(argc, argv);
	movapd	xmm6, xmm0	# input, tmp137
# double x = fabs(input);
	andpd	xmm6, XMMWORD PTR .LC11[rip]	# x
# double input = getNumber(argc, argv);
	movsd	QWORD PTR 24[rsp], xmm0	# %sfp, input
# double total = 1, total_temp = 0, n = 1;
	movapd	xmm1, xmm4	# n, tmp131
	movapd	xmm5, xmm4	# total, tmp131
# double x = fabs(input);
	movq	r13, xmm6	# x, x
	.p2align 4,,10
	.p2align 3
.L55:
# total += pow(x, n) / factorial(n);
	movq	xmm0, r13	#, x
	movsd	QWORD PTR 16[rsp], xmm5	# %sfp, total
	movsd	QWORD PTR 8[rsp], xmm1	# %sfp, n
	call	pow@PLT
# for (double i = 1; i <= num; i++) {
	mov	rax, QWORD PTR .LC9[rip]	# tmp154,
	movsd	xmm1, QWORD PTR 8[rsp]	# n, %sfp
	movsd	xmm5, QWORD PTR 16[rsp]	# total, %sfp
	movq	xmm4, rax	# tmp131, tmp154
	movq	xmm2, rax	# i, tmp131
	movq	xmm3, rax	# res, tmp131
	comisd	xmm1, xmm4	# n, tmp131
	jb	.L52
	.p2align 4,,10
	.p2align 3
.L54:
# res *= i;
	mulsd	xmm3, xmm2	# res, i
# for (double i = 1; i <= num; i++) {
	addsd	xmm2, xmm4	# i, tmp131
	comisd	xmm1, xmm2	# n, i
	jnb	.L54
.L52:
# total += pow(x, n) / factorial(n);
	divsd	xmm0, xmm3	# _6, res
	addsd	xmm1, xmm4	# n, tmp131
	movapd	xmm2, xmm0	# tmp112, _6
	addsd	xmm2, xmm5	# iftmp.1_16, total
# while (total - total_temp > 0.000005) {
	movapd	xmm0, xmm2	# tmp114, iftmp.1_16
	subsd	xmm0, xmm5	# tmp114, total
	comisd	xmm0, QWORD PTR .LC12[rip]	# tmp114
	jbe	.L66
	movapd	xmm5, xmm2	# total, iftmp.1_16
	jmp	.L55
.L66:
	movsd	QWORD PTR 8[rsp], xmm2	# %sfp, iftmp.1_16
# unsigned int end_time = clock();
	call	clock@PLT
	lea	rdx, .LC13[rip]	# tmp116
	mov	edi, 1
	lea	rsi, .LC14[rip]	# tmp117
	mov	r13, rax	# _8, tmp139
	xor	eax, eax
	call	__printf_chk@PLT
# printf("%.5lf", (double) (end_time - start_time) / CLOCKS_PER_SEC);
	sub	r13d, ebx	# tmp120, _5
	lea	rsi, .LC16[rip]	# tmp126
	mov	edi, 1
	pxor	xmm0, xmm0	# tmp119
	mov	eax, 1
	cvtsi2sd	xmm0, r13	# tmp119, tmp120
	divsd	xmm0, QWORD PTR .LC15[rip]	# tmp124
	call	__printf_chk@PLT
	lea	rdi, .LC17[rip]	# tmp127
	call	puts@PLT
# outputNumber(input < 0 ? total : 1 / total, argc, argv);
	pxor	xmm0, xmm0	# tmp128
	comisd	xmm0, QWORD PTR 24[rsp]	# tmp128, %sfp
	movsd	xmm2, QWORD PTR 8[rsp]	# iftmp.1_16, %sfp
	ja	.L58
	mov	rax, QWORD PTR .LC9[rip]	# tmp153
	movq	xmm4, rax	# tmp131, tmp153
	divsd	xmm4, xmm2	# tmp131, iftmp.1_16
	movapd	xmm2, xmm4	# iftmp.1_16, tmp131
.L58:
	mov	rsi, r12	#, argv
	mov	edi, ebp	#, argc
	movapd	xmm0, xmm2	#, iftmp.1_16
	call	outputNumber
# return 0;
	xor	eax, eax	# <retval>
.L49:
	add	rsp, 40
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	ret	
.L65:
	lea	rdi, .LC10[rip]	# tmp108
	call	puts@PLT
# return 1;
	mov	eax, 1	# <retval>
	jmp	.L49
	.size	main, .-main
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
