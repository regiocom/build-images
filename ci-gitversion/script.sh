#!/bin/sh

git fetch --unshallow || true
git fetch --all

# merge source branch into target branch to calculate version after merge
if [ ${CI_MERGE_REQUEST_TARGET_BRANCH_NAME} != "" ]; then
  git checkout ${CI_MERGE_REQUEST_TARGET_BRANCH_NAME}
  git merge origin/${CI_MERGE_REQUEST_SOURCE_BRANCH_NAME}
fi

echo "CREATE SHARED VARIABLES"

# write GIT_VERSION to shared-vars.sh and pass it to the next stages
export FULLSEMVER=$(/tools/dotnet-gitversion /output json /config ${GIT_VERSION_CONFIG_PATH} /showvariable FullSemVer)
echo "GIT_VERSION=${FULLSEMVER}" >> shared-vars.env

chmod +x shared-vars.env

# print shared variables to console
cat shared-vars.env
