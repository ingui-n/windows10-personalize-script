import {
  imageResource,
  keyboard,
  mouse,
  OptionalSearchParameters,
  Point,
  Region,
  screen,
  sleep, straightTo
} from "@nut-tree/nut-js";
import {AbortController} from "node-abort-controller";
import {log} from "./logger.js";
import {GlobalKeyboardListener} from "node-global-key-listener";

const screenWidth = await screen.width();
const screenHeight = await screen.height();

const typeMultipleKeys = async ({keys = [], sleepTime = 0}) => {
  for (const key of keys) {
    await sleep(sleepTime);
    await keyboard.type(key)
  }
};

const findInRegion = async ({
                              left = 0,
                              top = 0,
                              width = screenWidth,
                              height = screenHeight,
                              confidence = .9,
                              imagePath,
                              timeout = 0
                            }) => {
  const region = new Region(left, top, width, height);
  const controller = new AbortController();
  const {signal} = controller;

  const config = new OptionalSearchParameters(region, confidence, signal);

  try {
    if (timeout > 0) {
      return await screen.waitFor(imageResource(imagePath), timeout, 10, config);
    } else {
      return await screen.find(imageResource(imagePath), config);
    }
  } catch (e) {
    return null;
  }
};

const resetMouse = async () => {
  await mouse.move(straightTo(new Point(10000, 10000)));
};

const initStopListener = async () => {
  const listener = new GlobalKeyboardListener();

  await listener.addListener((event, down) => {
    if (event.rawKey._nameRaw === 'VK_PAUSE') {
      log({message: 'Stopped by Break listener'});
      process.exit();
    }
  });

  await listener.start();

  return listener;
};

export {screenWidth, screenHeight, typeMultipleKeys, findInRegion, resetMouse, initStopListener};
