# online documents
git command --help
git help everyday
git help tutorial
git help revisions
git help workflow

## git tutorials
Git is an auxillary file manage and control system. It is possible to
delete files when a git repository is removed. So be careful.



# Files
~/.gitconfig user global config file



# Q&A
In local repo., where does Git store the tracked files, and how (compressed )
    * under the .git/objects dir. using some kind of compression algorithm.
    * for each commit, files are stored in incremental mode.
For each commit, the tracked files are stored in incremental mode or in separate mode ?
    * for each commit, the modified same name files are stored separately.
How to discard "DETACHED HEAD" when I checkout a <commit> ?
git fetch: will this command merge different files ???


# configuration
- git config --system	    /etc/gitconfig  :	system config file
- git config --global	    ~/.gitconfig    :	personal config file
- git config --local   	    .git/config	    :	project config file

## alias
- git config --global alias.co checkout

# basic 
## Initialization
- git init
    Initialized empty Git repository
- git clone https(ssh)://url fork-dir
    clone remote repo. to local fork-dir
    && this will set remote automatically to https[ssh]://url
- git fetch [remote repo.]
    update local repo. from remote one

## update
- git add file.name
    add a file to the staging area.
- git commit -m "message"
    commit the staging area to the local repo.
- git stash
    to interact with the stash, a place to temporarily save your changes away ( cleaning up your 
    working copy ). This is an alternative to committing or checking out changes.

## status
- git status
- git log
    * git log --pretty=format:"%h -%an, %ar : %s"
###  filter on git log:
    *   git log --since=2.weeks ("2016-01-15", "2 years 1 day 10 minutes ago", "yesterday")
    *   git log <since>..<until>
    *   git log	--grep=README
    *   git log --author="John\|Mary"
    *   git log --commitor=
    *   git log -- foo.py bar.py
    *   git log -S"Hello, World!"
    *   git log -G"<regex>"
    *   git log master..feature	    // all the commits that are in the feature branch, but aren't in master branch.
- git show [SHA-1]

## remote repo.
- git remote -v
    show remote repo.
- git remote add another-remote-repo https[ssh]://url

## branch
- git branch -a -v
- git branch name
    to create a new branch 
- git checkout branch
    to move your working copy to represent the state of the branch 'branch'; can also create a new branch and move to it.
    && keep the change to your local file
- git push origin:<branchname>
    Delete a branch on your remote repository

## check out
- git checkout path
    to move your working copy to represent the state of the current branch (also HEAD); 
    this will delete any changes you may have locally (under that path)
- git checkout branch
- git checkout <commit>  | git checkout --detach <branch>|<commit>
    Rather than checking out a branch to work on it, check out a commit for inspection and 
    disardable experiments. 
- git rebase 
    to replay your local changes on top of another hash and update the current
    branch pointer to that state.

## reference
* tag
* HEAD -> branch (detached HEAD)
* branch -> the most forward commit
- git rev-parse master
    return the commit hash pointed to by the 'master' branch

### Refspecs
[+]<src>:<dst>
    the <src> para. is the source branch in the local repo. and the <dst> para. is the destination
    branch in the remote repo. the optional + sign is for forcing the remote repo to preform a 
    non-fast-forward update.

- git push origin master:refs/heads/qa-master

[remote "origin"]
    url = https://git@github.com:example.git
    fetch = +refs/heads/*:refs/remotes/origin/*	% fetch all branches

### relative refs
- HEAD~2    the grandparent of HEAD
- HEAD^2    the ~ char will always follow the *first* parent of a merge commit. 
	    HEAD^2 will returns the second parent of HEAD.
 HEAD^2^1   [use more than one ^ char] the grandparent of HEAD(assuming it's a merge commit) that 
	    rests on the *second* parent
- HEAD{<n>} this syntax lets you reference commits stored in the reflog. It works a lot like the
	    HEAD~<n> references, but the <n> refers to an entry in the reflog instead of the commit
	    history.

### Special refs
- HEAD
    * detached HEAD: what the HEAD points to(an old commit) is different 
      from current branch tip.
    * FETCH_HEAD -- the most recently fetched branch from a remote repo
    * ORIG_FEAD -- A backup refs to HEAD before drastiv changes to it
    * MERGE_HEAD -- the commit that you're merging into the current branch with git merge.
    * CHERRY_PICK_HEAD -- the commit that you're cherry-picking

## replay
- git stash pop
    to replay the changes in your stash on top of your HEAD ( and delete the stash )
- git cherry-pick hash
    to apply a commit on top of your current branch

## difference
- git diff  
    View all the merge conflicts
- git diff --base <filename>
    View the conflicts against the base file
- git diff <sourcebranch> <targetbranch>
    Preview changes, before merging

## search
- git grep "foo()"
    Search the working dir. for foo()

## Extension
git LFS(Large File storage) deal with projects containing large files.
