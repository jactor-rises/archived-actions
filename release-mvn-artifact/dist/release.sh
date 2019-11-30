#!/bin/bash

env

echo "Running release"
mvn -B deploy -Dregistry=https://maven.pkg.github.com/jactor-rises -Dtoken=GITHUB_TOKEN
