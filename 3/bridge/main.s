	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	getRandomNumber
	.type	getRandomNumber, @function
getRandomNumber:
.LFB6:
	.cfi_startproc
	endbr64	
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi	# start, start
	mov	QWORD PTR -16[rbp], rsi	# end, end
# return rand() % (end + 1 - start) + start;
	call	rand@PLT
	cdqe
	mov	rdx, QWORD PTR -16[rbp]	# tmp92, end
	add	rdx, 1	# _3
	mov	rcx, rdx	# _3, _3
	sub	rcx, QWORD PTR -8[rbp]	# _3, start
	cqo
	idiv	rcx	# _4
	mov	rax, rdx	# _5, tmp93
	mov	edx, eax	# _6, _5
	mov	rax, QWORD PTR -8[rbp]	# tmp95, start
	add	eax, edx	# _8, _6
	leave
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE6:
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
.LFB7:
	.cfi_startproc
	endbr64	
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	mov	DWORD PTR -36[rbp], edi	# argc, argc
	mov	QWORD PTR -48[rbp], rsi	# argv, argv
# double getNumber(int argc, char* argv[]) {
	mov	rax, QWORD PTR fs:40	# tmp123
	mov	QWORD PTR -8[rbp], rax	# D.4321, tmp123
	xor	eax, eax	# tmp123
# FILE* file = NULL;
	mov	QWORD PTR -16[rbp], 0	# file
# if (!strcmp(argv[1], "-f")) {
	mov	rax, QWORD PTR -48[rbp]	# tmp100, argv
	add	rax, 8	# _1
	mov	rax, QWORD PTR [rax]	# _2, *_1
	lea	rdx, .LC0[rip]	# tmp101
	mov	rsi, rdx	#, tmp101
	mov	rdi, rax	#, _2
	call	strcmp@PLT
	test	eax, eax	# _3
	jne	.L4
# if (argc > 2) {
	cmp	DWORD PTR -36[rbp], 2	# argc
	jle	.L5
# file = fopen(argv[2], "r");
	mov	rax, QWORD PTR -48[rbp]	# tmp102, argv
	add	rax, 16	# _4
	mov	rax, QWORD PTR [rax]	# _5, *_4
	lea	rdx, .LC1[rip]	# tmp103
	mov	rsi, rdx	#, tmp103
	mov	rdi, rax	#, _5
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax	# file, tmp104
	jmp	.L6
.L5:
# file = fopen("in.txt", "r");
	lea	rax, .LC1[rip]	# tmp105
	mov	rsi, rax	#, tmp105
	lea	rax, .LC2[rip]	# tmp106
	mov	rdi, rax	#, tmp106
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax	# file, tmp107
.L6:
# if (file == NULL) {
	cmp	QWORD PTR -16[rbp], 0	# file
	jne	.L4
# printf("%s\n",
	lea	rax, .LC3[rip]	# tmp108
	mov	rdi, rax	#, tmp108
	call	puts@PLT
# exit(1);
	mov	edi, 1
	call	exit@PLT
.L4:
# double number = 0;
	pxor	xmm0, xmm0	# tmp109
	movsd	QWORD PTR -24[rbp], xmm0	# number, tmp109
# if (!strcmp(argv[1], "-r")) {
	mov	rax, QWORD PTR -48[rbp]	# tmp110, argv
	add	rax, 8	# _6
	mov	rax, QWORD PTR [rax]	# _7, *_6
	lea	rdx, .LC5[rip]	# tmp111
	mov	rsi, rdx	#, tmp111
	mov	rdi, rax	#, _7
	call	strcmp@PLT
	test	eax, eax	# _8
	jne	.L7
# number = (double)getRandomNumber(-78, 53);
	mov	esi, 53
	mov	rdi, -78
	call	getRandomNumber
	pxor	xmm0, xmm0	# _10
	cvtsi2sd	xmm0, eax	# _10, _9
	movsd	QWORD PTR -24[rbp], xmm0	# number, _10
	jmp	.L8
.L7:
# else if (!strcmp(argv[1], "-f")) {
	mov	rax, QWORD PTR -48[rbp]	# tmp112, argv
	add	rax, 8	# _11
	mov	rax, QWORD PTR [rax]	# _12, *_11
	lea	rdx, .LC0[rip]	# tmp113
	mov	rsi, rdx	#, tmp113
	mov	rdi, rax	#, _12
	call	strcmp@PLT
	test	eax, eax	# _13
	jne	.L9
# fscanf(file, "%lf\n", &number);
	lea	rdx, -24[rbp]	# tmp114
	mov	rax, QWORD PTR -16[rbp]	# tmp115, file
	lea	rcx, .LC6[rip]	# tmp116
	mov	rsi, rcx	#, tmp116
	mov	rdi, rax	#, tmp115
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	jmp	.L8
.L9:
# scanf("%lf", &number);
	lea	rax, -24[rbp]	# tmp117
	mov	rsi, rax	#, tmp117
	lea	rax, .LC7[rip]	# tmp118
	mov	rdi, rax	#, tmp118
	mov	eax, 0
	call	__isoc99_scanf@PLT
.L8:
# if (!strcmp(argv[1], "-f")) {
	mov	rax, QWORD PTR -48[rbp]	# tmp119, argv
	add	rax, 8	# _14
	mov	rax, QWORD PTR [rax]	# _15, *_14
	lea	rdx, .LC0[rip]	# tmp120
	mov	rsi, rdx	#, tmp120
	mov	rdi, rax	#, _15
	call	strcmp@PLT
	test	eax, eax	# _16
	jne	.L10
# fclose(file);
	mov	rax, QWORD PTR -16[rbp]	# tmp121, file
	mov	rdi, rax	#, tmp121
	call	fclose@PLT
# file = NULL;
	mov	QWORD PTR -16[rbp], 0	# file
.L10:
# return number;
	movsd	xmm0, QWORD PTR -24[rbp]	# _40, number
	movq	rax, xmm0	# <retval>, _40
	mov	rdx, QWORD PTR -8[rbp]	# tmp124, D.4321
	sub	rdx, QWORD PTR fs:40	# tmp124
	je	.L12
	call	__stack_chk_fail@PLT
.L12:
	movq	xmm0, rax	#, <retval>
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE7:
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
.LFB8:
	.cfi_startproc
	endbr64	
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	movsd	QWORD PTR -24[rbp], xmm0	# total, total
	mov	DWORD PTR -28[rbp], edi	# argc, argc
	mov	QWORD PTR -40[rbp], rsi	# argv, argv
# FILE* file = NULL;
	mov	QWORD PTR -8[rbp], 0	# file
# if (strcmp(argv[1], "-c")) {
	mov	rax, QWORD PTR -40[rbp]	# tmp93, argv
	add	rax, 8	# _1
	mov	rax, QWORD PTR [rax]	# _2, *_1
	lea	rdx, .LC8[rip]	# tmp94
	mov	rsi, rdx	#, tmp94
	mov	rdi, rax	#, _2
	call	strcmp@PLT
	test	eax, eax	# _3
	je	.L14
# if (argc == 4) {
	cmp	DWORD PTR -28[rbp], 4	# argc
	jne	.L15
# file = fopen(argv[3], "w");
	mov	rax, QWORD PTR -40[rbp]	# tmp95, argv
	add	rax, 24	# _4
	mov	rax, QWORD PTR [rax]	# _5, *_4
	lea	rdx, .LC9[rip]	# tmp96
	mov	rsi, rdx	#, tmp96
	mov	rdi, rax	#, _5
	call	fopen@PLT
	mov	QWORD PTR -8[rbp], rax	# file, tmp97
	jmp	.L14
.L15:
# file = fopen("out.txt", "w");
	lea	rax, .LC9[rip]	# tmp98
	mov	rsi, rax	#, tmp98
	lea	rax, .LC10[rip]	# tmp99
	mov	rdi, rax	#, tmp99
	call	fopen@PLT
	mov	QWORD PTR -8[rbp], rax	# file, tmp100
.L14:
# if (!strcmp(argv[1], "-c")) {
	mov	rax, QWORD PTR -40[rbp]	# tmp101, argv
	add	rax, 8	# _6
	mov	rax, QWORD PTR [rax]	# _7, *_6
	lea	rdx, .LC8[rip]	# tmp102
	mov	rsi, rdx	#, tmp102
	mov	rdi, rax	#, _7
	call	strcmp@PLT
	test	eax, eax	# _8
	jne	.L16
# printf("%.23lf\n", total);
	mov	rax, QWORD PTR -24[rbp]	# tmp103, total
	movq	xmm0, rax	#, tmp103
	lea	rax, .LC11[rip]	# tmp104
	mov	rdi, rax	#, tmp104
	mov	eax, 1
	call	printf@PLT
	jmp	.L17
.L16:
# fprintf(file, "%.23lf\n", total);
	mov	rdx, QWORD PTR -24[rbp]	# tmp105, total
	mov	rax, QWORD PTR -8[rbp]	# tmp106, file
	movq	xmm0, rdx	#, tmp105
	lea	rdx, .LC11[rip]	# tmp107
	mov	rsi, rdx	#, tmp107
	mov	rdi, rax	#, tmp106
	mov	eax, 1
	call	fprintf@PLT
.L17:
# if (strcmp(argv[1], "-c")) {
	mov	rax, QWORD PTR -40[rbp]	# tmp108, argv
	add	rax, 8	# _9
	mov	rax, QWORD PTR [rax]	# _10, *_9
	lea	rdx, .LC8[rip]	# tmp109
	mov	rsi, rdx	#, tmp109
	mov	rdi, rax	#, _10
	call	strcmp@PLT
	test	eax, eax	# _11
	je	.L19
# fclose(file);
	mov	rax, QWORD PTR -8[rbp]	# tmp110, file
	mov	rdi, rax	#, tmp110
	call	fclose@PLT
.L19:
	nop
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE8:
	.size	outputNumber, .-outputNumber
	.globl	factorial
	.type	factorial, @function
factorial:
.LFB9:
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	movsd	QWORD PTR -24[rbp], xmm0	# num, num
# double res = 1;
	movsd	xmm0, QWORD PTR .LC12[rip]	# tmp84
	movsd	QWORD PTR -16[rbp], xmm0	# res, tmp84
# for (double i = 1; i <= num; i++) {
	movsd	xmm0, QWORD PTR .LC12[rip]	# tmp85
	movsd	QWORD PTR -8[rbp], xmm0	# i, tmp85
	jmp	.L21
.L22:
# res *= i;
	movsd	xmm0, QWORD PTR -16[rbp]	# tmp87, res
	mulsd	xmm0, QWORD PTR -8[rbp]	# tmp86, i
	movsd	QWORD PTR -16[rbp], xmm0	# res, tmp86
	movsd	xmm1, QWORD PTR -8[rbp]	# tmp89, i
	movsd	xmm0, QWORD PTR .LC12[rip]	# tmp90
	addsd	xmm0, xmm1	# tmp88, tmp89
	movsd	QWORD PTR -8[rbp], xmm0	# i, tmp88
.L21:
# for (double i = 1; i <= num; i++) {
	movsd	xmm0, QWORD PTR -24[rbp]	# tmp91, num
	comisd	xmm0, QWORD PTR -8[rbp]	# tmp91, i
	jnb	.L22
# return res;
	movsd	xmm0, QWORD PTR -16[rbp]	# _6, res
	movq	rax, xmm0	# <retval>, _6
	movq	xmm0, rax	#, <retval>
	pop	rbp
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE9:
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
.LFB10:
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	push	rbx	#
	sub	rsp, 72	#,
	.cfi_offset 3, -24
	mov	DWORD PTR -68[rbp], edi	# argc, argc
	mov	QWORD PTR -80[rbp], rsi	# argv, argv
# srand(time(NULL));
	mov	edi, 0
	call	time@PLT
	mov	edi, eax	#, _2
	call	srand@PLT
# if (argc < 2 || argc > 4) {
	cmp	DWORD PTR -68[rbp], 1	# argc
	jle	.L25
	cmp	DWORD PTR -68[rbp], 4	# argc
	jle	.L26
.L25:
# printf("%s\n",
	lea	rax, .LC13[rip]	# tmp96
	mov	rdi, rax	#, tmp96
	call	puts@PLT
# return 1;
	mov	eax, 1	# _14
	jmp	.L27
.L26:
# unsigned int start_time = clock();
	call	clock@PLT
	mov	DWORD PTR -64[rbp], eax	# start_time, _3
# double input = getNumber(argc, argv);
	mov	rdx, QWORD PTR -80[rbp]	# tmp97, argv
	mov	eax, DWORD PTR -68[rbp]	# tmp98, argc
	mov	rsi, rdx	#, tmp97
	mov	edi, eax	#, tmp98
	call	getNumber
	movq	rax, xmm0	# tmp99
	mov	QWORD PTR -32[rbp], rax	# input, tmp99
# double x = fabs(input);
	movsd	xmm0, QWORD PTR -32[rbp]	# tmp101, input
	movq	xmm1, QWORD PTR .LC14[rip]	# tmp102
	andpd	xmm0, xmm1	# tmp100, tmp102
	movsd	QWORD PTR -24[rbp], xmm0	# x, tmp100
# double total = 1, total_temp = 0, n = 1;
	movsd	xmm0, QWORD PTR .LC12[rip]	# tmp103
	movsd	QWORD PTR -56[rbp], xmm0	# total, tmp103
	pxor	xmm0, xmm0	# tmp104
	movsd	QWORD PTR -48[rbp], xmm0	# total_temp, tmp104
	movsd	xmm0, QWORD PTR .LC12[rip]	# tmp105
	movsd	QWORD PTR -40[rbp], xmm0	# n, tmp105
# while (total - total_temp > 0.000005) {
	jmp	.L28
.L29:
# total_temp = total;
	movsd	xmm0, QWORD PTR -56[rbp]	# tmp106, total
	movsd	QWORD PTR -48[rbp], xmm0	# total_temp, tmp106
# total += pow(x, n) / factorial(n);
	movsd	xmm0, QWORD PTR -40[rbp]	# tmp107, n
	mov	rax, QWORD PTR -24[rbp]	# tmp108, x
	movapd	xmm1, xmm0	#, tmp107
	movq	xmm0, rax	#, tmp108
	call	pow@PLT
	movq	rbx, xmm0	# _4
	mov	rax, QWORD PTR -40[rbp]	# tmp109, n
	movq	xmm0, rax	#, tmp109
	call	factorial
	movq	xmm1, rbx	# _4, _4
	divsd	xmm1, xmm0	# _4, _5
	movsd	xmm0, QWORD PTR -56[rbp]	# tmp111, total
	addsd	xmm0, xmm1	# tmp110, _43
	movsd	QWORD PTR -56[rbp], xmm0	# total, tmp110
# n++;
	movsd	xmm1, QWORD PTR -40[rbp]	# tmp113, n
	movsd	xmm0, QWORD PTR .LC12[rip]	# tmp114,
	addsd	xmm0, xmm1	# tmp112, tmp113
	movsd	QWORD PTR -40[rbp], xmm0	# n, tmp112
.L28:
# while (total - total_temp > 0.000005) {
	movsd	xmm0, QWORD PTR -56[rbp]	# tmp115, total
	subsd	xmm0, QWORD PTR -48[rbp]	# _6, total_temp
	comisd	xmm0, QWORD PTR .LC15[rip]	# _6
	ja	.L29
#  unsigned int end_time = clock();
	call	clock@PLT
	mov	DWORD PTR -60[rbp], eax	# end_time, _7
# printf("%s", "Время выполнения программы: ");
	lea	rax, .LC16[rip]	# tmp116
	mov	rsi, rax	#, tmp116
	lea	rax, .LC17[rip]	# tmp117
	mov	rdi, rax	#, tmp117
	mov	eax, 0
	call	printf@PLT
# printf("%.5lf", (double) (end_time - start_time) / CLOCKS_PER_SEC);
	mov	eax, DWORD PTR -60[rbp]	# tmp118, end_time
	sub	eax, DWORD PTR -64[rbp]	# _8, start_time
	mov	eax, eax	# tmp119, _8
	test	rax, rax	# tmp119
	js	.L30
	pxor	xmm0, xmm0	# _9
	cvtsi2sd	xmm0, rax	# _9, tmp119
	jmp	.L31
.L30:
	mov	rdx, rax	# tmp121, tmp119
	shr	rdx	# tmp121
	and	eax, 1	# tmp122
	or	rdx, rax	# tmp121, tmp122
	pxor	xmm0, xmm0	# tmp120
	cvtsi2sd	xmm0, rdx	# tmp120, tmp121
	addsd	xmm0, xmm0	# _9, tmp120
.L31:
	movsd	xmm1, QWORD PTR .LC18[rip]	# tmp123
	divsd	xmm0, xmm1	# _9, tmp123
	movq	rax, xmm0	# _10, _9
	movq	xmm0, rax	#, _10
	lea	rax, .LC19[rip]	# tmp124
	mov	rdi, rax	#, tmp124
	mov	eax, 1
	call	printf@PLT
# printf("%s\n", "с");
	lea	rax, .LC20[rip]	# tmp125
	mov	rdi, rax	#, tmp125
	call	puts@PLT
# outputNumber(input < 0 ? total : 1 / total, argc, argv);
	pxor	xmm0, xmm0	# tmp126
	comisd	xmm0, QWORD PTR -32[rbp]	# tmp126, input
	jbe	.L36
	mov	rax, QWORD PTR -56[rbp]	# iftmp.0_15, total
	jmp	.L34
.L36:
	movsd	xmm0, QWORD PTR .LC12[rip]	# tmp127
	divsd	xmm0, QWORD PTR -56[rbp]	# tmp127, total
	movq	rax, xmm0	# iftmp.0_15, tmp127
.L34:
	mov	rcx, QWORD PTR -80[rbp]	# tmp128, argv
	mov	edx, DWORD PTR -68[rbp]	# tmp129, argc
	mov	rsi, rcx	#, tmp128
	mov	edi, edx	#, tmp129
	movq	xmm0, rax	#, iftmp.0_15
	call	outputNumber
# return 0;
	mov	eax, 0	# _14
.L27:
	mov	rbx, QWORD PTR -8[rbp]
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE10:
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
