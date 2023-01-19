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
	mov	DWORD PTR -4[rbp], edi
	mov	DWORD PTR -8[rbp], esi
	call	rand@PLT
	mov	edx, DWORD PTR -8[rbp]
	add	edx, 1
	mov	ecx, edx
	sub	ecx, DWORD PTR -4[rbp]
	cdq
	idiv	ecx
	mov	eax, DWORD PTR -4[rbp]
	add	eax, edx
	leave
	ret
	.size	getRandomNumber, .-getRandomNumber
	.section	.rodata
	.align 8
.LC0:
	.string	"\320\222\321\213 \320\276\320\261\321\217\320\267\320\260\320\275\321\213 \320\262\320\262\320\265\321\201\321\202\320\270 1,2 \320\270\320\273\320\270 3 \320\260\321\200\320\263\321\203\320\274\320\265\320\275\321\202\320\260 \320\272\320\276\320\274\320\260\320\275\320\264\320\275\320\276\320\271 \321\201\321\202\321\200\320\276\320\272\320\270:\n\320\237\320\265\321\200\320\262\321\213\320\271 - -f/-r/-c.\n\320\222\321\202\320\276\321\200\320\276\320\271 \320\270 \321\202\321\200\320\265\321\202\320\270\320\271 \320\276\320\277\321\206\320\270\320\276\320\275\320\260\320\273\321\214\320\275\321\213, \321\215\321\202\320\276 \320\260\320\261\321\201\320\276\320\273\321\216\321\202\320\275\321\213\320\271 \320\277\321\203\321\202\321\214 \320\272 \321\204\320\260\320\271\320\273\320\260\320\274 \320\262\320\262\320\276\320\264\320\260 \320\270 \320\262\321\213\320\262\320\276\320\264\320\260."
.LC1:
	.string	"-f"
.LC2:
	.string	"r"
.LC3:
	.string	"string_in.txt"
	.align 8
.LC4:
	.string	"\320\236\321\210\320\270\320\261\320\272\320\260! \320\244\320\260\320\271\320\273 \320\262\320\262\320\276\320\264\320\260 \320\275\320\265 \320\274\320\276\320\266\320\265\321\202 \320\261\321\213\321\202\321\214 \320\276\321\202\320\272\321\200\321\213\321\202.\n\320\244\320\260\320\271\320\273 \320\264\320\276\320\273\320\266\320\265\320\275 \321\201\321\203\321\211\320\265\321\201\321\202\320\262\320\276\320\262\320\260\321\202\321\214 \320\270 \320\261\321\213\321\202\321\214 \321\204\320\276\321\200\320\274\320\260\321\202\320\260 txt."
.LC5:
	.string	"-r"
	.align 8
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
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 112
	mov	DWORD PTR -100[rbp], edi
	mov	QWORD PTR -112[rbp], rsi
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	cmp	DWORD PTR -100[rbp], 1
	jle	.L4
	cmp	DWORD PTR -100[rbp], 4
	jle	.L5
.L4:
	lea	rax, .LC0[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	jmp	.L6
.L5:
	mov	QWORD PTR -24[rbp], 0
	mov	rax, QWORD PTR -112[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC1[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L7
	cmp	DWORD PTR -100[rbp], 2
	jle	.L8
	mov	rax, QWORD PTR -112[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC2[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax
	jmp	.L9
.L8:
	lea	rax, .LC2[rip]
	mov	rsi, rax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax
.L9:
	cmp	QWORD PTR -24[rbp], 0
	jne	.L7
	lea	rax, .LC4[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	jmp	.L6
.L7:
	mov	DWORD PTR -84[rbp], 0
	mov	edi, 65536
	call	malloc@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -112[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC5[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L10
	mov	esi, 10000
	mov	edi, 1
	call	getRandomNumber
	mov	DWORD PTR -84[rbp], eax
	mov	DWORD PTR -80[rbp], 0
	jmp	.L11
.L14:
	mov	esi, 16
	mov	edi, 0
	call	getRandomNumber
	cmp	eax, 13
	jle	.L12
	mov	eax, DWORD PTR -80[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -16[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 32
	jmp	.L13
.L12:
	mov	esi, 122
	mov	edi, 97
	call	getRandomNumber
	mov	edx, eax
	mov	eax, DWORD PTR -80[rbp]
	movsx	rcx, eax
	mov	rax, QWORD PTR -16[rbp]
	add	rax, rcx
	mov	BYTE PTR [rax], dl
.L13:
	add	DWORD PTR -80[rbp], 1
.L11:
	mov	eax, DWORD PTR -80[rbp]
	cmp	eax, DWORD PTR -84[rbp]
	jl	.L14
	jmp	.L15
.L10:
	mov	rax, QWORD PTR -112[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC1[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L16
.L17:
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	fgetc@PLT
	mov	DWORD PTR -40[rbp], eax
	mov	eax, DWORD PTR -84[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR -84[rbp], edx
	movsx	rdx, eax
	mov	rax, QWORD PTR -16[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR -40[rbp]
	mov	BYTE PTR [rax], dl
	cmp	DWORD PTR -40[rbp], -1
	jne	.L17
	mov	eax, DWORD PTR -84[rbp]
	cdqe
	lea	rdx, -1[rax]
	mov	rax, QWORD PTR -16[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	jmp	.L15
.L16:
	mov	rax, QWORD PTR stdin[rip]
	mov	rdi, rax
	call	fgetc@PLT
	mov	DWORD PTR -44[rbp], eax
	mov	eax, DWORD PTR -84[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR -84[rbp], edx
	movsx	rdx, eax
	mov	rax, QWORD PTR -16[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR -44[rbp]
	mov	BYTE PTR [rax], dl
	cmp	DWORD PTR -44[rbp], -1
	jne	.L16
	mov	eax, DWORD PTR -84[rbp]
	cdqe
	lea	rdx, -1[rax]
	mov	rax, QWORD PTR -16[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
.L15:
	call	clock@PLT
	mov	DWORD PTR -36[rbp], eax
	mov	eax, DWORD PTR -84[rbp]
	cdqe
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	DWORD PTR -76[rbp], 0
	mov	DWORD PTR -68[rbp], -1
	mov	DWORD PTR -64[rbp], 0
	jmp	.L18
.L29:
	mov	eax, DWORD PTR -64[rbp]
	mov	DWORD PTR -60[rbp], eax
	mov	eax, DWORD PTR -64[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -16[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 96
	jle	.L19
	mov	eax, DWORD PTR -64[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -16[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 122
	jg	.L19
	mov	eax, DWORD PTR -68[rbp]
	add	eax, 1
	cmp	DWORD PTR -64[rbp], eax
	jne	.L20
	mov	eax, DWORD PTR -64[rbp]
	mov	DWORD PTR -72[rbp], eax
.L20:
	mov	eax, DWORD PTR -84[rbp]
	sub	eax, 1
	cmp	DWORD PTR -64[rbp], eax
	jl	.L38
	add	DWORD PTR -60[rbp], 1
.L19:
	mov	eax, DWORD PTR -60[rbp]
	mov	DWORD PTR -68[rbp], eax
	mov	DWORD PTR -56[rbp], 1
	mov	eax, DWORD PTR -68[rbp]
	sub	eax, DWORD PTR -72[rbp]
	mov	DWORD PTR -28[rbp], eax
	mov	DWORD PTR -52[rbp], 0
	jmp	.L23
.L26:
	mov	edx, DWORD PTR -72[rbp]
	mov	eax, DWORD PTR -52[rbp]
	add	eax, edx
	movsx	rdx, eax
	mov	rax, QWORD PTR -16[rbp]
	add	rax, rdx
	movzx	edx, BYTE PTR [rax]
	mov	eax, DWORD PTR -68[rbp]
	sub	eax, DWORD PTR -52[rbp]
	cdqe
	lea	rcx, -1[rax]
	mov	rax, QWORD PTR -16[rbp]
	add	rax, rcx
	movzx	eax, BYTE PTR [rax]
	cmp	dl, al
	je	.L24
	mov	DWORD PTR -56[rbp], 0
	jmp	.L25
.L24:
	add	DWORD PTR -52[rbp], 1
.L23:
	mov	eax, DWORD PTR -28[rbp]
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	cmp	DWORD PTR -52[rbp], eax
	jl	.L26
.L25:
	cmp	DWORD PTR -56[rbp], 1
	jne	.L22
	mov	eax, DWORD PTR -72[rbp]
	mov	DWORD PTR -48[rbp], eax
	jmp	.L27
.L28:
	mov	eax, DWORD PTR -48[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -16[rbp]
	lea	rcx, [rdx+rax]
	mov	eax, DWORD PTR -76[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR -76[rbp], edx
	movsx	rdx, eax
	mov	rax, QWORD PTR -8[rbp]
	add	rdx, rax
	movzx	eax, BYTE PTR [rcx]
	mov	BYTE PTR [rdx], al
	add	DWORD PTR -48[rbp], 1
.L27:
	mov	eax, DWORD PTR -48[rbp]
	cmp	eax, DWORD PTR -68[rbp]
	jl	.L28
	mov	eax, DWORD PTR -76[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR -76[rbp], edx
	movsx	rdx, eax
	mov	rax, QWORD PTR -8[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 32
	jmp	.L22
.L38:
	nop
.L22:
	add	DWORD PTR -64[rbp], 1
.L18:
	mov	eax, DWORD PTR -64[rbp]
	cmp	eax, DWORD PTR -84[rbp]
	jl	.L29
	mov	eax, DWORD PTR -76[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -8[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	call	clock@PLT
	mov	DWORD PTR -32[rbp], eax
	lea	rax, .LC6[rip]
	mov	rsi, rax
	lea	rax, .LC7[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR -32[rbp]
	sub	eax, DWORD PTR -36[rbp]
	mov	esi, eax
	lea	rax, .LC8[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	lea	rax, .LC9[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	rax, QWORD PTR -112[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC1[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L30
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	QWORD PTR -24[rbp], 0
.L30:
	mov	rax, QWORD PTR -112[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC10[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	je	.L31
	cmp	DWORD PTR -100[rbp], 4
	jne	.L32
	mov	rax, QWORD PTR -112[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC11[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax
	jmp	.L31
.L32:
	lea	rax, .LC11[rip]
	mov	rsi, rax
	lea	rax, .LC12[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax
.L31:
	mov	rax, QWORD PTR -112[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC10[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L33
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	puts@PLT
	jmp	.L34
.L33:
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	fputs@PLT
.L34:
	mov	rax, QWORD PTR -112[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC10[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	je	.L35
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	fclose@PLT
.L35:
	cmp	QWORD PTR -8[rbp], 0
	je	.L36
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	free@PLT
.L36:
	cmp	QWORD PTR -16[rbp], 0
	je	.L37
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	free@PLT
.L37:
	mov	eax, 0
.L6:
	leave
	ret
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
