## 2019  part A 
1(a)
   Data Communication is defined as exchange of data between two devices via some form of transmission media such as a cable, wire or it can be air or vacuum also. For occurrence of data communication, communicating devices must be a part of communication system made up of a combination of hardware or software devices and programs
  Data Communication System Components :
There are mainly five components of a data communication system:

1. Message
2. Sender
3. Receiver
4. Transmission Medium
5. Set of rules (Protocol)      


    Message :
    This is most useful asset of a data communication system. The message simply refers to data or piece of information which is to be communicated. A message could be in any form, it may be in form of a text file, an audio file, a video file, etc.


    Sender :
    To transfer message from source to destination, someone must be there who will play role of a source. Sender plays part of a source in data communication system. It is simple a device that sends data message. The device could be in form of a computer, mobile, telephone, laptop, video camera, or a workstation, etc.


    Receiver :
    It is destination where finally message sent by source has arrived. It is a device that receives message. Same as sender, receiver can also be in form of a computer, telephone mobile, workstation, etc.


    Transmission Medium :
    In entire process of data communication, there must be something which could act as a bridge between sender and receiver, Transmission medium plays that part. It is physical path by which data or message travels from sender to receiver. Transmission medium could be guided (with wires) or unguided (without wires), for example, twisted pair cable, fiber optic cable, radio waves, microwaves, etc.


    Set of rules (Protocol) :
    To govern data communications, various sets of rules had been already designed by the designers of the communication systems, which represent a kind of agreement between communicating devices. These are defined as protocol. In simple terms, the protocol is a set of rules that govern data communication. If two different devices are connected but there is no protocol among them, there would not be any kind of communication between those two devices. Thus the protocol is necessary for data communication to take place.

1(b)

A digital signal is a defined (by me) as coded binary data transmitted and received over a time interval through a selected channel
Digital data may exist either as a coded binary signal that propagates over time OR as a composite set of static binary data that is read from a storage device such as electronic memory. In principle it is exactly the same as reading the one’s and zero’s from a (rather lengthy) printed document.

Parameters 	Data 	Signal
• What is it ? 
	- Data is the information we want to transmit. 	
  - Signal is the waveform format used to send data over channel.
• Function 	
  - Acts as payload of carrier 	
  - Acts as carrier which carries data or payload.
• Measurement quantity 	
  - Bit rate in bps or Kbps or Mbps or Gbps 	
  - Signal rate or baud rate in Baud, KBaud or Mbaud
• Affecting data communication parameter 	
  - Speed, Higher the bit rate higher is the speed 	
  - Bandwidth, lower the signal rate, lower is the bandwidth
• Format 	Analog (Continuous) or digital form (Binary or discrete) 	
  - Analog (Electric, EM or Optical) or digital form (i.e. pulse such as NRZ or RZ )



1(c)

Standards : 

Standards are the set of rules  for data communication that are needed for  exchange of information among devices. It is important to follow Standards which are created by various  Standard Organization like IEEE , ISO , ANSI etc.

Types of Standards :

Standards are of two types :

    De Facto Standard.
    De Jure  Standard.

De Facto Standard :  The meaning of the work ” De Facto ”  is ” By Fact ”  or “By Convention”.
These are the standard s that have not been approved by any Organization , but have been adopted as  Standards  because of it’s widespread use. Also , sometimes these standards are often established by Manufacturers.

For example :   Apple  and Google are two companies which established their own rules on their products which are different . Also they use some same standard rules for manufacturing for their products.

De Jure Standard :  The meaning of the word “De Jure”  is  “By Law” or “By  Regulations” . 
Thus , these are the  standards that have been approved by officially recognized body like ANSI , ISO , IEEE etc. These are the standard which are important to follow if it is required or needed.

For example :  All the data communication standard  protocols like SMTP , TCP , IP , UDP etc. are important to follow the same when we needed them. 

2.(a)

Both Bit rate and Baud rate are generally used in data communication,

Bit rate is the transmission of number of bits per second. On the other hand, Baud rate is defined as the number of signal units per second. The formula which relates both bit rate and baud rate is given below:

Bit rate = Baud rate x the number of bit per baud. 
Let’s see the difference between Bit Rate and Baud Rate:

S.NO	Bit Rate	Baud Rate
1.	Bit rate is defined as the transmission of number of bits per second.	
Baud rate is defined as the number of signal units per second.
2.	Bit rate is also defined as per second travel number of bits.	
Baud rate is also defined as per second number of changes in signal.
3.	Bit rate emphasized on computer efficiency.	
While baud rate emphasized on data transmission.
4.	The formula of Bit Rate is:= baud rate x the number of bit per baud 
The formula of Baud Rate is:= bit rate / the number of bit per baud 
5.	Bit rate is not used to decide the requirement of bandwidth for transmission of signal.	
While baud rate is used to decide the requirement of bandwidth for transmission of signal.

Bit rate – the number of binary ‘bits’, 1s or 0s to be transmitted per second
Baud rate – the number of line ‘symbols’ transmitted per second
Channels – the number of transmission channels
So to convert bit rate to baud rate you multiple baud rate by the number of bits per symbol by the number of channels being used:

Bit rate = baud rate * bits per symbol * Channels

2.(b)

https://www.rfwireless-world.com/Terminology/Difference-between-encoding-and-modulation.html
https://www.tutorialspoint.com/digital_communication/digital_communication_data_encoding_techniques.htm

Encoding is the process of converting the data or a given sequence of characters, symbols, alphabets etc., into a specified format, for the secured transmission of data. Decoding is the reverse process of encoding which is to extract the information from the converted format.

Data Encoding
Encoding is the process of using various patterns of voltage or current levels to represent 1s and 0s of the digital signals on the transmission link.

The common types of line encoding are Unipolar, Polar, Bipolar, and Manchester.

Encoding Techniques
The data encoding technique is divided into the following types, depending upon the type of data conversion.

Analog data to Analog signals − The modulation techniques such as Amplitude Modulation, Frequency Modulation and Phase Modulation of analog signals, fall under this category.

Analog data to Digital signals − This process can be termed as digitization, which is done by Pulse Code Modulation PCM. Hence, it is nothing but digital modulation. As we have already discussed, sampling and quantization are the important factors in this. Delta Modulation gives a better output than PCM.

Digital data to Analog signals − The modulation techniques such as Amplitude Shift Keying ASK, Frequency Shift Keying FSK, Phase Shift Keying PSK, etc., fall under this category. These will be discussed in subsequent chapters.

Digital data to Digital signals − These are in this section. There are several ways to map digital data to digital signals. Some of them are −

Non Return to Zero NRZ
NRZ Codes has 1 for High voltage level and 0 for Low voltage level. The main behavior of NRZ codes is that the voltage level remains constant during bit interval. The end or start of a bit will not be indicated and it will maintain the same voltage state, if the value of the previous bit and the value of the present bit are same.

The following figure explains the concept of NRZ coding.

Non Return to Zero
If the above example is considered, as there is a long sequence of constant voltage level and the clock synchronization may be lost due to the absence of bit interval, it becomes difficult for the receiver to differentiate between 0 and 1.

There are two variations in NRZ namely −

NRZ - L NRZ–LEVEL
There is a change in the polarity of the signal, only when the incoming signal changes from 1 to 0 or from 0 to 1. It is the same as NRZ, however, the first bit of the input signal should have a change of polarity.

NRZ - I NRZ–INVERTED
If a 1 occurs at the incoming signal, then there occurs a transition at the beginning of the bit interval. For a 0 at the incoming signal, there is no transition at the beginning of the bit interval.

NRZ codes has a disadvantage that the synchronization of the transmitter clock with the receiver clock gets completely disturbed, when there is a string of 1s and 0s. Hence, a separate clock line needs to be provided.

Bi-phase Encoding
The signal level is checked twice for every bit time, both initially and in the middle. Hence, the clock rate is double the data transfer rate and thus the modulation rate is also doubled. The clock is taken from the signal itself. The bandwidth required for this coding is greater.

There are two types of Bi-phase Encoding.

Bi-phase Manchester
Differential Manchester
Bi-phase Manchester
In this type of coding, the transition is done at the middle of the bit-interval. The transition for the resultant pulse is from High to Low in the middle of the interval, for the input bit 1. While the transition is from Low to High for the input bit 0.

Differential Manchester
In this type of coding, there always occurs a transition in the middle of the bit interval. If there occurs a transition at the beginning of the bit interval, then the input bit is 0. If no transition occurs at the beginning of the bit interval, then the input bit is 1.

The following figure illustrates the waveforms of NRZ-L, NRZ-I, Bi-phase Manchester and Differential Manchester coding for different digital inputs.

Differential Manchester
Block Coding
Among the types of block coding, the famous ones are 4B/5B encoding and 8B/6T encoding. The number of bits are processed in different manners, in both of these processes.

4B/5B Encoding
In Manchester encoding, to send the data, the clocks with double speed is required rather than NRZ coding. Here, as the name implies, 4 bits of code is mapped with 5 bits, with a minimum number of 1 bits in the group.

The clock synchronization problem in NRZ-I encoding is avoided by assigning an equivalent word of 5 bits in the place of each block of 4 consecutive bits. These 5-bit words are predetermined in a dictionary.

The basic idea of selecting a 5-bit code is that, it should have one leading 0 and it should have no more than two trailing 0s. Hence, these words are chosen such that two transactions take place per block of bits.

8B/6T Encoding
We have used two voltage levels to send a single bit over a single signal. But if we use more than 3 voltage levels, we can send more bits per signal.

For example, if 6 voltage levels are used to represent 8 bits on a single signal, then such encoding is termed as 8B/6T encoding. Hence in this method, we have as many as 729 36 combinations for signal and 256 28 combinations for bits.

These are the techniques mostly used for converting digital data into digital signals by compressing or coding them for reliable transmission of data


2.(c)

https://www.geeksforgeeks.org/analog-to-digital-conversion/

