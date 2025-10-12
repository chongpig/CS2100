# CS2100 Lecture 1&2 Overview of C Programming

## 1. Edit, Compile , Execute
Edit -> Source Code -> Compile -> Executable code -> Execute -> Program output

## 2. A Simple C Programming

```
preprocessor directives
main function header
{
	declaration of variables
	executable statements
}
```
## 3. von Neumann Architecture
describes a computer consisting of :
* Central Processing Unit (CPU) 
	* Registers
	* A control unit containing an instruction register and program, counter
	* An arithmetic/logic unit(ALU)
* Memory 
	* Stores both program and data in random access memory(RAM) 
* I/O devices

## 4. Variables
* data stores in variables
* name, data type, value
* have an address
* initialization
* data types
	* int : 4 bytes,$ -2^{31}$ ~ $2^{31} -1$
	* float/double: 4/8 bytes
	* char
* strongly/weakly typed
-> gcc filename -o newname(o specifies name if executable file)

## 5. Program Structure
A basic C program has 4 main parts:
* Preprocessor directives :
	* Header files
		(need to use -lm when using math.h; string.h for strings)
	* Macro expansions
		`#define PI 3.142`(no ";")`
	* Conditional compilation
	* Input: stdin/file
	scanf(format string, input list)
	printf(format string)
	printf(format string, print list)
	|Placeholder|Variable Type|Function Use|
	|---|---|---|
	|%f|float/double|printf|
	|%f|float|scanf|
	|%lf|double|scanf|
	|%e|float/double|printf(for scientific notation)|	
	escape sequence:
	\n: new line; \t Horizental tab; \" Double quote; %% percent 

* Compute
	* Computation is through function
	* A function body have two parts:
		* Declaration statements:
		* Executable statements:
* Output: stdout/file

## Control Structures in C
1. Selection Structures
	* if else
	* switch case:
	``` 
	switch (variable or expression) {
		case value1:
			code to excecute
			break;
		...
		default:
		code to execute
		break;
	}
	```

	------

# L3
## 1.Data Representation

* Data are internallu represented as sequence if bits(binary digits). A bit is either 0 or 1.
* Other units 
	* Byte: 8 bits
	* Nibble: 4 bits
	* Word: Multiple butes
* N bis can represent up to $2^N$ values

## 2. Decimal (base 10) Number System
* A weight=positional number system.
* Base(radix) is 10
## 3. Other Number Systems
* Binary
* Octal
* Hexadecimal : 0123456789ABCDEF
* Base/Radix R
In C 
* Prefix 0 is for octal, eg 032 
* Prefix 0x is for hexadecimal
## 4. Base-R to Decimal Conversion
## 5. Decimal to Binary Conversion
* For whole numbers : Repeated Division-b-2 Method
* For fractions : Repeated Multiplication-by-2 Method
## 6. Conversion Between Bases 
1. via decimal
2. Shortcuts for conversion between bases 2,4,8,16
## 7. ASC2 Code
* American Standard Code for informaation Interchange
* 7 bits, plus 1 parity bit(odd or even parity)
## 8. Negative Numbers 
1. Sign and Magnitude
	The Sign is represeneted by a 'sign bit', 0 for +, 1 for -
	range $-2^{n-1}+1    to    2^{n-1}-1$
	To negate a number, just invert the sign bit
	The subscript sm, eg ${11001}_{sm}$  _
2. 1s Complement
	given number x , -x can be obtained using $-x = 2^n -x -1$
	technique to neagte: invert 1 and 0
	The MSB still represents the sign: 0 for positive , 1 for negative
	range : $-2^{n-1} + 1, 2^{n-1}-1$
3. 2s Complement
	 given number x ,$-x = 2^n -x$
	 invert 0,1 then +1
	 range : $-2^{n-1},2^{n-1}-1$
## 9. 2s Complement on addition/Subtraction
* Algorithm for addition of integers, A + B
	1. Perform binary addition on the two numbers.
	2. Ignore the carry out of the MSB
	3. Check for overflow. Overflow ovvurs if the 'carry in' and 'carry out' of the MSB are different, ot if the result is opposite sign of A and B.
* Algorithm for substraction of integers, A-B = A+(-B)
	1. Take 2s complement of B
	2. Add 2s complement of B to A
* Overflow:
	positive + positive -> negative
	negative + negative -> positive
## 10. 1s Complement on Addition/Subtraction
* Addition:
	1. Perform binary addition
	2. if there is a carry out of the MSB, add 1 to the result
	3. Check for overflow. Overflow occurs if result is opposite sign of A and B.
* Subtraction:
	1.Take B 1s complement
	2.Add 1s complement of B to A  
## 11. Excess Representation
It allows the range of values to be distributed evenly between the positive and negative values, by a simple translation
Excess-n means 00..0 = -n

## 12. Real Numbers
1. Fixed-Point Representation: the number of bits allocated for the whole number part and fractional par are fixed
2. Floating-Point Representation
	allow us to represent very large or very small numbers
	3 components: sign, exponent and mantissa(fraction)
	the base(radix) is assumed to be 2
	Two formats:
		Single-precision(32 bits): 1-bit sign, 8 bit exponent with bias -127(excess+127), 23 -bit mantissa
		Double-precision(64 bits): 1-bit sign, 11 bit exponent with bias -1023(excess+1023), and 52 bit mantissa
	* Sign bit : 0 for positive , 1 for negative
	* Mantissa is normalized with an implicit leading bit 1
		* $110.1_2$ -> normalized -> $1.101_2 * 2^2$ -> only 101 is stored in the mantissa field
		* $0.00101101_2$ -> normalised -> $1.01101_2 * 2^{-3}$ -> only 01101 is stored in the mantissa field
---
# L4 Pointers
## 1. Pointers
### 1.1 Pointer variable
* A variaible that contains the address of another variable
* To declare a pointer variable:
	syntax: type * pointername
* Assigning value to a pointer: assign the address to a pointer
* Accessing variable through pointer: indirection operation operator * 
* Incrementing a pointer: the address inrease depends on the type of the variable,int 4 bytes, floar 4 bytes,char 1, double 8
## 2. Functions
* Pass-by-value and Scope Rule:
---

# L5 Collection of data
## 1. Array
* An homogeneous collection of data, occupy contiguous memory locations, and are accessed through indexing

 ``
 	int a[3] = {1,2,3}
 	int b[] = {1,2,3}
 	int d[5] = {0}
 ``
### Array and pointers
C sees array as constant pointer
### Array oarameters in functions
`` int sumArray(int [], int) `` 
`` int sumArray(int *, int) `` 
No need to put array size inside[]
## 2. Strings
* Array of chars with \0 as an end, We can turn any array of chars into a string by add a\0 at the end
* Can use include <string .h> to manipulate
`` char fruit_name[] ="apple"
### Strings I/O
```
fgets(str, size, stdin); // reads size -1 char or until newline
scanf("%s", str); // read until white space
puts(str);
pritnf("%s\n", str) 
```
* fgets()
ON interactive input, fgets() also read in the newline character, Hence we may need to replace it with '\0', if necessary
```
fgets(stsr, size, stdin);
len = strlen(str);
if(str[len-1] == '\n')
	STR[LEN -1] = '\0';
```
### String Functions
* strlen
* strcmp : positive if s1 is lexicographically
* strncmp(s1, s2, n) first n chars
* strcpy(s1, s2): copy s2 into s1
* strncpy(s1, s2, n): copy first n chars of s2 to s1

## 3. Structure
Allow groupping of heterpgeneous members of different types
```
typedef struct {
int length, width, height;
} box_t;
box_t box = {1,1,1};
```
* A type is not a variable, No memory is allocatd to a type
* can do assignment woth structures : reslut1 = result2
* shortcut: ``(*player_ptr).name  = player-ptr->name``
---
# L 7 MIPS
## 1. Instruction Set Architecture
### 1.1
* An abstraction on the interface between the hardware and the low-level software:
	Software -> to be translated to the instruction set
	Hardware -> implment the instruction set
* Include everything programmers need to know to make the machine code work correctly
* Allows compter designers to talk about functions independently from the hardware
* This abstraction allows many imolementations of varying cost and performance to run identical software

### 1.2 Machine code / Assembly language
|Machine Code|Assembly Language|
|binary|Human readable|
|Also be wriiten in hexadecimal| May provide pseudo-instructions as syntatic sugar|
### 1.3 The Components
* The two major components in a computer 
	1. Processor and memory
		Processor: Perform computations
		Memory: Storage of code and data
		Bus: Bridge between the two components
		* To Provie tempopaty storage for values in the processor, use registers in processors
	2. Input/Output devices omitted in this example
### 1.4 General purpose registers
* Fast memories in the processor
* Limited in number: 16-32 registers, compiler associates variables in progra,  with registers
* Have no data type

* There are 32 registers in MIPS assembly language, can be refered by a number($0, ...$31), or referred by a name
C:\Users\Alienware\Desktop\registers
### 1.5 MIPS assembly language
* Each instruction excecutes a simple command
* Each line of assembly code contains at most 1 instruction
* (hex-sign) # is used for comments
* General instruction syntax:
* operation(op) destination source1 source2  :  add $s0, $s1, $s2
* Immediate values are numerical constants: addi
* The number zero , use $s0($0 or $zero)
### 1.6 Logical operation
Shift left : sll
Shift right: srl
Bitwise AND: and, andi
Bitwise OR: or, ori
Bitwise NOT: nor
BitWIse XOR: xor

* sll : shift left logical
Move all the bits in a word to the left by a number of positions; fill the empted positions with zeros. Fill the emptied positions with zeroes

* srl : shift right logical
Move right and fills emptied positions with zeroes
* The equaivalence of shifting left/right n bits : Multiply/divide by $2^n$, shifting is faster than multiplication/division

* Bitwise AND :
	Place 0s into the positions to be ignored -> bits will turn into 0s
	Place 1s for interested positions -> bits will remain the same as the original

* Bitwise OR:
* Bitwise NOR: 
	* There is no NOT instruction in MIPS to toggle the bits, However, a NOR instruction is provided, use NOR with zeroes(nor $t0, $t0, $zero)

* Bitwise XOR(not equal operation)
	can get NOT operationfrom XOR: xor $tom $t0, $t2
	There is no NORI, but XORI instruction
## 2 Memory organisation
### 2.1 General Interview:
* The main memory can ve viewed as a large, single-dimension array of memory locations
* Each location of the memotu has an addres, which is an index into the array
* The memory map on the right contains one byte(8 bits) in every location/address
### 2.2 Transfer Unit
* using distinvt memory address, we can access:
	* a single byte
	* a single word
* Word is :
	* Usually $2^n$ bytes
	* The common unit of transfer between processor and memory
	* Also commonly coincide with the register size, the integer size andinstruction size in most architectures
### 2.3 Word Alignment
* Words are aligned in memory if they begin at a byte address that is a multiple of the number of bytes in a word
### 2.4 Memory Instructions
* MIPS is a load-store register architecture
	* 32 registers, each 32-bit(4 byte) long
	* Each word contains 32 btis(4 bytes)
	* Memory addresses are 32-bit long
* In  MIPS, data must be in registers to perform arithmetic. Memory accessed only by data transfer instructionsMIPS uses byte addresses, so consecutive words differ by 4.

* Memory Instruction: Load Word
	eg. lw $t0, 4($s0)
	steps:
    1.Memory address = $s0 + 4 = 8000 + 4 = 8004
	2. Memory woed at Mem[8004] is loaded into $t0
* Memory Instruction: Store Word
	e.g. sw $t0, 12($s0)
	steps:
    1.Memory address = $s0 + 12 = 8000 + 4 = 8012
	2.Content of $t0 is stored into word at Mem[8012]
* Load and Store Instructions
	* Only load and store instructions can access data in memory.
	* Remember that arithmetic operands(for add) are registers, not memory
	* lb,sb, similar in working except that one byte, instead of one word, is loaded or stored
* Others 
	* MIPS disallows loading/storing unaligned word using lw/sw
	* Pseudo-Instructions unaligned load word(ulw) and unaligned store word(usw) are provided for this purpose
	* lh/sh : load halfword and store halfword
	* lwl,lwr,swl,swr : load word left/right, store word left/right

### 2.5 Common Questions: Address vs Value
* A register can hold any 32-bit number:
	The number has no implicit data type and is interpreted according to the instruction that uses it
* Bytevs Word: IMPORTANT : Consecutive word addresses in machines with byte-addressing do not differ by 1.
## 3. Making decisions
### 3.1 Two types of decision-making statements in MIPS
* Conditional(branch)
	bne $t0,$t1, label
	beq $t0,$t1, label
* Unconditional(jump)
	j label
* A label is an anchor in the asssembly code to indicate point of interest, usually as branach target

* Conditional Branch: beq and bne
	* Processor follews the branch only when the conditions is satisfied
	* beq $r1, $r2, L1
		* Go to the statement labeled L1 if the value in register $r1 equals the value in register $r2
		* beq is branch if equal
	* bne $r1, $r2, L1
		* Go to the statement labeled L1 if the value in register $r1does not  equal the value in register $r2
		* bne is branch if not equal

* Unconditional Jump: j
	* Processor always follows the branch
	* j L1
		* Jump to label L1 unconditionally
	
* Translate if else to bne/beq
f :s0, g: s1, h : s2, i :s3, j : s4
```
if (i == j)
	f = g + h
else 
	f = g - h
```
```
	bne $s3, $s4, Else
	add $s0, $s1, $s2
	j Exit
Else : sub $s0, $s1, $s2
Exit:
```

* Loops:
i : s0, a: s2
```
for (i = 0; i<10 ; i++)
	a = a + 5
```
```
	add $s0, $zero, $zero
	addi $s1, $zero, 10
Loop: beq $s0, $s1, Exit
	addi $s2, $s2, 5
	addi $s0, $s0, 1
	j Loop
Exit:
```
### 3.2 Inequalities
* set less than: slt
	slt $t0, $s1, $s2
	if(s1<s2) t0 = 1
	else t0 = 0
* to buile a "blt $s1, $s2,L" instruction:
	slt $t0, $s1, $s2
	bne $t0, $zero, L
### Array and Loop
e.g. Count the number of zeros in an array A

# L9 MIPS Instruction Formats
## 1. MIPS Encoding
### 1.1 Baiscs: 
* Each MIPS instruction has a fixed-length of 32 bits
* The instruction encodings should be as regular as possible
### 1.2 Classification
* Instructions are classified according to their operands
	R-format(register): arithmetics, shift
	I-format(immediate)
	J-format(Jump)
### 1.3 MIPS Registers
* For simplicity, register numbers($0,$1,....$31) will be used
### 1.4 R-Format
opcode rs rt rd shamt funct
31<------------------------------>0
rs rt rd(register numbers): 5bits
shamt(shift amout)： 5bits
opcode(instruction name)： 6 bits
funct(combined with opcode exactly specifies the instruction) : 6 bits

* opcode: 

 	partially specifies the instruction
 	Equal to 0 for all R-Format instructions
* funct:
	Combined with opcode exactly specifies the instruction
* rs(Source Register):
	Specify register containing first operand
* rt(Target Register):

 	Specify register containing second operand
* rd(Destination Register):
	Specify register which will receive result of computation
* shamt:
	Amount a shift instruction will shift by
	5 bits
	Set to 0 in all non-shift instructions

* for shift , rs is always 0

### 1.5 I-format
opcode rs rt immediate
6           5  5   16 
* opcode
	opcode uniquely specifies an instruction
* rs
	specify the sourcr register operand(if anty)
* rt
	specifies register to receive result
	note the difference from R-format instructions
* immediate:
	Treated as signed integer
		Except for bitwise operations(ani,ori,xori)
	16 bits -> can be used to represent a constant up to 2^16 different values
	Large enough to handle:
		The offsets in a typical lw or sw
		Most of the values used in the addi, slti instructions
	For beq , immediate == the lines jumped
### 1.6 J-Format
* For braches, PC-relative addressing was used:
	Because we do not need to branch too far
* For general jumps:
	We may jump to anywhere in memory
* The ideal case is to specify a 32-bit memory address to jump to
	Unfortunately, we can't

6 bits  26 bits
opcode target

* We canonly specify 26 bits of 32-bit address
	Jump will only jump to word-aligned addresses, so last 2 bits are always 00
	MIPS choose to take the 4 most significant bits from PC+4
###  1.7 Addressing mode
* Register addressing: operand is a register
* Immediate addressing: operand is a constant within the instruction
* Base addressing (displacement addresssing) : operand is at the memory location whise address is sum if a register and a constant in the instruction
* PC-relative addressing: address is sum of PC and constant in the instruction
* Pseudo-direct addressing : 26-bit o finstruction concatenated with upper 4-bits of PC

# L10 The 5 Concepts in ISA Design
## 1. RISC VS CISC: The Famous Battle
* Two Major design philosophies fo ISA
* Complex Instruction Set Computer(CISC)
	eg. x86-32
	Single instruction performs complex operation
	Smaller progra, size as memory was premim
	Complex implementation, no room for  hardware optimization
* Reduced Instruction Set Computer(RISC)
	e.g. MIPS, ARM
	Keep the instruction set small and simple, makes it easier to build/optimise hardware
	Burden on software to combine simpler operations to implement high-level language statements 
## 2. The 5 Concepts in ISA Design
### 2.1 Data Storage
*  Storage Architecture
*  General Purpose Register Architecture
#### 2.1.1 Storage Architecture: Definition
* von Neumann Architecture
	Data(operands) are stored in memory
* For a processor, storage architecture concerns with:
	Where do we store the operands so that the computation can be performed
	Where do we store the compuptation result afterwards
	How do we specify the operands
* Major storage architectures
	* Stack architecture:
		* Operands are implicitly on top of the stack
	* Accumulator architecture:
		* One operand is implicitly in the accumulator(a special register)
	* General-purpose register architecture:
		* Only explicit operands
		* Register-memory architecture(One operand in memory)	
		* Register-register(or load-store) architecture
	* Memory-memory architecture:
		* All operands in memory.

* example: Goal : C = A + B
	1. Stack: Push A, Push B , add , Pop C 
	2. Accumulator: Load A, Add B, Store C
	3. Register(load-store) : Load R1 A, Load R2 B, Add R3 R1 R2, Store R3 C
	4. Memory-Memory: Add C, A, B

* For modern processors:
	* General-Purpose-Register(GPR) is the most common choice for storage design
	* RISC computers typically use Register-Register (Load/Store) design
	* CISC computers use a mixture of Register-Register and Register-Memory
### 2.2 Memory Address and Content
* Given k-bit address, the address space is of size $2^k$

* Each memory transfer consists of one word of n bits

* Memory Content: Endianness
	The relative ordering of the bytes in a multiple-byte word stored in memory
	* Big-endian: MSB stored in lowest address
	* Little-endian: LSB stored in lowest address
	
* Addressing Modes
	* Ways to specify an operand in an asssembly language
	
* In  MIPS, there are onlu 3 addressing modes:
	* Register
		Operand is in a register
		
	* Immediate
		Operand is spercified in the instruction deirectly
		
	* Displacement
		Operand is in memory with address calculated as Base + Offset
		
	* PC-relative addressing mode
		caculate the address acording to PC
	* Pesudo address
	
	  
### 2.3 Operations in Instructions Set
* Standard Operations in an Instruction Set
* Frequently Used Instructions

### 2.4 Instruction Formats
* Instruction Length
* Instsruction Fields
	Type and Size of Operands
	
1. Instruction Length
	* Variable-length instructions(CISC)
		Intel 80 * 86, 1-17 bytes long
		Digital VaAX 1-54 bytes long
		require multi-step fetch and decode
	* Fixed-length instructions(RISC)
2. Instruction Fields
	* An instruction consists of 
		opcode
		operands
	* The operation designates the type and size of the operands
		Typicla type and size: CHaracter(8 bits) half-word(16 ibts)
		 word (32 bits) single precision floating point(1 word) double(2 words)
	* Expectataions from any new 32-bit architecture:
		Support for8- 16- and 32- bit integer and 32-bit and 64-bit floating point operations. A 64-bit architecture would need to support 64-bit integers as well.\
		
### 2.5 Encoding the Instruction Set
* Issues: Code size, speed/performance, design complexity
* Things to be decided:
	* Number of registers
	* Number of addressing modes
	* Number of operands in an instruction
* The different competing forces
	* Have many resters and addressing modes
	* Reduce code size
	* Have instruction length that is easy to handle(fixed -length instructions are easier to handle)
#### 3.5.1 Encoding Choices
* Three encoding choices: variable, fixed, hybrid

* Fixed length instruction
	* Use expanding opcode scheme
		No wasred bits and result in a larger instruction set

# R2 
* A general formula to compute the address:
	a[i1][i2]...[in] is A0 + S * (((i1 * D2) + i2 ) * D3 + .... + in)
* Unions 
	* A special kind of struct where the fields occupy the same memory storage (or the max)
* typedef
	Introduces a user ddefined type
```
typedef struct {
	int day, month, year;
} date_t;

typedef struct {
	int cardNum;
	date_t expiryDate;
} card_t;

```

* enum
	An enum  is a C type that represents a group of (integer) constants,i.e. cannot be changed
	
* Dynamic storage allocation
	To allocate storage at runtime, use the malloc() system call
	

#

# L11 The Processor: Datapath
## 1. Building a Processor: Datapath & Control
* two major components for a processor
	Datapath
		Collection of components that process data
		Performs the arithmetic, logical and memory operations
	Control
		tells the datapath, memoty and I/O devices what to do according to program instructions
## 2. MIPS Processor: Implementation
* Simplest possible implementation of a subset of the core MIPS ISA
	Arithmetic and Logicak operations
	Data transfer instructions
	Branches
## 3. Instruction Excecution Cycle(Basic)
1. Fetch
	Get instruction from memory
	Address is in Program Counter(PC) Register
2. Decode
	Find out the operation required
3. Operand Fetch
	Get operands needed for operation
4. Excute
	Perform the required operation(ALU)
5. Result Write
	Store the result of the operation
## 4. MIPS Instruction Execution
1. Fetch: Read instr from [PC] 
2. Decode.Operand Fetch 
	add $rd, $rs, $rt: Read rs as opr1, rt as opr2
	lw $rt, ofst($rs): Read rs as opr1, use ofst a ssopr2
	beq $rs, $rt,ofst: Read rs as opr1, rt as opr2
3. ALU
4. Memory Access
5. Result Write

## 5. Build a MIPS Processor
1. Stages
	1. Instruction Fetch stage
		1. Use the Program Counter to fetch the instruction from memory
		2. Increment the PC by 4 to get the address of the next instruction	
			Output to the nextstage(Decode)
			The instruction to be excecuted
		* Instruction Memory
			* Storage element for the instructions
				* It is a sequential circuit
				* Has an internal state that stores information
				* Clock signal is assumed and not shown
			* Supply instruction given the address
				* Given instruction address M as input, the memory outputs the content at address M
		* Adder:
			* Combinational logic to implement the addition of two numbers
			* Inputs: Two 32-bit numbers  A,B
			* Output:Sum of the input numbers, A+B
		* The idea of Clocking:
			PC is read during the first half of the clock period and it is updated with PC+4 at the next rising clock edge
	2. Decode Stage: Requirements
		* Gather data from the instruction fields:
			1. Read the opcode to determine instruction type and field lengths
			2. Read data from all necessary registers
		* Input from previois stage(Fetch)
			* Instruction to be excecuted
		* Output tp the next stage(ALU)
			Operation and the necessary operands
		* Register File
			* A collection of 32 registers
				* Each 32-bit wide; canve read/written by specifyin register number
				* Read at most two registers per instrution
				* Write at most noe register per instruction
			* RegWrite is a control signal to indicate
				* Writing of register
				* 1(True) = write, 0 (False) = No Write

# L12 The Processor: Control
## 1. Identified Control Signals
* RegDst: Decode/Operand Fetch, Select the destinition register number
* RegWrite: Decode/Operand Fetch RegWrite, Enable writing if register
* ALUSrc: ALU, Select the $2^{nd}$ operand for ALU
* ALUcontrol: ALU, Select the operation to be performed
* MemRead/MemWrite: Memory, Enable reading/writing of data memory
* MemToReg: regWrite: Select the result to be written back to register file
* PCSrc: Memory/RegWrite, Select the next PC value
## 2. Generating Control SIgnals: Idea
* The control signals are generated based on the instruction to be executed
	* Opcode -> Instruction Format
	* Example:
		* R-Format -> RegDst = 1
	* R-Type instruction has additional information:
		* the 6-bit "funct" field
* Idea:
	* Design a combinational circuit to generate these signals based on Opcode and possibly Function code
		* A control unit is needed
## 3. The Control Unit
## 4. Control Signals
## 5. ALU Control Signal
* One Bit At A Time
	* A simplified 1-bit MIPS ALU can be implemented as follows
	* 4 controls bits are needed:
		* Ainvert: 1 to invert input A
		* Binvert: 1 to invert input B
		* Operation(2-bit) : To select one of the 3 results
* Multilevel Decoding:
	* Brute Force approach:
		* Use Opcode and Function Code directly, i.e. finding expressions with 12 variables
	* Multilevel Decoding approach:
		* Use some of the input to reduce the cases, then generate the full output
		* Simplify the design process, reduce the size of the main controler, potentially speedup the circuit
* Intermediate Signal : ALUop:
* Basic Idea:
	1. Use Opcode to generate a 2-bit ALUop signal 
		* Represent classification of the instructions:
		|Instruction type|ALUop|
		|---|---|
		|lw/sw|00|
		|beq|01|
		|R-type|10|
	2. Use ALUop signal and Function Code field (For R-type instructions) to generate the 4-bit ALUcontrol signal
		* ALUcontrol3 = 0
		* ALUcontrol2 = ALUOp0 + ALUOp1& F1
		* 
## 6. Instruction Execution
3. ALU Stage
		* ALU = Arithmetic-Logic Unit
		* Also called the Execution stage
		* Perform the real worl for most instruction here
			* Arithmetic, Shifting, Logical
			* Memory operation: Address calculation
			* Branch operation: Perform register comparison and targer address calculation
		* Input from previous stage (Decode):
			* Operation and Operands
		* Output to the next stage (Memory):
			* Caluculation result
	
		* Arithmetic Logic Unit:
			A(32bits)			isZero
	        B(32bits)			ALU result
	        ALUcontrol
	    	* Combinational logic to implement arithmetic and logical operations
	    	* Input
	    		Two 32 bit numbers
	    	* Control:
	    		4-bit to decide the particular operation
	    	* Outputs:
	    		Result of arithmetic/logical operation
	    		A 1-bti signal to indicate whether result is zero
	    * Branch Instructions:
	    	1. Branch outcome:
	    		* Use ALU to compare the register
	    		* The 1-bit "isZero" signal is enough to handle equal/not equal check 
	    	2. Branch Target Address:
	    		* Introduce additional logic to calculate the address
	    		* Need PC
	    		* Need Offset
4. Memory Stage:
		* Instruction Memory Access Stge:
			* Only the load and store instructions need to perform operation on this stage:
				* Use memory address calculated by ALU Stage
				* Read form or write to data memory
			* All other instructions remain idle:
				* Result from ALU Stage will pass through to be used in Register Write stage if applicable
		* Input from previous stage (ALU):
			* Computation result to be used as memory address
		* Output to the next stage(Registser Write) :
			* Result to be stored
	
		* Data Memory:
			* Storage element for the data of a program
			* Inputs:
				* Memory Address
				* Data to be written (Write Data) for store instructions
			* Control:
				* Read and Write controls; only one can be asserteed at any pont of time
			* Output:
				* Data read from memory (Read Data) for load instructions
	5. Register Write Stage:
		* Instruction Register Write Stage:
			* Most instructions write the result of some computation into a register
				* e.g. arithmetic, logical,shifts,loads,set-less-than
				* Need destination register number and computation result
			* Exceptions are stores, branches,jumps:
				* There are no results to be written
				* These instructions remain idle in this stage
			* Input from previous stage (Memory)
				* Computation result either from memory or ALU

# L13 Boolean Algebra
## 1. Digital Circuits
*  Two voltage levels
	* High/true/1/asserted
	* Low/false/0/deasserted
* Advantages of digital circuits over analog circuits
	*  More reliable (simpler circuits, less noise-prone )
	*  Specified accuracy (determinable)
	*  Abstraction can be applied using  simple mathematical model – Boolean Algebra
	* Ease design, analysis and simplification of digital circuit – Digital Logic Design
* Combinational: no memory, output depends solely on the input
	* Gates
	* Decoders, multiplexers
	* Adders, multipliers
*  Sequential: with memory, output depends on both input and current state
	*  Counters, registers
	* Memories
	*
## 2. Boolean Algebra
* Boolean values
	* True(T or 1)
	* False(F or 0)
* Connectives
	* Conjuction (AND)
		A* B ; A ^ B    *
	* Disjunction (OR)
	* Negation (NOT)
* Truth Table
	*  Provide a listing of every possible combination of inputs and its corresponding outputs.
		* Inputs are usually listed in binary sequence.
## 4. Precedence of the Operators
* Precedence from highest to lowest
	* Not
	* And
	* Or
*  Use parenthesis to overwrite precedence.

## Laws of Boolean Algebra
Identity laws
 A + 0 = 0 + A = A  ;  A * 1 = 1 * A = A
 Inverse/complement laws
 A + A' = A' + A = ;  A * A' = A' * A = 0
 Commutative laws
 A + B = B + A  ; A * B = B * A
 Associative laws *
 A + (B + C) = (A + B) + C ; A * (B * C) = (A * B) * C
 Distributive laws
 A * (B + C) = (A * B) + (A * C) ; A + (B * C) = (A + B) * (A + C)         *
## 6. Duality
* If the AND/OR operators and identity elements 0/1 in a Boolean equation are 
interchanged, it remains valid.
* Example:
	* The dual equation of a+(b*c)=(a+b)*(a+c) is a*(b+c)=(a*b)+(a*c).
* Duality gives free theorems – “two for the price of one”, as a Boolean equation 
is logically equivalent to its dual. So, you prove one theorem and the other 
comes for free!
*  Examples:
	* If (x+y+z)' = x'* y' * z' is valid, then its dual (x*y*z)' = x'+y'+z' is also valid. *
	* If x+1 = 1 is valid, then its dual x*0 = 0 is also valid.

## 7. Theorems
* Idempotency
	X + X = X ; X * X = X 
* One element / Zero element
	X + 1 = 1 + X =  1 ; X * 0 = 0 * X = 0
* Involution
	( X' )' = X
* Absorption 1
	X + X * Y = X ; X * (X + Y) = X
* Absorption 2
	X + X' * Y = X + Y ; X * (X' + Y) = X * Y
* DeMorgans’ (can be generalised to more than 2 variables)
	(X + Y)' = X' * Y' ; (X * Y)' = X' + Y'
* Consensus
	X * Y + X' * Z + Y * Z = X * Y + X' * Z (X+Y) * (X'+Z) * (Y+Z) = (X+Y) * (X'+Z)

* Proving a theorem
	* Theorems can be proved using truth table, or by algebraic manipulation using 
	other theorems/laws. 
	* By the principle of duality, we may also cite (without proof)
 ) that X * (X+Y) = X.
## 8. Boolean Functions
*  Examples of Boolean functions (logic equations):
	*   F1(x,y,z) = x * y * z' 
		F2(x,y,z) = x + y' * z 
		F3(x,y,z) = x' * y' * z + x' * y * z + x * y' 
		F4(x,y,z) = x * y' + x' * z
## 9.Complement Functions
* Given a Boolean function F, the complement of F, denoted as F', is obtained by interchanging 1 with 0 in the function's output values
* Example: F1 = x * y * z' 
* What is F1' ?

## 10. Standard Forms
* Certain types of Boolean expressions lead to circuits that are desirable from 
an implementation viewpoint.
* Two standard forms:
	* Sum-of-Products (SOP)
	* Product-of-Sums (POS)
* Literals
	*  A Boolean variable on its own or in its complemented form
	*  Examples: (1) x, (2) x', (3) y, (4) y' 
* Product term
	* A single literal or a logical product (AND) of several literals
	* Examples: (1) x, (2) x * y * z', (3) A' * B, (4) A * B, (5) d * g' * v * w
* Sum term
	*A single literal or a logical sum (OR) of several literals
* Examples: (1) x, (2) x+y+z', (3) A'+B, (4) A+B, (5) c+d+h'+j
* Sum-of-Products (SOP) expression
	* A product term or a logical sum (OR) of several product terms
* Examples: (1) x, (2) x + yz', (3) xy' + x'yz, (4) AB + A'B', (5) A + B'C + AC' + CD 
* Product-of-Sums (POS) expression
	* A sum term or a logical product (AND) of several sum terms
	*  Examples: (1) x, (2) x(y+z'), (3) (x+y')(x'+y+z), 
		(4) (A+B) * (A'+B'), (5) (A+B+C) * D' * (B'+D+E') 
*  Every Boolean expression can be expressed in SOP or POS form
## 11. Minterms and Maxterms
