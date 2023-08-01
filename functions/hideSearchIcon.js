import {
    centerOf,
    imageResource,
    Key,
    mouse,
    OptionalSearchParameters,
    Region,
    screen,
    straightTo
} from "@nut-tree/nut-js";
import {screenHeight, screenWidth, typeMultipleKeys} from "../globals.js";
import {AbortController} from "node-abort-controller";

const hideSearchIcon = async () => {
    const region = new Region(0, Math.floor(screenHeight * .9), screenWidth, Math.floor(screenHeight * .1));
    const controller = new AbortController();
    const {signal} = controller;

    const config = new OptionalSearchParameters(region, .9, signal);

    try {
        const match = await screen.find(imageResource('images/search0.png'), config);

        await mouse.move(straightTo(centerOf(match)));
        await mouse.rightClick();
        await typeMultipleKeys(Key.Down, Key.Down, Key.Right, Key.Enter);
    } catch (e) {
    }
};

export default hideSearchIcon;
