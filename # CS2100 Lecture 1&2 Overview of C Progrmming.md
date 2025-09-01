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
		* Executanble statements:
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
## 9. 2s Complement on addition/Substraction
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
## 10. 1s Complement onn Addition/Substraction
* Addition:
	1. Perform binary addition
	2. if there is a carry out of the MSB, add 1 to the result
	3. Check for overflow. Overflow occurs if result is p[[psite sign of A and B.
* Substraction:
	1.Take B 1s complemenet
	2.Add 1s complement of B to A
## 11. Excess Representation
It allows the range of values to be distributed evenly between the positive and negatice values, by a simple translation
Excess-n means 00..0 = -n
## 12. Real Numbers
1. Fixed-Point Representation: the number of bits allocated for the whole number part and fractional par are fixed
2. Floating-Point Representation
	allow us to represenet very large or very small numbers
	3 compoments: sign, exponent and mantissa(fraction)
	the base(radix) is assumedn to be 2
	Two formats:
		Single-precision(32 bits): 1-bit sign, 8 bit exponent with bias -127(excess+127), 23 -bit mantissa
		Double-precision(64 bits): 1-bit sign, 11 bit exponent with bias -1023(excess+1023), and 52 bit mantisssa
	* Sign bit : 0 for positive , 1 for negative
	* Mantissa is normalised with an implicit leading bit 1
		* $110.1_2$ -> normalised -> $1.101_2 * 2^2$ -> only 101 is stored in the mantissa field
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
* An homogeneous collection of data, occupt contiguous memory locations, and are accessed throufh indexing

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
### 1.2 MAchine code / Assembly language
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


