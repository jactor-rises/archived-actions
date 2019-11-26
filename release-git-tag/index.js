const core = require("@actions/core");
const fs = require("fs");
const process = require("process");

async function run() {
  try {
    // the tag filename
    const token = core.getInput('repo-token', {required: true});
    const taggedRelease = core.getInput("tagged-release", {required: true});

  } catch (error) {
    core.setFailed(error.message);
  }
}

// noinspection JSIgnoredPromiseFromCall
run();
