## set redis value string 
    SET user:101:time-zome UTC-8
    // to set a string value
    GET user:101:time-zone

    SET usage:63 '{"name":"raka","age":44}' EX 7200
    // store a json data and delete it 7200 second later

# strings 
- Text data
- integer and floating point number 
- binary data
- Maximum of 512MB

- strings basic of storage 
- encoding verified before command execution 
- strings can be manupulated as text , float and integer 

## manupulate strings 
    DECR // for decreament key
    INCR // for increment key 
    INCRBYFLOAT // for loating point integer 

    SET inventory:4x100-men-final 1000
    GET inventory:4x100-men-final // "1000" , gives value as string
    DECRBY inventory:4x100-men-final 1 // retruns (integer)999 
    GET inventory:4x100-men-final // return "999"

    TYPE inventory:4x100-men-final // string

    OBJECT ENCODING inventory:4x100-men-final // int


    SET inventory:4x100-men-final "sold out"
    OBJECT ENCODING inventory:4x100-men-final // "emberstr" 
    DECRBY inventory:4x100-men-final 10 // error

## create value pare
    HSET player:42 name raka race wlf level 4 hp 20 gold 20

    HSET player:42 status dazed //set a new key  value pare 

    HDEL player:42 status  // delete status key and it's value

    HGETALL player:42 // see all the key value

    HINCRBY player:42 gold 120  // increment the gold value by 120   













