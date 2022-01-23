# React Native Project

## Usage

### Install

`npm install`

### Running project

- ios run `npm run ios`
- android run `npm run android`

### Nvm Switcher

this project use `.nvmrc` to specify the node version. if you're using nvm\
make sure you're set up nvm switcher for zsh/bash [here](https://github.com/nvm-sh/nvm#automatically-call-nvm-use).

### Extensions

If you're using `vscode`, install these vscode extensions for this project

- [Jest Runner](https://marketplace.visualstudio.com/items?itemName=firsttris.vscode-jest-runner) (firsttris)
- [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint) (Dirk Baeumer)
- [Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode) (Prettier)

## iOS Troubleshooting

if ios don't build. do the following

- clean ios project `npm run ios:clean`
- reset pods `npm run ios:reset`
- install pods `npm install`
