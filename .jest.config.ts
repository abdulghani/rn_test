import { Config } from "@jest/types";

const config: Config.InitialOptions = {
  preset: "react-native",
  moduleFileExtensions: ["ts", "tsx", "js", "jsx", "json", "node"],
  displayName: {
    name: "RN TEST",
    color: "white",
  },
  detectLeaks: false,
  verbose: false,
  detectOpenHandles: false,
  maxConcurrency: 1,
  maxWorkers: 1,
  notify: false,
  coverageDirectory: "<rootDir>/.coverage",
  testMatch: [
    "**/__tests__/**/*.test.[jt]s?(x)",
    "**/__tests__/**/*.int.test.[jt]s?(x)",
    "**/__tests__/**/*.test.int.[jt]s?(x)",
  ],
  transform: {
    "\\.tsx?$": "babel-jest",
    "\\.jsx$": "babel-jest",
  },
  rootDir: process.cwd(),
  reporters: ["default", "jest-junit"],
  testResultsProcessor: "jest-junit",
};

export default config;
