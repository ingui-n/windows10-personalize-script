import {execute} from "../globals.js";
import {log} from "../logger.js";

const powerShellScript = async () => {
  log({source: 'powerShellScript', message: 'Running ps1 script...'})

  const {ok} = await execute(`
    try {Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force} catch {};
    functions\\script.ps1
  `);
  return ok;
};

export default powerShellScript;
