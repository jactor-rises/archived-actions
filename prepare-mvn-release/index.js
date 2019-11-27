const core = require("@actions/core");
const exec = require("@actions/exec");
const fs = require("fs");
const process = require("process");

async function run() {
  try {
    core.debug(`filepath: ${__dirname}`);

    // Execute prepare-release bash script
    await exec.exec(`${__dirname}/src/prepare-release.sh`);

    readPreparation('.tagged-release', 'tagged-release');
    readPreparation('.new-snapshot-version', 'new-snapshot-version');

  } catch (error) {
    core.setFailed(error.message);
  }
}

function readPreparation(filename, output) {
  prepareRelease(`${process.env.GITHUB_WORKSPACE}/${filename}`).then(
      value => {
        core.info('the new snapshot version: ' + value);
        core.setOutput(output, value);
      }
  );
}

function prepareRelease(filepath) {
  const encoding = {encoding: 'utf-8'};

  return new Promise((resolve, reject) => {
        fs.readFile(filepath, encoding, function (error, data) {
          if (error) {
            console.log(error);
            reject(error)
          } else {
            resolve(data)
          }
        })
      }
  );
}

// noinspection JSIgnoredPromiseFromCall
run();
