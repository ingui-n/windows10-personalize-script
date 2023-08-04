import {execute} from "../globals.js";
import {log} from "../logger.js";

const installOperaProfile = async () => {
  const {ok: isOperaInstalled} = await execute(`Test-Path -Path "$env:APPDATA\\Opera Software"`);

  if (!isOperaInstalled) {
    await execute(`New-Item -ItemType Directory -Path "$env:APPDATA\\Opera Software"`);
    log({source: 'installOperaProfile', message: 'Warning: Opera is not installed'});
  }

  const {ok} = await execute(`
    $zipFile = "software\\Opera Stable.zip"
    $destination = "$env:APPDATA\\Opera Software"

    Expand-Archive -Path $zipFile -DestinationPath $destination
  `);

  if (ok)
    return true;
};

export default installOperaProfile;
