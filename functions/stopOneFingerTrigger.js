import {findInRegion, typeMultipleKeys} from "../globals.js";
import {centerOf, getActiveWindow, Key, keyboard, mouse, sleep, straightTo} from "@nut-tree/nut-js";
import {log} from "../logger.js";
import {spawn, spawnSync} from 'child_process';
import {PowerShell} from 'node-powershell';

const settingsWindowScript = async () => {
  log({message: 'Turning off trigger for one finger function'});

  // await keyboard.pressKey(Key.LeftSuper, Key.I);
  // await keyboard.releaseKey(Key.LeftSuper, Key.I);
  //
  // await sleep(1000);

  // if (!(await isWindowSettings())) {
  //   return attempt > 0 ? stopOneFingerTrigger(attempt - 1) : false;
  // }

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

const test = async (fun, attempt) => {
  const callAgain = async () => {
    // child.kill();
    try {
      await ps.dispose('SIGPWR');
    } catch (e) {
    }
    clearInterval(interval);
    // i = false;
    console.log('108')

    if (attempt > 0) {
      console.log(attempt)
      return test(fun, attempt - 1);
    }
  };

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

  const interval = setInterval(() => {
    isWindowSettings()
      .then(async res => {
        if (!res)
          await callAgain();
      });
  }, 10);

  // let i = true;

  //console.log((await PowerShell.$`npx run-func stopOneFingerTrigger.js ${fun.name}`).stdout.toString());
  // const a = spawnSync('pwd', [], {encoding: 'utf-8'});
  // console.log(a.stdout)

  const ps = new PowerShell();

  ps.invoke(`npx run-func functions/stopOneFingerTrigger.js ${fun.name}`)
    .then(async output => {
      console.log(200, output);
      console.log(output.raw, typeof output.raw, output.raw === '1');
      // if (output.raw !== '1')
      //   await callAgain();
    })
    .catch(err => {
      console.error(10, err);
    });

  // await ps.dispose();
  // clearInterval(interval);

  /*const a = await PowerShell.$`npx run-func stopOneFingerTrigger.js ${fun.name}`;
  console.log(a)

  const b = a.stdout.toString();
  console.log(b)

  if (b === 'true') {
    clearInterval(interval);
  }*/

  // const child = spawn('npx', ['run-func', './stopOneFingerTrigger.js', fun.name]);
  // const res = await fun();

  // child.on('close', (code) => {
  //   clearInterval(interval);
  // });

  // if (res)
  //   clearInterval(interval);
  console.log('129')
};

const stopOneFingerTrigger = async () => {


  await test(settingsWindowScript, 5);
};

// export default a;
// module.exports = {stopOneFingerTrigger};
export {settingsWindowScript, stopOneFingerTrigger}