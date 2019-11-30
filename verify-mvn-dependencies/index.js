const core = require("@actions/core");
const exec = require("@actions/exec");

async function run() {
  try {

    // Execute verify-dependencies bash script
    await exec.exec(`${__dirname}/verify-dependencies.sh`);

  } catch (error) {
    core.setFailed(error.message);
  }
}

// noinspection JSIgnoredPromiseFromCall
run();
''