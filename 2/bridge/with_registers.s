	.file	"main.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	getRandomNumber
	.type	getRandomNumber, @function
getRandomNumber:
	endbr64	
	push	rbp
	mov	ebp, edi	# start, tmp95
	push	rbx
	mov	ebx, esi	# end, tmp96
	sub	rsp, 8
	call	rand@PLT
	lea	esi, 1[rbx]	# tmp90
	add	rsp, 8
	sub	esi, ebp	# tmp91, start
	cdq
	pop	rbx
	idiv	esi	# tmp91
	lea	eax, [rdx+rbp]	# tmp89
	pop	rbp
	ret	
	.size	getRandomNumber, .-getRandomNumber
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"\320\222\321\213 \320\276\320\261\321\217\320\267\320\260\320\275\321\213 \320\262\320\262\320\265\321\201\321\202\320\270 1,2 \320\270\320\273\320\270 3 \320\260\321\200\320\263\321\203\320\274\320\265\320\275\321\202\320\260 \320\272\320\276\320\274\320\260\320\275\320\264\320\275\320\276\320\271 \321\201\321\202\321\200\320\276\320\272\320\270:\n\320\237\320\265\321\200\320\262\321\213\320\271 - -f/-r/-c.\n\320\222\321\202\320\276\321\200\320\276\320\271 \320\270 \321\202\321\200\320\265\321\202\320\270\320\271 \320\276\320\277\321\206\320\270\320\276\320\275\320\260\320\273\321\214\320\275\321\213, \321\215\321\202\320\276 \320\260\320\261\321\201\320\276\320\273\321\216\321\202\320\275\321\213\320\271 \320\277\321\203\321\202\321\214 \320\272 \321\204\320\260\320\271\320\273\320\260\320\274 \320\262\320\262\320\276\320\264\320\260 \320\270 \320\262\321\213\320\262\320\276\320\264\320\260."
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"r"
.LC2:
	.string	"string_in.txt"
	.section	.rodata.str1.8
	.align 8
.LC3:
	.string	"\320\236\321\210\320\270\320\261\320\272\320\260! \320\244\320\260\320\271\320\273 \320\262\320\262\320\276\320\264\320\260 \320\275\320\265 \320\274\320\276\320\266\320\265\321\202 \320\261\321\213\321\202\321\214 \320\276\321\202\320\272\321\200\321\213\321\202.\n\320\244\320\260\320\271\320\273 \320\264\320\276\320\273\320\266\320\265\320\275 \321\201\321\203\321\211\320\265\321\201\321\202\320\262\320\276\320\262\320\260\321\202\321\214 \320\270 \320\261\321\213\321\202\321\214 \321\204\320\276\321\200\320\274\320\260\321\202\320\260 txt."
	.section	.rodata.str1.1
.LC4:
	.string	"-f"
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"\320\222\321\200\320\265\320\274\321\217 \320\262\321\213\320\277\320\276\320\273\320\275\320\265\320\275\320\270\321\217 \320\277\321\200\320\276\320\263\321\200\320\260\320\274\320\274\321\213: "
	.section	.rodata.str1.1
.LC6:
	.string	"%s"
.LC7:
	.string	"%d"
.LC8:
	.string	"\320\274\321\201"
.LC9:
	.string	"w"
.LC10:
	.string	"string_out.txt"
.LC11:
	.string	"-c"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
	endbr64	
	push	r15
	push	r14
	mov	r14d, edi	# argc, tmp307
	push	r13
	push	r12
	mov	r12, rsi	# argv, tmp308
	push	rbp
	push	rbx
	sub	rsp, 40
	mov	DWORD PTR 8[rsp], edi	# %sfp, argc
	xor	edi, edi
	call	time@PLT
	mov	edi, eax	# _1, tmp309
	call	srand@PLT
	lea	eax, -2[r14]	# tmp195
	cmp	eax, 2	# tmp195
	ja	.L62
	mov	rax, QWORD PTR 8[r12]
	cmp	BYTE PTR [rax], 45
	je	.L63
.L40:
	xor	r14d, r14d	# file
.L8:
	mov	edi, 65536
	call	malloc@PLT
	mov	rdi, QWORD PTR 8[r12]
	mov	rbp, rax	# string, tmp312
	cmp	BYTE PTR [rdi], 45
	jne	.L12
	cmp	BYTE PTR 1[rdi], 114
	jne	.L12
	movzx	r9d, BYTE PTR 2[rdi]
	test	r9d, r9d	# len
	mov	DWORD PTR [rsp], r9d	# %sfp, len
	jne	.L12
	call	rand@PLT
	mov	ecx, 10000	# tmp214
	mov	r9d, DWORD PTR [rsp]	# len, %sfp
	cdq
	idiv	ecx	# tmp214
	lea	r15d, 1[rdx]	# n
	test	r15d, r15d	# n
	jle	.L13
	mov	edx, edx	# _158, tmp212
	mov	DWORD PTR [rsp], ebx	# %sfp, start
	mov	rbx, rbp	# ivtmp.34, ivtmp.34
	lea	rax, 1[rbp+rdx]	# _30
	mov	r13, rax	# _30, _30
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L14:
	mov	BYTE PTR [rbx], dl
	add	rbx, 1	# ivtmp.34
	cmp	r13, rbx	# _30, ivtmp.34
	je	.L64
.L15:
	call	rand@PLT
	movsx	rdx, eax	# _160, _160
	mov	esi, eax	# tmp222, _160
	imul	rdx, rdx, 2021161081	# tmp219, _160
	sar	esi, 31	# tmp222
	sar	rdx, 35	# tmp221
	sub	edx, esi	# tmp217, tmp222
	mov	esi, edx	# tmp224, tmp217
	sal	esi, 4	# tmp224
	add	edx, esi	# tmp225, tmp224
	sub	eax, edx	# tmp226, tmp225
	mov	edx, 32	# _14
	cmp	eax, 13	# tmp226
	jg	.L14
	call	rand@PLT
	add	rbx, 1	# ivtmp.34
	movsx	rdx, eax	# _162, _162
	mov	esi, eax	# tmp232, _162
	imul	rdx, rdx, 1321528399	# tmp229, _162
	sar	esi, 31	# tmp232
	sar	rdx, 35	# tmp231
	sub	edx, esi	# tmp227, tmp232
	imul	edx, edx, 26	# tmp233, tmp227
	sub	eax, edx	# tmp234, tmp233
	lea	edx, 97[rax]	# _14
	mov	BYTE PTR -1[rbx], dl
	cmp	r13, rbx	# _30, ivtmp.34
	jne	.L15
.L64:
	mov	ebx, DWORD PTR [rsp]	# start, %sfp
	jmp	.L16
.L63:
	cmp	BYTE PTR 1[rax], 102
	jne	.L40
	cmp	BYTE PTR 2[rax], 0
	jne	.L40
	cmp	DWORD PTR 8[rsp], 2	# %sfp
	je	.L9
	mov	rdi, QWORD PTR 16[r12]
	lea	rsi, .LC1[rip]	# tmp202
	call	fopen@PLT
	mov	r14, rax	# file, tmp310
.L10:
	test	r14, r14	# file
	jne	.L8
	lea	rdi, .LC3[rip]	# tmp207
	call	puts@PLT
	jmp	.L48
.L12:
	lea	rsi, .LC4[rip]	# tmp237
	mov	r13, rbp	# ivtmp.39, string
	call	strcmp@PLT
	test	eax, eax	# tmp316
	mov	eax, 1	# tmp239
	jne	.L17
	sub	eax, ebp	# tmp239, string
	mov	r15d, eax	# tmp238, tmp239
	.p2align 4,,10
	.p2align 3
.L18:
	mov	rdi, r14	# file
	call	fgetc@PLT
	lea	edx, [r15+r13]	# n
	mov	rcx, r13	# _18, ivtmp.39
	add	r13, 1	# ivtmp.39
	mov	BYTE PTR -1[r13], al
	cmp	eax, -1	# ch
	jne	.L18
.L61:
	mov	BYTE PTR [rcx], 0	#* _25
	mov	r15d, edx	# n, n
.L16:
	call	clock@PLT
	movsx	rdi, r15d	# n, n
	mov	DWORD PTR 12[rsp], eax	# %sfp, tmp323
	call	malloc@PLT
	xor	ecx, ecx	# ivtmp.27
	xor	r9d, r9d	# len
	mov	QWORD PTR 16[rsp], r14	# %sfp, file
	mov	r13, rax	# total, tmp324
	mov	rax, rcx	# ivtmp.27, ivtmp.27
	mov	QWORD PTR 24[rsp], r12	# %sfp, argv
	lea	r11d, -1[r15]	# tmp305
	mov	ecx, r15d	# n, n
	mov	r12, r13	# total, total
	mov	r15d, ebx	# start, start
	mov	edx, -1	# end
	mov	r14d, r9d	# len, len
	mov	r13, rbp	# string, string
	mov	rbx, rax	# ivtmp.27, ivtmp.27
	jmp	.L26
	.p2align 4,,10
	.p2align 3
.L22:
	add	rbx, 1	# ivtmp.27
	cmp	ecx, ebx	# n, ivtmp.27
	jle	.L65
.L26:
	movzx	eax, BYTE PTR 0[r13+rbx]
	lea	ebp, 1[rbx]	# temp
	sub	eax, 97	# tmp243
	cmp	al, 25	# tmp243
	ja	.L42
	lea	eax, 1[rdx]	# tmp245
	cmp	eax, ebx	# tmp245, ivtmp.27
	cmove	r15d, ebx	# start,, start, ivtmp.27
	cmp	r11d, ebx	# tmp305, ivtmp.27
	jg	.L22
.L20:
	mov	eax, ebp	# k, temp
	sub	eax, r15d	# k, start
	mov	edi, eax	# tmp247, k
	shr	edi, 31	# tmp247
	add	edi, eax	# tmp248, k
	sar	edi	# tmp249
	cmp	eax, 1	# k
	jle	.L23
	movsx	rax, ebp	# temp, temp
	movsx	rsi, r15d	# start, start
	lea	rdx, -1[r13+rax]	# ivtmp.22
	add	rsi, r13	# tmp253, string
	xor	eax, eax	# ivtmp.19
	jmp	.L24
	.p2align 4,,10
	.p2align 3
.L66:
	add	rax, 1	# ivtmp.19
	sub	rdx, 1	# ivtmp.22
	cmp	edi, eax	# tmp249, ivtmp.19
	jle	.L23
.L24:
	movzx	r8d, BYTE PTR [rdx]
	cmp	BYTE PTR [rsi+rax], r8b
	je	.L66
	add	rbx, 1	# ivtmp.27
	mov	edx, ebp	# end, temp
	cmp	ecx, ebx	# n, ivtmp.27
	jg	.L26
.L65:
	movsx	r9, r14d	#, len
	mov	rbp, r13	# string, string
	mov	r14, QWORD PTR 16[rsp]	# file, %sfp
	mov	r13, r12	# total, total
	mov	r12, QWORD PTR 24[rsp]	# argv, %sfp
.L39:
	mov	BYTE PTR 0[r13+r9], 0	# *_56
	call	clock@PLT
	lea	rdx, .LC5[rip]	# tmp271
	mov	edi, 1
	lea	rsi, .LC6[rip]	# tmp272
	mov	rbx, rax	# _57, tmp319
	xor	eax, eax
	call	__printf_chk@PLT
	lea	rsi, .LC7[rip]	# tmp274
	xor	eax, eax
	mov	edx, ebx	# tmp273, _57
	mov	edi, 1	#
	sub	edx, DWORD PTR 12[rsp]	# tmp273, %sfp
	call	__printf_chk@PLT
	lea	rdi, .LC8[rip]	# tmp275
	call	puts@PLT
	mov	rax, QWORD PTR 8[r12]
	cmp	BYTE PTR [rax], 45
	jne	.L28
	cmp	BYTE PTR 1[rax], 102
	je	.L67
.L28:
	cmp	BYTE PTR [rax], 45
	jne	.L44
	cmp	BYTE PTR 1[rax], 99
	je	.L68
.L44:
	cmp	DWORD PTR 8[rsp], 4	# %sfp
	je	.L69
	lea	rsi, .LC9[rip]	# tmp287
	lea	rdi, .LC10[rip]	# tmp288
	call	fopen@PLT
	mov	r14, rax	# file, tmp321
.L32:
	mov	rdi, QWORD PTR 8[r12]
	lea	rsi, .LC11[rip]	# tmp293
	call	strcmp@PLT
	test	eax, eax	# tmp322
	je	.L30
	mov	rsi, r14	#, file
	mov	rdi, r13	#, total
	call	fputs@PLT
.L34:
	mov	rax, QWORD PTR 8[r12]
	cmp	BYTE PTR [rax], 45
	je	.L70
.L37:
	mov	rdi, r14	#, file
	call	fclose@PLT
	test	r13, r13	# total
	je	.L35
.L38:
	mov	rdi, r13	#, total
	call	free@PLT
.L35:
	test	rbp, rbp	# string
	je	.L48
	mov	rdi, rbp	#, string
	call	free@PLT
.L48:
	add	rsp, 40
	xor	eax, eax
	pop	rbx	#
	pop	rbp	#
	pop	r12	#
	pop	r13	#
	pop	r14	#
	pop	r15	#
	ret	
	.p2align 4,,10
	.p2align 3
.L23:
	cmp	r15d, ebp	# start, temp
	jge	.L25
	lea	edx, -1[rbp]	# tmp257
	movsx	rdi, r14d	# len, len
	movsx	rsi, r15d	# start, start
	mov	DWORD PTR 4[rsp], r11d	# %sfp, tmp305
	sub	edx, r15d	# tmp259, start
	add	rdi, r12	# tmp256, total
	add	rsi, r13	# tmp262, string
	mov	DWORD PTR [rsp], ecx	# %sfp, n
	add	rdx, 1	# tmp260
	call	memcpy@PLT
	lea	r9d, [r14+rbp]	# tmp268
	mov	r11d, DWORD PTR 4[rsp]	# tmp305, %sfp
	mov	ecx, DWORD PTR [rsp]	# n, %sfp
	sub	r9d, r15d	# tmp268, start
	mov	r14d, r9d	# len, tmp268
.L25:
	movsx	rax, r14d	# len, len
	mov	edx, ebp	# end, temp
	add	r14d, 1	# len
	mov	BYTE PTR [r12+rax], 32	# *_54
	jmp	.L22
	.p2align 4,,10
	.p2align 3
.L42:
	mov	ebp, ebx	# temp, ivtmp.27
	jmp	.L20
.L70:
	cmp	BYTE PTR 1[rax], 99
	jne	.L37
	cmp	BYTE PTR 2[rax], 0
	je	.L38
	jmp	.L37
.L68:
	cmp	BYTE PTR 2[rax], 0
	jne	.L44
.L30:
	mov	rdi, r13	#, total
	call	puts@PLT
	jmp	.L34
.L17:
	sub	eax, ebp	# tmp242, string
	mov	r15d, eax	# tmp241, tmp242
	.p2align 4,,10
	.p2align 3
.L19:
	mov	rdi, QWORD PTR stdin[rip]	#, stdin
	call	fgetc@PLT
	lea	edx, [r15+r13]	# n
	mov	rcx, r13	# _25, ivtmp.44
	add	r13, 1	# ivtmp.44
	mov	BYTE PTR -1[r13], al
	cmp	eax, -1	# ch
	jne	.L19
	jmp	.L61
.L62:
	lea	rdi, .LC0[rip]	# tmp196
	call	puts@PLT
	jmp	.L48
.L67:
	cmp	BYTE PTR 2[rax], 0
	jne	.L28
	mov	rdi, r14	#, file
	xor	r14d, r14d	# file
	call	fclose@PLT
	mov	rax, QWORD PTR 8[r12]
	jmp	.L28
.L9:
	lea	rsi, .LC1[rip]	# tmp204
	lea	rdi, .LC2[rip]	# tmp205
	call	fopen@PLT
	mov	r14, rax	# file, tmp311
	jmp	.L10
.L69:
	mov	rdi, QWORD PTR 24[r12]
	lea	rsi, .LC9[rip]	# tmp285
	call	fopen@PLT
	mov	r14, rax	# file, tmp320
	jmp	.L32
.L13:
	mov	DWORD PTR [rsp], r9d	# %sfp, len
	call	clock@PLT
	movsx	rdi, r15d	# n, n
	mov	DWORD PTR 12[rsp], eax	# %sfp, tmp325
	call	malloc@PLT
	movsx	r9, DWORD PTR [rsp]	#, %sfp
	mov	r13, rax	# total, tmp326
	jmp	.L39
	.size	main, .-main
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
