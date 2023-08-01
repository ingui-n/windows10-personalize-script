import {PowerShell} from "node-powershell";
import isChocolateyInstalled from "./isChcolateyInstalled.js";
import dotenv from 'dotenv';
import {log} from "../logger.js";

dotenv.config();

const installAppsFromChocolatey = async () => {
  log({source: 'installAppsFromChocolatey', message: 'Installing packages'});

  if (!(await isChocolateyInstalled()))
    return false;

  const ps = new PowerShell();

  await ps.invoke(`choco install ${process.env.CHOCO_APPS} -y`)
    .then(res => log({source: 'Chocolatey packages installation', message: res.raw}))
    .finally(() => {
      ps.dispose();
    });

  return true;
};

export default installAppsFromChocolatey;
