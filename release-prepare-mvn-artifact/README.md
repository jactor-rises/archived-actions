# jactor-rises/actions/prepare-mvn-release

This action will prepare a maven artifact to be released. It will get the
release version from the expected SNAPSHOT version of the project. This
version will be bumped, ie. the pom.xml will be modified.

Requires a github runner with maven and a github artifact being built
with maven and runs on an environment which support bash-scripts.

No inputs are required, but the script will expect an environment 
variable for the filename that will hold the release tag.
