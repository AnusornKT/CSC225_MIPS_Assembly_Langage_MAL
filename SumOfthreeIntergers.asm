
# Unit 3 Exercise
# Sum of Three Numbers
# Programming: Anusorn KT
# CSC225 Computer Architecture/Assembly Language
# Sep 23, 2020

# Define the program data:
.data
programname: .asciiz "-- Sum of Three Numbers ---"
prompt1: .asciiz "\nEnter the first integer: "
prompt2: .asciiz "\nEnter the second integer: "
prompt3: .asciiz "\nEnter the third integer: "
res: .asciiz "You just entered the number: "
result: .asciiz "\nThe sum of three numbers is: "

.text
main:
	# Print the greeting
	# 4 loaded into $v0 to indicate a print string
	li $v0, 4
	la $a0, programname
	syscall
	
	# ------------ The  First Integer ------------
	# Prompt a user to input the first integer:
	li $v0, 4
	la $a0, prompt1
	syscall
	
	# Read the first interger ($v0, 5) and save it in $t0:
	li $v0, 5
	syscall 
	move $t0, $v0
	
	# print the number the user just typed/entered
	li $v0, 4
	la $a0, res
	syscall
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	
	# ------------ The Second Integer ------------
	# Prompt a user to enter the second integer:
	li $v0, 4
	la $a0, prompt2
	syscall
	
	# Read the second interger ($v0, 5) and save it in $t1:
	li $v0, 5
	syscall 
	move $t1, $v0
	
	# print the number the user just typed/entered
	li $v0, 4
	la $a0, res
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	# ------------ The Third Integer ------------
	# Prompt a user to enter the third integer:
	li $v0, 4
	la $a0, prompt3
	syscall
	
	# Read the third interger ($v0, 5) and save it in $t2:
	li $v0, 5
	syscall 
	move $t2, $v0
	
	# print the number the user just typed/entered
	li $v0, 4
	la $a0, res
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	
	# --------------- Addition --------------- 
	# print out the sum: 
	li $v0, 4
	la $a0, result
	syscall
	
	
	# *** Adding the three number together ***:
	#  $t3 = first_int + second_int
	add $t3, $t0, $t1
	#  $t4 = $t3 + third_int
	add $t4, $t3, $t2
	
	
	
	li $v0, 1
	move $a0, $t4
	syscall
	

	# Exit the program:
	li $v0, 10
	syscall
	
	
	
	
	
	
	
	
	
