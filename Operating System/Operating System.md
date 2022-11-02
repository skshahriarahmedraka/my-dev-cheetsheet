# Operating System

### introduction to Operating system

- an operating system(OS) in a progam that manages the computer hardware 

- it also provides a basis for applicationg programs and acts as a  intermediary between computer  user and computer hardware

### types of os

- batch os

- time sharing os

- distributed os

- network os

- realtime os

- multi programming/ processing/ tasking os

### Functions of OS

- it is an interface between user and hardware

- allocation of resources

- management of memory security etc

- 

### Goals of os

- convenience 

- efficiency

- both

- 

# basic of operating system(computer system operation)

some basic knowledge og the structure of computer system is require to understacn how operating system work 

- A mordern generel purpose computer system consists of one or more CPUs and a number of device controllers connected through a common bus that provides accrss to share memory 

- each device controller is inchare of a specific type of device 

- the CPU and  the device controllers can execute  concurrently , competing  for memory cycles 

- to ensure orderly access to the share memory , a memory  controller is provided whose function is syncronize access to memory

- 

#### some impportant terms :

1. Bootstrap Program : 
   
   - The initial program that runs when a computer is powered  up
   
   - it's stored in the ROM (BIOS chip)
   
   - it must know how  to load theos and start executing the system 
   
   - it must locate and load into memory the OS kernel

2. Interrupt :
   
   - the occurence of an event is usually signalled by interrut from hardware  or software 
   
   - hardware may trigger an interrupt  at  any time by sending a signal to the CPU , usually by the way of the system bus 

3. system Call (Monitor call): 
   
   - software may trigger an interrupt by the executing a special operation called system call
   
   - 

when the CPU is interrupted , it stop what is doting and immediately transfers execution to a fixed location

- the fixed location usually contains the starting address where the service Routine of the interrupt is located

the interrupt service routine executes

on completion ,the CPU resumes the interrupt computation

## basic of operating system (storage structure)

1. Registers

2. Cache 

3. Main Memory (Ram)

4. electronic disk 

5. magnetic disk 

6. optical disk 

7. magnetic tapes

## basic of operating system(I/O structure)

- storate is only one of many types of  I/O devices within a computer 

- a large portion of operating system code is dedicated to managing I/O , both because of it's importance to the reliability and performance of the system andbecause of the vary nature of  devices 

- a genereal purpose computer system consists of CPUs are mutiple device comtrolleers that are connected through a common bus 

- each device controller is in change of a specific type of device 

- device controller maintains  - 1. local buffer storage 2. set of special purpose registers

- typically operating systems have device driver for each device controller 

- this device driver understands the device controller and presentsa uniform interface tothe device to the rest of opertating system

### working with I/O Operation

- To start a I/O operation the device deriver  load appropriage regisers within the device controller

- the device controller , in turn, examine the content of these registers to  determine what action to take 

- the controller starts the transfer of data form device to its local buffer

- one the transfer data is complete the device controller informs  the device driver via an interrupt that it has finished it's operation 

- the device driver then retun control to hte operating system

- - this form of interrupt  driven I/O  is fine for moving small ammount of data but can produce high overhead when used for bulk data movement

- - to solve  this problem , Direct memory access (DMA) is used 

- after setting up buffer pointer and counters for the I/O device the device controller transfers an entire block of data directlyto or from its buffer storage to memory , with no intervention by the cpu

- only one thing interrupt is  generated per block to tell the device driver that the operation has completed

- while the device controller is performing these operation , the CPU is available to accomplish other works

- 

### Computer system architechture

types of computer systems based on number of General Purpose Processors

1. single Processor system 
   
   - one ain CPU capable of executing a general purpose instruction set including intruction from user processes 
   
   - Other spechial purpose processors are also present which perform device specific task (small micro processor convert keyboard input to binary instruction)

2. multiprocessor syystem
   
   - also known as paraller systems or tightly coupled systems
   
   - has two or more processor in close communication sharing the computer bus and sometime the clock , memory and peripheral devices
   
   - advantages : increate throughput , economy of scale, increase reliability
   
   - 2 types : symmetric multi processor , Asymmetric multiprocessing (master slave approch)

3. Clustered Systems 
   
   - like multiprocessor systems , cluster systems gather together multiple cpus to accomplish computational work
   
   - they are composed of two or more indivisual systems coupled together
   
   - provides high availablility
   
   - can be structuerd asymmetrically (one machine in hot standby mode other s run application) symmetrically (two or more hosts run applications) monitors each other
   
   - 

## operating system structure (multiprogramming and multitasking)

- operating system vary greatky in their makeup internally 

- commonalities ,1. multi programming 2. time sharing(multi tasking)
1. multi programmig :
   
   1. single juser cannnot , in general keep either the cpu or I/O devices busy at all time
   
   2. multi programming increate CPU utilization by organization jobs(code and data ) so that CPU always has one to execute
      
      - multi programmed systems provides an environment in  which  the various system  resources (for example cpu, memory, and peripheral devices) are utilized effectively but the dont provide for user interaction with the computer system

    2. time sharing (multi tasking) :

- CPU executes multiple jobs by switching among them 

- switches occur so frequently that the user can interact with each program while it is running 

- time sharing requires an interractive (or hands on) computer system , which provides ditect communication between the user and system 

- A time shared operating system operating system allows many users to share the computer simultaneously 

- uses CPU scheduling and multi programming to provide each user with a small portion of a time shared computer 

- each user has at least one seperate program in memory 

- a program loaded into memory and executing is called a "PROCESS"

## operating system services

- an os provides an environemnt for execution of programs 

- it provides certain services to programs and to users of those programs 

- 
1. user interface : CLI , GUI

2. program execution
   
   - source code- compiler - object code - executor - output

3. I/O operation

4. file system manipulation

5. communications

6. error detection

7. REsource allocation

8. accounting

9. protection and security

## user operating system interface

1. provide a command line interface (CLI) or command interpreter that allows users to directly enter command that are to be performed by the operating system 

2. allow the user to interface with operating system via a graphical user interface or GUI

### command interpreter

- some operating systems include the command interpreter in kernel

- Others such as linux ,windows, unix , theat the command interpeter as a special program

- on systems with multiple command interpretter to choose from the interpretter are known as shell

- bourne shell , c shell , bourne-again shell (bash), korn shell

- 

# system calls

- system call provide an interface to the services made avaiable by an operating system 

- user mode, kernel mode (previleged mode)

- system ccall is progrmmatically way  in which a computer program request a service from the kernel of operating system 

- these call are generally available as routines written in c ans c++

- example of a system call sequence for writing a simple program to read data from one file and copy them to another file
  
  - acqure input file name
  
  - write prompt to screen 
  
  - accept input
  
  - aquire output file name
  
  - write promt to screen 
  
  - Accept input 
  
  - open input file
  
  - if file doesnot exit abort 
  
  - create output file 
  
  - if file exits abort 
  
  - read from input file 
  
  - write to output file
  
  - close output file
  
  - write completion message to screen 
  
  - terminate normally

## types of system calls

system call can be grouped roughly into five catagories 

1. process control 

2. file manipulation

3. device mangement 

4. information maintenance 

5. communication

### 1. process control

- end ,abort 

- load execute

- create  process , terminate process

- get process attibutes , set process attibutes

- wait for time

- wait event , signal event 

- allocation and free memory

## 2. file manipulation

- create file , delete file 

- open , close 

- read ,write , reposition
  
  - fet file attibutes ,set fiel attibutes

## 3. device manipulaion

- request device, release device

- read, write, reposition

- get device attibutes, set device attibutes 

- logically attach or detach devices

## 4. information maintenance

- get time  or date , set time or date 

- get system data,set system data 

- get process ,file ,or device attibutes 

- set process, file, or device attibutes 

## 5. Communication

- create ,delete communication connection 

- send , receive messages

- transfer status information

- attach or detach remote devices

- 

## system program

- system programs provide a convenient enviroment for program development and  execution

- some of them are simply user interface to system calls

- others considerably more complex

system program catagories:

1. file management
   
   - create ,delete, copy , rename print dump,list generaly manipulate files and directories 

2. status information :
   
   - ask system for :
     
     - date,time
     
     - amount of available memory or disk space 
     
     - number of users 
     
     - detaild performence logging and debugging information etc

3. file modification
   
   - several text editors may be available to create and modify the content of files stored on disk or other devices 
   
   - there may also be special commands to search contents of files or perform transforms of text 

4. programming language support 
   
   - compiler 
   
   - assemblers 
   
   - debugger 
   
   - interpreters 
   
   - for common programming language (such as c,c++,java,visual basic and pearl ) are often provied to the user with the operation system

5. program loading and execution 
   
   - once a progam is assembled or compiled , it must be loaded into memory tobe executed 
   
   - the system may provide :
     
     - absolute loaders
     
     - relocatable loaders
     
     - linkage editor and 
     
     - overlay loaders
       
       - debugging system for either higher level langages or machine language are needed as well

6. communication
   
   - these program provide the mechanizm for :
     
     - create virtual connections among process , users and computer systems
     
     - allowing users to send messages to one another's screens 
     
     - to browse webpages 
     
     - to send electronic mail messages
     
     - to log in remotely or to transfer files from one machine to another
   
   ## operating system design & implementation
   
   - desing goals:
     
     - choice of hardware
     
     - type of system
   
   - beyond the hight design level , the requirement may be much hearder to specify
   
   - requitement: user goals, system goals

## virtual machine

- the fundamental idea behind a virtual mahcine is to abstruct the hardware of a single computer (the CPU,memory,disk drive, network iinterface card, and so forth) into several different execution environment , there by createing the illusion that each separate execution environment is running it's own private computer

## process management

- process: A process can be thought of as a program in execution 

- Thread: A thread is the unite of execution within a process. A process  can have any where from just one thread to many threads

## process state

- as a process executes , it changes state 

- the state of a process is define in part by current activity of that process 

- each process may be in one of the folowing states :
  
  - NEW - the process is being created
  
  - RUNNING - intructions are being executed 
  
  - WAITING - the process is waiting for some event to occur (such as I/O completion or reception of a signal)
  
  - READY - the process is waiting to be assigned to a processor
  
  - TERMINATED - the process has finished execution

## process control block

- each process is repreasented in the operating system by a process control Block (PCB) also called a task control block
  
  - Process ID 
    
    - process state 
    
    - process number 
    
    - program counter
    
    - Registers
    
    - memory limits
    
    - list of open files

## Process scheduling

- the objective of multi programming it to have some process running at all time , to maximize CPU utilization

- the objective of time sharing is to switch  the cpu among processes so frequently that usercan interact with each program while it is running

- to meet these objective the process scheduler selects an available process (possibly  from a set of several available processes ) for program execution on cpu
  
  - for a single processor system , there wilbe more than one running process 
  
  - if there are more processes , the rest will have to wait untill the cpu is free and canbe rescheduled

### Scheduling queues

- JOB queue : as processes enter the system , they are put into a job queue which consiss of all processes in the system

- READY QUEUE : the processes that are residing in main memory and are ready and wait to execute are kept on a list called the ready queue

## context switch

- interrupts cause the operating system to change a CPU from it's current task ans to run a kernel routine 

- such operation happed requently on general putpose systems 
  
  #### when a interrupt occurs , the system needs to save the current context of the process currently running on the CPU so that it can restore that context when it's processing is done , essentially suspending the process and then resuming it

- the context is re presented in the PCB(process control block) of the process 
  
  ### switching the cpu to another processes requires performing a state save of the current process and a state store of different process
  
  - context swithc time is pure overhead because the system does no useful work while switching 
  
  - it's speed varies from machine to machine , depending on the memory speed the number of register that must be copied and existence of special intructions (such as a single instruction to load or store all registers)
