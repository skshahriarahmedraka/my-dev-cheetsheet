```
cd /etc/nginx/

mkdir -p ssl 




openssl req -x509 -days 100 -nodes -newkey rsa:2048 -keyout 
/etc/nginx/ssl/self.key  -out /etc/nginx/ssl/self.cert
```

add SSL certificate :

```
suer www-data ;
worket_processes auto ;
pid /run/nginx.pid ;
include /etc/nginx/modules-enabled/*.config 

event {
    worker_connections 768 ;
    # multi_accept on ;
}

http {
    include /etc/nginx/mime.types ;
    access_log /var/log/nginx/access.log;
    error_log /var/log/nginx/error.log ;
    
   
    server {

        listen 443 ssl  ;
        server_name 104.131.80.130 ;
        
        ssl_certificate /etc/nginx/ssl/self.cert  ;
        ssl_ceretificate_key /etc/nginx/ssl/self.key ;  
        root /bloggingtemplate ;   
            
        
      
    }
}
```

## upgrade to http2

configure and install again using http module 

```
nginx -V 
// see all the already installed module
./configure --help | grep 'http'


./configure [all module] [http module]

make 
make install
```

```
user www-data ;
worket_processes auto ;
pid /run/nginx.pid ;
include /etc/nginx/modules-enabled/*.config 

event {
    worker_connections 768 ;
    # multi_accept on ;
}

http {
    include /etc/nginx/mime.types ;
    access_log /var/log/nginx/access.log;
    error_log /var/log/nginx/error.log ;
    
   
    server {

        listen 443 ssl http2 ;
        server_name 104.131.80.130 ;
        
        ssl_certificate /etc/nginx/ssl/self.cert  ;
        ssl_ceretificate_key /etc/nginx/ssl/self.key ;  
        root /bloggingtemplate ;   
            
        
      
    }
}
```

## Rate limit for prevent DDOS attack

```
apt install siege 


// send  multiple request 


siege -v -r 2 -c 5 http://104.131.80.30/assets/js/custom.js
```

add rate limit 

```
user www-data ;
worket_processes auto ;
pid /run/nginx.pid ;
include /etc/nginx/modules-enabled/*.config 

event {
    worker_connections 768 ;
    # multi_accept on ;
}

http {
    include /etc/nginx/mime.types ;
    access_log /var/log/nginx/access.log;
    error_log /var/log/nginx/error.log ;
    
    limit_req_zone $request_uri zone=test_zone:10m rate=1r/s ;
   
    server {

        listen 443 ssl http2 ;
        server_name 104.131.80.130 ;
        
        ssl_certificate /etc/nginx/ssl/self.cert  ;
        ssl_ceretificate_key /etc/nginx/ssl/self.key ;  
        root /bloggingtemplate ;   
            
        location  / {
            limit_req zone=test_zone ;
            try files $uri $uri/ =404 ; 
        }
      
    }
}
```

here most of the request will fail

```
siege -v -r 2 -c 20 http://104.131.80.130/assets/js/custom.js
```

burst limit will put every excess request in queue 

```
user www-data ;
worket_processes auto ;
pid /run/nginx.pid ;
include /etc/nginx/modules-enabled/*.config 

event {
    worker_connections 768 ;
    # multi_accept on ;
}

http {
    include /etc/nginx/mime.types ;
    access_log /var/log/nginx/access.log;
    error_log /var/log/nginx/error.log ;
    
    limit_req_zone $request_uri zone=test_zone:10m rate=1r/s ;
   
    server {

        listen 443 ssl http2 ;
        server_name 104.131.80.130 ;
        
        ssl_certificate /etc/nginx/ssl/self.cert  ;
        ssl_ceretificate_key /etc/nginx/ssl/self.key ;  
        root /bloggingtemplate ;   
            
        location  / {
            limit_req zone=test_zone burst=5 nodelay ;
            try files $uri $uri/ =404 ; 
        }
      
    }
}
```
