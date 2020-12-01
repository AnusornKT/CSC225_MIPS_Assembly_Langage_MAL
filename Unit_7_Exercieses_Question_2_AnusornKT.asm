# Unit 7 Exercises - Question #2
# Guessing Mu Number (without a while or for loop)
# Programming: Anusorn KT
# CSC225 Computer Architecture/Assembly Language
# Oct 28, 2020
.text
main:
	########## 1st Program : Can You Vote? ##########
	jal firstProgram_displayProgramName

	jal PrintNewLine

	jal firstProgram_displayPrompt

	# Read the integer given by a user
	# and then save it in $10
	li $v0, 5
	syscall
	move $t1, $v0

	slti $t0, $t1, 7
	beqz $t0, else_if
	jal firstPogram_displayeResultTooLow
	jal Exit

	else_if:
		sgt $t0, $t1, 7
		beqz $t0, else
		jal firstPogram_displayeResultTooHigh
		jal Exit

	else:
		jal firstPogram_displayeFinalResult
		jal Exit

################# Functions #################
# Display a program name:
firstProgram_displayProgramName:
	li $v0, 4
	la $a0, programName
	syscall
	jr $ra

# Prompt a user for a number:
firstProgram_displayPrompt:
	li $v0, 4
	la $a0, prompt
	syscall
	jr $ra

# Output the result when it's too low:
firstPogram_displayeResultTooLow:
	li $v0, 4
	la $a0, resultTooLow
	syscall
	jr $ra

# Output the result when it's too high:
firstPogram_displayeResultTooHigh:
	li $v0, 4
	la $a0, resultTooHigh
	syscall
	jr $ra

# Output the result when a user guesses it right:
firstPogram_displayeFinalResult:
	li $v0, 4
	la $a0, fianlResult
	syscall
	jr $ra


######### Define the program data #########
.data
	#### 1st Program : Can You Vote? ####
	programName: .asciiz "-- Guess My Number ---"
	prompt: .asciiz "Guess a number from 1-10: "
	resultTooLow: .asciiz "Your guess is too low."
	resultTooHigh: .asciiz "Your guess is too high."
	fianlResult: .asciiz "You guessed it!"


################ Utils.asm ################
.include "utils.asm"
