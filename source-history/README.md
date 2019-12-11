# jactor-rises/actions/release-git

This action will release a version via the git-history, i.e. commit any
changes of the source-tree done by previous actions (if any changes) and
also adding a tag for the release.

Requires a github runner with a github artifact and an environment where
a bash shell can run with a git client.

This action is strongly influenced by [Endbug/add-and-commit][https://github.com/EndBug/add-and-commit]
but do not require running a docker image and do not require to specify
the name and email of the committer. This information will be gathered
from use the information from the author of the head commit.
