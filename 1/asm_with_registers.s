	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"r"
.LC1:
	.string	"array_in.txt"
.LC2:
	.string	"%d"
.LC3:
	.string	"w"
.LC4:
	.string	"array_out.txt"
.LC5:
	.string	"%d\t"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
	endbr64
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbp
	push	rbx
	mov	rbx, rsi
	sub	rsp, 56
	mov	rax, QWORD PTR 8[rsi]
	mov	DWORD PTR 44[rsp], edi
	cmp	BYTE PTR [rax], 45
	jne	.L35
	cmp	BYTE PTR 1[rax], 102
	je	.L49
.L35:
	xor	r13d, r13d
.L3:
	mov	rdi, QWORD PTR 16[rbx]
	mov	edx, 10
	xor	esi, esi
	call	strtol@PLT
	movsx	r12, eax
	mov	QWORD PTR 24[rsp], rax
	mov	r14, rax
	sal	r12, 2
	mov	rdi, r12
	call	malloc@PLT
	mov	rbp, rax
	test	r14d, r14d
	jle	.L6
	mov	r14, rax
	mov	rax, QWORD PTR 24[rsp]
	lea	rcx, 4[rbp]
	lea	r15, .LC2[rip]
	mov	QWORD PTR 32[rsp], rcx
	sub	eax, 1
	lea	rax, [rcx+rax*4]
	mov	QWORD PTR 8[rsp], rax
	jmp	.L13
	.p2align 4,,10
	.p2align 3
.L51:
	movzx	edx, BYTE PTR 1[rsi]
	sub	edx, 114
	jne	.L9
	movzx	edx, BYTE PTR 2[rsi]
	test	edx, edx
	jne	.L9
	call	rand@PLT
	mov	DWORD PTR 16[rsp], eax
	call	rand@PLT
	mov	edx, DWORD PTR 16[rsp]
	mov	esi, eax
	mov	eax, edx
	mov	edi, esi
	shr	eax, 31
	sar	edi, 31
	add	edx, eax
	and	edx, 1
	sub	edx, eax
	movsx	rax, esi
	imul	rax, rax, 274877907
	imul	edx, edx, -1000
	sar	rax, 38
	sub	eax, edi
	imul	eax, eax, 1000
	sub	esi, eax
	add	edx, esi
	mov	DWORD PTR [r14], edx
.L10:
	add	r14, 4
	cmp	r14, QWORD PTR 8[rsp]
	je	.L50
.L13:
	mov	rsi, QWORD PTR 8[rbx]
	movzx	eax, BYTE PTR [rsi]
	mov	ecx, eax
	sub	ecx, 45
	je	.L51
.L9:
	cmp	eax, 45
	jne	.L12
	cmp	BYTE PTR 1[rsi], 102
	jne	.L12
	cmp	BYTE PTR 2[rsi], 0
	jne	.L12
	mov	rdx, r14
	mov	rsi, r15
	mov	rdi, r13
	xor	eax, eax
	call	__isoc99_fscanf@PLT
	add	r14, 4
	cmp	r14, QWORD PTR 8[rsp]
	jne	.L13
.L50:
	cmp	DWORD PTR 24[rsp], 2
	jle	.L6
	mov	rax, QWORD PTR 24[rsp]
	mov	r15, QWORD PTR 32[rsp]
	xor	edi, edi
	mov	ecx, DWORD PTR 0[rbp]
	sub	eax, 3
	lea	rsi, 8[rbp+rax*4]
	mov	rax, r15
	.p2align 4,,10
	.p2align 3
.L16:
	mov	edx, DWORD PTR [rax]
	cmp	edx, ecx
	je	.L15
	cmp	edx, DWORD PTR -4[rbp+r12]
	je	.L15
	add	edi, 1
.L15:
	add	rax, 4
	cmp	rax, rsi
	jne	.L16
	movsx	rdi, edi
	mov	QWORD PTR 16[rsp], rsi
	sal	rdi, 2
	mov	DWORD PTR 8[rsp], ecx
	call	malloc@PLT
	mov	ecx, DWORD PTR 8[rsp]
	mov	rsi, QWORD PTR 16[rsp]
	xor	edx, edx
	mov	r14, rax
	.p2align 4,,10
	.p2align 3
.L19:
	mov	eax, DWORD PTR [r15]
	cmp	ecx, eax
	je	.L18
	cmp	eax, DWORD PTR -4[rbp+r12]
	je	.L18
	movsx	rdi, edx
	add	edx, 1
	mov	DWORD PTR [r14+rdi*4], eax
.L18:
	add	r15, 4
	cmp	rsi, r15
	jne	.L19
.L34:
	mov	rax, QWORD PTR 8[rbx]
	cmp	BYTE PTR [rax], 45
	jne	.L21
	cmp	BYTE PTR 1[rax], 102
	je	.L52
.L21:
	cmp	BYTE PTR [rax], 45
	jne	.L36
	cmp	BYTE PTR 1[rax], 99
	je	.L53
.L36:
	cmp	DWORD PTR 44[rsp], 5
	mov	DWORD PTR 8[rsp], edx
	je	.L54
	lea	rsi, .LC3[rip]
	lea	rdi, .LC4[rip]
	call	fopen@PLT
	mov	edx, DWORD PTR 8[rsp]
	mov	r13, rax
	mov	rax, QWORD PTR 8[rbx]
.L23:
	test	edx, edx
	je	.L33
	sub	edx, 1
	mov	r15, r14
	lea	r12, .LC5[rip]
	lea	rcx, 4[r14+rdx*4]
	mov	QWORD PTR 8[rsp], rcx
	jmp	.L32
	.p2align 4,,10
	.p2align 3
.L55:
	cmp	BYTE PTR 1[rax], 99
	jne	.L30
	cmp	BYTE PTR 2[rax], 0
	jne	.L30
	mov	edx, DWORD PTR [r15]
	mov	rsi, r12
	mov	edi, 1
	xor	eax, eax
	add	r15, 4
	call	__printf_chk@PLT
	mov	rax, QWORD PTR 8[rbx]
	cmp	QWORD PTR 8[rsp], r15
	je	.L33
.L32:
	cmp	BYTE PTR [rax], 45
	je	.L55
.L30:
	mov	ecx, DWORD PTR [r15]
	mov	rdx, r12
	mov	esi, 1
	mov	rdi, r13
	xor	eax, eax
	add	r15, 4
	call	__fprintf_chk@PLT
	mov	rax, QWORD PTR 8[rbx]
	cmp	QWORD PTR 8[rsp], r15
	jne	.L32
.L33:
	cmp	BYTE PTR [rax], 45
	je	.L56
.L27:
	mov	rdi, r13
	call	fclose@PLT
.L28:
	mov	rdi, r14
	call	free@PLT
	mov	rdi, rbp
	call	free@PLT
	add	rsp, 56
	xor	eax, eax
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	ret
	.p2align 4,,10
	.p2align 3
.L12:
	mov	rsi, r14
	mov	rdi, r15
	xor	eax, eax
	call	__isoc99_scanf@PLT
	jmp	.L10
.L53:
	cmp	BYTE PTR 2[rax], 0
	je	.L23
	jmp	.L36
.L52:
	cmp	BYTE PTR 2[rax], 0
	jne	.L21
	mov	rdi, r13
	mov	DWORD PTR 8[rsp], edx
	xor	r13d, r13d
	call	fclose@PLT
	mov	rax, QWORD PTR 8[rbx]
	mov	edx, DWORD PTR 8[rsp]
	jmp	.L21
.L49:
	cmp	BYTE PTR 2[rax], 0
	jne	.L35
	cmp	edi, 3
	jle	.L4
	mov	rdi, QWORD PTR 24[rsi]
	lea	rsi, .LC0[rip]
	call	fopen@PLT
	mov	r13, rax
	jmp	.L3
.L56:
	cmp	BYTE PTR 1[rax], 99
	jne	.L27
	cmp	BYTE PTR 2[rax], 0
	je	.L28
	jmp	.L27
.L4:
	lea	rsi, .LC0[rip]
	lea	rdi, .LC1[rip]
	call	fopen@PLT
	mov	r13, rax
	jmp	.L3
.L54:
	mov	rdi, QWORD PTR 32[rbx]
	lea	rsi, .LC3[rip]
	call	fopen@PLT
	mov	edx, DWORD PTR 8[rsp]
	mov	r13, rax
	mov	rax, QWORD PTR 8[rbx]
	jmp	.L23
.L6:
	xor	edi, edi
	call	malloc@PLT
	xor	edx, edx
	mov	r14, rax
	jmp	.L34
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
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
