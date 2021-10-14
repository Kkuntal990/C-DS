	.file	"A1_2.c"
	.text
	.comm	arr,400,32
	.globl	tob
	.type	tob, @function
tob:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L5:
	movq	-24(%rbp), %rax
	andl	$1, %eax
	testq	%rax, %rax
	je	.L3
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	arr(%rip), %rax
	movl	$1, (%rdx,%rax)
	jmp	.L4
.L3:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	arr(%rip), %rax
	movl	$0, (%rdx,%rax)
.L4:
	movq	-24(%rbp), %rax
	movq	%rax, %rdx
	shrq	$63, %rdx
	addq	%rdx, %rax
	sarq	%rax
	movq	%rax, -24(%rbp)
	addl	$1, -4(%rbp)
.L2:
	cmpq	$0, -24(%rbp)
	jg	.L5
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	tob, .-tob
	.globl	pp
	.type	pp, @function
pp:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$1, -12(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, -8(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	tob
	movl	%eax, -4(%rbp)
	movl	$0, -16(%rbp)
	jmp	.L8
.L10:
	movl	-16(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	arr(%rip), %rax
	movl	(%rdx,%rax), %eax
	cmpl	$1, %eax
	jne	.L9
	movl	-12(%rbp), %eax
	imull	-8(%rbp), %eax
	movl	%eax, -12(%rbp)
.L9:
	movl	-8(%rbp), %eax
	imull	%eax, %eax
	movl	%eax, -8(%rbp)
	addl	$1, -16(%rbp)
.L8:
	movl	-16(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jl	.L10
	movl	-12(%rbp), %eax
	cltq
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	pp, .-pp
	.section	.rodata
.LC0:
	.string	"pp(%d, %lld) = %lld\n"
.LC1:
	.string	"w"
	.align 8
.LC2:
	.string	"Assignment1/codes/complexity.dat"
.LC3:
	.string	"%d %ld \n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$4, -64(%rbp)
	movq	-64(%rbp), %rax
	movq	%rax, %rsi
	movl	$3, %edi
	call	pp
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rax, %rdx
	movl	$3, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC1(%rip), %rsi
	leaq	.LC2(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -56(%rbp)
	movl	$0, -72(%rbp)
	jmp	.L13
.L14:
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movl	-72(%rbp), %eax
	cltq
	movq	%rax, %rdi
	call	tob
	movl	%eax, -68(%rbp)
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rcx
	subq	%rax, %rcx
	movl	-72(%rbp), %edx
	movq	-56(%rbp), %rax
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	addl	$1, -72(%rbp)
.L13:
	cmpl	$999999, -72(%rbp)
	jle	.L14
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L16
	call	__stack_chk_fail@PLT
.L16:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
