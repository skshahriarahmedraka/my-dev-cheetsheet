# Problems of JWT 

## Weak Algorithms 
- Give developers too many algorithms to choose 
- Some algorithms are known to be vulnerable 
  - RSA PKCSv1.5 L padding oracle attack 
  - ECDSA: invalid- curve attack 


## Trival Forgery 
- Set "alg" header to "none"
- Set "alg" header to "HS256" while the server normally verifies token with RSA public key

