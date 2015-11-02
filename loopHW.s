#Create a C program that mirrors the structures of this assembly program
#There are many ways to do this
LC0:
	.ascii "%d\12\0"
	.text
	.global _main
_main:
	pushl	%ebp			#Set up the Stack Frame *Prologue*
	movl	%esp, %ebp		#Set up the Stack Frame
	andl	$-16, %esp		#Set up the Stack Frame
	subl	$32, %esp		#Set up the Stack Frame
	movl	12(%ebp), %eax		#Address of pointer to argv[0](the program name)
	addl	$4, %eax		#Address of pointer to the argv[1] of %eax
	movl	(%eax), %eax		#Pointer to argv[1]
	movl	%eax, (%esp)		#Copies argv[1] to depreference of esp (bottom of our stack frame %esp+32 or %ebp-32)
	call	_atoi			#Call _atoi grabs the char array at the address stored in (%esp), converts the ASCII string to an int, and returns the int in %eax
	movl	%eax, 24(%esp)		#Copies (n1) of argv[1] @ebp-4/@esp+28 (below old %ebp)
	movl	12(%ebp), %eax		#Address of pointer to the program name
	addl	$8, %eax		#Address of pointer to the argv[2] of %eax
	movl	(%eax), %eax		#Pointer to argv[2]
	movl	%eax, (%esp)		#Send argv[2] to depreference of esp (bottom of our stack frame %esp+32 or %ebp-32)
	call	_atoi			#call _atoi
	movl	%eax, 20(%esp)		#Copies (n2) of argv[2] @ebp-8/@esp+20 (below old %ebp)
	movl	%24(%esp), %eax		#Copies (n2) to %eax 
	movl	%eax, 28(%esp)		#Copies %eax (n2) to (n1) now at 28(%esp)/@(old ebp - 4) Overwrite (n1) with (n2) 
	jmp	L2			#Unconditional jump to L2
L3:
	movl	28(%esp),	%eax	#Copies (n2) to %eax
	movl	%eax,	4(%esp)		#Copies %eax to @%esp+4/@%ebp-28 (above argv[1]) 
	movl	$LC0,	(%esp)		#Copies the format string
	call	_printf			#Call printf to product output
	movl	28(%esp),	%eax	#Copies (n2) to %eax
	addl	%eax,	%eax		#Add %eax to %eax (n2 + n2)
	movl	%eax, 28(%esp)		#Copies the (n2 + n2) to @esp+28/@ebp-4
L2:
	movl	28(%esp),	%eax	#Copies (n2) to %eax
	cmpl	20(%esp),	%eax	#(n2 - n2)
	jle		L3		#Go to L3 if (n2 - n2 == 0) || (SF != OF)
	movl	$0, %eax		#Else then copies 0, to %eax 
	leave				#Reset %ebp & %esp to the (old ebp)
	ret				#Return at the begin
