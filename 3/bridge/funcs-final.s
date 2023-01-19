	.file	"funcs.c"
	.intel_syntax noprefix
	.text
	.globl	getRandomNumber
	.type	getRandomNumber, @function
getRandomNumber:
	endbr64	
	push	rbp
	mov	rbp, rdi	# start, tmp100
	push	rbx
	mov	rbx, rsi	# end, tmp101
	push	rax
# return rand() % (end + 1 - start) + start;
	call	rand@PLT
	lea	rsi, 1[rbx]	# tmp95
	cdqe
	sub	rsi, rbp	# tmp96, start
	cqo
	idiv	rsi	# tmp96
	lea	eax, [rdx+rbp]	# tmp93
	pop	rdx
	pop	rbx
	pop	rbp
	ret	
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
	endbr64	
	push	r13
	push	r12
	lea	r12, .LC0[rip]	# tmp105
# double getNumber(int argc, char* argv[]) {
	push	rbp
	mov	ebp, edi	# argc, tmp138
	push	rbx
	mov	rbx, rsi	# argv, tmp139
	sub	rsp, 24
# if (!strcmp(argv[1], "-f")) {
	mov	rdi, QWORD PTR 8[rsi]
	mov	rsi, r12	#, tmp105
	mov	rax, QWORD PTR fs:40	# tmp147
	mov	QWORD PTR 8[rsp], rax	# D.4656, tmp147
	xor	eax, eax	# tmp147
	call	strcmp@PLT
	test	eax, eax	# tmp140
	jne	.L12
# if (argc > 2) {
	cmp	ebp, 2	# argc
# file = fopen("in.txt", "r");
	lea	rdi, .LC2[rip]	# tmp110
	lea	rsi, .LC1[rip]	# tmp136
	jle	.L14
# file = fopen(argv[2], "r");
	mov	rdi, QWORD PTR 16[rbx]
.L14:
	call	fopen@PLT	#
	mov	rbp, rax	# file, tmp142
# if (file == NULL) {
	test	rax, rax	# file
	jne	.L4
	lea	rdi, .LC3[rip]	# tmp112
	call	puts@PLT
# exit(1);
	mov	edi, 1
	call	exit@PLT
.L12:
# FILE* file = NULL;
	xor	ebp, ebp	# file
.L4:
	mov	r13, QWORD PTR 8[rbx]
	lea	rsi, .LC5[rip]	# tmp115
# double number = 0;
	mov	QWORD PTR [rsp], 0x000000000	# number
# if (!strcmp(argv[1], "-r")) {
	mov	rdi, r13	#, _4
	call	strcmp@PLT
	test	eax, eax	# tmp143
	jne	.L7	#,
# return rand() % (end + 1 - start) + start;
	call	rand@PLT
	mov	ecx, 132	# tmp120
	cdqe
	cqo
	idiv	rcx	# tmp120
	sub	edx, 78	# tmp121
# number = (double)getRandomNumber(-78, 53);
	cvtsi2sd	xmm0, edx	# tmp122, tmp121
	movsd	QWORD PTR [rsp], xmm0	# number, tmp122
	jmp	.L8
.L7:
# else if (!strcmp(argv[1], "-f")) {
	mov	rsi, r12	#, tmp105
	mov	rdi, r13	#, _4
	call	strcmp@PLT
	mov	rdx, rsp	# tmp137
	test	eax, eax	# tmp145
	jne	.L9	#,
# fscanf(file, "%lf\n", &number);
	lea	rsi, .LC6[rip]	# tmp126
	mov	rdi, rbp	#, file
	call	__isoc99_fscanf@PLT
	jmp	.L8
.L9:
# scanf("%lf", &number);
	mov	rsi, rdx	#, tmp137
	lea	rdi, .LC7[rip]	# tmp128
	xor	eax, eax
	call	__isoc99_scanf@PLT
.L8:
# if (!strcmp(argv[1], "-f")) {
	mov	rdi, QWORD PTR 8[rbx]
	mov	rsi, r12	#, tmp105
	call	strcmp@PLT
	test	eax, eax	# tmp146
	jne	.L10
# fclose(file);
	mov	rdi, rbp	#, file
	call	fclose@PLT
.L10:
# return number;
	movsd	xmm0, QWORD PTR [rsp]	# <retval>, number
	mov	rax, QWORD PTR 8[rsp]	# tmp148, D.4656
	sub	rax, QWORD PTR fs:40
	je	.L11
	call	__stack_chk_fail@PLT
.L11:
	add	rsp, 24
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	ret	
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
	endbr64	
	push	r14
	movq	r14, xmm0	# total, tmp116
	push	r13
	mov	r13d, edi	# argc, tmp117
	push	r12
	lea	r12, .LC8[rip]	# tmp96,
# void outputNumber(double total, int argc, char* argv[]) {
	push	rbp
# FILE* file = NULL;
	xor	ebp, ebp	# file
	push	rbx
# if (strcmp(argv[1], "-c")) {
	mov	rdi, QWORD PTR 8[rsi]
	mov	rbx, rsi	# argv, tmp118
	mov	rsi, r12	#, tmp96
	call	strcmp@PLT	#
	test	eax, eax	# tmp119
	je	.L17
# if (argc == 4) {
	cmp	r13d, 4	# argc
	lea	rdi, .LC10[rip]	# tmp101
	lea	rsi, .LC9[rip]	# tmp115
	jne	.L25
#  file = fopen(argv[3], "w");
	mov	rdi, QWORD PTR 24[rbx]
.L25:
# file = fopen("out.txt", "w");
	call	fopen@PLT
	mov	rbp, rax	# file, tmp121
.L17:
# if (!strcmp(argv[1], "-c")) {
	mov	rdi, QWORD PTR 8[rbx]
	mov	rsi, r12	#, tmp96
	call	strcmp@PLT
	movq	xmm0, r14	#, total
	lea	rdx, .LC11[rip]	# tmp114
	test	eax, eax	# tmp122
	jne	.L19
# printf
	mov	rsi, rdx	#, tmp114
	mov	edi, 1
	mov	al, 1
	call	__printf_chk@PLT
	jmp	.L20
.L19:
# fprintf
	mov	esi, 1
	mov	rdi, rbp	#, file
	mov	al, 1
	call	__fprintf_chk@PLT
.L20:
# if (strcmp(argv[1], "-c")) {
	mov	rdi, QWORD PTR 8[rbx]
	mov	rsi, r12	#, tmp96
	call	strcmp@PLT
	test	eax, eax	# tmp123
	je	.L16
	pop	rbx
# fclose(file);
	mov	rdi, rbp	#, file
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	jmp	fclose@PLT
.L16:
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	ret	
	.size	outputNumber, .-outputNumber
	.globl	factorial
	.type	factorial, @function
factorial:
	endbr64	
	movsd	xmm1, QWORD PTR .LC12[rip]	# i,
# double factorial(double num) {
	movaps	xmm2, xmm0	# num, tmp88
	movaps	xmm3, xmm1	# i, i
# double res = 1;
	movaps	xmm0, xmm1	# <retval>, i
.L27:
# for (double i = 1; i <= num; i++) {
	comisd	xmm2, xmm1	# num, i
	jb	.L29
# res *= i;
	mulsd	xmm0, xmm1	# <retval>, i
	addsd	xmm1, xmm3	# i, i
	jmp	.L27
.L29:
	ret
	.size	factorial, .-factorial
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC12:
	.long	0
	.long	1072693248
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
