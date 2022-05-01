#!/bin/sh
branch=qq
GIT=`which git`
# REPO_DIR=/
# cd ${REPO_DIR}
${GIT} init
ss=$(${GIT} ls-remote --heads https://ImsAbhishek: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@github.com/ImsAbhishek/Repo1.git $branch | wc -l)
echo "$ss"
if [[ "$ss" == 0 ]];
then
 echo "branch does't exist"
 ${GIT} checkout -b $branch
else
    echo "branch exist"
   ${GIT} fetch --all
   ${GIT} checkout -b $branch
fi
${GIT} add --all .
${GIT} commit -m "Test commit"
${GIT} push https://ImsAbhishek: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@github.com/ImsAbhishek/Repo1.git $branch
