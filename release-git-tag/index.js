const core = require("@actions/core");
const fs = require("fs");
const process = require("process");

async function run() {
  try {
    // the tag filename
    const releaseVersion = core.getInput("release-version", {required: true});

  } catch (error) {
    core.setFailed(error.message);
  }
}

// noinspection JSIgnoredPromiseFromCall
run();
