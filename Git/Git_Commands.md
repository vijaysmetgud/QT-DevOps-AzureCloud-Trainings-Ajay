Git Commands:
-------------

#### To create local repository
```
mkdir gitpractice
cd gitpractice/
git init
```

#### Command to configure git

    git config --global user.name "your_ name"

    git config --global user.email "your_mail@example.com"

#### Command to check git configure status

     git config --list

#### command to check status of files

    git status

#### command to add untracked/working tree files to staging area    

     git add <filename>

### command to add untracked files to staging area adding all files in the current directory at once

        git add .

### command To move a particular file from Stating  area to commit area

    git commit -m "commit_msg"  file_name

### command To move all file from Stating  area to commit area

      git commit -m "commit_msg" . 

#### command to add and commit a file in single command 
  * but only modified early file not new file this command will not work

        git commit -am "added early modified file" <file name>
                      or

        git add . ; git commit -m "msg" file_name 
        git add . && git commit -m "msg"

#### command to see commit id,username, email, message and date time information

          git log

### Command to see the commit details in one line instead of multiple like above


