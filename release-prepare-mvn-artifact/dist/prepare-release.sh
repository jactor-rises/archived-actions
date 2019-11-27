#!/bin/bash
set -e

cat pom.xml | grep version | grep SNAPSHOT | \
  sed 's/version//g' | sed 's/  /v/' | sed 's/-SNAPSHOT//' | sed 's;[</>];;g' > .release-version

mvn -B release:update-versions

cat pom.xml | grep version | grep SNAPSHOT | \
  sed 's/version//g' | sed 's/  /v/' | sed 's:[</>]::g' > .new-snapshot-version
