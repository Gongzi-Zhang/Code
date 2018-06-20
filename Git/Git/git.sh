#!/bin/bash

# Help
git help tutorial

# URL
'http://host/path/to/repo.git'
'ssh://user@host/path/to/repo.git'

# Set-up
git init  
    # transform current dir. into a git repository, and adds a .git 
    # folder to the current dir. 

git init [dir.] 
    # Create an empty Git repository in the specified dir.

git init --bare [dir.] 
    # Initialize an empty Git repo. but omit the working dir. 
    # which means no changes or commitment is allowed in this dir. 
    # Shared repo. should always be created with the --bare flag to 
    # be used as the Central storage repo. rather than a developing 
    # repo. Conventionally, repo. initialized with the --bare flag 
    # end in .git.

git clone [repo] 
    # create a copy of an existing Git repo.

git clone -b branch git@github.com:Name/Repo.git    
    # clone only single branch

git clone [repo] [dir] 
    # clone repo. into dir.

## Configuration
git config user.name [name] 
    # define the author name to be used for all commits in the 
    # current repo. Typically, you'll want to use the --global flag 
    # to set configuration option for the current user.

git config --global user.name [name]
git config --global user.email [email] 
git config --global alias.[alias-name] [git-command] 
    # create a shortcut for a Git command
git config --global core.editor [editor] 
    # define the text editor used by commands like git commit for 
    # all users on the current machine. The [editor] arg. should 
    # be the command that launches the desired editor.
git config --global --edit 
    # open the global configuration file in a text editor for manual editing
git config --global core.excludesfile ~/.config/git/ignore


# Development
git add [file] 
    # add file to current stage to be commit to repo.
    # stage acts like buffer between working dir. and the repo.
    # while commit acts like buffer between local repo. and the central 
    # repo. each commit(history) contain several stage.

git add . 
    # add all files in current dir.

git rm [file] 
    # rm file which will be commited
git rm --cached <file>
    # .gitignore will prevent untracked files from being added to set of files
    # tracked by git, however git will continue to track any files that are
    # already being tracked.

## history
git status 
    # show changes in stages

git log 
    # show every commit histoty

git log -n [limit] 
    # display only [limit] commits

git log --oneline 
    # condense each commit to a single line.

git log --stat 
    # include more detailed log about changes to a file

git log -p 
    # display the patch representing each commit. This shows the full 
    # diff of each commit, which is the most detailed view you can have 
    # of your project history.

git log --author="[pattern]" 
    # search for commits by a part. author.

git log --grep="[pattern]" 
    # search for commits with a commit message that matches [pattern].

git log [since]..[until] 
    # show only commits that occur between [since] and [until]. Both 
    # argu. can be either a commit ID, a branch name, HEAD, or any other 
    # kind of rivision reference.

git log [file] 
    # only display commits that include the specified file
git log --graph --decorate --oneline 
    # --graph flag will draw a text based graph of the commits on the 
    # left hand side of the commit messages. --decorate adds the names 
    # of branches or tags of the commits that are shown.

' the ~ char is useful for making relative reference to the parent of a
commit. For example, 3157e~1 refers to the commit before 3157e, and HEAD~3
is the great-grandparent of the current commit.'


## branches
git branch <branch> # create new branch
git branch -m <bannch> 
    # rename the current branch to <branch>
git branch -d(-D) <branch>
    # delete (force) branch
git checkout -b <branch> <sha>
    # restore deleted branch
git push origin local_branch:remote_branch
    # push local branch to a remote branch
git push origin remote_branch
    # pull from a remote branch
git push --set-upstream origin branch
    # set push upstream (remote branch) for local branch (they have the same name)


## restore old commit
git checkout [commit] 
    # jump to the specified "commit" without affecting current working 
    # dir. You are allowed doing anything there and go back to current 
    # working dir. with command#
git checkout master
git checkout -b <branch> <sha>
    # restore deleted branch

git checkout [commit] [file] 
    # unlike checking out a commit, this does affect the current state 
    # of your project. To discard the old version you have checked out, 
    # use 
git checked HEAD [file]
    
git revert [commit] 
    # Generate a new commit that undoes all of the changes introduced 
    # in [commit], then apply it to the current brance.

git reset [commit] 
    # unlike revert, reset permanently remove all the commit between 
    # [commit] and the HEAD. DANGEROUS!!

git reset [file] 
    # unstage a file, but leave the working dir. unchanged.

git reset 
    # reset the staging area to match the most recent commit, but leave 
    # the working dir. unchanged.

git reset --hard 
    # reset the staging area and the working dir. to match the most 
    # recent commit. 

git reset [commit] 
    # Move the current branch tip backward to [commit], reset the 
    # staging area to match, but leave the working dir. alone.All 
    # changes made since [commit] will reside in the working dir. which 
    # lets you re-commit the project history using cleaner, more atomic 
    # snapshots.

git reset --hard [commit] 
    # reset both the staging area and the working dir. to match [commit].

git clean 
    # rm untrack files in working dir.
git clean -n 
    # show what will be removed
git clean -f 
    # this will not rm untracked folders or files specified by .gitignore
git clean -f [path] 
    # limit rm action in specified [path]
git clean -df 
    # rm both untracked files and dir.
git clean -xf 
    # rm untracked files from the current working dir. as well as any 
    # one that Git usually ingores.

git commit --amend 
    # the --amend option to commit command allows you to alternate 
    # a commit,which will combine current stage with recent commit 
    # to submit a new commit to replace the recent one, which like 
    # "git reset", will permanently erase the last commit and replace 
    # it with the new one.

git rebase
    # mv commits in one branch to a new base(branch).
git rebase -i [base]
    # provide an interactive way to perform rebasement.


# Collaboration
git remote
    # list all remote connection you have to other repo.
git remote -v
    # same as above, but include URL of each connectioin.
git remote add [name][url]
    # create a new connection to a remote repo. After adding a remote, 
    # you'll be able to use [name] as a convenient shortcut for [url] 
    # in other Git commands.
git remote rm [name]
    # rm the connection to the remote repo.
git remote rename [ole-name] [new-name]	
    # rename a remote connection.
git remote set-url [remote] [url]
    # reset url for remote

git fetch [remote] [branch] 
    # fetch branch from remote repo. without branch, all brnches is downloaded.

git pull 
    # equal to "fetch" and "merge"
git pull --rebase 
    # same as above, but rebase fetched commits rather than merge them.
git push 
    # counterpart of pull

git merge <branch>
    # merge the specified branch into the current branch

<Git-Structure>
    Repository
    |
    |-- Branches
	|
	|-- Commits
	    |
	    |-- Stages
</Git-Structure>

