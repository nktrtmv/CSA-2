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
	mov	ebp, edi
	push	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	mov	ebx, esi
	sub	rsp, 8
	.cfi_def_cfa_offset 32
	call	rand@PLT
	lea	esi, 1[rbx]
	add	rsp, 8
	.cfi_def_cfa_offset 24
	sub	esi, ebp
	cdq
	pop	rbx
	.cfi_def_cfa_offset 16
	idiv	esi
	lea	eax, [rdx+rbp]
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE51:
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
.LFB52:
	.cfi_startproc
	endbr64
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	mov	ebx, edi
	sub	rsp, 72
	.cfi_def_cfa_offset 128
	mov	DWORD PTR 52[rsp], edi
	xor	edi, edi
	mov	QWORD PTR 8[rsp], rsi
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	lea	eax, -2[rbx]
	cmp	eax, 2
	ja	.L77
	mov	rbx, QWORD PTR 8[rsp]
	mov	rax, QWORD PTR 8[rbx]
	cmp	BYTE PTR [rax], 45
	je	.L78
.L52:
	mov	QWORD PTR 40[rsp], 0
.L8:
	mov	edi, 65536
	call	malloc@PLT
	mov	r14, rax
	mov	rax, QWORD PTR 8[rsp]
	mov	rdi, QWORD PTR 8[rax]
	cmp	BYTE PTR [rdi], 45
	jne	.L12
	cmp	BYTE PTR 1[rdi], 114
	jne	.L12
	movzx	ecx, BYTE PTR 2[rdi]
	test	ecx, ecx
	mov	DWORD PTR 16[rsp], ecx
	jne	.L12
	call	rand@PLT
	mov	esi, 10000
	mov	ecx, DWORD PTR 16[rsp]
	cdq
	idiv	esi
	lea	r12d, 1[rdx]
	test	r12d, r12d
	jle	.L13
	mov	edx, edx
	mov	rbp, r14
	lea	rbx, 1[r14+rdx]
	.p2align 4,,10
	.p2align 3
.L17:
	call	rand@PLT
	movsx	rdx, eax
	mov	ecx, eax
	imul	rdx, rdx, 2021161081
	sar	ecx, 31
	sar	rdx, 35
	sub	edx, ecx
	mov	ecx, edx
	sal	ecx, 4
	add	edx, ecx
	sub	eax, edx
	cmp	eax, 13
	jle	.L79
	mov	BYTE PTR 0[rbp], 32
	add	rbp, 1
	cmp	rbp, rbx
	jne	.L17
	jmp	.L16
.L78:
	cmp	BYTE PTR 1[rax], 102
	jne	.L52
	cmp	BYTE PTR 2[rax], 0
	jne	.L52
	cmp	DWORD PTR 52[rsp], 2
	je	.L9
	mov	rdi, QWORD PTR 16[rbx]
	lea	rsi, .LC1[rip]
	call	fopen@PLT
	mov	QWORD PTR 40[rsp], rax
.L10:
	cmp	QWORD PTR 40[rsp], 0
	jne	.L8
	lea	rdi, .LC3[rip]
	call	puts@PLT
	jmp	.L62
.L12:
	lea	rsi, .LC4[rip]
	mov	ebx, 1
	mov	rbp, r14
	call	strcmp@PLT
	sub	ebx, r14d
	test	eax, eax
	jne	.L20
	mov	r13, QWORD PTR 40[rsp]
	.p2align 4,,10
	.p2align 3
.L19:
	mov	rdi, r13
	lea	r12d, [rbx+rbp]
	call	fgetc@PLT
	mov	rdx, rbp
	add	rbp, 1
	mov	BYTE PTR -1[rbp], al
	cmp	eax, -1
	jne	.L19
.L76:
	mov	BYTE PTR [rdx], 0
.L16:
	call	clock@PLT
	movsx	rdi, r12d
	mov	DWORD PTR 56[rsp], eax
	call	malloc@PLT
	mov	r9d, r12d
	mov	r13, rax
	sub	r9d, 1
	jne	.L50
	xor	ebp, ebp
	mov	eax, -1
	xor	ecx, ecx
.L37:
	mov	QWORD PTR 16[rsp], r13
	mov	r13d, r12d
	mov	r12d, ecx
	.p2align 4,,10
	.p2align 3
.L28:
	movzx	ecx, BYTE PTR [r14+rbp]
	lea	ebx, 1[rbp]
	lea	edx, -97[rcx]
	cmp	dl, 25
	ja	.L53
	add	eax, 1
	cmp	eax, ebp
	je	.L80
.L21:
	mov	eax, ebx
	sub	eax, r15d
	mov	edi, eax
	shr	edi, 31
	add	edi, eax
	sar	edi
	cmp	eax, 1
	jle	.L22
	movsx	rax, ebx
	movsx	rsi, r15d
	lea	rdx, -1[r14+rax]
	add	rsi, r14
	xor	eax, eax
	jmp	.L27
	.p2align 4,,10
	.p2align 3
.L81:
	add	rax, 1
	sub	rdx, 1
	cmp	edi, eax
	jle	.L22
.L27:
	movzx	ecx, BYTE PTR [rsi+rax]
	cmp	BYTE PTR [rdx], cl
	je	.L81
	mov	eax, ebx
.L25:
	add	rbp, 1
	cmp	r13d, ebp
	jg	.L28
	mov	r13, QWORD PTR 16[rsp]
	movsx	rcx, r12d
.L51:
	mov	BYTE PTR 0[r13+rcx], 0
	call	clock@PLT
	lea	rdx, .LC5[rip]
	mov	edi, 1
	lea	rsi, .LC6[rip]
	mov	rbx, rax
	xor	eax, eax
	call	__printf_chk@PLT
	mov	edx, ebx
	lea	rsi, .LC7[rip]
	xor	eax, eax
	sub	edx, DWORD PTR 56[rsp]
	mov	edi, 1
	call	__printf_chk@PLT
	lea	rdi, .LC8[rip]
	call	puts@PLT
	mov	rbx, QWORD PTR 8[rsp]
	mov	rax, QWORD PTR 8[rbx]
	cmp	BYTE PTR [rax], 45
	jne	.L39
	cmp	BYTE PTR 1[rax], 102
	je	.L82
.L39:
	cmp	BYTE PTR [rax], 45
	jne	.L58
	cmp	BYTE PTR 1[rax], 99
	je	.L83
.L58:
	cmp	DWORD PTR 52[rsp], 4
	je	.L84
	lea	rsi, .LC9[rip]
	lea	rdi, .LC10[rip]
	call	fopen@PLT
	mov	QWORD PTR 40[rsp], rax
.L43:
	mov	rax, QWORD PTR 8[rsp]
	lea	rsi, .LC11[rip]
	mov	rdi, QWORD PTR 8[rax]
	call	strcmp@PLT
	test	eax, eax
	je	.L41
	mov	rsi, QWORD PTR 40[rsp]
	mov	rdi, r13
	call	fputs@PLT
.L45:
	mov	rax, QWORD PTR 8[rsp]
	mov	rax, QWORD PTR 8[rax]
	cmp	BYTE PTR [rax], 45
	je	.L85
.L48:
	mov	rdi, QWORD PTR 40[rsp]
	call	fclose@PLT
	test	r13, r13
	je	.L46
.L49:
	mov	rdi, r13
	call	free@PLT
.L46:
	test	r14, r14
	je	.L62
	mov	rdi, r14
	call	free@PLT
.L62:
	add	rsp, 72
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xor	eax, eax
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L20:
	.cfi_restore_state
	mov	rdi, QWORD PTR stdin[rip]
	lea	r12d, [rbx+rbp]
	call	fgetc@PLT
	mov	rdx, rbp
	add	rbp, 1
	mov	BYTE PTR -1[rbp], al
	cmp	eax, -1
	jne	.L20
	jmp	.L76
	.p2align 4,,10
	.p2align 3
.L80:
	mov	r15d, eax
.L22:
	cmp	ebx, r15d
	jle	.L26
	lea	edx, -1[rbx]
	movsx	rsi, r15d
	movsx	rdi, r12d
	add	r12d, ebx
	sub	edx, r15d
	add	rdi, QWORD PTR 16[rsp]
	add	rsi, r14
	sub	r12d, r15d
	add	rdx, 1
	call	memcpy@PLT
.L26:
	mov	rcx, QWORD PTR 16[rsp]
	movsx	rax, r12d
	add	r12d, 1
	mov	BYTE PTR [rcx+rax], 32
	mov	eax, ebx
	jmp	.L25
	.p2align 4,,10
	.p2align 3
.L53:
	mov	ebx, ebp
	jmp	.L21
	.p2align 4,,10
	.p2align 3
.L50:
	cmp	r12d, r9d
	mov	DWORD PTR 60[rsp], r12d
	mov	eax, -1
	lea	r8, -1[r14]
	cmovle	r9d, r12d
	xor	ecx, ecx
	mov	r12, r13
	xor	ebx, ebx
	mov	r13d, ecx
	jmp	.L36
	.p2align 4,,10
	.p2align 3
.L87:
	lea	edx, 1[rax]
	cmp	edx, ebx
	cmove	r15d, edx
.L32:
	add	rbx, 1
	cmp	r9d, ebx
	jle	.L86
.L36:
	movzx	esi, BYTE PTR [r14+rbx]
	mov	r11d, ebx
	mov	ebp, ebx
	lea	ecx, 1[rbx]
	lea	edx, -97[rsi]
	cmp	dl, 25
	jbe	.L87
	mov	eax, ebx
	sub	eax, r15d
	mov	edi, eax
	shr	edi, 31
	add	edi, eax
	sar	edi
	cmp	eax, 1
	jle	.L33
	movsx	rsi, r15d
	lea	rdx, [r8+rbx]
	xor	eax, eax
	add	rsi, r14
	jmp	.L34
	.p2align 4,,10
	.p2align 3
.L88:
	add	rax, 1
	sub	rdx, 1
	cmp	edi, eax
	jle	.L33
.L34:
	movzx	r10d, BYTE PTR [rdx]
	cmp	BYTE PTR [rsi+rax], r10b
	je	.L88
	add	rbx, 1
	mov	eax, ebp
	cmp	r9d, ebx
	jg	.L36
.L86:
	movsx	rbp, ecx
	movsx	rcx, r13d
	mov	r13, r12
	mov	r12d, DWORD PTR 60[rsp]
	cmp	r12d, ebp
	jg	.L37
	jmp	.L51
	.p2align 4,,10
	.p2align 3
.L33:
	cmp	r15d, ebx
	jge	.L35
	sub	r11d, r15d
	movsx	rdi, r13d
	movsx	rsi, r15d
	mov	DWORD PTR 48[rsp], ecx
	lea	edx, -1[r11]
	add	rdi, r12
	add	rsi, r14
	mov	QWORD PTR 32[rsp], r8
	add	rdx, 1
	mov	DWORD PTR 28[rsp], r9d
	mov	DWORD PTR 16[rsp], r11d
	call	memcpy@PLT
	mov	r11d, DWORD PTR 16[rsp]
	mov	ecx, DWORD PTR 48[rsp]
	mov	r8, QWORD PTR 32[rsp]
	mov	r9d, DWORD PTR 28[rsp]
	add	r13d, r11d
.L35:
	movsx	rax, r13d
	add	r13d, 1
	mov	BYTE PTR [r12+rax], 32
	mov	eax, ebp
	jmp	.L32
.L85:
	cmp	BYTE PTR 1[rax], 99
	jne	.L48
	cmp	BYTE PTR 2[rax], 0
	je	.L49
	jmp	.L48
.L83:
	cmp	BYTE PTR 2[rax], 0
	jne	.L58
.L41:
	mov	rdi, r13
	call	puts@PLT
	jmp	.L45
.L77:
	lea	rdi, .LC0[rip]
	call	puts@PLT
	jmp	.L62
.L82:
	cmp	BYTE PTR 2[rax], 0
	jne	.L39
	mov	rdi, QWORD PTR 40[rsp]
	call	fclose@PLT
	mov	rax, QWORD PTR 8[rbx]
	mov	QWORD PTR 40[rsp], 0
	jmp	.L39
	.p2align 4,,10
	.p2align 3
.L79:
	call	rand@PLT
	add	rbp, 1
	movsx	rdx, eax
	mov	ecx, eax
	imul	rdx, rdx, 1321528399
	sar	ecx, 31
	sar	rdx, 35
	sub	edx, ecx
	imul	edx, edx, 26
	sub	eax, edx
	add	eax, 97
	mov	BYTE PTR -1[rbp], al
	cmp	rbx, rbp
	jne	.L17
	jmp	.L16
.L9:
	lea	rsi, .LC1[rip]
	lea	rdi, .LC2[rip]
	call	fopen@PLT
	mov	QWORD PTR 40[rsp], rax
	jmp	.L10
.L84:
	mov	rax, QWORD PTR 8[rsp]
	lea	rsi, .LC9[rip]
	mov	rdi, QWORD PTR 24[rax]
	call	fopen@PLT
	mov	QWORD PTR 40[rsp], rax
	jmp	.L43
.L13:
	mov	DWORD PTR 16[rsp], ecx
	call	clock@PLT
	movsx	rdi, r12d
	mov	DWORD PTR 56[rsp], eax
	call	malloc@PLT
	movsx	rcx, DWORD PTR 16[rsp]
	mov	r13, rax
	jmp	.L51
	.cfi_endproc
.LFE52:
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
