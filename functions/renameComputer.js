import {Key, keyboard, sleep} from "@nut-tree/nut-js";
import {isWindowSettings} from "../globals.js";

const renameComputer = async () => {
  if (process.env.DEVICE_NAME === '')
    return false;

  await keyboard.pressKey(Key.LeftAlt, Key.Pause);
  await keyboard.releaseKey(Key.LeftAlt, Key.Pause);
  await sleep(1000);

  await keyboard.type(Key.Enter);
  await sleep(500);

  await keyboard.type(process.env.DEVICE_NAME);
  await keyboard.type(Key.Enter);
  await sleep(2000);

  await keyboard.type(Key.Tab, Key.Enter);

  if (await isWindowSettings()) {
    await keyboard.pressKey(Key.LeftAlt, Key.F4);
    await keyboard.releaseKey(Key.LeftAlt, Key.F4);
  }

  return true;
};

export default renameComputer;
