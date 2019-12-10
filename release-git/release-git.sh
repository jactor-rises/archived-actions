#!/bin/sh
set -eu

echo "installing jq..."
sudo apt-get install jq

echo "fetching author name and email"
AUTHOR_EMAIL=$(cat $GITHUB_EVENT_PATH | sed 's/"//g' | jq '.head_commit.author.email')
AUTHOR_NAME=$(cat $GITHUB_EVENT_PATH | sed 's/"//g' | jq '.head_commit.author.name')

echo "'$AUTHOR_NAME' and '$AUTHOR_EMAIL'"

# Set up .netrc file with GitHub credentials
git_setup() {
  cat <<- EOF > $HOME/.netrc
    machine github.com
    login $GITHUB_ACTOR
    password $GITHUB_TOKEN
    machine api.github.com
    login $GITHUB_ACTOR
    password $GITHUB_TOKEN
EOF
  chmod 600 $HOME/.netrc

  git config --global user.email "$AUTHOR_EMAIL"
  git config --global user.name "$AUTHOR_NAME"
}

add() {
  if $INPUT_FORCE
    then find $INPUT_PATH -name "$INPUT_PATTERN" | while read x; do git add -f $x; done
    else find $INPUT_PATH -name "$INPUT_PATTERN" | while read x; do git add $x; done
  fi
}

echo "Setting up commit message"

if [[ -f "$INPUT_TAG_FILE_NAME" ]]
then
  TAG=$(cat "$INPUT_TAG_FILE_NAME")
  INPUT_MESSAGE=$(echo "$INPUT_MESSAGE" | sed '/{1}/'"$TAG"'/')
fi

INPUT_MESSAGE=$(echo "$INPUT_MESSAGE" | sed '/{0}/'"$GITHUB_ACTOR"'/")

echo "Commit message to use '$INPUT_MESSAGE'"

echo "Checking for uncommitted changes in the git working tree..."
# This section only runs if there have been file changes
if ! git diff --cached --exit-code
then
  git_setup

  git fetch

    # Verify if the branch needs to be created
  if ! git rev-parse --verify --quiet "${GITHUB_REF:11}"
  then
    echo "Creating branch..."
    git branch "${GITHUB_REF:11}"
  fi

  # Switch to branch from current workflow run
  echo "Switching branch..."
  git checkout "${GITHUB_REF:11}"

  echo "Adding files..."
  add

  echo "Creating commit..."
  git commit -m "'$INPUT_MESSAGE'"

  echo "Pushing to repo..."
  git push --set-upstream origin "${GITHUB_REF:11}"

  if [[ -f "$INPUT_TAG_FILE_NAME" ]]
  then
    echo "Creating release tag"
    git tag ${TAG}
    git push origin ${TAG}
  fi
else
  echo "Working tree clean. Nothing to commit."
fi
