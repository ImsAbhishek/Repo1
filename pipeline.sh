#!/bin/sh
branch=dev
GIT=`which git`
# REPO_DIR=/
# cd ${REPO_DIR}
wpcomvip/babychakra.
${GIT} init
ss=$(${GIT} ls-remote --heads https://wpcomvip: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@github.com/wpcomvip/babychakra.git $branch | wc -l)
if [[ "$ss" == 0 ]];
then
 echo "branch does't exist"
 ${GIT} checkout -b $branch
else
    echo "branch exist"
   ${GIT} checkout $branch
fi
${GIT} add --all .
${GIT} commit -m "Test commit"
${GIT} push https://wpcomvip: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@github.com/wpcomvip/babychakra.git $branch
    