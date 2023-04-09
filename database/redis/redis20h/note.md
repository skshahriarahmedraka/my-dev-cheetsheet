## shutdown
	shutdown save
	shutdown nosave
	

## redis
    - redis is in memory, key value pare store 
    - DEL [KEY...]
    SET name "raka"
    SET fname "shahriar ahmed raka"
    GET name 
    // "raka"
    GET fname 
    // "shahriar ahmed raka"
    DEL name
    // (integer) 1
    GET name 
    // (nil)
## EXISTS 
    - EXISTS [VALUE...]
    EXISTS name 
    // (integer) 1
    DEL name
    // (integer) 1
    EXISTS name
    // (integer) 0
    EXISTS lname rname fname
    // (integer) 3
## SET with EXPIRE
    SET raka val EX 120 
    // key: raka & value:val will be deleted in 120 secend
    TTL raka
    // time remaing
    // (integer) 46
## EXPIRE 
    -EXPIRE [KEY] [TIMEinSECOND]
    EXPIRE raka 10
    // raka will expire in 10 seceond
    // after EXPIRE time it will count -1,-2 etc
## SET with EXPIRE with milisecond 
    - SET raka val PX 10000
    // 10 second/10000 milisecond 
    PTTL raka
    // show remaining time in millisecond 
    PEXPIRE raka 100
    // expire after 100 milisecond 
## info 
    info 
    // gives information
    info stats
    info keyspace
    quit 
    // quit the redis termial


































