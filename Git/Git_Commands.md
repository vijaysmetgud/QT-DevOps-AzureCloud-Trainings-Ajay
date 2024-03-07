Git Commands:
-------------

### To create local repository
```
mkdir gitpractice
cd gitpractice/
git init
```

### Command to configure git

    git config --global user.name "your_ name"

    git config --global user.email "your_mail@example.com"

### Command to check git configure status

     git config --list

### command to check status of files

    git status

### command to add untracked/working tree files to staging area    

     git add <filename>

### command to add untracked files to staging area adding all files in the current directory at once

        git add .

### Command to add untracked file to staging area at once any directory of files
     git add -A
     git add --all

### Command to add modified files to staging area

    git add -u 

### command To move a particular file from Stating  area to commit area

    git commit -m "commit_msg"  file_name

### command To move all file from Stating  area to commit area

      git commit -m "commit_msg" . 

### command to add and commit a file in single command 
  * but only modified early file not new file this command will not work

        git commit -am "added early modified file" <file name>
                      or

        git add . ; git commit -m "msg" file_name 
        git add . && git commit -m "msg"

### command to see commit id,username, email, message and date time information

          git log

### Command to see the commit details in one line instead of multiple like above

     git log --oneline 

### Command to go back particular commit or history

      git checkout 0d231157d2d372b6c04445ffab06fe5d3c296ede
      git checkout <commit id>
      
### Command to move back latest commit

      git checkout master

### command to get files from staging area to working area/Untracked files/Unstage

    git reset <file_name> <commit_id>
    git reset # latest commit 
    git rm --cached test/main.py
    git restore --staged <fileName>

### Command to get files from commit area to staging area
    
    # latest commit below commands where HEAD is pointing
    git reset --soft HEAD^
    git reset --soft HEAD~

    # after HEAD any commit then below command with adding numerical
    git reset --soft HEAD~1,2,3

### Command to get files from commit area to working area/Untracked files

      # latest commit below commands where HEAD is pointing
      git reset --mixed HEAD^
      git reset --mixed HEAD~

          or

      git reset HEAD~
      git reset HEAD^     

      
      # after HEAD any commit then below command with adding numerical
      git reset --mixed HEAD~1,2,3

            or

      git reset HEAD~1,2,3      


### Command to delete permanently files from commit area 
         # latest commit below commands where HEAD is pointing
         git reset --hard HEAD^
         git reset --hard HEAD~
         git reset --hard <commit id>

         # after HEAD any commit then below command with adding numerical
         git reset --hard HEAD~1,2,3


### Command to rebase
* here first we needs to checkout in which branch we have to rebase and second we needs to execute rebase command with branch name  

        git checkout develop
        git rebase master

### Command to change commit message using interactive rebase
  * select option `reword` 

        git rebase -i HEAD~3

### What is cherry pick:
* To get a particular commit from one branch to another branch
* To get a particular files from one branch to another branch 
* if we dont want to merge or rebase whole branch, only we need some files from that branch we can use cherry-pick
* If you by mistake make a commit in an incorrect branch, then using cherry-pick you can apply the required changes in the right branch 

#### Command to cherry pick:
* should checkout to branch where you want to get particular commit id then use cherry-pick command

      git checkout master
      git cherry-pick <commit id>

### What is squash
* Squashing a commit means, simply making two commits into one commit or Combining commits
* If you repeat this process multiple times, you can reduce n commit to a single one

      # select option `squash` 
      # also select two commits to make it one

      git rebase -i HEAD~3

### Command to remove commit
   * select option `drop`
 
        git rebase -i HEAD~2

### Command to edit commit/file content
* select option `edit`

        git rebase -i HEAD~3

### Command to change latest/Head Pointing commit message

     git commit --amend

### Command to show all the details of commit 

    git show 368ab7f
    git show <commit_id>

### command to show HEAD  details

      git show HEAD

### command to show head details of one commit backward from head/latest

     git show HEAD~
         or 
     git show HEAD~1

     git show HEAD^

         or 

     git show HEAD^1


### command to show head details of two commit backward from head/latest

    git show HEAD~3
        or 
    git show HEAD^^
    git show HEAD^^^ 

### Command to pull the changes to local repo 
* But Note: with out creating one extra commit called `merge commit` we will use command called `git pull origin master --rebase `
* if we use pull the remote repo changes with  normal command called `git pull origin master` or `git fetch origin master and git merge origin master` then we will get one extra commit id called `merge commit` to avoid that unnecessary merge commit id to create we will follow the below rebase command

      git pull origin master --rebase 

### Command to create branch in local repo and push to remote repo

```
# create branch
git branch rel_1
# check the branches created 
git branch
# push the branch to remote repo 
git push --all origin 
git push rel_1 origin
```

### Tags:
* Tag is reference object like `refspec`
* Tag points to specific commit and it doesn’t move/change like branch
* Tags will apply to commit and it will not change until unless if we want to change, till then it will be fixed 
* There are two types of Git reference objects `refspec`
   * Branches
   * Tags
* We have two types of tags
* [Refer Here](https://www.atlassian.com/git/tutorials/inspecting-a-repository/git-tag#:~:text=Annotated%20tags%20store%20extra%20meta,quick%20links%20to%20relevant%20commits.) 
   * lightweight tags:
      * means name of the tag and what what commit id it points
      * EX: `git tag intel_rel_1.0`
   * annonated tags:
      * Annotated tags store extra meta data such as: the tagger name, email, and date. This is important data for a public release. 
      * Annotated tags have a tagging message.
      * Ex: ` git tag -a int_dev_1.0 -m "this is development release"`    


### Command apply tags to latest commit 
   * this is lightweight tags

    git tag intel_rel_1.0

### command to apply tags to particular commits 
   * this is lightweight tags

          git tag <Name><commit_id>  

### Command to push tags to remote repo
     *  this is lightweight tags
      git push origin intel_rel_1.0

### Command to apply Annotated tags to latest commit

     git tag -a int_dev_1.0 -m "this is development release"

### Command to apply Annotated tags to particular commits

    git tag -a testing1  6c4c435 -m "this is testing release"

    git tag -a <tag_name><commit-id> -m <message>

### Command to recover deleted commit from reflog

       git reflog
       git reset --hard 834f1d7
       git reset --hard <commit_id>


### Command To list the tracked files by git

    git ls-files

### command to clone any repository into local

   git clone https or ssh <url_link>

### Command to check any remote repository is connect to our local repository   

     git remote -v

### Command to add or connect remote repository to local repository     

    git remote add origin git@github.com:Ajayshady/DevOps-2.git

    git remote add <aliasname> <remote_repo_url_link>

### Command to override existing remote repo 

     git remote set-url origin git@github.com:Ajayshadysample_repo.git

     git remote set-url <aliasName> <remote_repo_link>

### command to push files from our local repo to remote repo

    git push origin master

    git push <aliasname> <branch name>

### command to set by default push to particular remote and branch
* if we set -u then not required to mention origin master, just directly we can push the contain. default to master
* this both command is same `-u` is short name and `--set-upstream`  is long name


      git push -u origin master

      git push --set-upstream <branch_name>

### Command To Check current branch
* represents that we are into current branch name

       git branch     

### Command to create new branch and switch to that created branch

     git checkout -b <branch name>

### Command to create branch

    git branch <branch name>

### Command to pull the files from remote repo to our local    

     git pull origin master
     git pull <aliasname> <branch_name>

### To update all local branches

    git pull --all

### Command to delete branch in the remote repo

    git push origin --delete dev 

    git push origin -d test

    git push <remote_repo_name> --delete <branch_name>
    git push remote_repo_name -d <branch_name>

### Command to delete branch in local repo     
* to delete forcefully, use option `-D` 


       git branch -d <branch name>
       git branch -D <branch_name>

### Command to rename the branch in the local repo

    git branch -m master test
    git branch -m <old_branch_name><new_branch_name>

             or 

    git branch -M master
    git branch -M <new_branch_name>

### Command to rename the branch in the remote repo  

      git push origin :test dev
      git push origin :<old_branch_name> and <new_branch_name>

### Command to switch to different branch

       git checkout <branch name>

### Command to merge
* first checkout which branch you want to merge then execute below command so that for current branch merge will take place 

      git checkout master
      git merge test
      git merge <branch_name>

### Command to Merge the two branches
* Note: two diff content of the files wil be merged


      git checkout master
      git merge dev test
      git merge <branch1> <branch2>

### How will you know in GIT if a branch has been already merged into master?
* It lists the branches that have been merged into the current branch

       git branch --merged 

* It lists the branches that have not been merged

      git branch --no-merged


### Command to check difference between 2 files

       diff <file_name1> <file_name2>

### Command to check difference between 2 commit 

    git diff <commit_id1> <commit_id2>
    
    git diff 7e6b43a 4e5adcd
    git diff 7e6b43a..4e5adcd
    git diff 7e6b43a^ 4e5adcd
    git diff <older_Commit_id> <Newer_commit_id>
    git diff <older_Commit_id>..<Newer_commit_id>

### Command to check difference between file and commit id

     git diff <commit_id><file_name>
    
### Command to check difference between two branches    
  
     git diff <first_branch_name><second_branch_name>

### Command to list local and remote branches

         git branch -a 
              or
         git branch --all


### Fork: 
> when you want some else repository to copy into our own repository just we need to click on fork option on right in that person repository 
 so that copy of that person repository will create in our repository we can do in UI, if i dont have access to that particular repo then after i fork click then ill be the owner of the repo 
 so i can do what ever i want to do since even i can make any changes.. and then that repo will be added to my repo.. to work.
 >

### How to give an access to a specific person to repository

* You can invite users to become collaborators to your personal repository.
* Under your repository, click on Settings.
* In the left sidebar, click Collaborators.
* Under "Collaborators", start typing the collaborator's username.
* Select the collaborator's username from the drop-down menu.
* Click Add collaborator.
* The user will receive an email inviting them to the repository. Once they accept your invitation, they will have collaborator access to your repository
* he can view and do any activities in my github repo


### How to Lock a branch? why we need to lock a branch?

* On GitHub, navigate to the main page of the repository
* Under your repository name, click on Settings
* section of the sidebar
* In the "Code and automation" section of the sidebar, click Branches
* Next to "Branch protection rules", click Add rule
* Click Save changes

### How to delete Repository in GitHub
* On GitHub, navigate to the main page of the repository.
* Under your repository name, click Settings.
* Scroll to the bottom of the page and you will find Delete this repository button
* When you click on that button, another pop up will appear, here you need to type in the name of your repository name and click on the button bellow which says: I understand the consequences, delete the repository.

### command to rename remote/alias/origin Name

      git remote rename origin wing
      git remote rename <old_alias_name><new_alias_name>

### Command to remove remote Name/repository in the local repository       

    git remote remove origin
    git remote rm origin
    git remote remove <remote_name>
    git remote rm <remote_name>

### Command to remove file

     git rm <file_name>

### Command to remove entire .git local repo

     # everything will deleted from our local repo   
     rm -rf .git

### Command to save working area/Untracked files in the stash for later use

           git stash
           git stash save

### Command to get back the files from stash to working area

          git stash pop 
          git stash apply 

### Command to list files which are saved in the stash          

        git stash list
        git stash show

### Command to delete the file in stash

       git stash drop

### Command to remove/unset a user-name and user-email in global config


             git config --global --unset user.name

             git config --global –unset user.email

             git config –global –unset-all user.name

### Command to undo the last commit 

     git revert <commit id>

### Command to list remote branches

     git branch -r 

     git remote show origin

### what is Fetch
* Fetch will download all files or code from remote repo to local but it will not integrate or takes changes with local repo     

#### Command to fetch files from remote repo to local repo

    git fetch origin master
    git fetch <alias_name><branch_name>
    
    # then below command
    git merge origin/master
    git merge <alias_name>/<branch_name>
        
           or 
    git checkout origin/master
    git checkout origin/master

### Command to skip from merge conflict

      git merge --abort

### Command to quit from git log or git reflog  

     To exit type “q” or “z”. Or type “h”

### Git Alias Commands

```bash
alias.pushsub=push origin HEAD:master
alias.rspush=push --recurse-submodules=check
alias.history=log --graph --decorate --pretty=oneline --abbrev-commit
alias.pushmain=push origin HEAD:main
alias.s=status
alias.pr=pull
```
### Command to list which type of commit

       git cat-file -t <commit-id>

### Command to list content of commit

       git cat-file -p <commit-id>

       



