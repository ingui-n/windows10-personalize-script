import {PowerShell} from "node-powershell";
import isChocolateyInstalled from "./isChcolateyInstalled.js";
import {log} from "../logger.js";

const installChocolatey = async () => {
  log({source: 'installChocolatey', message: 'Installing Chocolatey'});

  if (await isChocolateyInstalled())
    return true;

  const ps = new PowerShell();

  await ps.invoke(`Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))`)
    .finally(() => {
      ps.dispose();
    });

  return true;
};

export default installChocolatey;
