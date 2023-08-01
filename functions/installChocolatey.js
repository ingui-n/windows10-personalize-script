import {PowerShell} from "node-powershell";

const installChocolatey = async () => {
  if (await isChocolateyInstalled())
    return true;

  const ps = new PowerShell();

  await ps.invoke(`Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))`)
    .finally(() => {
      ps.dispose();
    });

  return true;
};

const isChocolateyInstalled = async () => {
  let isInstalled;
  const ps = new PowerShell();

  await ps.invoke(`C:\\ProgramData\\chocolatey\\choco.exe`)
    .then(() => {
      isInstalled = true;
    })
    .catch(() => {
      isInstalled = false;
    })
    .finally(() => {
      ps.dispose();
    });

  return isInstalled;
};

export default installChocolatey;
