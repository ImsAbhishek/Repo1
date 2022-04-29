#!/bin/sh
branch=mygalmm
GIT=`which git`
# REPO_DIR=/
# cd ${REPO_DIR}
${GIT} init
ss=$(${GIT} ls-remote --heads https://ImsAbhishek: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@github.com/ImsAbhishek/Repo1.git $branch | wc -l)
if [[ "$ss" == 0 ]];
then
 echo "branch does't exist"
 ${GIT} checkout -b $branch
else
    echo "branch exist"
   ${GIT} checkout $branch
fi
${GIT} add --all -- ':!.gitignore' ':!bitbucket-pipelines.yml' ':!pipeline.sh'
${GIT} commit -m "Test commit"
${GIT} push https://ImsAbhishek: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@github.com/ImsAbhishek/Repo1.git $branch
    