# Unit 3 Exercise
# Hello, you name!
# Programming: Anusorn KT
# CSC225 Computer Architecture/Assembly Language
# Sep 23, 2020

# Define the program data:
.data
programname: .asciiz "-- What! It's Your Name? ---"
prompt: .asciiz "\nEnter your name: "
hello: .asciiz "Hello, "

input: .space 51 # # including '\0'
inputSize: .word 50

.text
main:
	# Print the greeting
	# 4 loaded into $v0 to indicate a print string
	li $v0, 4
	la $a0, programname
	syscall
	
	# ---- Prompt a user for an input (a name) ----
	# Prompt a user for his/her name:
	li $v0, 4
	la $a0, prompt
	syscall
	
	# Get the input and read the string:
	li $v0, 8
	la $a0, input
	lw $a1, inputSize
	syscall
	
	# Print out the "Hello, ":
	li $v0, 4
	la $a0, hello
	syscall
	
	# Print out the user's name:
	li $v0, 4
	la $a0, input
	syscall


	# Exit the program:
	li $v0, 10
	syscall
