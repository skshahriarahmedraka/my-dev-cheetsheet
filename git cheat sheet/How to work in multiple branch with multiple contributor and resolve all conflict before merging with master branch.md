## How to work in multiple branch with multiple contributor and resolve all conflict before merging with master branch

### suppose you'r working in **feature** branch

- commit your changes in **feature** branch
    `git add .` 
    `git commit -m "added: new feature"`    

- move to **master** branch 
    `git checkout master`

- fetch all the remote changes from github/gitlab , and move to the head of the **master** branch 
    `git fetch && git rebase`

- move to the **feature** branch 
    `git checkout feature`

- As your **feature** branch is started from a old commit of **master** branch . you have to move rebase it from the latest commit of **master** branch 
    `git rebase master`

- Now VSCode will show all the confict that arises . resolve them one by one 

- now , After resolving conflicts, continue the rebase by using:
    `git rebase --continue`

- test all code locally before pushing to github/gitlab

- Now you can push to github/gitlab and create a pull request and marge with the **master** branch
