# 💡 🖥️ CSC225_MIPS_Assembly_Langage_MAL 🖥️ 💡
# MIPS Assembly Language Programming 
Assembly Language Programming is one of the most foundation of programming concept that people in tech field should know and learn to know how a computer work at the low level(Machine language). MIPS stores data as a word (32 bits or 4 bytes) and keep instructions on a word boudary. MIPS memory consists of many types such as heap(synamic allocation), stack(synamic allocation), and static data(fixed size) that are located under the Kernel.
# ⚙️ ⚙️ ⚙️ MIPS Architecture ⚙️ ⚙️ ⚙️ 
1. ALU (Artihmetic Logic Unit)
2. Memory (Storage Unit)
3. Control Unit
# ⌨️ Types of Registers ⌨️
- $zero ($0) - constant value of 0 which can be read but cannot be written.
- $at ($1) - a register reserved for the assembler.
- $v0 - $v1 ($2-$3) - used for return values for subprograms. $v0 is also used to input the requested service to syscall.
- $a0 - $a3 ($4-$7) - used to pass arguments (or parameters) into subprograms.
- $t0 - $t9 ($8-$15, $24-$25) - stores temporary variables and can change when a subprogram is called.
- $s0 - $s8 ($16-$24) - stores saved values and maintained across subprogram calls.
- $k0 - $k1 ($26-$27) - reserved for OS
- $gp ($28) - pointer to global memory for heap allocations
- $sp ($29) – stack pointer
- $fp ($30) – frame pointer
- $ra ($31) – return address: a pointer to the address to use
