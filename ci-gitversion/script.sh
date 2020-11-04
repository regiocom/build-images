#!/bin/sh

git fetch --unshallow
git fetch --all
echo "CREATE SHARED VARIABLES"

# write GIT_VERSION to shared-vars.sh and pass it to the next stages
export FULLSEMVER=$(/tools/dotnet-gitversion /output json /showvariable FullSemVer)
echo "export GIT_VERSION=$FULLSEMVER" >> shared-vars.sh
echo "export IMAGE_VERSION_TAG=$CONTAINER_BASE_NAME\$CONTAINER_IMAGE_NAME:\$GIT_VERSION" >> shared-vars.sh
# write private go repository import paths to GOPRIVATE
echo "export GOPRIVATE=gitlab.com/vlekapp/framework" >> shared-vars.sh

chmod +x shared-vars.sh

# print shared variables to console
cat shared-vars.sh
