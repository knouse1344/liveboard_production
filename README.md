liveboard_production
====================

This is the main repo for liveboard.

Currently github seems to be having server issues with its wiki feature. So the development guide will be hosted here. 

Work flow:

Assign issues using the issue feature on github. This includes things that need to be added to the site as well as bugs found that need to be fixed. This way the proper person for the job can be assigned the bug and fix it in the msot efficient manner possible. 

Contributing:

The work flow for contributing to liveboard is as follows:

# get the repository either by SSH (requires ssh key for auth)
git clone git@github.com:knouse1344/liveboard_production.git

# or by http (requires typing password on each push and pull)
git clone https://github.com/knouse1344/liveboard_production.git

# you now have a local repository that is the same as the remote repository stored on github's servers
# you are on the branch master be default. Changes you make now will all happen on whatever branch you are on. Lets change to a new branch so that our changes are separated from everyone else. Changes you make on a new branch do not effect any other branches.

# make new branch to work on your new feature, and also "checkout" into it. Checking out means switching into a specific branch. All of your local files will automatically be switched to those present in that branch. A new branch and a checkout in one command!

git checkout -b newBranchName

# check what branch you are on by typing:
git branch

# now make some changes! They will only happen on your local repo on your current branch. But this means if something happens to your computer those changes are lost. Let's push them to the remote repository hosted on github that you cloned from. This way everyone else can now pull them down, and they are safely stored away

# see the status of the changes you have made on your branch
git status

# tell git that you want to keep all of the changes you have made. this is called staging a change
git add .

# commit those changes and add a message
git commit -am "my first commit"

# push the local version of the repository to the remote host
git push origin newBranchName

# Here we have a general rule. YOU ARE RESPONSIBLE FOR SOLVING MERGE CONFLICTS BETWEEN MASTER AND YOUR BRANCH. This means you need to frequently get the latest version of master, and merge master into your branch. NOT THE OTHER WAY AROUND. All conflicts must be fixed before merging your branch back into master. This will keep everyone sane. Let's try it.

#get the newest version of master
git pull origin master

# merge master into your new branch. You have to be in the branch to do this so let's make sure we are with a checkout first
git checkout newBranchName
git merge master

# Hopefully there weren't any conflcits. If there were try to merge them safely. If you are confused contact someone else for help. DONT GO AHEAD WITH BAD MERGES. THIS IS ANOTHER WAY TO BREAK EVERYTHING

# now that we have the newest version of master merged into our branch we should push to remote again
git push origin newBranchName

#awesome. Now code to your heart's content. when you are ready to merge your code back into master you are ready for a pull request. Go to github and select your branch. Then issue a pull request. This means that at least one other person must read and approve your code. Please do a good job on reviews, nobody wants to go back and fix things once they are committed. Once the code is approved merge it back into master. Your code is now in master! Finally delete your branch

# delete the now useless branch, first checkout master since we can't delete a branch we are in
git checkout master
# delete remote branch
git push origin --delete branchName
#delte local branch 
git branch -D branchName