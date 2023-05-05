## change old commit message

### // git hash id will change

### log outline

    git log --outline 

### rebase

#### Interactive rebase

A tool for optimizing & cleaning up your commit history 

- change a commit's message delete commits 

- reorder commit's 

- combine multiple commits into one 

- edit / split an existing commit into multiple new ones
  
  note :
  
  - dont use interactive rebase on commit that you have already pushed/shared on a remote repository 
  
  - instead use it for cleaning up your local commit history before merging into a shared ream branch 

#### if you want to change most recent commit

`git commit --amend`

You can use this command without the `-m` flag. If you do, an interactive text editor will be opened up in which 
you can replace the message from your older commit. Save and exit the 
text editor and your change will be made.

If you’d like to use the `-m` flag here’s an example of what that would look like.

`git commit --amend -m “this fixes the previous oopsies”`

Say
 that your last commit is missing a crucial file. Without it, you will 
be fired immediately. We can use the git commit –amend command to get 
out of this bind and fix the issue.

To change the files in a commit, first add the files you want to be included in your commit:

`git add redemption.exs`

If you want to remove a file from a commit, you can use `git rm`:

`git rm garbage.exs`

Once you have made the changes to a repository, you are ready to amend your commit. You can do this by using the `–no-edit` flag:

`git commit --amend --no-edit`

This
 command will change the files in your last commit. It will not change 
the message associated with the commit because we have not used the `-m` flag



#### step by step

1. how far back do you want to go ?
   
   what should be the **base** commit 

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