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
  # ${GIT} push --delete https://ImsAbhishek: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@github.com/ImsAbhishek/Repo1.git $branch
   ${GIT} checkout  $branch
fi
 ${GIT} add --all .
ab=`${GIT} status`
echo $ab
${GIT} commit -m "Test commit"
${GIT} push https://ImsAbhishek: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@github.com/ImsAbhishek/Repo1.git $branch
