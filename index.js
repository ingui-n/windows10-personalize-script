import {mouse} from '@nut-tree/nut-js';
import '@nut-tree/template-matcher';
import hideMeetingButton from "./functions/hideMeetingButton.js";
import hideSearchIcon from "./functions/hideSearchIcon.js";
import hideTasksIcon from "./functions/hideTasksIcon.js";
import turnOffTheFunctionWithOneFinger from "./functions/turnOffTheFunctionWithOneFinger.js";

mouse.config.mouseSpeed = Infinity;

const start = async () => {
  await hideSearchIcon();
  // await hideMeetingButton();
  // await hideTasksIcon();
  await turnOffTheFunctionWithOneFinger();

};

start().catch();
