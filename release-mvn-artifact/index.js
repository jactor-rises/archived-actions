const core = require("@actions/core");
const exec = require("@actions/exec");

async function run() {
  try {
    // Set the src-path
    const src = __dirname + "/src";
    core.debug(`src: ${src}`);

    // Execute release bash script
    await exec.exec(`${src}/release.sh`);
  } catch (error) {
    core.setFailed(error.message);
  }
}

// noinspection JSIgnoredPromiseFromCall
run();