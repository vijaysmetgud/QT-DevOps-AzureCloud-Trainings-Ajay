Version Control Systems
-----------------------

* This is source code repository
* Software which allows us to store code along with history is called as Version Control Systems.
* **Evolution of VCS or Types:**
   * Single System VCS
   * Client Server VCS: 
      * Popular examples are Subversion, Clear Case, Visual Source Safe etc:
        * Online
        * Offline
* **Distribute Version Control Systems:** 
   * Mercurial
   * Git
![Preview](./Images/git.png)

Git
---

* In Git we have 5 areas
   * Working tree/Working Area
   * Staging area/Cache area/Index Area
   * Local repository/Commit Area
   * Remote Repository
   * Stash

* Lets focus on 3 areas:
![Preview](./Images/git1.png)

### Note:
* Command lines:
   * Cheat sheet 
     * [Refer Here](https://education.github.com/git-cheat-sheet-education.pdf)
     * [Refer Here](https://www.atlassian.com/git/tutorials/atlassian-git-cheatsheet)


* Create a local repository
* create an empty directory and execute `git init`     
![Preview](./Images/git2.png)


* Configure username and email id `one time job`
![Preview](./Images/git3.png)

* Create one file `one.txt` and execute `git status`
![Preview](./Images/git4.png)

* Three areas quick revision
![Preview](./Images/git5.png)

* Lets add this change to the staging area
![Preview](./Images/git6.png)

* Lets create a commit with this one change
![Preview](./Images/git7.png)

* For every commit git gives commit id with username, email, message and date time information
![Preview](./Images/git8.png)

* Create a new file `two.txt` and change the contents of `one.txt`
![Preview](./Images/git9.png)

* untracked files represent the files newly created in working tree which donot have any history in local repo and for the files which are already existing in local repo we see states such as
  * modified
  * renamed
  * deleted

* Lets add both the changes to staging area
![Preview](./Images/git10.png)
![Preview](./Images/git11.png)

