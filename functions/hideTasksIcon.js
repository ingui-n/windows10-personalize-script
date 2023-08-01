import {
    imageResource,
    Key,
    mouse,
    OptionalSearchParameters,
    Point,
    Region,
    screen,
} from "@nut-tree/nut-js";
import {screenHeight, screenWidth, typeMultipleKeys} from "../globals.js";
import {AbortController} from "node-abort-controller";

const hideTasksIcon = async () => {
    const region = new Region(0, Math.floor(screenHeight * .9), screenWidth, Math.floor(screenHeight * .1));
    const controller = new AbortController();
    const {signal} = controller;

    const config = new OptionalSearchParameters(region, .9, signal);

    try {
        await screen.find(imageResource('images/tasks0.png'), config);

        await mouse.move([new Point(screenWidth / 2, screenHeight)]);
        await mouse.rightClick();
        await typeMultipleKeys(Key.Down, Key.Down, Key.Down, Key.Enter);
    } catch (e) {
    }
};

export default hideTasksIcon;
