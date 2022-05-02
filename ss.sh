#!/bin/sh
branch=qq3
key="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"
GIT=`which git`
# REPO_DIR=/
# cd ${REPO_DIR}
${GIT} init
ss=$(${GIT} ls-remote --heads https://ImsAbhishek:$key@github.com/ImsAbhishek/Repo1.git $branch | wc -l)
echo "$ss"
if [[ "$ss" == 0 ]];
then
 echo "branch does't exist"
 ${GIT} checkout -b $branch
else
    echo "branch exist"
  # ${GIT} push --delete https://ImsAbhishek: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@github.com/ImsAbhishek/Repo1.git $branch
  # ${GIT} fetch -p
    ${GIT} pull https://ImsAbhishek:$key@github.com/ImsAbhishek/Repo1.git
    ${GIT} checkout  $branch
fi
 ${GIT} add --all .
ab=`${GIT} status`
echo $ab
${GIT} commit -m "Test commit add new file111111 "
${GIT} push --force https://ImsAbhishek:$key@github.com/ImsAbhishek/Repo1.git $branch
