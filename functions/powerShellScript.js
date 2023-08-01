import {PowerShell} from "node-powershell";

const powerShellScript = async () => {
  const ps = new PowerShell();

  await ps.invoke(`
       Set-ItemProperty -Path HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Search -Name SearchBoxTaskbarMode -Value 0 -Type DWord -Force;
       Set-ItemProperty -Path HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced -Name ShowTaskViewButton -Type DWord -Value 0;
       Set-ItemProperty -Path HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced\\People -Name PeopleBand -Value 0 -Type DWord;
       Set-ItemProperty -Path HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer -Name HideSCAMeetNow -Value 1;
       Stop-Process -Name "explorer" -Force;
       Start-Process -Name "explorer"
  `)
    .finally(() => {
      ps.dispose();
    });

  return true;
};

export default powerShellScript;
