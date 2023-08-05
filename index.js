import {mouse} from '@nut-tree/nut-js';
import '@nut-tree/template-matcher';
import {initStopListener, runOnBackGround, resetMouse} from "./globals.js";
import powerShellScript from "./functions/powerShellScript.js";
import dotenv from 'dotenv';
import driverBoosterListeners from "./functions/driverBoosterListeners.js";

dotenv.config();
mouse.config.mouseSpeed = Infinity;

const start = async () => {
  const abortListener = await initStopListener();
  await resetMouse();

  runOnBackGround(() =>
    powerShellScript().then(() =>
      process.env.INSTALL_DRIVER_BOOSTER === "1" ? driverBoosterListeners : undefined
    )
  );

  abortListener.kill();

  //todo unpin all
  //todo pin this pc
  //todo set this pc to default
  //todo show hidden files

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
};

start().catch();
