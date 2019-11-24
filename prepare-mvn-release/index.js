const core = require("@actions/core");
const exec = require("@actions/exec");

async function run() {
  try {
    // set the file name to use for the tag value
    const tagFileName = core.getInput("tag-file-name");

    if (tagFileName != null) {
      exportTagFileName(tagFileName)
    } else {
      exportTagFileName(".tag-artifact")
    }

    // Set the src-path
    const src = __dirname + "/src";
    core.debug(`src: ${src}`);

    // Execute verify bash script
    await exec.exec(`${src}/prepare-release.sh`);
  } catch (error) {
    core.setFailed(error.message);
  }
}

async function exportTagFileName(tagFileName) {
  await exec.exec("export", "TAG_FILE_NAME=" + tagFileName);
}

// noinspection JSIgnoredPromiseFromCall
run();