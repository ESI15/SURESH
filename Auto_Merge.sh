#!/bin/sh
# Automatically merge the last commit through the following branches:
#Hotfix->master
#hotfix->Integration 

CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

LAST_COMMIT=$(git rev-list -1 HEAD)

echo Automatically merging commit $LAST_COMMIT from $CURRENT_BRANCH rippling to master

case $CURRENT_BRANCH in
Hotfix)

git checkout master

git pull origin master

git merge $CURRENT_BRANCH

git push https://ESI15:admin123@github.com/ESI15/SURESH.git


git checkout Integration

git pull origin Integration

git merge $CURRENT_BRANCH

git push https://ESI15:admin123@github.com/ESI15/SURESH.git


git checkout $CURRENT_BRANCH

;;
esac
