import {screen, getActiveWindow, getWindows, mouse, singleWord, sleep} from '@nut-tree/nut-js';
import '@nut-tree/template-matcher';
import hideMeetingButton from "./functions/hideMeetingButton.js";
import hideSearchIcon from "./functions/hideSearchIcon.js";
import hideTasksIcon from "./functions/hideTasksIcon.js";
import turnOffTheFunctionWithOneFinger from "./functions/turnOffTheFunctionWithOneFinger.js";

mouse.config.mouseSpeed = Infinity;

const start = async () => {
  // await hideSearchIcon();
  // await hideMeetingButton();
  // await hideTasksIcon();
  await turnOffTheFunctionWithOneFinger({});


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
