import {findInRegion, typeMultipleKeys} from "../globals.js";
import {
  centerOf,
  Key,
  keyboard,
  mouse,
  straightTo
} from "@nut-tree/nut-js";
import {log} from "../logger.js";

const turnOffTheFunctionWithOneFinger = async () => {
  log({message: 'Turning off trigger for one finger function'});

  await keyboard.pressKey(Key.LeftSuper, Key.I);
  await keyboard.releaseKey(Key.LeftSuper, Key.I);

  let region = findInRegion({imagePath: 'images/oneFinger0.png', timeout: 10000});

  if (!region)
    return;

  await mouse.move(straightTo(centerOf(region)));
  await mouse.leftClick();

  region = findInRegion({imagePath: 'images/oneFinger1.png'});

  if (!region)
    return;

  await mouse.move(straightTo(centerOf(region)));
  await mouse.leftClick();

  await typeMultipleKeys(
    Key.Tab, Key.Tab, Key.Tab, Key.Space,
    Key.Tab, Key.Tab, Key.Space,
    Key.Tab, Key.Tab, Key.Space
  );


  // await typeMultipleKeys(Key.LeftShift, Key.LeftShift, Key.LeftShift, Key.LeftShift, Key.LeftShift, Key.LeftShift, Key.LeftShift, Key.LeftShift, Key.LeftShift, Key.LeftShift, Key.LeftShift);
  // await typeMultipleKeys(Key.A, Key.A, Key.A, Key.A, Key.A, Key.A, Key.A, Key.A, Key.A);

};

export default turnOffTheFunctionWithOneFinger;
