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

`CPRS` register stores flag if there is any negative number or there is any overflow

you will use `SUBS`where you dont know there is any negative nuber or you dont know the operation

```
.global _start
_start:
    MOV R0,#5
    MOV R1,#7
    SUBS R2,R0,R1  
    // ans is negetive two
// here CPRS register has value N which indicate negetive number
```

```
.global _start
_start:
    MOV R0,#0xFFFFFFF
    MOV R1,#3
    ADDS R2,R0,R1  
    // here 32 bit register over flows 
// here CPRS register has value C which indicate carry flag
```

add nuber with carry value 

`ADC` command add value with carry 

```
.global _start
_start:
    MOV R0,#0xFFFFFFFF
    MOV R1,#3
    ADC R2,R0,R1  //R2=R0+R1+CARRY
    // 
// here CPRS register has value N which indicate negetive number
```

### arithmetic operation

```
.global _start
_start:
    MOV R0,#0xFF
    MOV R1,#22
    AND R2,R0,R1  // LOGICAL AND 
    ORR R2,R0,R1 // LOGICAL OR
    EOR R2,R0,R1 // LOGICAL  EXCLUSIVE OR
```

```
.global _start
_start:
    MOV R0,#0xFF
    MVN R0,R0 // MAKE VLUE NEGATIVE AND MOVE TO THE SAME LOCATION
    AND R0,R0,#0x000000FF  // set every other  value to 0


```

LSL , left shift 1 bit is same as multiply by 2

LSR, right shift 1 bit same as divide by 2

ROR , right shift and move right most value to front 

```
.global _start
_start:
    MOV R0,#10
    LSL R0,#1 // 20
    LSR R0,#1  // 10
```

```
.global _start
_start:
    MOV R0,#10
    MOV R1,R0,LSL #1  // MOVE R0 TO R1 AND LEFT SHIFT R1 1
    
```



  

BLT , BRANCH LESS THAN

BLE , BRANCH LESS EQUAL

BEQ , BRANCH EQUAL TO 

BNE , BRANCH  NOT EQUAL 

```
.global _start
_start:
    MOV R0,#3
    MOV R1,#2 
    CMP R0,R1 // COMPIRE , does R0-R1 
    BGT greater // BRANCH GREATER THAN if R0-R1 POSITIVE 
    BAL default // BRANCH ALWAYS
greater:
    MOV R2,#1 
default: 
    MOV R2,#2




```

### print string

```

.global _start
_start:
    MOV R0,#1
    LDR R1,=message
    LRD R2,=len

    MOV R7,#4 

    SWI 0

    MOV R7.#1

    SWI 0


.data 
message:
    // .string is same as .asciz
    .asciz "hello world\n"

len = .-message
```



print a number in asembly(valid)

```
.global _start
.text
_start:

@ write to num variable
_write:
    mov r8, #99
    ldr r9, =num
    str r8, [r9]

@read from num variable and print to screen
_read:
    mov r7, #4 @ syscall
    mov r0, #1 @ std output
    ldr r1, =num @ starting address
    mov r2, #2 @ number of character to print
    swi  0 @ interrupt

_end:
    mov r7, #1
    swi 0

.data
num: .word 0
```



print a number in arm

```
.text
.global main
.extern printf
main:
        push {ip, lr}

        ldr r0, =string
        mov r1, #1024
        bl printf

        pop {ip, pc}

.data
string: .asciz "The number is: %d\n"
```

print a number in std output with c library (valid)

```
.text
.global main
.extern printf
main:
 PUSH {ip, lr}
  
        LDR r0, =string
 MOV r1, #4
        MOV r2, #5
        ADD R1,R1,R2 
  
        BL printf
 POP {ip, pc} 
.data
string: .asciz "The number is: %d\n"
```
