optimize performance in nginx

buffer : buffer size is another aspect to manage the nginx  performance 

if buffer size are too low  then nginx will have to write to a temporary fle causing the disk to read  and write constantly

client_body_buffer_size : this handles the client buffer size, meaning any POST actions sent to Nginx . POST actions are typically from submission .

client_header_buffer_size : similar to previous directive , only instead it handles the cliet header size 

client_max_body_size : the maximum allowed size for a  client request . if the maximum size is exceeded then nginx will spit out a 413 error or request entity too large 

time outs:

    - client_body_timeout and client_header_timeout directives are responsible for the time a server will wait for a client body or client header to be sent after request . if neither a body or header is sent, the server will issue a 408 error or request time out  

    - keepalive_timeout  assigns the timeout for keep alive connections with the client nginx will close connections with the client after this period of time

    - send_time out is stablished not on the entier transfer of answer but only between two operations of reading , if after this time client will take  nothing then nginx is shutting down the connection

Gzip compression :

- Gzip can help reduce the amount of network transfer Nginx deals with. how ever be careful increasing the **gzip_com_level** too high as the server will begin wasting cpu cycle 

- ```
  gzip    on ;
  gzip_com_level 2 ;
  gzip_min_length 1000;
  gzip_types     text/plain application/x-javascipt text/xml text/css application/xml;
  ```

```
 

static file caching :

- it's possible to set expire headers for files that don't change and served regularly . this directive canbe added to the actual nginx server block

- ```
location ~* .(jpg|jpeg|png|gif|ico|css|js)$ {
    expires 365d ;
}
```

- complete nginx config with performance optimization 

```
user www-data ;
worker_processes auto ;
event {
    worket_connection 1024 ;
}
http {
    include mime.types ;
    
    #buffer size for post submissions 
    client_body_buffer_size 10k ; # 100,100k.100M ;
    client_max_body_size 8m;

    #buffer size for headers 
    client_header_buffer_size 1k ;

    # max time to receive client headers/body 
    client_body_timeout 12 ;
    client_header_timeout 12 ;
    
    # max time to keep a connection open for 
    keepalive_timeout 15;

    # max time for client accept/receive a response 
    send_timeout 10 ;
    
    # skip buffering for static files 
    sendfile on;
    
    # optimised send file packets
    tcp_nopush on ;

    location ~* .(jpg|jpeg|png|gif|ico|css|js)$ {
          expires 365d ;
      }

}
```

## Adding dynamic modules

gd library is required before the module inclue 

```
sudo apt get install libgd-dev
```

see all the configure argument 

```
nginx -V
```

in `/nginx-1.19.1`

```
./configure  --help | grep dynamic 
```

now add `--with-http_image_filter_module=dynamic --modules-path=/etc/nginx/modules` 

```
./configure --with-cc-opt='-g -O2 -ffile-prefix-map=/build/nginx-d8gVax/nginx-1.18.0=. 
-flto=auto -ffat-lto-objects -flto=auto 
-ffat-lto-objects -fstack-protector-strong -Wformat 
-Werror=format-security -fPIC -Wdate-time -D_FORTIFY_SOURCE=2' 
--with-ld-opt='-Wl,-Bsymbolic-functions -flto=auto -ffat-lto-objects
 -flto=auto -Wl,-z,relro -Wl,-z,now -fPIC' --prefix=/usr/share/nginx 
--conf-path=/etc/nginx/nginx.conf --http-log-path=/var/log/nginx/access.log
 --error-log-path=/var/log/nginx/error.log --lock-path=/var/lock/nginx.lock 
--pid-path=/run/nginx.pid --modules-path=/usr/lib/nginx/modules 
--http-client-body-temp-path=/var/lib/nginx/body --http-fastcgi-temp-path=/var/lib/nginx/fastcgi 
--http-proxy-temp-path=/var/lib/nginx/proxy --http-scgi-temp-path=/var/lib/nginx/scgi 
--http-uwsgi-temp-path=/var/lib/nginx/uwsgi --with-compat --with-debug 
--with-pcre-jit --with-http_ssl_module --with-http_stub_status_module 
--with-http_realip_module --with-http_auth_request_module --with-http_v2_module 
--with-http_dav_module --with-http_slice_module --with-threads --add-dynamic-module=/build/nginx-d8gVax/nginx-1.18.0/debian/modules/http-geoip2 
--with-http_addition_module --with-http_gunzip_module --with-http_gzip_static_module 
--with-http_sub_module
 --with-http_image_filter_module=dynamic --modules-path=/etc/nginx/modules
```

now run make 

```
make


make install
```

```
ps -aux | grep nginx 
```

now you can find the module in `/etc/nginx/modules`

```
user www-data ;
worker_processes auto ;

## external module for working with image
load_module /etc/nginx/modules/ngx_http_image_filter_module.so;

event {
    worker_connection 1024 ;
}
http {
    include mime.types ;
    
    server {
        listen 80 ;
        server_name 104.131.80.130; 
        root /blogtemplate ;
        location = /assets/images/about/welcome-banner.jpg {
              # image will rotate 180 degree
              image_filter rotate 180 ;
        }
    }

}
```
