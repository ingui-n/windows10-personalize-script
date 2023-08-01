import {centerOf, Key, mouse, straightTo} from "@nut-tree/nut-js";
import {findInRegion, screenHeight, screenWidth, typeMultipleKeys} from "../globals.js";

const hideTasksIcon = async () => {
  let region = await findInRegion({
    top: screenHeight - 50,
    width: Math.floor(screenWidth / 2),
    height: 50,
    imagePath: 'images/tasks0.png',
    confidence: .8
  });

  if (region) {
    await mouse.move(straightTo(centerOf(region)));
    await mouse.rightClick();

    await typeMultipleKeys({
        keys: [
          Key.Down, Key.Down, Key.Down, Key.Enter
        ], sleepTime: 100
      }
    );
  }

  return true;
};

export default hideTasksIcon;
