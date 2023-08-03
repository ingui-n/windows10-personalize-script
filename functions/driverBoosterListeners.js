import {findInRegion} from "../globals.js";
import {centerOf, mouse, sleep, straightTo} from "@nut-tree/nut-js";

const driverBoosterListeners = async () => {
  const scanRegion = await findInRegion({imagePath: 'images/driver-booster0.png', confidence: .7, timeout: 10000});

  if (!scanRegion)
    return driverBoosterListeners();

  await mouse.move(straightTo(centerOf(scanRegion)));
  await sleep(1000);
  await mouse.leftClick();

  const updateRegion = await findInRegion({imagePath: 'images/driver-booster1.png', timeout: 15000});

  if (!updateRegion)
    return driverBoosterListeners();

  await mouse.move(straightTo(centerOf(updateRegion)));
  await sleep(500);
  await mouse.leftClick();

  const confirmRegion = await findInRegion({imagePath: 'images/driver-booster2.png', timeout: 10000});

  if (!confirmRegion)
    return driverBoosterListeners();

  await mouse.move(straightTo(centerOf(confirmRegion)));
  await sleep(500);
  await mouse.leftClick();
};

export default driverBoosterListeners;
