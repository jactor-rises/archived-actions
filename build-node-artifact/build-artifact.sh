#!/bin/bash
set -e

echo "Building action: $INPUT_ARTIFACT_FOLDER"

cd "$RUNNER_WORKSPACE/$INPUT_ARTIFACT_FOLDER"

npm install
ncc build index.js
