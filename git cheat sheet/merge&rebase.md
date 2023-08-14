suppose there are **master** branch and **feature** branch 

master           m1---m2---m3

                                    |

featuer                       |-m2---f1---f2 

### merge

`git checkout  master `

- `git merge feature` create a merge branch and you have one last commit which combines all the changes of both branch of latest changes of both branches but you would also merge all the other commits of your feature branch into you master branch

- `git merge --squash feature`  squash  simply allows us to kind of summarize  all the different commits so all the changes we had in the feature branch in the last commit so it kind of puts them together and then merges this last commit with the latest commit in the master branch
  
  - simply it's marge but becomes uncommited , you have to manually commit those changes in master branch

### rebase

`git checkout feature`

- `git rebase master`  if we see `git log`  the branch is based on the latest commit of master branch  , master branch will not change any thing

- first thing it does is check both branches and has a look at the last commit both branches have in common , which commit was that ,  this was our m2 commit the commit we used  to create our feature branch , initially than git has a look at our current branch remember  we are in the feature branch so good look at this feature branch see what changed actually feature branch , now i think it find all these changes than kind of saves these changes internally for the moment so nothing is commited or something like that , it's just saved internally thengit goes back to the master and sees what happended to the master so how the master envolved and what git see right here it sees that master got an additional commit that m3 commit nwo git uses m3 commit and also kind of moves the feature branch forward to this m3 commit so the feature branch is no longer based on the m2 commit but on the m3 commit and then both branches are alligned again git simply applies this internally saved information so our f1 changes this change right here and puts it on the top of m3 commit that all happening 





---------------

### resolve conficts

`git status`   ->  master 

-  `git merge develop`

undo a confict and start over 

`git merge --abort`

`git rebase --abort`




