import {PowerShell} from "node-powershell";
import {getTempPath} from "../globals.js";
import {log} from "../logger.js";

const installVisualC = async () => {
  log({source: 'installVisualC', message: 'Installing C++'});

  let returnStatus = false;
  const tempPath = await getTempPath();

  if (!tempPath)
    return false;

  const filePath = `${tempPath}\\VisualCppRedist_AIO_x86_x64.exe`;

  const ps = new PowerShell();

  await ps.invoke(`Invoke-WebRequest -Uri "https://github.com/abbodi1406/vcredist/releases/download/v0.73.0/VisualCppRedist_AIO_x86_x64.exe" -OutFile "${filePath}"`)
    .then(async () => {
      returnStatus = await runTheInstall(filePath);
    })
    .catch((e) => {
      log({source: 'installVisualC', message: e});
    })
    .finally(() => {
      ps.dispose();
    });

  return returnStatus;
};

const runTheInstall = async (filePath) => {
  log({source: 'installVisualC-runTheInstall', message: 'Installing C++'});

  let returnStatus = false;
  const ps = new PowerShell();

  await ps.invoke(`${filePath} /ai /gm2`)
    .then(async () => {
      returnStatus = true;
    })
    .catch((e) => {
      log({source: 'installVisualC', message: e});
    })
    .finally(() => {
      ps.dispose();
    });

  return returnStatus;
};

export default installVisualC;
