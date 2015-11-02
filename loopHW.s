#Create a C program that mirrors the structures of this assembly program
#There are many ways to do this
LC0:
	.ascii "%d\12\0"
	.text
	.global _main
_main:
	pushl	%ebp
	movl	%esp,	%ebp
	andl	$-16,	%esp
	subl	$32,	%esp
	movl	12(%ebp),	%eax
	addl	$4,		%eax
	movl	(%eax),	%eax
	movl	%eax,	(%esp)
	call	_atoi
	movl	%eax,	24(%esp)
	movl	12(%ebp),	%eax
	addl	$8,	%eax
	movl	(%eax),	%eax
	movl	%eax,	(%esp)
	call	_atoi
	movl	%eax,	20(%esp)
	movl	%24(%esp),	%eax
	movl	%eax,	28(%esp)
	jmp	L2
L3:
	movl	28(%esp),	%eax
	movl	%eax,	4(%esp)
	movl	$LC0,	(%esp)
	call	_printf
	movl	28(%esp),	%eax
	addl	%eax,	%eax
	movl	%eax, 28(%esp)
L2:
	movl	28(%esp),	%eax
	cmpl	20(%esp),	%eax
	jle		L3
	movl	$0, %eax
	leave
	ret
