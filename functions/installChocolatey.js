import isChocolateyInstalled from "./isChcolateyInstalled.js";
import {log} from "../logger.js";
import {execute} from "../globals.js";

const installChocolatey = async () => {
  log({source: 'installChocolatey', message: 'Installing Chocolatey'});

  if (await isChocolateyInstalled())
    return true;

  const res = await execute(`Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))`, 'installChocolatey');

  return res.ok;
};

export default installChocolatey;
