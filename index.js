/**
 * @format
 */

import { AppRegistry } from "react-native";
import { name as appName } from "./app.json";
import App from "./src/App";
import configureNotification from "./src/utils/configure-push-notification";

// configure notification
configureNotification();

AppRegistry.registerComponent(appName, () => App);
