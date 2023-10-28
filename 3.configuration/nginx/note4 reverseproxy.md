reverse proxy :  A reverse proxy  is a server that sits in front of webserver and forwards client (e.g.  web browser) 

server proxies are typically implemented to help increase security, performance and reliability 

benefit of reverse proxy - 

load balancing :  A popular website that gets millions of users every day may not be able to handle all of its incomming site traffic with a single origin server , instead , the site can be distributed among a pool a different servers , all handling requests for the same site 

A reverse proxy can provide a load balancing solution which will
distribute the incoming traﬃc evenly among the diﬀerent servers to
prevent any single server from becoming overloaded.
➤ Protection from attacks - With a reverse proxy in place, a web site
or service never needs to reveal the IP address of their origin
server(s). This makes it much harder for attackers to leverage a
targeted attack against them such as DOS attack, CDN attack and
more.

➤ Benefits of Reverse Proxy -
➤ Caching - A reverse proxy can also cache content, resulting in
faster performance.
➤ SSL encryption -
Encrypting and decrypting SSL
communications for each client can be computationally
expensive for an origin server. A reverse proxy can be
configured to decrypt all incoming requests and encrypt all
outgoing responses, freeing up valuable resources on the
origin server.

use nginx as reverse proxy 

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
        listen 80 ;
        server_name 206.189.132.205 ;
        
        location / {
            proxy_pass http://104.131.80.130 ;

        }
    server {
        listen 8080 ;
        server_name 206.189.132.205;
        location / {
            proxy_pass http://206.189.130.80;
            }
        }
    }
}
```

### X-Real-IP directive

```
nginx -V 

./configure --help  | grep realip 
```

```
./configure [all nginx -V modules] [realip module] [stream ip moudle]


// compile and build nginx
make 
make install
```

in reverse proxy nginx  

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
        listen 80 ;
        server_name 206.189.132.205 ;
        
        location / {
            proxy_pass http://104.131.80.130 ;
            ## this will forward the ip of the real client/browser    
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;

        }
    server {
        listen 8080 ;
        server_name 206.189.132.205;
        location / {
            proxy_pass http://206.189.130.80;
            }
        }
    }
}
```

as a application server we use nginx , and we have to create log manullly 

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
        listen 80 ;
        server_name 104.131.80.130 ;
        
        root /bloggingtemplate ;   
      
    }
}
```

## File cache in nginx server

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

        listen 80 ;
        server_name 104.131.80.130 ;
            
        root /bloggingtemplate ;   
            
        ## this only cache port.jpg file 
        location = /port.jpg {
            return 200 "hello this is dummy location";
            add_header Cache-control public ;
            add_header Pragma public ;        
            add_header Vary Accept-Encoding;
            expires 2M ;    
        }
        
        ## this will cache all the file    
        location ~* \.(css|js|jpg|jpeg|png) {
            return 200 "hello this is dummy location";
            add_header Cache-control public ;
            add_header Pragma public ;        
            add_header Vary Accept-Encoding;
            expires 2M ;    
        }
    
        
      
    }
}
```

compress the files using gzip 

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
    
    ## will compress all the server into gzip 

    gzip on ;

    gzip_comp_level 4 ; ## higher the level more cpu it uses 

    gzip_types text/plain text/css application/json application/x-javascript 

    text/xml application/xml+rss text/javascript application/javascript;
    
    server {

        listen 80 ;
        server_name 104.131.80.130 ;
            
        root /bloggingtemplate ;   
            
        ## this only cache port.jpg file 
        location = /port.jpg {
            return 200 "hello this is dummy location";
            add_header Cache-control public ;
            add_header Pragma public ;        
            add_header Vary Accept-Encoding;
            expires 2M ;    
        }
        
     
    
        
      
    }
}
```

we will get compression in browser but not in `curl`

```
## this will not be gzip / not compressed
curl -I http://104.131.80.130/assets/js/jquery.js 


## this will be compressed 
curl -H "Accept-Encoding: gzip,deflate" -I http://104.131.80.130/assets/js/jquery.js 
```

## micro Caching in nginx

```
suer www-data ;
worket_processes auto ;
pid /run/nginx.pid ;
include /etc/nginx/modules/ngx_http_image_filter_module.so;

event {
    worker_connections 768 ;
    # multi_accept on ;
}

http {
    include /etc/nginx/mime.types ;
    access_log /var/log/nginx/access.log;
    error_log /var/log/nginx/error.log ;
    
    
    fastcgi_cache_path /tmp/cache_nginx levels=1:2 keys_zone=ZONE_1:100m inactive=60m;
    fastcgi_cache_key "$scheme$request_methos$host$requst_uri";

    add_header X-Cache $upstream_cache_status;
    
    server {

        listen 80 ;
        server_name 104.131.80.130 ;
            
        root /bloggingtemplate ;   
            
        ## this only cache port.jpg file 
        location / {
             try_files $uri $uri/ =404 ;
        }

        location ~\.php$ {
            # pass php requests to the php-fpm service (fastcgi)
            include fastcgi.conf;
            fastcgi_pass unix:/run/php/php7.2-fpm.sock;

            fastcgi_cache ZONE_1 ;
            fastcgi_cache_valid 200;
        }
        
     
    
        
      
    }
}
```
