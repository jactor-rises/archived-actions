# jactor-rises/actions/release-artifact

This action will release an artifact already built by earlier steps.

Requires that the artifact is being modified and is prepared for release
by earlier steps. This action is only interested in the pattern given to
`git add`, the release tag, the release tag message, and the commit 
message for the files being added to the commit history.

This action therefore requires the name of the generated json file which
will supply this information. see `action.yml`

The json expected is:
```
{
  "git-add":"<some argument>",
  "git-commit-msg":"<the commit message for the files being added>", 
  "git-tag":"<the expected tag being released>",
  "git-tag-msg":"<the message which will follow the release tag"
}
```
