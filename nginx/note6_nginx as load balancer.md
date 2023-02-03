## nginx as load balancer

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
    
    
    upstream appserver {
           server 104.131.80.130;
           server 167.172.161.192 ;
    }
   
    server {            
        location  / {
             proxy_pass http://appserver;
        }
      
    }
}
```

fail time out is how many faild req  an d fail time out is how much time 

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
    
    
    upstream appserver {
           server 104.131.80.130 max_fails=5 fail_timeout=30s;
           server 167.172.161.192 ;
    }
   
    server {            
        location  / {
             proxy_pass http://appserver;
        }
      
    }
}
```

## health check

```
server {
    location / {
        proxy_pass http://backend ;
        health_check ;
    }
}
```

```
server {
    location / {
        proxy_pass http://backend ;
        health_check port=8080;
    }
}
```

```
server {
    location / {
        proxy_pass http://backend ;
        health_check interval fails=3 passes=2;
    }
}
```

```
server {
    location / {
        proxy_pass http://backend ;
        health_check uri=/some/path;
    }
}
```

```
http {
    #..
    match server_ok {
        status 200-399;
        body !~ "maintenance mode";
    }
    server {
        #..
        location / {
            proxy_pass http://backend;
            health_check match=server_ok;
        }
    }
}
```
