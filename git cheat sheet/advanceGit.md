
## change old commit message 
### // git hash id will change
### log outline 
    git log --outline 
### rebase 
    git rebase -i HEAD~3 
    //editor window popup 
    // rewrite "pick" with "reword"
    // save and close // another window popup 
    // now we can change commit message 
    // save and close
    // commit message will change 
### change another comment 
    git rebase -i HEAD~4 
     //editor window popup 
    // rewrite "pick" with "squash"
    // "squash" will combine the message and one above that and
    // make one commit with one message 
    // save and close // another window popup 
    // now add one message on the top of the document 
    // that message will be the only message for two commit  
    // save and close
    // commit message will change 
## cherry-picking 
    // first checkout the branch where you want to paste the commit
    git checkout feature/newsletter
    // copy the hash of the commit you want to cherry pick and paste
    git cerry-pick 26bf1b48
    // delete the commit what you have cherry picked 
    git reset --hard HEAD~1 
    // delete 1st head commit
## reflog 
### recovering deleted commit with reflog
    // 2b504bee is the 3rd commit // delete all commit before this
    git reset --hard 2b504bee 
    // this was a mistake // delteted 2 upper commit 
    // now
    git reflog
    // copy the commit hash 
    git branch happy-ending  e53425 
    // the 2 commit added to "happy-ending" branch 
### recover deleted branch 
    // deleted feature/login 
    // now 
    git reflog 
    // copy the checkout command hash from master  to feature/login
    git branch feature/login [hashvalue]
## submodules
### add a git repository inside another git repository
    // inside parrent project 
    git submodule add http://github.com/skshahriarahmedraka 
    // when you download a git project , submodules will not download automatically
    //to get submodules 
    git submodule update --init --recursive

## search find 
### filering your commit history 
- by date 
```
--before / --after
git log --after="2021-7-1"
git log --after="2021-7-1" --before="2021-7-1"
```
- message 
```
--grep
git log --grep="refactor"
```
- by author 
```
--author 
git log --author="ssar"
```
- by file 
```
-- <filename>
git log -- README.m
```
- by branch 
```
<branch-a>
git log feature/login..main
```