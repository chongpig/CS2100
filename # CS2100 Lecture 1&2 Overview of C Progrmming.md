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