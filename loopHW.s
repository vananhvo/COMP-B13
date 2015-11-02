#Create a C program that mirrors the structures of this assembly program
#There are many ways to do this
LC0:
	.ascii "%d\12\0"
	.text
	.global _main
_main:
	pushl	%ebp			#Set up the Stack Frame *Prologue*
	movl	%esp,	%ebp		#Set up the Stack Frame
	andl	$-16,	%esp		#Set up the Stack Frame
	subl	$32,	%esp		#Set up the Stack Frame
	movl	12(%ebp),	%eax	#Address of pointer to the program name
	addl	$4,		%eax	#Address of pointer to the argv[1] of %eax
	movl	(%eax),	%eax		#Pointer to argv[1]
	movl	%eax,	(%esp)		# Send argv[1] to depreference of esp (bottom of our stack frame %esp+32 or %ebp-32)
	call	_atoi			# call _atoi grabs the char array at the address stored in (%esp), converts the ASCII string to an int, and returns the int in %eax
	movl	%eax,	24(%esp)	# Copies (n1) of argv[1] @ebp-4/@esp+28 (below old %ebp)
	movl	12(%ebp),	%eax	# Address of pointer to the program name
	addl	$8,	%eax		# Address of pointer to the argv[2] of %eax
	movl	(%eax),	%eax		# Pointer to argv[2]
	movl	%eax,	(%esp)		# Send argv[2] to depreference of esp (bottom of our stack frame %esp+32 or %ebp-32)
	call	_atoi			# call _atoi
	movl	%eax,	20(%esp)	# Copies (n2) of argv[2] @ebp-8/@esp+24 (below old %ebp)
	movl	%24(%esp),	%eax	# Copies (n2) to %eax 
	movl	%eax,	28(%esp)	# Copies %eax (n2) to (n1) now at 28(%esp) n1 => n2
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
