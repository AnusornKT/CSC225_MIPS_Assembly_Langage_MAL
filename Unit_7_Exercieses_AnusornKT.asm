# Unit 7 Exercises - Question #1
# Time Travel Calculator with Supprogram
# Programming: Anusorn KT
# CSC225 Computer Architecture/Assembly Language
# Oct 28, 2020
.text
main:	
	########## 1st Program : Can You Vote? ########## 
	jal firstProgram_displayProgramName
	
	jal PrintNewLine
	
	jal firstProgram_displayPrompt
	
	# Read the integer and save it in $10
	li $v0, 5
	syscall
	move $t1, $v0
	
	lw $t2, ageEligibilityToVote
	
	# Condition: If the condition is true, go to jal firstPogram_displayeResult and then jal Exit.
	#	     Otherwise, if it's not true, the program will jump into end_if: and executes all
	#	     instructions inside the block of code:
	sge $t0, $t1, $t2
	beqz $t0, end_if
	jal firstPogram_displayeResult
	jal Exit			

	end_if:
		li $v0, 4
		la $a0, inEligibleToVote
		syscall
	
		jal Exit
	
################# Functions #################
# First Program: Have you voted?
firstProgram_displayProgramName:	
	# display a program name:
	li $v0, 4
	la $a0, programName1
	syscall
	jr $ra
	
firstProgram_displayPrompt:
	# Prompt a user for his age:
	li $v0, 4
	la $a0, prompt1
	syscall
	jr $ra
	
firstPogram_displayeResult:
	li $v0, 4
	la $a0, eligibleToVote
	syscall
	jr $ra

######### Define the program data #########
.data
	#### 1st Program : Can You Vote? ####
	programName1: .asciiz "-- Can You Vote? ---"
	prompt1: .asciiz "How old are you? "
	eligibleToVote: .asciiz "Have you registed to vote? You know. You're eligible to vote."
	inEligibleToVote: .asciiz "You're not eligible to vote."
	
	ageEligibilityToVote: .word 18
	
################ Utils.asm ################	
.include "utils.asm"
