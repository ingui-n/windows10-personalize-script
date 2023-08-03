import {mouse} from '@nut-tree/nut-js';
import '@nut-tree/template-matcher';
import {initStopListener, createTempDirIfNotExist} from "./globals.js";
import powerShellScript from "./functions/powerShellScript.js";

mouse.config.mouseSpeed = Infinity;

const start = async () => {
  const abortListener = await initStopListener();
  await createTempDirIfNotExist();

  // runOnBackGround(() => {
  //   installChocolatey().then(installAppsFromChocolatey);
  // });

  // await resetMouse();
  // await stopOneFingerTrigger();

  // await resetMouse();
  // await renameComputer();

  // await installVisualC();
  // await installDirectX();
  // await addWiFiEntry();

  await powerShellScript();

  abortListener.kill();

  //   const region = new Region(Math.floor(screenWidth / 2), screenHeight - 50, Math.floor(screenWidth / 2), 50);
  // await screen.captureRegion('screenshot.png', region);
  // return ;


  // mouse.config.mouseSpeed = 1;
  // await sleep(1000)
  // try {
  //   mouse.scrollDown(10000);
  //   const location = await screen.waitFor(singleWord("Tablet"), 5000);
  //
  //   console.log(location)
  // } catch (e) {
  //   console.log(e)
  // }

  // const ps = new PowerShell();
  //
  //   ps.invoke(`npx run-func functions/stopOneFingerTrigger.js ${fun.name}`)
  //     .then(async output => {
  //       console.log(200, output);
  //       console.log(output.raw, typeof output.raw, output.raw === '1');
  //       // if (output.raw !== '1')
  //       //   await callAgain();
  //     })
  //     .catch(err => {
  //       console.error(10, err);
  //     });

  // const child = spawn('npx', ['run-func', './stopOneFingerTrigger.js', fun.name]);
  // const res = await fun();

  // child.on('close', (code) => {
  //   clearInterval(interval);
  // });

};

start().catch();
