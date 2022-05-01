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
   ${GIT} push --delete https://ImsAbhishek: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@github.com/ImsAbhishek/Repo1.git $branch
   ${GIT} checkout -b  $branch
fi
ab=$(${GIT} add --all .)
echo $ab
${GIT} commit -m "Test commit"
${GIT} push https://ImsAbhishek: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@github.com/ImsAbhishek/Repo1.git $branch
