import isChocolateyInstalled from "./isChcolateyInstalled.js";
import dotenv from 'dotenv';
import {log} from "../logger.js";
import {execute} from "../globals.js";
import installChocolatey from "./installChocolatey.js";

dotenv.config();

const installDriverBooster = async () => {
  log({source: 'installDriverBooster', message: 'Installing DriverBooster'});

  if (!(await isChocolateyInstalled())) {
    const {ok} = await installChocolatey();

    if (!ok)
      return false;
  }

  const {ok} = await execute(`choco install driverbooster -y`, 'installDriverBooster');

  return ok;
};

export default installDriverBooster;
