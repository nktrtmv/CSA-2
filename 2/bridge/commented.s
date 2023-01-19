# не комментирую вызовы функций внутри if/else if и сами if/else if, комментировал в первом дз, понимание как работает показано там
# комментарии к вызову strcmp такие же как в первом дз, код идентичен, поэтому в этот раз без комментариев, знания эти уже показаны
	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	getRandomNumber
	.type	getRandomNumber, @function
# описание функции получения рандомного числа на заданном диапазоне
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
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
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
.LFB7:
    # следующие 9 строк - это объявление мейна и старт начала программы + преамбула
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 112
	mov	DWORD PTR -100[rbp], edi
	mov	QWORD PTR -112[rbp], rsi
	# следующие 4 строки это вызов функции srand и передача параметров в нее
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	cmp	DWORD PTR -100[rbp], 1
	jle	.L4
	cmp	DWORD PTR -100[rbp], 4
	jle	.L5
.L4:
    # следующие три строки это передача параметров и вызов функции printf
	lea	rax, .LC0[rip]
	mov	rdi, rax
	call	puts@PLT
	# следующие две строки это выход из функции main и возврат значения 0
	mov	eax, 0
	jmp	.L6
.L5:
    # следующая строка отвечает за инициализацию указателя file и присвоения ему null
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
	# следующие 8 строк это вызов функции открытия файла и присвоение результата возврата функции в указатель file
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
    # следующие 6 строк это вызов функции открытия файла и присвоение результата возврата функции в указатель file
	lea	rax, .LC2[rip]
	mov	rsi, rax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax
.L9:
    # следующие 7 строк - это передача параметров и вызов функции printf, а также возврат нуля из мейна
	cmp	QWORD PTR -24[rbp], 0
	jne	.L7
	lea	rax, .LC4[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	jmp	.L6
.L7:
    # объявление переменной n и присвоение в нее 0
	mov	DWORD PTR -84[rbp], 0
	# следующие три строки - это объявление указателя char (переменная string) и присвоение указателю возврату malloc
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
	# следующие 4 строки это вызов функции getRandomNumber и передача в нее параметров
	mov	esi, 10000
	mov	edi, 1
	call	getRandomNumber
	mov	DWORD PTR -84[rbp], eax
	# объявление переменной i и присвоение ей значения 0
	mov	DWORD PTR -80[rbp], 0
	jmp	.L11
.L14:
    # следующие 3 строки это вызов функции getRandomNumber и передача в нее параметров
	mov	esi, 16
	mov	edi, 0
	call	getRandomNumber
	cmp	eax, 13
	jle	.L12
	# строки до jmp .L13 - это присовение ' ' в память по указателю (string[i])
	mov	eax, DWORD PTR -80[rbp]
	# копирование в регистр
	movsx	rdx, eax
	mov	rax, QWORD PTR -16[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 32
	jmp	.L13
.L12:
    # первые четыре строки это передача параметров и вызов функции getRandomNumber
	mov	esi, 122
	mov	edi, 97
	call	getRandomNumber
	mov	edx, eax
	# следующие пять строк - это присовение значения возвращенного из функции getRandomNumber в память по указателю (string[i])
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
    # следующие 6 строк - это присвоение в ch значения возвращенного функциями tolower(fgetc())
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	fgetc@PLT
	mov	edi, eax
	call	tolower@PLT
	mov	DWORD PTR -40[rbp], eax
	# следующие 8 строк это передача значения ch в память по указателю
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
	# следующие 6 строк - это передача значения '\0' в память по указателю
	mov	eax, DWORD PTR -84[rbp]
	cdqe
	lea	rdx, -1[rax]
	mov	rax, QWORD PTR -16[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	jmp	.L15
.L16:
    # полностью повторяет .L17 за исключением, что функция fgetc вызывается с другим параметром
	mov	rax, QWORD PTR stdin[rip]
	mov	rdi, rax
	call	fgetc@PLT
	mov	edi, eax
	call	tolower@PLT
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
    # вызов функции clock
	call	clock@PLT
	# присвоение в переменную значения из регистров (результат возврата функции clock)
	mov	DWORD PTR -36[rbp], eax
	# следующие 5 строк это вызов функции malloc и передача туда параметра, а далее присвоение результата в память (в указатель char*)
	mov	eax, DWORD PTR -84[rbp]
	cdqe
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR -8[rbp], rax
	# int len = 0
	mov	DWORD PTR -76[rbp], 0
	# int end = -1
	mov	DWORD PTR -68[rbp], -1
	# i = 0
	mov	DWORD PTR -64[rbp], 0
	jmp	.L18
.L29:
    # cледующие две строки это объявление int temp = i
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
	# следующие две строки это start = i
	mov	eax, DWORD PTR -64[rbp]
	mov	DWORD PTR -72[rbp], eax
.L20:
	mov	eax, DWORD PTR -84[rbp]
	sub	eax, 1
	cmp	DWORD PTR -64[rbp], eax
	jl	.L38
	add	DWORD PTR -60[rbp], 1
.L19:
    # следующие две строки: end = temp
	mov	eax, DWORD PTR -60[rbp]
	mov	DWORD PTR -68[rbp], eax
	# int isPal = 1
	mov	DWORD PTR -56[rbp], 1
	# следующие 3 строки: int k = start - end
	mov	eax, DWORD PTR -68[rbp]
	sub	eax, DWORD PTR -72[rbp]
	mov	DWORD PTR -28[rbp], eax
	# int j = 0
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
	# isPal = 0
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
    # .L28 кроме последней строки - это total[len++] = string[j] (работа с памятью и регистрами)
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
	# строки до конца блока - это total[len++] = ' ';
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
	# следующие пять строк - это total[len] = '\0';
	mov	eax, DWORD PTR -76[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -8[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	# следующие две строки - это вызов clock() и присвоение результата в объявленную переменную end_time
	call	clock@PLT
	mov	DWORD PTR -32[rbp], eax
	# следующие 16 строк это три вызова printf() с передачей параметров в эту функцию
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
	# все, что до блока .L30 - это закрытие файла и присвоение ему null, если он был открыт
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
# блоки .L30 и .L32 это открытие файла если нужно
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
# блоки .L31 и .L33 это вывод строки (char*) методом puts в файл или stdin
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
# код до блока .L37 это закрытие файлов, если это нужно
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
    # возврат нуля из функции main
	mov	eax, 0
.L6:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
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
