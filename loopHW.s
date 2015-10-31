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
	
