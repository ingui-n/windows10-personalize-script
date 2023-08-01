import {centerOf, Key, mouse, straightTo} from "@nut-tree/nut-js";
import {findInRegion, screenHeight, screenWidth, typeMultipleKeys} from "../globals.js";
import {log} from "../logger.js";

const hidePeopleIcon = async () => {
  log({source: 'hidePeopleIcon', message: 'Hide people icon'});

  const region = await findInRegion({
    left: Math.floor(screenWidth / 2),
    top: screenHeight - 50,
    width: Math.floor(screenWidth / 2),
    height: 50,
    imagePath: 'images/people0.png',
    confidence: .8
  });

  if (region) {
    await mouse.move(straightTo(centerOf(region)));
    await mouse.rightClick();

    await typeMultipleKeys({
        keys: [
          Key.Down, Key.Down, Key.Down, Key.Down, Key.Enter
        ], sleepTime: 100
      }
    );
  }

  return true;
};

export default hidePeopleIcon;
