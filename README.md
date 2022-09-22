# DU-Mining-Screen

![Gallery](https://raw.githubusercontent.com/d6rks1lv3rz3r0/DU-Mining-Screen/main/Splash.png)

Helps manage Mining Units in Dual Universe.

# Features

## Mining Screen - Basic
- Displays stats of up to 8 Mining Units and Storage
- Options to define a threshold for calibration percentage either through game reported optimal values or personal preference (Default: 50%).
- Display Guide:

![Gallery](https://raw.githubusercontent.com/d6rks1lv3rz3r0/DU-Mining-Screen/main/Guide.png)

## Mining Screen - Advanced Plugin
- Adds support for clicking the Mining Unit on the Screen to show it's location.
- Adds support to send data to Mining Screen Aggregator via an Emitter. **Data is sent when the plug in board is turned off.**

**Requirements**
- Programming Board
- Screen
- Up to 8 Mining Units

**Installation**

Video Guide: https://www.youtube.com/watch?v=twP21oFKjgE

There are several stages of installation depending on the functionality required:

**Mining Screen - Basic **
1) Place a Programming Board and a Screen in a visible location.
2) Link Screen - Mining Output Container - Up to 8 Hubs in this order to the Programming Board.
3) Paste "MiningScreenRender.lua" to the Screen by editing the contents.
4) Paste "MiningScreenBoard.json" to the Programming Board by using "paste configuration".
5) (Highly Recommended) Tie a Detection Zone to the Programming Board to activate it by proximity.

**Mining Screen - Advanced Plugin **
1) Place another Programming Board and an Emitter next to the Mining Screen.
2) Connect the Programming board to the same Screen that hosts the Mining Screen at the previous step, and also the emitter.
3) Set the Emitter channel (by right clicking on the Emitter) to something you will remember, you may need to use this name again and again later. I use "MiningScreen".
4) (Highly Recommended) Tie a Detection Zone to the Programming Board to activate it by proximity.
