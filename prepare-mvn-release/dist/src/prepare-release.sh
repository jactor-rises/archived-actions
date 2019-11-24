#!/bin/bash
set -e

echo "Writing to tag file '$TAG_FILE_NAME'"

cat pom.xml | grep version | grep SNAPSHOT | \
  sed 's/version//g' | sed 's/  /v/' | sed 's/-SNAPSHOT//' | sed 's;[</>];;g' > $TAG_FILE_NAME

mvn -B release:update-versions

cat pom.xml | grep version | grep SNAPSHOT | \
  sed 's/version//g' | sed 's/  /Bumped to new version: /' | sed 's:[</>]::g'
