	.file	"A1.c"
	.text
	.globl	tob
	.type	tob, @function
tob:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L5:
	movl	-20(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L3
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	$1, (%rax)
	jmp	.L4
.L3:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	$0, (%rax)
.L4:
	movl	-20(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -20(%rbp)
	addl	$1, -4(%rbp)
.L2:
	cmpl	$0, -20(%rbp)
	jg	.L5
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	tob, .-tob
	.globl	pp
	.type	pp, @function
pp:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movl	%edi, -116(%rbp)
	movl	%esi, -120(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$1, -108(%rbp)
	movl	-116(%rbp), %eax
	movl	%eax, -104(%rbp)
	leaq	-96(%rbp), %rdx
	movl	-120(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	tob
	movl	%eax, -100(%rbp)
	movl	$0, -112(%rbp)
	jmp	.L8
.L10:
	movl	-112(%rbp), %eax
	cltq
	movl	-96(%rbp,%rax,4), %eax
	cmpl	$1, %eax
	jne	.L9
	movl	-108(%rbp), %eax
	imull	-104(%rbp), %eax
	movl	%eax, -108(%rbp)
.L9:
	movl	-104(%rbp), %eax
	imull	%eax, %eax
	movl	%eax, -104(%rbp)
	addl	$1, -112(%rbp)
.L8:
	movl	-112(%rbp), %eax
	cmpl	-100(%rbp), %eax
	jl	.L10
	movl	-108(%rbp), %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L12
	call	__stack_chk_fail@PLT
.L12:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	pp, .-pp
	.section	.rodata
	.align 8
.LC0:
	.string	"Please input \" a \" and \" b \" in order "
.LC1:
	.string	"%d %d"
.LC2:
	.string	"pp(%d, %d) = %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	leaq	-12(%rbp), %rdx
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-12(%rbp), %edx
	movl	-16(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	pp
	movl	%eax, %ecx
	movl	-12(%rbp), %edx
	movl	-16(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L15
	call	__stack_chk_fail@PLT
.L15:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
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
