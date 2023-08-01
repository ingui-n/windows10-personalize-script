import {findInRegion, typeMultipleKeys} from "../globals.js";
import {
  Button,
  centerOf, getActiveWindow,
  Key,
  keyboard,
  mouse, sleep,
  straightTo
} from "@nut-tree/nut-js";
import {log} from "../logger.js";

const turnOffTheFunctionWithOneFinger = async ({repeatTime = 5}) => {
  log({message: 'Turning off trigger for one finger function'});

  await keyboard.pressKey(Key.LeftSuper, Key.I);
  await keyboard.releaseKey(Key.LeftSuper, Key.I);

  await sleep(1000);

  await keyboard.pressKey(Key.LeftSuper, Key.Up);
  await keyboard.releaseKey(Key.LeftSuper, Key.Up);

  let region = await findInRegion({imagePath: 'images/oneFinger2.png', confidence: .8});

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

  region = await findInRegion({imagePath: 'images/oneFinger4.png', confidence: .8});

  if (region) {
    await typeMultipleKeys({keys: [Key.Space]});
  }

  await typeMultipleKeys({
      keys: [
        Key.Tab, Key.Tab
      ], sleepTime: 100
    }
  );

  region = await findInRegion({imagePath: 'images/oneFinger4.png', confidence: .8});

  if (region) {
    await typeMultipleKeys({keys: [Key.Space]});
  }

  await typeMultipleKeys({
      keys: [
        Key.Tab, Key.Tab
      ], sleepTime: 100
    }
  );

  region = await findInRegion({imagePath: 'images/oneFinger4.png', confidence: .8});

  if (region) {
    await typeMultipleKeys({keys: [Key.Space]});
  }

  let windowTitle = await (await getActiveWindow()).title;

  if (windowTitle.startsWith('Nastaven') || windowTitle.startsWith('Settings')) {
    await keyboard.pressKey(Key.LeftAlt, Key.F4);
    await keyboard.releaseKey(Key.LeftAlt, Key.F4);
  }


  /*while (region) {
    await sleep(100);
    await mouse.leftClick();
    region = await findInRegion({imagePath: 'images/oneFinger3.png', confidence: .8, timeout: 10000});
  }*/

  // await mouse.move(straightTo(centerOf(region)));
  // await sleep(100);
  // await mouse.leftClick();

  console.log('a')
  return ;

  windowTitle = await (await getActiveWindow()).title;

  if (!(windowTitle.startsWith('Nastaven') || windowTitle.startsWith('Settings'))) {
    return repeatTime < 1 ? false : turnOffTheFunctionWithOneFinger({repeatTime: repeatTime - 1});
  }

  await typeMultipleKeys({keys: [Key.Enter]});

  await keyboard.pressKey(Key.LeftAlt, Key.F4);
  await keyboard.releaseKey(Key.LeftAlt, Key.F4);

  await keyboard.pressKey(Key.LeftSuper, Key.I);
  await keyboard.releaseKey(Key.LeftSuper, Key.I);

  await typeMultipleKeys({
      keys: [
        Key.Tab, Key.Right, Key.Right, Key.Right, Key.Right, Key.Right, Key.Right, Key.Right,
        Key.Right, Key.Right, Key.Space, Key.Tab
      ], sleepTime: 100
    }
  );

  region = findInRegion({imagePath: 'images/oneFinger0.png', timeout: 10000});

  if (!region)


  await typeMultipleKeys({
      keys: [
        Key.Tab, Key.Right, Key.Right, Key.Right, Key.Right, Key.Right, Key.Right, Key.Right,
        Key.Right, Key.Right, Key.Space, Key.Tab,
        Key.Down, Key.Down, Key.Down, Key.Down, Key.Down, Key.Down, Key.Down,
        Key.Down, Key.Down, Key.Down, Key.Space
      ], sleepTime: 100
    }
  );

  return;

  region = findInRegion({imagePath: 'images/oneFinger0.png', timeout: 10000});

  if (!region)
    return;

  await mouse.move(straightTo(centerOf(region)));
  await mouse.leftClick();

  region = findInRegion({imagePath: 'images/oneFinger1.png', timeout: 10000, confidence: .7});

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
