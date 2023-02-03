## cache control header

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
        server_name 104.131.80.130 ;
        root /bloggingtemplate ;
                 
        location / {
              try_files $uri $uri/ =404;
        }
        ## no png file will be cached 
        location ~ \.(png) {
            try_files $uri $uri/ =404;
            add_header Cache-Control no-store;
        }
      
    }
}
```

allow or deny by ip

```
location /admin {
       allow 190.99.00.71;
        deny all;
}
```

block list of ip

`touch whitelistip` 

in nginx.config

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
        server_name 104.131.80.130 ;
        root /bloggingtemplate ;
                 
        location / {
              try_files $uri $uri/ =404;
        }
        ## no png file will be cached 
        location ~ \.(png) {
            try_files $uri $uri/ =404;
            include /etc/nginx/whitelistip;
            deny all ;
        }
      
    }
}
```

\\\ from 0 to 30MB will get maxium bandwith

limit_rate_after 30m ;

\\\ all other download will get 500KB per sec  

limit_rate 500k 

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
        server_name 104.131.80.130 ;
        root /bloggingtemplate ;
                 
        location / {
              try_files $uri $uri/ =404;
              ## from 0 to 30MB will get maxium bandwith
              limit_rate_after 30m ;
              ## all other download will get 500KB per sec  
             limit_rate 500k ; 
        }
        ## no png file will be cached 
        location ~ \.(png) {
            try_files $uri $uri/ =404;
            include /etc/nginx/whitelistip;
            deny all ;
        }
      
    }
}
```
