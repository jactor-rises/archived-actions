#!/bin/bash

cat pom.xml | grep version | grep SNAPSHOT | \
  sed 's/version//g' | sed 's/  /v/' | sed 's/-SNAPSHOT//' | sed 's;[</>];;g' > .tag_artifact

mvn -B release:update-versions

cat pom.xml | grep version | grep SNAPSHOT | \
  sed 's/version//g' | sed 's/  /Bumped to new version: /' | sed 's:[</>]::g'
