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
   ${GIT} push --delete https://ImsAbhishek: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@github.com/ImsAbhishek/Repo1.git $branch
   ${GIT} fetch -p
   ${GIT} checkout -b  $branch
fi
 ${GIT} add --all .
ab=`${GIT} status`
echo $ab
${GIT} commit -m "Test commit"
${GIT} push --force https://ImsAbhishek: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@github.com/ImsAbhishek/Repo1.git $branch
