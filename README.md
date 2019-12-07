# GitHub Actions for jactor-rises
Github Actions for my workflow files

## Design Philosophy
These actions is all designed just to be placeholders for execution of
bash scripts for each step. This to be able to easy test each step 
without having to run a github workflow file.

### Input/output
All inputs to these actions are therefore
- Binaries for the build, ex: maven
- Environment variables
- files on the filesystem which are outputs from other scripts (actions)

All communications between actions are done in the filesystem. If an action requires input from another action, this is
governed by an environment variable stating the name of the file used for input/output.
