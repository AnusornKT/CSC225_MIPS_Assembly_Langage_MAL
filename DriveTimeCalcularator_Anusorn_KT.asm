
# Unit 5 Exercises (1)
# Time Travel Calculator with Supprogram
# Programming: Anusorn KT
# CSC225 Computer Architecture/Assembly Language
# Oct 20, 2020

.text
main:

	################ Display Program's Name ###########
	jal displayProgramName
	
	jal PrintNewLine
	
	###################### Distance ####################
	# Prompt a user to input the Distance:
	jal displayPromptForDistance
	
	# Read the distance save it in $t0:
	li $v0, 5
	syscall 
	move $t0, $v0
	
	######################## Speed ######################
	# Prompt a user to enter the speed:
	jal displayPromptForSpeed
	
	# Read the second interger ($v0, 5) and save it in $t1:
	li $v0, 5
	syscall 
	move $t1, $v0
	
	################# Print out the result ################
	jal displayResult
	
	# Divide 100 by 40
	div $t0, $t1
	
	# need this varible to covert the remainder to min(s):
	addi $t3, $zero, 60
	
	jal PrintNewLine
	
	li $v0, 4
	# la $a0, quotient
	la $a0, hours
	syscall
	
	li $v0, 1
	mflo $a0
	syscall
	
	jal PrintNewLine
	
	
	li $v0, 4
	# la $a0, remainder
	la $a0, minuates
	syscall
		
	# This part is for converting the remainder to time in min(s):
	mfhi $a0
	mul $t4, $a0, $t3
	div $s0, $t4, $t1
	li $v0, 1
	add $a0, $zero, $s0
	syscall

	# call the Exit subprogram to exit:
	jal Exit
	
	
	
################# Functions #################
	displayProgramName:
		li $v0, 4
		la $a0, programName
		syscall
		jr $ra
		
	displayPromptForDistance:
		li $v0, 4
		la $a0, prompt1
		syscall
		jr $ra
		
	displayPromptForSpeed:
		li $v0, 4
		la $a0, prompt2
		syscall
		jr $ra
		
	displayResult:
		li $v0, 4
		la $a0, result
		syscall
		jr $ra

####### Define the program data #######
.data
	programName: .asciiz "-- Drive Time Calculator ---"
	prompt1: .asciiz "Enter the distance: "
	prompt2: .asciiz "Enter the speed: "

	result: .asciiz "-- Your Drive Time Is --  "

	quotient: .asciiz "\n Register LO (Quotient): "
	remainder: .asciiz "\n Register HI (Remainder):"

	hours: .asciiz "	[] Hour(s): "
	minuates: .asciiz  "	[] Minute(s): "
	
############## Utils.asm #############	
.include "utils.asm"
