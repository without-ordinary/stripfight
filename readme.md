This contains the API code for JasX SL BARE game. If you want to work with outfit detection, use the JasX HUD API instead at: https://github.com/JasXSL/JasX-HUD

## How to install it?

1. Install firestorm
2. Open a script window and click the cogs icon to enter Script Editor Preferences
3. Check enable lsl preprocessor
4. Check includes from local disk
5. Create a directory somewhere such as C:\LSL and point your include path there
6. Git clone or download this repo as zip (click the green code dropdown and download as zip)
7. Unzip to your directory C:\LSL and rename it from "stripfight-master" to "stripfight"

## How to use it?

1. Make a new script
2. At the top of the script, put
  ```
  #include "stripfight/stripfight.lsl"
  #include "stripfight/stripfight_plugin.lsl"
  ```

## Receiving BARE events

The BARE HUD sends messages on [pluginChan() and pluginGlobalChan( player )](https://github.com/without-ordinary/stripfight/blob/master/stripfight_plugin.lsl#L2). pluginChan is only sent to the owner, meaning only the owner of the HUD can hear these messages, and only from attachments. pluginGlobalChan is sent to the region, but not all events are sent to this channel.

Look at [stripfight_plugin.lsl](https://github.com/without-ordinary/stripfight/blob/master/stripfight_plugin.lsl) for a list of all events.


