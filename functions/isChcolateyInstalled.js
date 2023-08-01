import {PowerShell} from "node-powershell";

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

export default isChocolateyInstalled;
