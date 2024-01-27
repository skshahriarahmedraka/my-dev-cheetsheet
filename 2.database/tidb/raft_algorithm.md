## concensus algorithm 


### every NODE  consistes of 
- state machine 
- log 
- raft protocol 

### every NODE store key value data 

- if all NODE begin with same state and perform same operations in same order than all process will end up to same state 



### when one command come in NODE save the execution in the log 
### every NODE log should be the same as the other nodes 


### there are 3 types of NODE
- follower 
- condidate 
- leader

-- all replica NODE starts as FOLLOWER 
-- FOLLOWER NODE only recive command 
-- if LEADER NODE is not responsive FOLLOWER NODE have to select a LEADER
-- only LEADER take request from client 
-- if a client send request to a FOLLOWER , loadbalancer send the request to the leader 
-- there is a election time out , specific time interval within which the follower must hear back form leader
-- raft protocol randomize the election time out time , tipically it between 150ms to 300ms 
-- when FOLLOWER reached a timeout , it becomes a candidate ,
-- CANDIDATE requests votes from FOLLOWERs , if it gates majority vote it becomes LEADER 
-- FOLLOWER checks CANDIDATE log and if it matches  it gives vote 
-- HEART BEAT time is the signal that sends from LEADER to FOLLOWERs , so that FOLLOWERs know the LEADER is still alive 


-- when client sends a request , LEADER sets it to it's log 
-- LEADER send the operation to the FOLLOWERs, 
-- if mejority of FOLLOWERs append the set operation to their log , LEADER perform the operation in STATE MACHINE 
and send append entry message to the followers and followers performs the operation 





