import {execute} from "../globals.js";

const isChocolateyInstalled = async () => {
  const {ok} = await execute(`C:\\ProgramData\\chocolatey\\choco.exe`);
  return ok;
};

export default isChocolateyInstalled;
