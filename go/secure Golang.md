# secure Golang

[Security - The Go Programming Language](https://go.dev/security/)

[Vulnerability DB | Snyk](https://security.snyk.io/vuln/golang)



A1: injection       - input

A2: broken Authentication        -authentication

A3: Sensitive Data Exposure          -output

A4: XML External Entity (XXE)          -input

A5: Broken Access Control        -authentication

A6: Security Misconfiguration        -infratructure

A7: Cross-site Scripting (XSS)            -output

A8: Insecure Deserializarion          -input

A9: Using Components with known vulnerabilities        -infratructure

A10: Insufficient Logging and Monitoring                -infratucture



### A1: injection - input

for avoid sql injection in database use 

    "database/sql"



use '' html/template "



authentication methods 

- basic 

- Oauth2

- jwt

- OICD

authorization and access control 

- ACL 

- RBAC



you can use 

```
http.ListenAndServeTLS
```

```
x/crypto/acme/autocert
```



for collecting matrices 

- expvar 

- prometheus



for autometic  security check 

[GitHub - securego/gosec: Golang security checker](https://github.com/securego/gosec)






