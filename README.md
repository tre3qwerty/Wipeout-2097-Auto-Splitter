## Wipeout 2097 (XL) Auto Splitter

A Wipeout 2097 (XL) Auto Splitter for [LiveSplit](https://github.com/LiveSplit/LiveSplit).

The script will automatically perform a split if the player reaches the end of a race in first place. If the player ends the race but is not in first place, the split will not be performed.

The split timer must be started manually.

### Requirements

-   [LiveSplit](https://github.com/LiveSplit/LiveSplit)
-   [ePSXe 2.0.5](https://www.epsxe.com/download.php)
-   Wipeout XL (NTSC)

### Installation

-   Download `wipeout.asl` from this repository
-   Create your splits in LiveSplit (one for each map)
-   In LiveSplit, right click and select `Edit Layout...`
-   Click on the `+` icon on the left and select `Control -> Scriptable Auto Splitter`
-   Double click the `Scriptable Auto Splitter` in the layout editor
-   Use the `Browse...` button and point it to the downloaded `wipeout.asl`

### Usage

Once the splitter has been added to the layout, it is automatically active. Start a run and you should see it automatically performing a split after every race's end.

Please not that, as of this moment, this splitter doesn't provide an auto-start functionality, you will need to start the timer yourself.
