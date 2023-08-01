import {imageResource, Key, keyboard, mouse, OptionalSearchParameters, Point, Region, screen} from "@nut-tree/nut-js";
import {AbortController} from "node-abort-controller";

const screenWidth = await screen.width();
const screenHeight = await screen.height();

const typeMultipleKeys = async (...keys) => {
    keys.map(async key => await keyboard.type(key));
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
            return screen.waitFor(imageResource(imagePath), timeout);
        } else {
            return screen.find(imageResource(imagePath), config);
        }
    } catch (e) {
        return null;
    }
};

const findWithTimeout = async () => {

};

export {screenWidth, screenHeight, typeMultipleKeys, findInRegion, findWithTimeout};
