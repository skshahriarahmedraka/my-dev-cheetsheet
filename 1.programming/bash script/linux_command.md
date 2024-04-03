



## find file under /home/* directory in linux terminal

```
find /home -type f -name "*.txt"

```



### 

### find file under /home/* directory edited in last 5 days

```
find /home/* -type f -mtime -5

```



### find file under /home/* directory edited in last 5 hour

```
find /home -type f -mmin -300

```



### create directory with current time in linux terminal

```
mkdir "$(date '+%Y-%m-%d_%H-%M-%S')"
```


