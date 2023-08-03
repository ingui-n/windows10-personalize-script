import {mouse} from '@nut-tree/nut-js';
import '@nut-tree/template-matcher';
import {initStopListener, createTempDirIfNotExist, runOnBackGround, resetMouse} from "./globals.js";
import powerShellScript from "./functions/powerShellScript.js";
import dotenv from 'dotenv';
import installDriverBooster from "./functions/installDriverBooster.js";
import driverBoosterListeners from "./functions/driverBoosterListeners.js";
import installVisualC from "./functions/installVisualC.js";
import installDirectX from "./functions/installVisualDirectX.js";
import addWiFiEntry from "./functions/addWiFiEntry.js";
import isOnline from "is-online";
import {log} from "./logger.js";
import installAppsFromChocolatey from "./functions/installAppsFromChocolatey.js";

dotenv.config();
mouse.config.mouseSpeed = Infinity;

const start = async () => {
  const abortListener = await initStopListener();
  await resetMouse();
  await createTempDirIfNotExist();

  if (process.env.ADD_WIFI_ENTRY === "1")
    await addWiFiEntry();

  runOnBackGround(powerShellScript)

  if (await isOnline()) {
    await installVisualC();
  } else {
    log({source: 'start', message: 'No internet connection'});
  }

  await installDirectX();

  if (process.env.INSTALL_DRIVER_BOOSTER === "1") {
    if (await isOnline()) {
      runOnBackGround(() => installDriverBooster().then(driverBoosterListeners));
    } else {
      log({source: 'start', message: 'No internet connection'});
    }
  }

  if (process.env.INSTALL_CHOCOLATEY_APPS === "1") {
    if (await isOnline()) {
      runOnBackGround(installAppsFromChocolatey);
    } else {
      log({source: 'start', message: 'No internet connection'});
    }
  }

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
};

start().catch();
