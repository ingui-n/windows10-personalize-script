import {centerOf, Key, mouse, straightTo} from "@nut-tree/nut-js";
import {findInRegion, screenHeight, typeMultipleKeys} from "../globals.js";

const hideSearchIcon = async () => {
  let region = await findInRegion({
    top: screenHeight - 50,
    width: 100,
    height: 50,
    imagePath: 'images/search0.png',
    confidence: .7
  });

  if (region) {
    await mouse.move(straightTo(centerOf(region)));
    await mouse.rightClick();

    await typeMultipleKeys({
        keys: [
          Key.Down, Key.Down, Key.Right, Key.Enter
        ], sleepTime: 100
      }
    );
  }

  return true;
};

export default hideSearchIcon;
