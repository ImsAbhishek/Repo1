#!/bin/sh

GIT=`which git`
REPO_DIR=/
cd ${REPO_DIR}
${GIT} add --all code
${GIT} commit -m "Test commit"
${GIT} push git@github.com:ImsAbhishek/Repo1.git master
