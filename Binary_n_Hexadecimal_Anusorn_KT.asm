
# Unit 5 Exercises (2)
# Binary and Hexadecimal
# Programming: Anusorn KT
# CSC225 Computer Architecture/Assembly Language
# Oct 20, 2020

.text
main:
	
	
	################ Display Program's Name ###########
	jal displayProgramName
	
	jal PrintNewLine
	
	jal displayPrompte
	
	# Get the user's integer:
	li $v0, 5
	syscall
	# Store the number to $s0:
	move $s0, $v0
		
	############### Binary# #############:
	jal displayBinary
	jal getBinaryValue
	
	jal PrintNewLine
	
	############ hexadecimal ############:
	jal displayHexadecimal
	jal getHexadecinalValue
	
	
	# Binary 874: 1101101010
	# Hex: 036A
	
	# call the Exit subprogram to exit:
	jal Exit
	
	
	
################# Functions #################
	displayProgramName:
		li $v0, 4
		la $a0, programName
		syscall
		jr $ra
	
	displayPrompte:
		li $v0, 4
		la $a0, prompt
		syscall
		jr $ra
	
	displayBinary:
		li $v0, 4
		la $a0, printOutBinary
		syscall
		jr $ra
		
	displayHexadecimal:
		li $v0, 4
		la $a0, printOutHexadecimal
		syscall
		jr $ra
		
	
	
####### Define the program data #######
.data
	programName: .asciiz "-- Binarry and Hexadecimal ---"
	prompt: .asciiz "Please enter an integer: "
	# recheck: .asciiz "The number you entered is: "
	printOutBinary: .asciiz "Binary: "
	printOutHexadecimal: .asciiz "Hexadecimal: "

############## Utils.asm #############	
.include "utils.asm"
