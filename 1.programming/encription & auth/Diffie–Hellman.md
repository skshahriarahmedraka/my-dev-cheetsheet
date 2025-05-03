alice -

1. generate private random number 15

2. calclulate (3^15) % 17  = 6

bob -

1. generate private random number 13 

2. calculte (3^13) % 17  =12

alice give public key 6 and bob gives public key 12 

alice -

1. takes bob's public key 12 and calculate (12^15) % 17 = 10 

bob -

1. takes alice's public key 6 and calculate (6^13) % 17 = 10 

## both generates same master key 10 , middle man only sees public key 6 & 12
