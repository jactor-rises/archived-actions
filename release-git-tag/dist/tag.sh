#!/bin/bash
set -e

TAGGED_CONTENT=$(cat $TAG_FILE_NAME)

echo "Creating tag: $TAGGED_CONTENT"

env

git config --global user.email "tor.egil.jacobsen@gmail.com"
git config --global user.name "release-prepare-mvn-artifact GitHub Action"

git tag -a ${TAGGED_CONTENT} -m "$GITHUB_ACTOR released artifact: $TAGGED_CONTENT"
