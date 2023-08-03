import isChocolateyInstalled from "./isChcolateyInstalled.js";
import dotenv from 'dotenv';
import {log} from "../logger.js";
import {execute} from "../globals.js";
import installChocolatey from "./installChocolatey.js";

dotenv.config();

const installAppsFromChocolatey = async () => {
  log({source: 'installAppsFromChocolatey', message: 'Installing packages'});

  if (!(await isChocolateyInstalled())) {
    const {ok} = await installChocolatey();

    if (!ok)
      return false;
  }

  const res = await execute(`choco install ${process.env.CHOCO_APPS} -y`, 'installAppsFromChocolatey');

  return res.ok;
};

export default installAppsFromChocolatey;
