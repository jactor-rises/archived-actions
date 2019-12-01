#!/bin/bash
set -e

TAGGED_CONTENT=$(cat $TAG_FILE_NAME)

echo "Creating tag: $TAGGED_CONTENT"

git tag -a ${TAGGED_CONTENT} -m "released artifact: $TAGGED_CONTENT"
