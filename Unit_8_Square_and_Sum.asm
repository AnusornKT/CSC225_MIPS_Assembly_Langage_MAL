# Unit 8 Exercise
# The Square and The Sum of Squares
# Programming: Anusorn KT
# CSC225 Computer Architecture/Assembly Language
# November 23, 2020
.text
main:	
	# display the program name:
	jal firstProgram_displayProgramName
	
	jal PrintNewLine
	
	# Square Subprogram:
	jal square
	
	jal PrintNewLine
	
	# display a message in main:
	jal display_helloFromMain
	
	jal PrintNewLine
	
	jal PrintNewLine
	
	# display the result of the sum of squares:
	jal display_sumOfSquares
	
	# the result stored in a register $v1:
	li $v0, 1
	addi $a0, $v1, 0
	syscall

	# call the Exit subprogram to exit:
	jal Exit
	

################# Functions #################
# Display a program name:
firstProgram_displayProgramName:	
	li $v0, 4
	la $a0, programName
	syscall
	jr $ra
	
# The first subprogram: "square"	
square:
	# Saving the hex value of the $ra on the stack
	addi $sp, $sp, -4	# save space on the stack (push)
	sw $ra, 0($sp)		# save $ra
	
	jal display_helloInsideSubprogramSquare
	
	jal PrintNewLine
	jal PrintNewLine
	
	jal display_firstInt
	
	jal PrintNewLine
	
	jal display_secondInt
	
	jal PrintNewLine
	
	jal display_thirdInteger
	
	jal PrintNewLine
	jal PrintNewLine
	
	######## Square the first interger And Display the result ########
	li $v0, 4
	la $a0, sqaureTheFirstInteger
	syscall
	
	
	li $v0, 1
	lw $a0, firstInteger
	syscall 
	
	li $v0, 4
	la $a0, is
	syscall
	
	# 2^2
	lw $t0, firstInteger
	mul $t1, $t0, $t0
	li $v0, 1
	
	add $a0, $zero, $t1
	syscall
	###################################################################
	
	# 3^3
	lw $t2, secondtInteger
	mul $t3, $t2, $t2
	li $v0, 1
	
	# 4^4
	lw $t4, thirdInteger
	mul $t5, $t4, $t4
	li $v0, 1
	
	
	# Recheck: 3^3
	# PS: remove the comment below this lines will show the result of 3^3
	#add $a0, $zero, $t3
	#syscall
	
	# Recheck: 4^4
	# PS: remove the comment below this lines will show the result of 4^4
	#add $a0, $zero, $t5
	#syscall
	
	jal PrintNewLine
	
	# jump and link to the function sumOfSquare (subprogram)
	# in order to add the sum of squares from three integers:
	jal sumOfSquares
	
	
	# Jump back to the main by specifying the given hex value:
	lw $ra, 0($sp)		# restore $ra
	addi $sp, $sp, 4	# return the space on the stack (pop)
	jr $ra

# The Second subprogram: "square"	
sumOfSquares:
	
	# Add 4 ($t1) and 9 ($t3) together. And then
	# store the value in a register $t6
	add $t6, $t1, $t3
	
	# Add 13 ($t6) and 16 ($t5). Then store the value 29
	# in a register $v1
	add $v1, $t5, $t6
	
	
	jr $ra
	
# display a message in the main program:	
display_helloFromMain:
	li $v0, 4
	la $a0, helloFromMain
	syscall
	jr $ra

# display a message in the subprogram (square):
display_helloInsideSubprogramSquare:
	li $v0, 4
	la $a0, helloInsideSubprogram
	syscall
	jr $ra

# display a message after we calculate the sum of squares
display_sumOfSquares:
 	li $v0, 4
	la $a0, theSumResult
	syscall
	jr $ra

# display what the first integer is
display_firstInt:
	li $v0, 4
	la $a0, firstInt
	syscall
	
	li $v0, 1
	lw $a0, firstInteger
	syscall
	
	jr $ra

# display what the second integer is
display_secondInt:
	li $v0, 4
	la $a0, secondInt
	syscall
	
	li $v0, 1
	lw $a0, secondtInteger
	syscall
	
	jr $ra

# display what the third integer is
display_thirdInteger:
	li $v0, 4
	la $a0, thirdInt
	syscall
	
	li $v0, 1
	lw $a0, thirdInteger
	syscall
	
	jr $ra


######### Define the program data #########
.data
	####  The Square and The Sum of Squares ####
	programName: .asciiz "-- The Square and The Sum of Squares ---"
	
	helloInsideSubprogram: .asciiz "We just jumped into the first subprogram called square."
	helloFromMain: .asciiz "Hello! Welcome back to the main again!"
	
	sqaureTheFirstInteger: .asciiz "We're still in the square subprogram. And the square of "
	
	firstInt: .asciiz "The first integer is "
	secondInt: .asciiz "The second integer is "
	thirdInt: .asciiz "The third integer is "
	
	theSumResult: "The sum of squares (three integers) is: "

	is: .asciiz " is "

	firstInteger: .word 2
	secondtInteger: .word 3
	thirdInteger: .word 4
	
	
################ Utils.asm ################	
.include "utils.asm"
