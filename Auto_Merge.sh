#!/bin/sh
# Automatically merge the last commit through the following branches:
#Hotfix-> Integration -> master

CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

LAST_COMMIT=$(git rev-list -1 HEAD)

echo Automatically merging commit $LAST_COMMIT from $CURRENT_BRANCH rippling to master

case $CURRENT_BRANCH in
Hotfix)

git checkout master

git merge $CURRENT_BRANCH

git push origin master


git checkout Dev

git merge $CURRENT_BRANCH

git push origin Dev:Integration


git checkout $CURRENT_BRANCH

;;
esac
