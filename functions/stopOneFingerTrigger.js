import {findInRegion, typeMultipleKeys} from "../globals.js";
import {centerOf, getActiveWindow, Key, keyboard, mouse, sleep, straightTo} from "@nut-tree/nut-js";
import {log} from "../logger.js";

const settingsWindowScript = async () => {
  log({message: 'Turning off trigger for one finger function'});

  await keyboard.pressKey(Key.LeftSuper, Key.I);
  await keyboard.releaseKey(Key.LeftSuper, Key.I);
  await sleep(1000);

  if (await isWindowSettings()) {
    await keyboard.pressKey(Key.LeftAlt, Key.F4);
    await keyboard.releaseKey(Key.LeftAlt, Key.F4);
    await sleep(1000);
  }

  await keyboard.pressKey(Key.LeftSuper, Key.I);
  await keyboard.releaseKey(Key.LeftSuper, Key.I);
  await sleep(1000);

  await keyboard.pressKey(Key.LeftSuper, Key.Up);
  await keyboard.releaseKey(Key.LeftSuper, Key.Up);

  let region = await findInRegion({imagePath: 'images/oneFinger0.png', confidence: .8});

  if (region) {
    await mouse.move(straightTo(centerOf(region)));
    await sleep(100);

    for (let i = 0; i < 15; i++) {
      await mouse.leftClick();
      await sleep(500);
    }
  }

  await typeMultipleKeys({
      keys: [
        Key.Tab, Key.Right, Key.Right, Key.Right, Key.Right, Key.Right, Key.Right, Key.Right,
        Key.Right, Key.Right, Key.Space
      ], sleepTime: 100
    }
  );

  await sleep(1000);

  await typeMultipleKeys({
      keys: [
        Key.Tab, Key.Down, Key.Down, Key.Down, Key.Down, Key.Down, Key.Down, Key.Down,
        Key.Down, Key.Down, Key.Down, Key.Space
      ], sleepTime: 100
    }
  );

  await sleep(1000);

  await typeMultipleKeys({
      keys: [
        Key.Tab, Key.Tab, Key.Tab
      ], sleepTime: 100
    }
  );

  region = await findInRegion({imagePath: 'images/oneFinger1.png', confidence: .8});

  if (region) {
    await typeMultipleKeys({keys: [Key.Space]});
  }

  await sleep(1000);

  await typeMultipleKeys({
      keys: [
        Key.Tab, Key.Tab
      ], sleepTime: 100
    }
  );

  region = await findInRegion({imagePath: 'images/oneFinger1.png', confidence: .8});

  if (region) {
    await typeMultipleKeys({keys: [Key.Space]});
  }

  await sleep(1000);

  await typeMultipleKeys({
      keys: [
        Key.Tab, Key.Tab
      ], sleepTime: 100
    }
  );

  region = await findInRegion({imagePath: 'images/oneFinger1.png', confidence: .8});

  if (region) {
    await typeMultipleKeys({keys: [Key.Space]});
  }

  await sleep(1000);

  if (await isWindowSettings()) {
    await keyboard.pressKey(Key.LeftAlt, Key.F4);
    await keyboard.releaseKey(Key.LeftAlt, Key.F4);
  }

  return 1;
};

const isWindowSettings = async () => {
  let windowTitle = await (await getActiveWindow()).title;

  return (windowTitle.startsWith('Nastaven') || windowTitle.startsWith('Settings'));
};

export default settingsWindowScript;
