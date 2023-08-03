import {PowerShell} from "node-powershell";

const powerShellScript = async () => {
  const ps = new PowerShell();

  await ps.invoke(`functions\\script.ps1`)
    .finally(() => {
      ps.dispose();
    });

  return true;
};

export default powerShellScript;
