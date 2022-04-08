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

Each event is sent as a JSON object with the key "BARE" set to 1. Ex: `{"0":{"4":8},"BARE":1}`

Example script:

```lsl
#include "stripfight/stripfight.lsl"
#include "stripfight/stripfight_plugin.lsl"
// Shortcut for json get value
#define j(input, index) llJsonGetValue(input, (list)index)
  
default{
    // Makes sure the listener has the correct owner
    on_rez( integer s ){
        llResetScript();
    }
    
    state_entry(){
        // Listen to your own BARE events
        // This script must be in an attachment
        llListen(pluginChan(), "", "", "");
        
    }
    
    listen( integer chan, string name, key id, string message ){
        // Make sure it's received by an object you own
        if( llGetOwnerKey(id) != llGetOwner() )
            return;
        // Make sure this was a BARE event
        if( j(message, "BARE") != "1" )
            return;
            
        string val;
        
        // Check for presence of game started event
        val = j(message, EVT_GAME_STARTED);
        if( val != JSON_INVALID )
            llOwnerSay("Game started event detected. My abilities: "+j(val, "a"));
        
        // Check for presence of game ended event
        val = j(message, EVT_GAME_ENDED);
        if( val != JSON_INVALID )
            llOwnerSay("Game ended event detected");

    }
    
}
```


## Sending tasks

You can run certain tasks such as accepting a duel or emulating keypresses by sending tasks to the HUD. You can only target your own HUD with this.
```
llRegionSayTo(llGetOwner(), playerChan(), llList2Json(JSON_OBJECT, [
   TASK_*, var,
   TASK_*, var
]));
```

Example:

```
llRegionSayTo(llGetOwner(), playerChan(), llList2Json(JSON_OBJECT, [
   TASK_QUIT_GAME, ""
]));
```



