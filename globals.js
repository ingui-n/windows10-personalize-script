import {
  imageResource,
  Key,
  keyboard,
  mouse,
  OptionalSearchParameters,
  Point,
  Region,
  screen,
  sleep
} from "@nut-tree/nut-js";
import {AbortController} from "node-abort-controller";

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

const findWithTimeout = async () => {

};

export {screenWidth, screenHeight, typeMultipleKeys, findInRegion, findWithTimeout};
