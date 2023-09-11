### # Structured Logging for the Standard Library - Jonathan Amsterdam



```
packge main

import (
    "os"
"time" 
"log/slog"
)

func main(){
    ....
    logger := slog.New(slog.NewTestHandler(os.Stdout,nil))
    logger.Info("Processed item",
        "name": item.Name,
        "size": item.Size,
        "duration": time.Since(start),
        )
    
}
```

### slog works with log

```
slog.SetDefault(logger)

```

### json output

```
logger := slog.New(slog.NewJSONHandler(os,Stdout,nil))
```

### Use Attrs for Speed

```
slog.LogAttrs(ctx,slog.InfoLevel,"processed item",
    slog.String("name",Item.Name),
    slog.Int("size",item.Size),
    slog.Duration("duration",time.Since(start))    
)
```

### Attrs and Values

```
type Attr struct {
    Key string
    Value Value
}
func String(key ,value string) Attr {
    return Attr {
        Key: key ,
        Value : StringValue(value)
    }
}
type Value struct {...}
```

### Levels

- levels are integers

- some have names(Debug,info,warn,Erro)

- there's room in between for your own 

- info is zero 

- fixed offset form OpenTelemetry level numbers



### Levels

```
var level slog.Level
func main(){
    flag.TextVar(&level,"level",level,"log level")
    flag.Parse()
    opts := &slog.HandlerOptions{Level: level}
    logger:= slog.New(slog.NewJSONHandler(os.Stdout,opts))
}
```

### Groups

```
logger.Info("msg" ,slog.Group("name",
    "first","ren",
    "last","hoek")
)
```

### Problem: conflicting keys

```
// in alpha.org/thing1
logger.info("msg1", "value" , 5)

// in beta.com/thing2
logger.info("msg2", "value", "high") 


```

### Logger.WithGroup

```
thing1.Run(logger.WithGroup("thing1"))
thing2.Do(logger.WithGroup("thing2"))
```

### Logger.with

```
func handleRequest(w http.ResponseWriter,r *request.Request) {
    logger := slog.Default().With("path",r.URL.Path)
    logger.Info("start")
    process(w,r,logger)    
}

func process(){
    lg.Info("doing","item",r.FormValue("item"))
    ...
}
```

### the LogValue Method

```
type Name struct {
    First,Last string
}
func (n Name) LogValue() slog.Value{
    return slog.GroupValue(
       slog.String("first",n.First),
       slog.String("last",n.Last)
    )
}
```

### LogValue in Action

```
logger.Info("msg","name",Name{"Hen","Hoek"})
```

### The Handler Interface

```
type Handler interface {
    Enabled(context.Context,Level) bool
    Handle(context.Context,Record) error
    WithGroup(name string) Handler
    WithAttrs(attrs []Attr) Handler
}
```

### handling a Record

```
type MyHandler struct {w io.Writer; ... }

func (h *MyHandler) Handle (ctx context.Context, r slog.Record) error{
    fmt.Fprintf(h.w, "Time: %s\n",r.Time)
    fmt.Fprintf(h.w, "Level: %s\n",r.Level)
    fmt.Fprintf(h.w, "Message: %s\n",r.Message)
    ...
    r.Attrs(func(a slog.Attr)bool {
        fmt.Fprintf(h.w, "%s: %v\n", a.key,a.value)
        return true
    })
    return nil
} 
```



### make slog faster

- server proess thousands of request per minute

- each requst can generate thousand of log messages 

- each log message may require non-trivial processing



### Direct vs indirect calls

direct calls to the cum don't alllocate 

```
func main() {fmt.Println(sum(1,2,3))}
```

indirect all might 

accurate escape analysis needs  the call function's code

```
type summer interface {
    sum(...int) int
}
type s struct {}
func (s) sum(ns ..int) int {...}

func main() {
    var m summer = s{}
    fmt.Println(m.sum(1,2,3))
}


```




