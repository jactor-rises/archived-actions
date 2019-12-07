# jactor-rises/actions/release-git

This action will release a version via the git-history, i.e. commit any
changes of the source-tree done by previous actions (if any changes) and
also adding a tag for the release.

Requires a github runner with a github artifact and an environemnt where
a bash shell can run with git interactions.

No inputs are required, but the script will expect an environment 
variable for the filename that will hold the release version and the
github token.
