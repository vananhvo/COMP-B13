#The purpose of this assignment is to investigate how loops and IF statements are implemented at the assembly language level

.code32
LC0:
  .ascii "%d\12\0"
  .text
  .global _main
_main:
  pushl %ebp			        # esp is now has the old ebp address
  movl %esp, %ebp		      # ebp is now pointing at the same place with ebp old address
  andl $-16, %esp		      # use -16 to align esp on the 16-bits system (+4 to move up/-4 to move down)
  subl $32, %esp	      	# subtract 32 from the current address of esp 
  movl 12(%ebp), %eax 	  # move ebp up 12 bits from the old ebp address, then dereferences ebp to grab the content of that place, and stores in register eax (-1)
  addl $4, %eax			      # adding $4 to &eax (NOT THE VALUE)
  movl (%eax), %eax		    # dereferences %eax (taking *-1*) copies that to &eax
  movl %eax, (%esp)		    # copies &eax *-1* to the dereferences of (%esp), which is at the bottom of our stack frame
  call _atoi			        # calling the function atoi_, which we will convert string "-1" to an integer "-1"
  movl %eax, 24(%esp)	    # move esp up 24 bits, then dereferences esp, and copies &eax *-1* to the value of 24(%esp)   
  cmpl $4, 24(%esp)		    # checks to see if (*-1* == 4?)
  je L2					          # Not TRUE AT ALLLLLL!!! FALSEEEEE! U suck! go to line #18 since the statement is false
  cmpl $6, 24(%esp)		    # checks to see if (*-1* <= 6?)
  jle L3				          # YAY! It is TRUE! GO TO L3!!!
  cmpl $9, 24(%esp)
  jg L3
L2:
  movl 24(%esp), %eax
  addl $20, %eax
  movl %eax, 28(%esp)
  jmp L4
L3:						           # HI! I'm L3
  cmpl $0, 24(%esp)		  # checks to see if (*-1* != 0?)
  jne L5				        # OFC! It is TRUE! We JUMP to L5!
  movl $44, 28(%esp)
  jmp L4
L5:					          	# Hi, nerds! I'm L5!
  cmpl $-1, 24(%esp)	  # checks to see if (*-1* != -1?)
  jne L6				        # NO! FALSE!!!!!!!!!! SUCKER!
  movl $-44, 28(%esp)	  # move esp up 28 bits and dereferences esp, then copies -44 to that place
  jmp L4			       	  # Move to L4!!!
L6:
  movl $99, 28(%esp)
L4:
  movl 28(%esp), %eax	  # copies the *-44* to eax! Now EAX has *-44*
  movl %eax, 4(%esp)	  # copies *-44* to the dereferences of esp after we move 4 bits up from esp	
  movl $LC0, (%esp)		  # copies the format string ("%d\n") to the value of dereferences of esp
  call _printf			    # call function printf, and we should print out our output: *-44*
  movl $0, %eax			    # make the return address 0
  leave					        # move ebp to where esp is pointing at and pop the ebp
  ret					          # return 0
