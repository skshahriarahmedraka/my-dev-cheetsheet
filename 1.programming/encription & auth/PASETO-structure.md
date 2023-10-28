# local

v2.local.QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ.UUUUUUUUUUUUUUUUUUUUU


- Version: v2 
- Purpose: local [symmetric-key authenticated encryption]
- Payload [hex-encoded]
  - body :
    - Encrypted :
      QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ
    - Decoded :
      { "data ": "MyData","exp":"ffhweoif"}
  - Nonce: 98258588UUUUUUUUUUU 
  - Authentication Tag : 6546547547 
- Footer :
  - Encoded : UUUUUUUUUUUUUUUUUUUUU

# Public 

v2.public.QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ.UUUUUUUUUUUUUUUUUUUUU

- Version: v2
- Purpose : public [asymmetric-key digital signature]
- payload :
  - Body :
    - Encoded: [base64]
      QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ
    - Decoded :
      { "data": "Mydata", "exp":"dsg"}
  - signature : [hex-encoded]
    UUUUUUUUUUUUUUUUUUUUU

  





