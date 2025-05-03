# [PASETO] Platform-Agnostic SEqurity TOkens

## Stronger Algorithms

- developers don't have to choose Algorithms
- Only need to select the version of PESETO 
- Each version has 1 strong cipher suite 
- Only 2 most recent PESETO versions are accepted 

- v1 [compatible with legacy system]
  - local:<symetric key >
    - Authenticated Encription 
    - AES256 CTR + HMAC SHA384 
  - public: <asymmetric key>
    - Digital Signature 
    - RSA PSS+ SHA384 

## Non-trival Forgery

- No more "alg" header or "none" Algorithms

- everything is Authenticated

- encripted payload for local use <symmetric key>

- v2[recomended]
  
  - local :<symmetric key>
    - Authenticated Encription
    - XChaCha20-Poly1305 
  - public: <asymetric key>
    - Digital Signature
    - Ed25519 [EdDSA+Curve25519]
