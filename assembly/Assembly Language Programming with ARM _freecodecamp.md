# assemby language with arm v7 DE1-SoC

here every register has 8 zeros 

r0    00000000

its a hex value so there are 2^32(binary) maximum value

it's a 32bit processor

maxium value can be stored in 32bit processor is 32 bit in size

**r7** -  register is special , it's responsible for sysem call . when we are working with assembly  language we need to communicate with  OS to allocate resources , terminate processes etc . r7 will map a table and call system to perform specific action

**sp**  - stack pointer register 

memory inside are all stack memory . stack memory tepically stored in RAM . RAM is generally slower to read and write than register . we can store lot more data in RAM . we use stack memory when we need to use more complex data type , like list of number

**lr**  - Link register 

when we use higher level language , function return a value , the return actiion allows us to move back to the place from where the function is called  . that is the link the link register stores 

**pc** - program counter 

keeps track of the next command needs to execute , all the instruction stored in Memory(RAM)

**CPSR** - (current program status register) -special type of register , stores information about our program . **holds four status bits, negative (N), zero (Z), carry (C), and overflow (O)**. These bits can be used for conditional execution of subsequent instructions.

when we are added or substracting  using 1's complement and 2's complement , we need a way to keep track if the ourput is negetive and positive number , CPSR will set a flag that the provious result was negetive , CPSR has lot of flag 

.Global  helps to give a starting position of program

every instruction is call opcode or oparation

```
.global _start
_start:
    MOV R0,#30
    MOV R0,#0x0A
    MOV R7,#1
    SWI 0
```

MOV R0,#30  - moves integer value 30 

MOV R0,#0x0A - moves hex value 0x0A value to regester

SWI (software interrupt)

SWI 0  lets the oparating system inturrupt and read the value r7 and if r7 is 1 it look up to the table and terminate the program

LDR (load data from stack into register)

.word 32bit in size 

LDR (load data from stack data)

` LDR R0,=list` its a direct addressing 

```
.global _start
_start:
    LDR R0,=list

.data
list:
    .word 3,-4,6,2,1,-7
```

```
.global _start
_start:
	LDR R0,=list
	LDR R1,[R0]
	LDR R2,[R0,#4]
    LDR R2,[R0,#4]!
    LDR R2,[R0],#4

.data
list:
	.word 3,-4,6,2,1,-7
	
```

here [R0] is  same as list[0]

here [#R0,#4] is same as list[1]

here LDR R2,[R0,#4]!   encrement r0

here LDR R2,[R0],#4 encremnt after word 



```
.global _start
_start:
	MOV R0,#5
	MOV R1,#3
	ADD R2,R1,R0 // R2=R1+R0
	SUB R2,R1,R0 // R2=R1-R0
	MUL R2,R1,R0 // R2=R1*R0
	
	
```



```
.global _start
_start:
	MOV R0,#0xFFFFFFFF
	MOV R1,#1
	SUB R2,R0,R1  
	//R2=fffffffe
	
```



SAME AS 

```
.global _start
_start:
	MOV R0,#5
	MOV R1,#7
	SUB R2,R0,R1 
	//R2=fffffffe
	
	
	

```

` SUB R2,R0,R1` here pc register flag is c

`SUBS R2,R0,R1`  arithmetic with flag , this command will set CPRS register, CPRS register requires additional one operation to operate

user `SUBS ADDS MULS` when you know there is a negetive number or you dont know the output neg/pos
