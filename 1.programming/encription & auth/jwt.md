# JWT SIGNING ALGORITHM

## Symmetric digintal signature algorithm

- the same secret key is used to sign & verify token 
- For local use: internal services, where secret key can be shared
- HS256,HS384,HS512
  - HS256 = HMAC + SHA256 
  - HMAC : Hash-based Message Authentication  code
  - SHA: Secure  Hashing Algorithm 
  - 256/384/512: number of output bits 

## Asymmetric Digital signature Algorithm

- the private key is used to sign token 
- The public key is used to verify token 
- For public use: Internal Service signs token, but external services needs to verify 
- RS256,RS256,RS512 || PS256,PS384,PS512 || ES256,ES384,ES512
  - RS256= RSA PKCSv1.5 + SHA256 [PKCS: Public-Key Cyptography Standards]
  - PS256=RSA PSS + SHA256 [PSS: Probabilistic Signature Scheme ]
  - ES256= ECDSA+ SHA256 [ECDSA: Elliptic Curve Digital Signature Algorithm]
