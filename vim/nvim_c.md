## movement

h - left 
j - down 
k - up
l - right 

## end of the line : capital A

A

## begining of the line : capital I

I    

## create a line above : capital O

O 

## 5 line up

5k

## 6 down

5j

## undo

u

## Re do

crtl + r

## 3 undo stack

3u

## 4 redo stack

4ctrl+r

## v for visual mode

## delete

d

## delete whole line

dd

## delete and  insert mode or from visual mode select delete  and  insert mode

cc

## delete the rest of the line : capital D

D

## delete and go insert mode : capital C

C

## copy - yank

y

yy // copy whole line 

## paste

p  // pase in line bellow 

P  // capital p to paste line above 

## copy ful line : capital y

Y

## replace :

r

## jump from word to word : space and hypen

w

## jump space to space :

W

## jump backword :

b

# jump between space

B

## delete a word

dw

## delete 4 word

4dw

## delete in a word

diw

## change in a word

ciw

## end of the  word

e

## beging of the line

0

## end of the line

$

## copy from in a word

yiw

## change  innner cotetion mark : copy from print("raka") like this

ci"

## 5 time delete 5 words

5d5w

## jump from open to close bracket

%

## find a word : find z word

fz

## move before a find word next

tz

## find a word before and move to

Tz

## start of the file

gg

## top of the screen

[shift]+h

## middle of the screen

[shift]+m

## move to end of file

G

## endentaion

> > 
> 
> <<

## select whole line from visual mode

V

## select multi line input

ctrl +v

## correct indentation

==

## search

/ 

## insert line bellow

o  

## insert line above

O / /   

## go to a letter the same line

%g  //  go to where "g"" is

d% // delete all the line between braket 

## toggle between all accured value

[shift]+*

fr;;;;;    // find r and ; for next occurance 

## move the line to the middle of screen

zz 

## reverse the case

~

## re run the previous command

.   // re do previous commnad 

### select an HTML tag's content

`vit` 

`vat`

Here are the steps:

1. Place the cursor on the tag.
2. Enter Visual mode by pressing v.
3. Select the inner tag block by pressing i+t (or a+t for outer tag block).

> at a `<tag> </tag>` block (with tags)
> 
> it inner `<tag> </tag>` block

### quit without saving

ZQ 

### save and exit

ZZ

### search and replace

:%s/static/whatever/g 

// replace `static` with `whatever`

### open a file

:e  ~/.config/file.txt

### go to the source file

gf 

### go backward of cursor history

ctrl+o

### go forward of cursor history

ctrl +i

### store the standard output to a file

:r!cat ~/config/file.txt

### output of a command

!! 

# Delete

### delete everything from the beging

0d

### delete every thing to the end

d$

delete rest of the line

D // capital D

### delete rest of the line and go the the insert mode

C // capital c

Dt} // delete until }

Ct} // delete until } and go to insert mode

### delete all until a ( :

dt(

### delete the the latter currently on

x

### delete a letter

dl 

## change word

cw // change a single word

### Change inside ''

ci"

# Tree sitter

up - j

down-k 

show sub directory -l

hide sub directory-h

create file or dir  -  a     // dir name end with `/`

delete file - d 

copy file - c 

rename - r

### go to the variable type defination

gT

### go back to the variable from type defination

ctrl+o

### go to the implementation

gI

### go to the defination

gd

### reference across project

gr

### open terminal

F7  key 

### Comment multiple line

<space> + /
