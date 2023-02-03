# Complete Guide For Using Golang Template

### Syntact keyword overview

There are 6 key topic

1. {{define}}

2. {{template}}

3. {{block ... }} {{end}}

4. {{if <var>}} {{else}}  {{if <var>}} {{else}} {{end}}

5. {{with <var>}} {{end}}

6. {{range <var>}} {{else }}{{end}}
- anything else (and ,or,not,len,index etc) is funciton

hello world example 

`index.html`

```hello.html
{{ template "header"}}
hello world ! my name is {{.name}}.
{{template "footer" }}
```

`common.html`

```
{{define "header" }}
<header>
    <p><a href="/">Home</a></p>
    <p><a href="/about">About</a></p>
<p><a href="/contact">Contact</a></p>
</header>
{{end}}


{{ define "footer"}}
    <p>Copyrignt 2021. All right Reserved</p>
{{ end }}
```

## 

`main.go`

```
t,_:= template.ParseFiles(
    "hello.html",
    "common.html"
)
t.Execute(os.Stdout, map[string]string{
    "name":"bokwoon",
})
```

`output`

```
<header>

<p><a href="/">Home</a></p>
<p><a href="/about">About</a></p>
<p><a>Contract</a></p>
</header>

hello world! my name is bokwoon 
<p>
    copyright 2021. allright reserved
</p>
```

### Go's template system is  not like the others

- you may have experience with some other templating engines e.g. django, templates, jinja2, laravel blade etc

- their tempate references are static , you include some other template by refrenceing its, path relative to some directory
  
  - e.g. {% include "partials/header.html"}

- but in go template refrence are dynamic you must compose the templates yourself 
  
  - e.g. {{template "header" }}

## Part 1 : Template composition

### under documented aspect of go templates

- In Go, a template is essentially a `map[string]*Template` 
  
  - when you compose template together , you are populating this `map[string]*Template`  data structure 

### In go , a template is essentially a `map[string]*Template`

`hello.html`

```
<p>Hello World</p>

{{template "footer"}}

{{ define "footer" }}
<p>
   <div>my blog</div> 
</p>
{{end}}


{{define "copyright"}}
    Copyright 2021 all right reserved
{{end}}
```

**when do `ParseFiles("hello.html")`**

```
map[string]*Template {
    "hello.html": &Template {
        name:"hello.html",
        Tree: /* template body */,
}
    "footer.html": &Template {
        name:"footer",
        Tree: /* template body */,
}
    "copyright": &Template {
        name:"copyright",
        Tree: /* template body*/,
}
}
```

- when you execure {{template "footer"}} , you are doing a map[string]*Template lookup for "footer"

### hello world example, translated to map[string]*Template

`hello.html`

```
{{ template "header"}}

    hello world! my name is {{.name}}
{{template "footer"}}
```

`common.html`

```
{{ define "header" }}
    <header>
    <p><a href="/"> home </a></p>
    <p><a href="/about"> About </a></p>
    <p><a href="/contract"> Contract </a></p>
    </header>
    
{{end}}
{{define "footer"}}
<p>
    copyright 2021
</p>
{{end}}
```

*when running ``ParseFiles("hello.html","common.html")``*

```
map[string]*Template {
    "hello.html": &Template {
        name:"hello.html",
        Tree: /* template body */,
}
"common.html": &Template {
        name:"common.html",
        Tree: /* template body */,
}
    "footer.html": &Template {
        name:"footer",
        Tree: /* template body */,
}
    "copyright": &Template {
        name:"copyright",
        Tree: /* template body*/,
}
}
```

### A template is essentially a map[string]*Template whre one of the template marked as  the current template

```
map[string]*Template {
    "hello.html": &Template {
        name:"hello.html",
        Tree: /* template body */,
}
 "common.html": &Template {
        name:"hello.html",
        Tree: /* template body */,
}
    "footer.html": &Template {
        name:"footer",
        Tree: /* template body */,
}
    "copyright": &Template {
        name:"copyright",
        Tree: /* template body*/,
}
}
```

```
// Get the name of the current template
t.Name() == "hello.html"
// execure the current template
t.Execute(os.Stdout,data)
// execute the header template
t.Execute(os.Stdout,"footer",data)
//execute the footer template
t.Execute(os.Stdout,"footer",data)


// iterate through the templates
for i,t := range t.Templates(){
    ...
}
// get the defined templates (in a string)
fmt.Printf("%s \n", t.DefinedTemplates())

// set the current template to header
t= t.Lookup("header")

// and execute it 
t.Execute(os.Stdout,data)
t.Name() =="header"

// if you lookup a noneexistent template
// you get nil 
t.Lookup("fsdhfajdjfalkg")==nil

// 
```

### Does go support nested template ?

- NO . even through a {{ define "header"}} is a nested template definition within a teplate all template are hoisted to the top level  i.e. they all exist as equal as equlas inside a map[string]*Template
  
  `hello.html` 

```
{{ template "header"}}

hello world my name is {{.name}}.
{{template "footer"}}
```

`common.html`

```
{{define "header"}}
<header>
    <p><a href="/">Home</a></p>
    <p><a href="/about">About Me</a></p>
    <p><a href="/contract">Contract</a></p>
</header>
{{end}}
{{ define "footer"}}
    <p>
    Copyright 2021 , all right reserved
    </p>
{{end}}
```

`main.go`

```
t,_:= template.ParseFiles(
    "hello.html",
    "common.html",
)
```

this main.go is equivalent to 

`main.go`

```
t,_:= template.New("hello.html").Parse(
    `
    {{ template "header"}}
    hello world my name is {{.name}}.
    {{template "footer"}}
    `
)
_,_ =t.New("common.html").Parse("\n")
_,_ =t.New("header").Parse(
    `
    <header>
        <p><a href="/">Home</a></p>
        <p><a href="/about">About Me</a></p>
        <p><a href="/contract">Contract</a></p>
    </header>
    `
)

_,_= t,New("footer").Parse(`
    <p>
    Copyright 2021 , all right reserved
    </p>
`)
```

- Does Go support nested templates ?
  
  - NO ,even though a {{ define "header"}} is a nested template definition within a template , all templates are hoisted to the top level , i.e. they all exist as equals inside a map[string]*Template

- Does Go template inheritance ?
  
  - think of it using plain old template composition

### why is template inheritance used ?

- pages often have a similar HTML structure and the only thing that changes is the  main content 

`/blog/posts`

```
<header>
    <p><a href="/">Home</a></p>
    <p><a href="/about">About Me</a></p>
    <p><a href="/contract">Contract</a></p>
</header>


{% include "index.html" %}
<p>
    copyright 2021 all right reserved 
</p>
```

`/blog/posts/about-me`

```
<header>
    <p><a href="/">Home</a></p>
    <p><a href="/about">About Me</a></p>
    <p><a href="/contract">Contract</a></p>
</header>


{% include "post.html" %}
<p>
    copyright 2021 all right reserved 
</p>
```

- the problem is "include" can only ever point to a specific template in the filesystem

- it cant solve to a different template depending on the context. it's static refenrence

### How does template inheritance solve it ?

- using tempalte inheritance you define a   parent template then let child templates override specific template block init

`base.html`

```
<header>
    <p><a href="/">Home</a></p>
    <p><a href="/about">About Me</a></p>
    <p><a href="/contract">Contract</a></p>
</header>

{% block "content" %}
    the this is placeholder
{% endblock %}
<p>
        copyright 2021 all right reserved 
</p>
```

`index.html`

```
{% extends "base.html" %}
{% block "content" %}
    Here are my posts
{% endblock %}
```

`post.html`

```
{% extends "base.html" %}
{% block "content" %}
    this is post
{% endblock %}
```

- looking at base html what is the "content" block going to render ? who knows depends on whether you invoke index.html or post.html or base.html

- 

### 

### Go template does not need template inheritance because  tempalte references  are already dynamically resolved

- If you want a template to render a different thing, you just overwrite its definition in the  map[string]*Template simple

`base.html`

```
<header>
    <p><a href="/">Home</a></p>
    <p><a href="/about">About Me</a></p>
    <p><a href="/contract">Contract</a></p>
</header>

{% block "content" %}
    the this is placeholder
{% endblock %}
<p>

        copyright 2021 all right reserved 


</p>
```

`index.html`

```
{{define "content"}}
    here are my posts
{{end}}
```

`post.html`

```
{{define "content"}}
    this is a post
{{end}}
```

- Looking at base.html what is {{ template " content"}} going to render? who knows
  
  depends on whether you **ParseFiles("base.html","index.html")** or **ParseFiles("base.html","post.html")** or **ParseFiles("base.html")**

### In fact the block keyword essentially does the same thing

```
{{define "content"}}
    this is a place holder
{{end}}
```

this is equivalent to 

```
{{template "content" .}}
{{define "content"}}
    this is a place holder
{{end}}
```

- {{block}} is just syntactical suger for {{template}} followed by a {{define}}

## Part 2 : Syntax and Variables

### Template Variable

- Every template has acess to exactly one variable , denoted by "."

- this is whatever variable you passed init `Execute()/ExecuteTemplate()`

```
e.g. dot is struct {
    Params: Params {
        Author:Author {
            FirstName: "john",
            LastName: "Doe",
        }
    }
}
}
here : 
{{.}} means whole Params block
{{.Params.Author.LastName}} means `LastName: "Doe"`
```

```
e.g. dot is map [string] interface {
     Params: map[string]interface{} {
        Author: mapp {
            FirstName: "john",
            LastName: "Doe",
        }
    }
}
{{.}} means whole Params block
{{.Params.Author.LastName}} means `LastName: "Doe",`
```

alternatively for maps:

```
{{ index . "Params" "Author" "LastName"}}
```

## Variable must be passed expicitly down to templates

```
{{ define "footer"}}
    {{ .Params.Author.FirstName}}
{{end}}
// nothing passed down
{{template "footer"}}
// dot passed down 
{{tempate "footer" . }}


// subset of dot passed down
{{ define "footer" }}
    {{ .FirstName}}
{{end}}
{{ template "footer" .Params.Author }}
```





```
e.g. dot is map[string]interface{}}{
    "Params": map[string]interface{}{
    "Author" : map[string]interface{}{
            FirstName: "john",
            LastName: "Doe",
        }
    }
}
```



### Variable can be  assigned (and reassigned)

```
{{define "greet"}}
    {{ $firstname := .Params.User.FirstName}}
    <p> hello my name is {{$firstname}} </p>
    {{ $firstname ="Joe"}}
    <p> actually my name is  {{$firstname}} </p>
{{end}}
```

- A variable's scope is extendeds to the {{end}} keyword of the current block

- e.g. {{if}} ,{{with}} {{range}} of the current

## Part 4 : {{if <var>}} {{else if <var>}} {{else}} {{end}}

- basic if statement you already know how it works

- ```
  {{if .User.IsAuthorized}}
      <p> welcome {{.User.Name}} </p>
  {{else}}
      <p>You are not allowed to see this</p>
  {{end}}
  ```

- evaluation is truthly/falsy 
  
  - falsy value are false,0,nil,empty array/slice/map/string
  
  - anything else truthy

don't do 

```
{{if eq(len .Users) 0 }}
    <p> there are {{len .Users}} users </p>
{{end}}
```

do this 

```
{{if .Users}}
    <p> there are {{len .Users}}  users</p>
{{end}}
```

### The Dot '.' and the dollar '$'

- The '.' refers to the current template variable
  
  - {{ . }}                // print the variable
  
  - {{ .Params.User.FirstName}}  // accessing a nested field 

- but the '$' also refers to the current remplate variable
  
  - {{$}}            // print the variable 
    
    - {{ $.Params.User.FirstName }}    // accessing nested field

- the difference is the dot '.'  changes value depending on ther context
  
  - it starts off pointing at the top level template variable (same as '$')
  
  - the dot changes inside  {{with}} and {{range}} blocks (only these 2 cases)

- the dollar '$' always points to the top level template variable it nevel changes

## Part 5 : {{ with <var> }}  {{end}}

- behaves like an {{ if }} : if <var>  is falsy, the block is not executed

- otherwise the dot '.' is set to <var> inside the {{ with}} block
  
  - if you want to access anything outside of the dot '.' use  '$' 

```
{{ with .User.FirstName}}
    <p> FirstName: {{.}} </p>
    <p> LastName : {{ $.User.LastName}} </p>
{{end}}
// Alternative with explicit variable
{{ with $firstname:= .User.FirstName }}
    <p> First Name : {{ . }} </p>
    <p> First Name : {{ $firstname }} </p>
    <p> Last Name : {{ $.User.LastName }} </p>    
{{end}}
```

## Part 6 :  {{ range <var> }} {{else}} {{end}}

- loops over <var> . <var> must be array , slice map or channel 

- if there are 0 element,  the {{else}} block is executed instead

- the dot '.' is changed to each successive element of the array/slice/map/channel 
  
  - if you want to access anything outside of the dot '.' use '$'

```
// Basic example 
{{ range .Users}}
    <p> User: {{.}} </p>
    <p> FirstName: {{ .FirstName }} </p>
    <p> today is {{$.Today}} </p>
{{end}}
```

```
template variable :
{
    "users": [
    {
        "FirstName":"john",
         "LastName":"",
        "Age" : 32 ,
         "Address" : "3 abc",
        "Email" : "ab@gmail.com"


    
    },
    "today":"Thursday"
    ]
}
```

## Part 3 : Function, methods and pipes

Template already have some default functions e.g.

- and
  
  - {{ if and <cond> <cond>  . . . }} {{end}} 

- or 
  
  - {{ if or . . . }} {{end}}

- not
  
  - {{ if not . . . }} {{end}}

- len 
  
  - {{len <var>}}
  - // <var> is one of the string | slice |slice | array | map | channel 

- index 
  
  - {{ index <slice> <num>  . . .  }}
  - {{index <map> <key> . . . }}

### Templates can call user-defined functions

- you install new functions into a template by calling `Func(map[stirng])interface{}` template

```
New("t")
Funcs(map[string]interface{}){
    "greet": func(name string) string { return "hello"+name},
     
}   
Parse(`{{greet "bob"}}`)
```

- Functions can take any number of argument but must return one result

```
func() string 
func(s string) string 
func(args ...interface{}) interface{}
```

- you can optionally return an error if the error is non nil it will halt template execution

```
func() (string , error)
func(s string) (string ,error)
func(args ...interface{}) (string,interface{})
```

### template call methods

- Calling a method looks like a field access

```
type User struct { greeting  string } 
func (u User) Greet(name string) string {
    return g.greeting + " " + name
}


t ,_ := template.New("t").Parse(`{{ .User.Greet "bob"}}`)
t.Execute(os.Stdout,map[string]interface{}){
    "User":User{greeting: "hello"}
},
```

### Template can'y directly call variable that are functions

```
type User struct {
    Greet func(string) string
}


t,_ := template.New("t").Parse(`{{ call .User.Greet "bob"}}`)
t.Execute(os.Stdout,map[string]interface{} {
    "User": User{
        Greet: func(name) {return "hello"+name},
    }
})
```

### The Results of one function can be piped into another

- when piped the result of a function is passed in as last argument to the next function

- ```
  t,_:= template.
      New("t").
      Funcs(map[string]interface{}{
            "upper":strings.ToUpper,
            "greet": func(greeting,name string)string {
                  return greeting+" "+name
      }  
  }).
  Parse(`{{ upper . | greet "hello"}}`) // "hello BOB"
  
  t.Execute(os.Stdout,"bob")
  ```

- 

## The End

more stuff i didn't cover:

- Templates can be parsed separately and then combined together
  
  - it's just merging two map[string]* Template

- If two template combine together , how do their functions interact with each other? which function wins?
  
  - the functions are just map[stirng]interface{} they also get merged together

- html/template will automatically secure HTML/CSS/JS/URL input for you. [1][2]
  
  - even the upcomming {{ break }} and {{continue}}  keywords will respect this.[3]  

- Funcs must be define before Parse(). But then you are free to overwrite them after that (why ??)
