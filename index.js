import {getActiveWindow, mouse} from '@nut-tree/nut-js';
import '@nut-tree/template-matcher';
import hideMeetingIcon from "./functions/hideMeetingIcon.js";
import hideSearchIcon from "./functions/hideSearchIcon.js";
import hideTasksIcon from "./functions/hideTasksIcon.js";
import {resetMouse, initStopListener} from "./globals.js";
import {stopOneFingerTrigger} from "./functions/stopOneFingerTrigger.js";
import hidePeopleIcon from "./functions/hidePeopleIcon.js";
import {spawnSync} from 'child_process';

mouse.config.mouseSpeed = Infinity;

const start = async () => {
  await initStopListener();

  // await resetMouse();
  // await hideSearchIcon();

  // await resetMouse();
  // await hideMeetingIcon();

  // await resetMouse();
  // await hidePeopleIcon();

  // await resetMouse();
  // await hideTasksIcon();

  await resetMouse();
  await stopOneFingerTrigger();



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
