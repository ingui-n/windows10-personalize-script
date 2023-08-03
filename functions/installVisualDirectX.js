import {log} from "../logger.js";
import {execute} from "../globals.js";

const installDirectX = async () => {
  log({source: 'installDirectX', message: 'Installing DirectX'});

  const {ok} = await execute(`software\\dxwebsetup.exe /Q`, 'installDirectX');

  return ok;
};
export default installDirectX;
