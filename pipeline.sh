#!/bin/sh
branch=dev
GIT=`which git`
REPO_DIR=/
cd ${REPO_DIR}
ss=$(${GIT} ls-remote --heads git@github.com:ImsAbhishek/Repo1.git $branch | wc -l)
if [[ "$ss" == 0 ]];
then
 echo "branch does't exist"
 ${GIT} checkout -b $branch
fi
${GIT} add --all .
${GIT} commit -m "Test commit"
${GIT} push git@github.com:ImsAbhishek/Repo1.git $branch