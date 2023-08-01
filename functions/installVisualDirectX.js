import {PowerShell} from "node-powershell";
import {log} from "../logger.js";

const installDirectX = async () => {
  log({source: 'installDirectX', message: 'Installing DirectX'});

  let returnStatus = false;
  const ps = new PowerShell();

  await ps.invoke(`software\\dxwebsetup.exe /Q`)
    .then(async () => {
      returnStatus = true;
    })
    .catch((e) => {
      log({source: 'installDirectX', message: e});
    })
    .finally(() => {
      ps.dispose();
    });

  return returnStatus;
};
export default installDirectX;
