load static site using nginx 

```
event {

}

http {
    server {
    listen 80 ;
    server_name 104.131.80.130;

    root /blogingtempelate/ ;

    }
}
```

reload the config

```
sudo systemctl restart nginx
```

or reload 

```
nginx -s reload
```

test the nginx config

```
nginx -t
```

see all the logs of nginx 

```
tail -f /var/log/nginx/*
```

if type is not defined in `nginx.config` than all the file will be `plain/text`

`nginx.config` 

```

```

event {

}

http {
    types {
        text/html html ;
        text/css css ;
    }
    server {
        listen 80 ;
        server_name 104.131.80.130;

        root /blogingtempelate/ ;

    }
}

```

```

file `mime.types` has all the file types

include `mime.types` for support all files

```
event {

}

http {
    include mime.types ;
    server {
        listen 80 ;
        server_name 104.131.80.130;

        root /blogingtempelate/ ;

    }
}
```

location for perticular route

```
event {

}

http {
    include mime.types ;
    server {
        listen 80 ;
        server_name 104.131.80.130;

        root /blogingtempelate/ ;

        location /contactus {
            return 200 "hello bro from /contactus"
        }

    }
}
```

modifier for location route 

(none) : if no modifier are present, the location is interpreted as prefix match, this means that the location given will be matched against the begining of the request URI  to determine a match 

=  :-  if an equal signed is used this block will considered a match if the request URI  exactly matches the location given 

~ : if tilde modfied is present , this location will be interpreted as case sensetive regular expression match 

~*  : if a tilde and asterisk modified is  used , the location block will be interpreted as a case insensitive regular expression match 

^~ : if a carat and tilde modified is present and if this block is selected as best non regular expression match regeular expression matching will not take place 

```
event {

}

http {
    include mime.types ;
    server {
        listen 80 ;
        server_name 104.131.80.130;

        root /blogingtempelate/ ;

        location /contactus {
            return 200 "hello bro from /contactus";
        }
        
        # exact match will be executed
        location = /contactus {
            return 200 "hello bro from /contactus exect match";
        }


    }
}
```

```
event {

}

http {
    include mime.types ;
    server {
        listen 80 ;
        server_name 104.131.80.130;

        root /blogingtempelate/ ;

        
        # not case sensetive
        location ~* /contactUS {
            return 200 "hello bro from regex incase sensetive";
        }


    }
}
```

see and follow logs in nginx 

```
tail -f /var/log/nginx/*
```

```
event {

}

http {
    include mime.types ;
    server {
        listen 80 ;
        server_name 104.131.80.130;

        root /blogingtempelate/ ;

        if ($arg_name == 'raka'){
            return 200 "hello i am raka";
        }

        ## if route is /guest/name then redirect to /welcome 
        rewrite ^/guest/\w+  /welcome ;


        ## if route is /user/name than redirect to /welcome/name 
        rewrite ^/user/(\w+) /welcome/$1 ;

        ## exact match will be used
        location = /welcome/raka {
            return 200 "hello raka welcome !!!";
        }


        location /welcome {
            return 301 /assets/image/banner.jpg;
        }


        location /find {
            return 200 " $hostname \n $args \n $connection_requests    
             \n $nginx_version" ;
        }

   





    }
}
```

try a perticuler uri if not valid than redirect to another uri 

```
events {

}
http {
    include mime.types ;
    
    server {
        listen 8081 ;
        server_name 104.131.80.130 ;
        root /bloggingtemplate ;
        
        ## any uri with invalid path will redirect to /video
        try_files /testroute /video ;
        location /video {
              return 200 "enjoy the movie !!! ";
        }
    }
}
```

```
events {

}
http {
    include mime.types ;
    
    server {
        listen 8081 ;
        server_name 104.131.80.130 ;
        root /bloggingtemplate ;
        
        ##  uri with invalid path & any invalid sub URI  will redirect 
        ##  to /video
        try_files $uri /assests/images /video ;
        location /video {
              return 200 "enjoy the movie !!! ";
        }
    }
}
```

```
events {

}
http {
    include mime.types ;
    
    server {
        listen 8081 ;
        server_name 104.131.80.130 ;
        root /bloggingtemplate ;
        
        ## check first uri than 2nd and then third 
        try_files $uri /assests/images /video /404 ;
        location /video {
              return 200 "enjoy the movie !!! ";
        }
        location /404 {
            return 404 "sorry this resource doesnot found"
}
    }
}
```

delete all data from a file 

```
> filename.extention
```

list of all file in current directory 

```
ll -lsh
```

create log for a route in a perticular log file 

```
event {

}

http {
    include mime.types ;
    
    server {
        listen 8081 ;
        server_name 104.131.80.130;
        
        root /blogsite ;
       ## this log will be only written in access_user.log
        location /userdata {
            access_log /var/log/nginx/access_user.log ;
            return 200 "User data is published";
        }
       ## off logging in perticuler directory 
        location /userdata {
            access_log off ;
            return 200 "User data is published";
        }
    }
}
```

install php-fpm 

```
sudo apt install php-fpm
sudo systemctl status phpp7.2-fpm
```

serve website 

```
event {

}
http {
    include mime.types ;
    
    server {
        listen 80 ;
        server_name 104.131.80.130;
        root /blogingtemplate ;

        index  index.php index.html;
        ## this will serve all html css and js 
    }
}
```

```
event {

}
http {
    include mime.types ;
    
    server {
        listen 80 ;
        server_name 104.131.80.130;
        root /blogingtemplate ;

        index  index.php index.html;
        ## this will serve all html css and js 

        location / {
            try_files $uri $uri/ =404 ;
        }
    }
}
```

include configaration from `/etc/nginx/fastcgi.conf`

find a file from root 

```
find / -name "*fpm.sock"
```

```
event {

}
http {
    include mime.types ;
    
    server {
        listen 80 ;
        server_name 104.131.80.130;
        root /blogingtemplate ;

        index  index.php index.html;
        ## this will serve all html css and js 

        location / {
            try_files $uri $uri/ =404 ;
        }
        location ~\.php$ {
            include fastcgi.conf 
            fastcgi_pass unix:/run/php/php7.2-fpm.sock;    
        }
    }
}
```

if php process is run in differrent user form nginx than there will be permission denied error 

for this error we have to define the same user  as  php inside nginx 

```
user www-data ;

event {

}
http {
    include mime.types ;
    
    server {
        listen 80 ;
        server_name 104.131.80.130;
        root /blogingtemplate ;

        index  index.php index.html;
        ## this will serve all html css and js 

        location / {
            try_files $uri $uri/ =404 ;
        }
    }
}
```

- nginx defalult worket process are 1 

- worker processes can be defined via directive  worker_processes 

- this directive is responsible for letting our virtual server know how many worker to spawn once it  has become bound to the proper IP and ports 

- It is common practice to run 1 worker process per core Cpu 

- anything above idle process usually just lying about 

- worker process directive belongs to global context  

- worker connection: this directive tells out worket processes how many people can simultaneously be served by nginx 

- this is the child of event context 

- the default value 768 ; how ever, considering that every browser userlly opens up at least 2 connection/server , this number can half 

- user can check our core's limitations by issuing a ulimit command :  `ulimit -n`

- worker_connection 1000 - this means, NGINX can server 1000 client/second

see all the nginx process

```
ps -aux --forest | grep nginx 
```

number of cpu 

```
lscpu
// or 
nproc
```

```
user www-data ;
## one master proecess and 4 worker process under www-data user is created 
worker_processes 4 ;
## if `worket_processes auto` nginx automatic created 
event {
worker_connections 1024 ;
## now this worker process can handle 1024 request per second 
}
http {
    include mime.types ;
    
    server {
        listen 80 ;
        server_name 104.131.80.130;
        root /blogingtemplate ;

        index  index.php index.html;
        ## this will serve all html css and js 

        location / {
            try_files $uri $uri/ =404 ;
        }
    }
}
```
