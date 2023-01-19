	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"-f"
.LC1:
	.string	"r"
.LC2:
	.string	"array_in.txt"
.LC3:
	.string	"-r"
.LC4:
	.string	"%d"
.LC5:
	.string	"-c"
.LC6:
	.string	"w"
.LC7:
	.string	"array_out.txt"
.LC8:
	.string	"%d\t"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 72
	.cfi_offset 3, -24
	mov	DWORD PTR -68[rbp], edi
	mov	QWORD PTR -80[rbp], rsi
	# Присвоение локальной переменной file (указатель на FILE) значения NULL
	mov	QWORD PTR -40[rbp], 0
	# Проверка(if) - равен ли аргумент командной строки строке "-f", если условие не выполняется - jump to .L2
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC0[rip]
	mov	rsi, rdx
	mov	rdi, rax
	# Предыдущие 5 строк передают фактические параметры в функцию и указывается связь между параметрами и регистрами
	# Вызов функции strcmp для сравнения строк
	call	strcmp@PLT
	test	eax, eax
	jne	.L2
	# Проверка(if) - больше ли аргументов командной строки чем 3, если условие не выполняется - jump to .L3
	cmp	DWORD PTR -68[rbp], 3
	jle	.L3
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 24
	# Присвоение указателю file объекта созданного вызовом функции fopen()
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC1[rip]
	mov	rsi, rdx
	mov	rdi, rax
	# Предыдущие 5 строк передают фактические параметры в функцию и указывается связь между параметрами и регистрами
	    # сам вызов fopen()
	call	fopen@PLT
	mov	QWORD PTR -40[rbp], rax
	jmp	.L2
.L3:
    # Присвоение указателю file объекта созданного вызовом функции fopen()
	lea	rax, .LC1[rip]
	mov	rsi, rax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	# Предыдущие 3 строки передают фактические параметры в функцию и указывается связь между параметрами и регистрами
	    # сам вызов fopen()
	call	fopen@PLT
	mov	QWORD PTR -40[rbp], rax
.L2:
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 16
	# Инициализация n
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	# Предыдущие 4 строки передают фактические параметры в функцию и указывается связь между параметрами и регистрами
	# Вызов функции atoi для приведения к int
	call	atoi@PLT
	# Выделение памяти malloc и инициализация int* a
	mov	DWORD PTR -44[rbp], eax
	mov	eax, DWORD PTR -44[rbp]
	cdqe
	sal	rax, 2
	mov	rdi, rax
	# Предыдущие 5 строк передают фактические параметры в функцию и указывается связь между параметрами и регистрами
	    # Вызов malloc
	call	malloc@PLT
	mov	QWORD PTR -32[rbp], rax
	# Инициализация итерационной переменной i
	mov	DWORD PTR -64[rbp], 0
	# Переход к проверке условия цикла
	jmp	.L4
.L8:
    # Первое условие в цикле - сравнение строк вызовом функции strcmp()
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC3[rip]
	mov	rsi, rdx
	mov	rdi, rax
	# Вызов функции strcmp()
	# Предыдущие 5 строк передают фактические параметры в функцию и указывается связь между параметрами и регистрами
	call	strcmp@PLT
	test	eax, eax
	# Если условие не выполняется - переход к следующей проверке (else if)
	jne	.L5
	# Много следующих строк - это подсчеты right side value которое будет записано в a[i]
	call	rand@PLT
	cdq
	shr	edx, 31
	add	eax, edx
	and	eax, 1
	sub	eax, edx
	imul	ebx, eax, -1000
	call	rand@PLT
	movsx	rdx, eax
	imul	rdx, rdx, 274877907
	shr	rdx, 32
	sar	edx, 6
	mov	ecx, eax
	sar	ecx, 31
	sub	edx, ecx
	imul	ecx, edx, 1000
	sub	eax, ecx
	mov	edx, eax
	mov	eax, DWORD PTR -64[rbp]
	cdqe
	lea	rcx, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rcx
	add	edx, ebx
	# Присвоение в a[i] расчитанного значения выше
	mov	DWORD PTR [rax], edx
	# Переход к блоку .L6 - инкремент итерационной переменной
	jmp	.L6
.L5:
    # Проверка второго условия (else if)
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC0[rip]
	mov	rsi, rdx
	mov	rdi, rax
	# Предыдущие 5 строк передают фактические параметры в функцию и указывается связь между параметрами и регистрами
	call	strcmp@PLT
	test	eax, eax
	# Если условие не выполняется - переход к (else)
	jne	.L7
	# Чтение значения из файла в a[i] по ссылке функцией fscanf()
	mov	eax, DWORD PTR -64[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp]
	add	rdx, rax
	mov	rax, QWORD PTR -40[rbp]
	lea	rcx, .LC4[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	# Предыдущие 10 строк передают фактические параметры в функцию и указывается связь между параметрами и регистрами
	call	__isoc99_fscanf@PLT
	# Переход к инкременту итерационной переменной
	jmp	.L6
.L7:
    # Чтение значения из консоли в a[i] по ссылке функцией scanf()
	mov	eax, DWORD PTR -64[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	mov	rsi, rax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	# Все строки блока передают фактические параметры в функцию и указывается связь между параметрами и регистрами
	call	__isoc99_scanf@PLT
.L6:
    # Инкремент итерационной переменной
	add	DWORD PTR -64[rbp], 1
.L4:
    # Проверка i < n, если i >= n идет переход к инициализации локальной переменной k и далее переход к новому циклу
	mov	eax, DWORD PTR -64[rbp]
	# Если i < n - jump to .L8 - переход к телу цикла
	cmp	eax, DWORD PTR -44[rbp]
	jl	.L8
	# Инициализация k и итерационной переменной i И переход к проверке условия следующего цикла
	mov	DWORD PTR -60[rbp], 0
	mov	DWORD PTR -56[rbp], 1
	# Переход в новый цикл
	jmp	.L9
.L11:
    # Проверка условия (if)
	mov	eax, DWORD PTR -56[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -32[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	edx, eax
	# Если хотя бы одно условие из && ложно - переход к следующей итерации
	je	.L10
	#
	mov	eax, DWORD PTR -56[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR [rax]
	mov	eax, DWORD PTR -44[rbp]
	cdqe
	sal	rax, 2
	lea	rcx, -4[rax]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rcx
	mov	eax, DWORD PTR [rax]
	cmp	edx, eax
	# Если хотя бы одно условие из && ложно - переход к следующей итерации
	je	.L10
	# Инцкремент итерационной перменной
	add	DWORD PTR -60[rbp], 1
.L10:
    # Инкремент итерационной переменной после итерации цикла
	add	DWORD PTR -56[rbp], 1
.L9:
	mov	eax, DWORD PTR -44[rbp]
	sub	eax, 1
	cmp	DWORD PTR -56[rbp], eax
	jl	.L11
	mov	eax, DWORD PTR -60[rbp]
	# Инцииализация int* b
	cdqe
	sal	rax, 2
	mov	rdi, rax
	# Выделение памяти функцией malloc
	# Предыдущие 4 строки передают фактические параметры в функцию и указывается связь между параметрами и регистрами
	call	malloc@PLT
	mov	QWORD PTR -24[rbp], rax
	# k = 0
	mov	DWORD PTR -60[rbp], 0
	# i = 0
	mov	DWORD PTR -52[rbp], 1
	jmp	.L12
.L14:
    # Долгая проверка условия уже внутри цикла (if) и если ложь - переход к инкременту i и новая итерация цикла
	mov	eax, DWORD PTR -52[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -32[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	edx, eax
	# Переход к инкременту i при невыполнении условий
	je	.L13
	mov	eax, DWORD PTR -52[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR [rax]
	mov	eax, DWORD PTR -44[rbp]
	cdqe
	sal	rax, 2
	lea	rcx, -4[rax]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rcx
	mov	eax, DWORD PTR [rax]
	cmp	edx, eax
	je	.L13
	mov	eax, DWORD PTR -52[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR -60[rbp]
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*4]
	mov	rdx, QWORD PTR -24[rbp]
	add	rdx, rcx
	mov	eax, DWORD PTR [rax]
	# Присвоение b[i] = a[i]
	mov	DWORD PTR [rdx], eax
	# Инкремент K (k++)
	add	DWORD PTR -60[rbp], 1
.L13:
    # Инкремент итерационной переменной i
	add	DWORD PTR -52[rbp], 1
.L12:
    # Если цикл заканчивается - переход дальше к двум (if)
	mov	eax, DWORD PTR -44[rbp]
	sub	eax, 1
	cmp	DWORD PTR -52[rbp], eax
	# Цикл - не закончился =Ю следующая итерация
	jl	.L14
	# Проверка условия внутри if, сравнение строк
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC0[rip]
	mov	rsi, rdx
	mov	rdi, rax
	# Вызов функции strcmp для сравнения строк
	# Предыдущие 6 строк передают фактические параметры в функцию и указывается связь между параметрами и регистрами
	call	strcmp@PLT
	test	eax, eax
	# Если условие ложно - переход к следующему (if)
	jne	.L15
	# Если условие оказалось истиной - закрытие файла вызовом функции fclose и присовение file = NULL
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	# Предыдущие 2 строки передают фактические параметры в функцию и указывается связь между параметрами и регистрами
	call	fclose@PLT
	mov	QWORD PTR -40[rbp], 0
.L15:
    # Проверка условия (сравнение строк вызовом функции strcmp), если ложно - переход к дальнейшему коду - циклу
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC5[rip]
	mov	rsi, rdx
	mov	rdi, rax
	# Предыдущие 6 строк передают фактические параметры в функцию и указывается связь между параметрами и регистрами
	call	strcmp@PLT
	test	eax, eax
	je	.L16
	cmp	DWORD PTR -68[rbp], 5
	# Если условие (if(argc == 5)) ложно - переход к блоку после (else)
	jne	.L17
	# Создание объекта FILE и помещение его по указателю в file функцией fopen()
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC6[rip]
	mov	rsi, rdx
	mov	rdi, rax
	# Предыдущие 6 строк передают фактические параметры в функцию и указывается связь между параметрами и регистрами
	call	fopen@PLT
	mov	QWORD PTR -40[rbp], rax
	# Если зашли в if - в else не заходим, поэтому переход дальше
	jmp	.L16
.L17:
    # Создание объекта FILE и помещение его по указателю в file функцией fopen()
	lea	rax, .LC6[rip]
	mov	rsi, rax
	lea	rax, .LC7[rip]
	mov	rdi, rax
	# Предыдущие 4 строки передают фактические параметры в функцию и указывается связь между параметрами и регистрами
	call	fopen@PLT
	mov	QWORD PTR -40[rbp], rax
.L16:
    # Инициализация переменной i = 0 и переход к проверке условия цикла
	mov	DWORD PTR -48[rbp], 0
	jmp	.L18
.L21:
    # Проверка первого условия.
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC5[rip]
	mov	rsi, rdx
	mov	rdi, rax
	# Предыдущие 6 строк передают фактические параметры в функцию и указывается связь между параметрами и регистрами
	call	strcmp@PLT
	test	eax, eax
	# Если условие ложно => переход к блоку .L19 (else)
	jne	.L19
	# Истина => вызов функции printf() для вывода числа в консоль
	mov	eax, DWORD PTR -48[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	mov	esi, eax
	lea	rax, .LC8[rip]
	mov	rdi, rax
	mov	eax, 0
	# Предыдущие 10 строк передают фактические параметры в функцию и указывается связь между параметрами и регистрами
	# Вызов функции printf() для вывода числа в консоль
	call	printf@PLT
	# Переход к слеюущей итерации цикла
	jmp	.L20
.L19:
    # Блок выполняет вывод числа в файл вызовом функции fprintf
	mov	eax, DWORD PTR -48[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -40[rbp]
	lea	rcx, .LC8[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	# Предыдущие 11 строк передают фактические параметры в функцию и указывается связь между параметрами и регистрами
	# Вызов функции fprintf() для вывода числа в файл
	call	fprintf@PLT
.L20:
    # i++
	add	DWORD PTR -48[rbp], 1
.L18:
    # Проверка условия цикла, если условие истинно - jump в блок .L21 то есть в тело цикла
	mov	eax, DWORD PTR -48[rbp]
	cmp	eax, DWORD PTR -60[rbp]
	# Переход в тело цикла
	jl	.L21
	# Проверка условия на равенство строк вызовом функции strcmp
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC5[rip]
	mov	rsi, rdx
	mov	rdi, rax
	# Вызов функции strcmp
	# Предыдущие 6 строк передают фактические параметры в функцию и указывается связь между параметрами и регистрами
	call	strcmp@PLT
	test	eax, eax
	# Если условие ложно - в тело if не заходим и перепрыгиваем дальше
	je	.L22
	# Вызов функции close для закрытия файла
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	# Предыдущие 2 строки передают фактические параметры в функцию и указывается связь между параметрами и регистрами
	call	fclose@PLT
.L22:
    # В этом блоке два раза вызывается функция free() для освобождение памяти a,b (массивы) и удаления поинтеров
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	# Предыдущие 2 строки передают фактические параметры в функцию и указывается связь между параметрами и регистрами
	call	free@PLT
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax
	call	free@PLT
	# return 0
	mov	eax, 0
	mov	rbx, QWORD PTR -8[rbp]
	leave # leave))))) 
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
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
