# Unit 6 Exercises
# Accessing Memory
# Programming: Anusorn KT
# CSC225 Computer Architecture/Assembly Language
# Oct 26, 2020

.text
main:
	
	#################### Register Indirect ####################
	# Load constants a, b, and c into registers
	#lui $t0, 0x1001
	#lw $t5, 0($t0)

	#addi $t0, $t0, 4
	#lw $t6, 0($t0)
	
	#addi $t0, $t0, 4
	#lw $t7, 0($t0)
	
	
	##################### Register Offset #####################
	#lui $t0, 0x1001
	#lw $t5, 0($t0)
	#lw $t6, 4($t0)
	#lw $t7, 8($t0)
	
	
	lui $t0, 0x1001		
	lw $t0, 32($t0)		# Loading the address of the data we want to alter 
				# into the register $t0.
	
	li $v0, 4
	la $a0, result 		# it will print out ==> "Data in the register $t0 :  "
	syscall
	
	li $v0, 1		# Output the data of $t0 before loading 30 as a new data to label c
	move $a0, $t0
	syscall
	
	li $t0, 30		# load 30 to label c
		
	jal PrintNewLine
	
	li $v0, 4
	la $a0, result 		# it will print out ==> "Data in the register $t0 :  "
	syscall
	
	li $v0, 1		# Output the data of $t0 after loading 30 as a new data to label c
	move $a0, $t0		
	syscall
	
	# call the Exit subprogram to exit:
	jal Exit
	
####### Define the program data #######
.data
	a: .word 0
	b: .word 10
	   .space 24
	c: .word 20
	
result: .asciiz "Data in the register $t0 :  "
############## Utils.asm #############	
.include "utils.asm"
	