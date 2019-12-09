#!/bin/bash
set -e

echo "debug workspace"
env

echo "Building action: $INPUT_ACTION-FOLDER"

cd "$RUNNER_WORKSPACE/actions/$INPUT_ACTION-FOLDER"

npm install
ncc build index.js

