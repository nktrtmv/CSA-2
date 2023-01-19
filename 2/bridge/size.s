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
	mov	ebp, edi
	push	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	mov	ebx, esi
	push	rax
	.cfi_def_cfa_offset 32
	call	rand@PLT
	lea	esi, 1[rbx]
	sub	esi, ebp
	cdq
	idiv	esi
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
	.string	"\320\222\321\213 \320\276\320\261\321\217\320\267\320\260\320\275\321\213 \320\262\320\262\320\265\321\201\321\202\320\270 1,2 \320\270\320\273\320\270 3 \320\260\321\200\320\263\321\203\320\274\320\265\320\275\321\202\320\260 \320\272\320\276\320\274\320\260\320\275\320\264\320\275\320\276\320\271 \321\201\321\202\321\200\320\276\320\272\320\270:\n\320\237\320\265\321\200\320\262\321\213\320\271 - -f/-r/-c.\n\320\222\321\202\320\276\321\200\320\276\320\271 \320\270 \321\202\321\200\320\265\321\202\320\270\320\271 \320\276\320\277\321\206\320\270\320\276\320\275\320\260\320\273\321\214\320\275\321\213, \321\215\321\202\320\276 \320\260\320\261\321\201\320\276\320\273\321\216\321\202\320\275\321\213\320\271 \320\277\321\203\321\202\321\214 \320\272 \321\204\320\260\320\271\320\273\320\260\320\274 \320\262\320\262\320\276\320\264\320\260 \320\270 \320\262\321\213\320\262\320\276\320\264\320\260."
.LC1:
	.string	"-f"
.LC2:
	.string	"r"
.LC3:
	.string	"string_in.txt"
.LC4:
	.string	"\320\236\321\210\320\270\320\261\320\272\320\260! \320\244\320\260\320\271\320\273 \320\262\320\262\320\276\320\264\320\260 \320\275\320\265 \320\274\320\276\320\266\320\265\321\202 \320\261\321\213\321\202\321\214 \320\276\321\202\320\272\321\200\321\213\321\202.\n\320\244\320\260\320\271\320\273 \320\264\320\276\320\273\320\266\320\265\320\275 \321\201\321\203\321\211\320\265\321\201\321\202\320\262\320\276\320\262\320\260\321\202\321\214 \320\270 \320\261\321\213\321\202\321\214 \321\204\320\276\321\200\320\274\320\260\321\202\320\260 txt."
.LC5:
	.string	"-r"
.LC6:
	.string	"\320\222\321\200\320\265\320\274\321\217 \320\262\321\213\320\277\320\276\320\273\320\275\320\265\320\275\320\270\321\217 \320\277\321\200\320\276\320\263\321\200\320\260\320\274\320\274\321\213: "
.LC7:
	.string	"%s"
.LC8:
	.string	"%d"
.LC9:
	.string	"\320\274\321\201"
.LC10:
	.string	"-c"
.LC11:
	.string	"w"
.LC12:
	.string	"string_out.txt"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB37:
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
	mov	rbx, rsi
	sub	rsp, 40
	.cfi_def_cfa_offset 96
	mov	DWORD PTR 24[rsp], edi
	xor	edi, edi
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	mov	eax, DWORD PTR 24[rsp]
	lea	rdi, .LC0[rip]
	sub	eax, 2
	cmp	eax, 2
	ja	.L52
	lea	r14, .LC1[rip]
	mov	rdi, QWORD PTR 8[rbx]
	mov	rsi, r14
	call	strcmp@PLT
	test	eax, eax
	jne	.L31
	cmp	DWORD PTR 24[rsp], 2
	lea	rdi, .LC3[rip]
	lea	rsi, .LC2[rip]
	je	.L49
	mov	rdi, QWORD PTR 16[rbx]
.L49:
	call	fopen@PLT
	mov	rbp, rax
	test	rax, rax
	jne	.L6
	lea	rdi, .LC4[rip]
.L52:
	call	puts@PLT
	jmp	.L5
.L31:
	xor	ebp, ebp
.L6:
	mov	edi, 65536
	call	malloc@PLT
	mov	r15, QWORD PTR 8[rbx]
	lea	rsi, .LC5[rip]
	mov	r12, rax
	mov	rdi, r15
	call	strcmp@PLT
	test	eax, eax
	jne	.L9
	call	rand@PLT
	mov	ecx, 10000
	xor	r14d, r14d
	mov	r15d, 17
	cdq
	idiv	ecx
	lea	eax, 1[rdx]
	mov	DWORD PTR 12[rsp], eax
.L10:
	cmp	DWORD PTR 12[rsp], r14d
	jle	.L13
	call	rand@PLT
	cdq
	idiv	r15d
	mov	al, 32
	cmp	edx, 13
	jg	.L11
	call	rand@PLT
	mov	ecx, 26
	cdq
	idiv	ecx
	lea	eax, 97[rdx]
.L11:
	mov	BYTE PTR [r12+r14], al
	inc	r14
	jmp	.L10
.L9:
	mov	rsi, r14
	mov	rdi, r15
	mov	r14d, 1
	mov	r15, r12
	call	strcmp@PLT
	sub	r14d, r12d
	test	eax, eax
	jne	.L16
.L15:
	mov	rdi, rbp
	call	fgetc@PLT
	lea	ecx, [r14+r15]
	mov	rdx, r15
	inc	r15
	mov	BYTE PTR -1[r15], al
	inc	eax
	mov	DWORD PTR 12[rsp], ecx
	jne	.L15
	jmp	.L50
.L16:
	mov	rdi, QWORD PTR stdin[rip]
	call	fgetc@PLT
	lea	ecx, [r14+r15]
	mov	rdx, r15
	inc	r15
	mov	BYTE PTR -1[r15], al
	inc	eax
	mov	DWORD PTR 12[rsp], ecx
	jne	.L16
.L50:
	mov	BYTE PTR [rdx], 0
.L13:
	call	clock@PLT
	movsx	rdi, DWORD PTR 12[rsp]
	xor	r15d, r15d
	mov	QWORD PTR 16[rsp], rax
	call	malloc@PLT
	mov	ecx, DWORD PTR 12[rsp]
	xor	r9d, r9d
	mov	r14, rax
	or	eax, -1
	dec	ecx
	mov	DWORD PTR 28[rsp], ecx
.L17:
	mov	ecx, r9d
	mov	r8d, r9d
	cmp	DWORD PTR 12[rsp], r9d
	jle	.L54
	mov	dl, BYTE PTR [r12+r9]
	sub	edx, 97
	cmp	dl, 25
	ja	.L18
	lea	edx, 1[rax]
	cmp	edx, r8d
	cmove	r13d, r8d
	mov	r8d, eax
	cmp	DWORD PTR 28[rsp], ecx
	jg	.L20
	lea	r8d, 1[rcx]
.L18:
	mov	r11d, r8d
	mov	ecx, 2
	movsx	rsi, r8d
	sub	r11d, r13d
	add	rsi, r12
	mov	eax, r11d
	cdq
	idiv	ecx
	movsx	rcx, r13d
	xor	edx, edx
	add	rcx, r12
.L21:
	cmp	eax, edx
	jle	.L55
	mov	r10, rdx
	lea	rdi, 1[rdx]
	not	r10
	mov	r10b, BYTE PTR [rsi+r10]
	cmp	BYTE PTR [rcx+rdx], r10b
	jne	.L20
	mov	rdx, rdi
	jmp	.L21
.L55:
	mov	eax, r8d
	xor	ecx, ecx
	movsx	rdx, r15d
	movsx	rsi, r13d
	sub	eax, r13d
	cmp	r13d, r8d
	lea	r10, [r14+rdx]
	cmovg	rax, rcx
	mov	rdi, r10
	add	rsi, r12
	cmp	r13d, r8d
	mov	rcx, rax
	rep movsb
	cmovg	r11d, ecx
	add	rax, r14
	mov	BYTE PTR [rax+rdx], 32
	lea	r15d, 1[r15+r11]
.L20:
	inc	r9
	mov	eax, r8d
	jmp	.L17
.L54:
	movsx	r15, r15d
	mov	BYTE PTR [r14+r15], 0
	call	clock@PLT
	lea	rdx, .LC6[rip]
	mov	edi, 1
	lea	rsi, .LC7[rip]
	mov	r13, rax
	xor	eax, eax
	call	__printf_chk@PLT
	mov	edi, 1
	xor	eax, eax
	mov	edx, r13d
	lea	rsi, .LC8[rip]
	sub	edx, DWORD PTR 16[rsp]
	call	__printf_chk@PLT
	lea	rdi, .LC9[rip]
	call	puts@PLT
	mov	rdi, QWORD PTR 8[rbx]
	lea	rsi, .LC1[rip]
	call	strcmp@PLT
	test	eax, eax
	jne	.L24
	mov	rdi, rbp
	xor	ebp, ebp
	call	fclose@PLT
.L24:
	lea	r13, .LC10[rip]
	mov	rdi, QWORD PTR 8[rbx]
	mov	rsi, r13
	call	strcmp@PLT
	test	eax, eax
	je	.L25
	cmp	DWORD PTR 24[rsp], 4
	lea	rdi, .LC12[rip]
	lea	rsi, .LC11[rip]
	jne	.L51
	mov	rdi, QWORD PTR 24[rbx]
.L51:
	call	fopen@PLT
	mov	rbp, rax
.L25:
	mov	rdi, QWORD PTR 8[rbx]
	mov	rsi, r13
	call	strcmp@PLT
	test	eax, eax
	jne	.L27
	mov	rdi, r14
	call	puts@PLT
	jmp	.L28
.L27:
	mov	rsi, rbp
	mov	rdi, r14
	call	fputs@PLT
.L28:
	mov	rdi, QWORD PTR 8[rbx]
	mov	rsi, r13
	call	strcmp@PLT
	test	eax, eax
	je	.L29
	mov	rdi, rbp
	call	fclose@PLT
.L29:
	test	r14, r14
	je	.L30
	mov	rdi, r14
	call	free@PLT
.L30:
	test	r12, r12
	je	.L5
	mov	rdi, r12
	call	free@PLT
.L5:
	add	rsp, 40
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
	.cfi_endproc
.LFE37:
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
