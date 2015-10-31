#The purpose of this assignment is to investigate how loops and IF statements are implemented at the assembly language level

.code32
LC0:
  .ascii "%d\12\0"
  .text
  .global _main
_main:
  pushl %ebp				#
  movl %esp, %ebp			#
  andl $-16, %esp			#
  subl $32, %esp
  movl 12(%ebp), %eax
  addl $4, %eax
  movl (%eax), %eax
  movl %eax, (%esp)
  call _atoi
  movl %eax, 24(%esp)
  cmpl $4, 24(%esp)
  je L2
  cmpl $6, 24(%esp)
  jle L3
  cmpl $9, 24(%esp)
  jg L3
L2:
  movl 24(%esp), %eax
  addl $20, %eax
  movl %eax, 28(%esp)
  jmp L4
L3:
  cmpl $0, 24(%esp)
  jne L5
  movl $44, 28(%esp)
  jmp L4
L5:
  cmpl $-1, 24(%esp)
  jne L6
  movl $-44, 28(%esp)
  jmp L4
L6:
  movl $99, 28(%esp)
L4:
  movl 28(%esp), %eax
  movl %eax, 4(%esp)
  movl $LC0, (%esp)
  call _printf
  movl $0, %eax
  leave
  ret

