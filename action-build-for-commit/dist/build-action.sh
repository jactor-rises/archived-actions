#!/bin/bash
set -e

echo "Building action: $INPUT_ACTION_FOLDER"

cd "$RUNNER_WORKSPACE/actions/$INPUT_ACTION_FOLDER"

npm install
ncc build index.js

