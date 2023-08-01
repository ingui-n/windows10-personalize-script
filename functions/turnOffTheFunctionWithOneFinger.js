import {findInRegion, typeMultipleKeys} from "../globals.js";
import {
    centerOf,
    Key,
    keyboard,
    mouse,
    straightTo
} from "@nut-tree/nut-js";
import {log} from "../logger.js";

const source = '';

const turnOffTheFunctionWithOneFinger = async () => {
    log({source, message: 'Opening Windows Settings'});
    await keyboard.pressKey(Key.LeftSuper, Key.I);
    await keyboard.releaseKey(Key.LeftSuper, Key.I);

    log({source, message: 'Searching for oneFinger0.png with timeout 10s'});
    let region = findInRegion({imagePath: 'images/oneFinger0.png', timeout: 10000});

    if (!region) {
        log({source, message: 'oneFinger0.png not found'});
        return;
    }

    //todo
    await mouse.move(straightTo(centerOf(region)));
    await mouse.leftClick();

    region = findInRegion({imagePath: 'images/oneFinger1.png'});

    if (!region)
        return;

    await mouse.move(straightTo(centerOf(region)));
    await mouse.leftClick();

    await typeMultipleKeys(
        Key.Tab, Key.Tab, Key.Tab, Key.Space,
        Key.Tab, Key.Tab, Key.Space,
        Key.Tab, Key.Tab, Key.Space
    );


    // await typeMultipleKeys(Key.LeftShift, Key.LeftShift, Key.LeftShift, Key.LeftShift, Key.LeftShift, Key.LeftShift, Key.LeftShift, Key.LeftShift, Key.LeftShift, Key.LeftShift, Key.LeftShift);
    // await typeMultipleKeys(Key.A, Key.A, Key.A, Key.A, Key.A, Key.A, Key.A, Key.A, Key.A);

};

export default turnOffTheFunctionWithOneFinger;
