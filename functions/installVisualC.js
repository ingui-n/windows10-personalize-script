import {execute, getTempPath} from "../globals.js";
import {log} from "../logger.js";

const installVisualC = async () => {
  log({source: 'installVisualC', message: 'Installing C++'});

  let returnStatus = false;
  const tempPath = await getTempPath();

  if (!tempPath)
    return false;

  const filePath = `${tempPath}\\VisualCppRedist_AIO_x86_x64.exe`;
  const {ok} = await execute(`Invoke-WebRequest -Uri "https://github.com/abbodi1406/vcredist/releases/download/v0.73.0/VisualCppRedist_AIO_x86_x64.exe" -OutFile "${filePath}"`, 'installVisualC');

  if (ok) {
    returnStatus = await runTheInstall(filePath);
  }

  return returnStatus;
};

const runTheInstall = async (filePath) => {
  log({source: 'installVisualC-runTheInstall', message: 'Installing C++'});
  const {ok} = await execute(`${filePath} /ai /gm2`, 'runTheInstall');

  return ok;
};

export default installVisualC;
