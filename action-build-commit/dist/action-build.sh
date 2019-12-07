#!/bin/bash
set -e

env

echo "Building action: $ACTION_FOLDER"

cat "$GITHUB_EVENT_PATH"
cd "$RUNNER_WORKSPACE/actions/$ACTION_FOLDER"

npm install
ncc build index.js

