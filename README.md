## Wipeout 2097 (XL) Auto Splitter

A Wipeout 2097 (XL) Auto Splitter for [LiveSplit](https://github.com/LiveSplit/LiveSplit).

The script will automatically perform a split if the player reaches the end of a race in first place. If the player ends the race but is not in first place, the split will not be performed.

The splitter will start automatically if the option is enabled (it's recommended that you open the splitter once you are already in the main menu, or the splitter may start randomly).

### Features

- Auto split at the end of every race
- Auto start
- Loadless timer (only affects in-game timer, pauses every time the game is paused or loading)

### Requirements

- [LiveSplit](https://github.com/LiveSplit/LiveSplit)
- [ePSXe 2.0.5](https://www.epsxe.com/download.php)
- Wipeout XL (NTSC)

### Installation

- Download `wipeout.asl` from this repository
- Create your splits in LiveSplit (one for each map)
- In LiveSplit, right click and select `Edit Layout...`
- Click on the `+` icon on the left and select `Control -> Scriptable Auto Splitter`
- Double click the `Scriptable Auto Splitter` in the layout editor
- Use the `Browse...` button and point it to the downloaded `wipeout.asl`

### Usage

Once the splitter has been added to the layout, it is automatically active. Start a run and you should see it automatically performing a split after every race's end.
