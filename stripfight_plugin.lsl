// My plugin channel
integer pluginChan(){return (integer)("0x7"+llGetSubString((string)llGetOwner(),0,6));}
integer CHAN_GLOBAL = 0xB00B5;
#define pluginGlobalChan( player ) ((integer)("0x7"+llGetSubString((string)player,0,6)) + 0xB00B5)

// † = Private
// ☢ = Not sent when botting is disabled

//Events
#define EVT_STATUS_CHANGE "0"   // †* {various} Raised whenever a players status changes, see GLOBALS (GLOBAL_FX is not sent to public)
#define EVT_GAME_STARTED "1"      // {"a":(array)abilities} Raised when the game starts. See Ability object for definitions on the ability objects.
#define EVT_GAME_ENDED "2"         // null Raised when game ends and any punishment is finished (reset)
#define EVT_DAMAGE_TAKEN "3"      // {"d":hp_damage,"a":armor_damage, "s":slot} Raised when I take damage
#define EVT_ANIM "4"            // {"a":animName, "s":started} Raised when an animation is started or force-stopped
#define EVT_DAMAGE_DONE "5"         // {"d":hp_damage,"a":armor_damage, "s":slot} Raised when I deal damage
#define EVT_CARDS_SENT "6"         // null Cards sent to center
#define EVT_NEW_ROUND "7"         // bool myTurn - Round has started
#define EVT_ABILITY "8"            // (int)ability, Raised when user triggers an ability
#define EVT_THRUST "9"            // {"b":bitfield, "d":(float)duration}
    #define THRUST_CLICKHELD 1                     // Set in the bitfield above if the thrust is a click-and-hold type of thing
#define EVT_PUNISHMENT "a"         // (object)punishment - Sent when a punishment is selected, (object)punishment contains info about the punishment (see below).
#define EVT_PUNISHMENT_ENDTIMER "b"   // null, triggered a few moments before the punishment ends, good for jizz plugins etc
#define EVT_THRUST_END "c"         // null, triggered if player releases punish button (only sent on EVT_THRUST)
#define EVT_DUEL_REQUESTED "d"      // {"p":uuid, "b":(int)bitflags}, triggered when someone requests a duel. uuid is the UUID of the agent that challenged you. b is chracter personal bitflag settings (GPB_*)
#define EVT_ERROR "e"            // {"c":ERR_*[, "i":(str)info]} - Raised when an erroneous call is sent
   #define ERR_KEY_NOT_FOUND "0"      // TASK_EMULATE_PRESS failed because that button doesn't exist. info is the key you attempted to press
   #define ERR_DUEL_ACCEPT "1"         // TASK_DUEL_ACCEPT if called before someone has sent a duel request. i = {"d":ERR_DA_*, "u":sender_uuid}
      #define ERR_DA_NO_REQUEST "0"      // No duel request has been received
      #define ERR_DA_NO_BOTS "1"         // Cannot accept duel due to no bots game
   #define ERR_PUNISHMENT_DENIED "2"   // TASK_SELECT_PUNISHMENT failed, probably because you didn't win or send that command too early
   #define ERR_QUERY_TOO_FAST "3"      // TASK_SITE_CFG failed due to triggering the command too fast   
   #define ERR_STYLE_FAILED "a"      // (int)style, TASK_SITE_CFG - Could not set style because style is not owned or doesn't exist
   #define ERR_ABILITIES "b"         // (array)abilities - Ability setting of these abilities failed.
#define EVT_CARDS_GENERATED "f"      // †☢ obj, return your cards
#define EVT_PICK_PUNISHMENT "g"      // (array)punishment_names - Triggered if you win and get to select a punishment
#define EVT_ENDBUTTON_AVAILABLE "h"   // null - End punishment button is available.
#define EVT_ABILITIES_CHANGED "i"   // (array)abilities - Abilities were altered. Keep in mind this command is not sent if changed mid combat, but is rather sent upon combat end.

// added 14-06-22
#define EVT_CAMERA "n" // {"a":(int)angle, "e":(int)target_enemy} - Raised when camera changes. Angle is one of following:
#define ANGLE_CLEAR -1
   #define ANGLE_CENTER 0
   #define ANGLE_TARGET 1
   #define ANGLE_BUTT 2
   #define ANGLE_GROIN 3
   #define ANGLE_BUTT_EXT 4
   #define ANGLE_MELEE 5
   #define ANGLE_SELF 6
#define EVT_BLOCK_TRIGGER "o"      // {"c":(int)blockcard, "p":(arr)cards_played, "t":(int)total_played} Your block triggered - cards_played is an array of card constants in order that successfully played, total_played is the total cards send that round
#define EVT_COMEBACK_TRIGGER "p"   // NULL - Raised when your comeback is triggered through a penta or block
#define EVT_OVERCHARGE_TRIGGER "q"   // {"d":(int)damage} - Raised when youre overcharge triggers
#define EVT_CHARM_UP "r"         // NULL - Raised when your charm gains a point
#define EVT_CONDUCTION_HEAL "s"      // (int)hp_healed - Raised when your conduction heals
#define EVT_SACRIFICE "t"         // {"s":(int)armor_slot, "f":(int)fully_stripped, "h":(int)amount_healed} Raised when you sacrifice. If armor_slot is -1 you had no armor to strip, fully_stripped will return true if armor_slot is -1
#define EVT_HEAL "u"            // (int)hp_healed - Raised when you heal
#define EVT_ASSAULT_TRIGGER "v"      // NULL - Raised when you get an extra turn through assault
#define EVT_SIPHON "w"            // {"a":(int)amount_siphoned, "h":(bool)hp_siphoned}
#define EVT_CHARGE "x"            // {"c":(int)manacards_consumed, "l":(int)links_shuffled, "m":(int)mana_gained}
#define EVT_COUNTERATTACK "y"      // (int)damage





// Global definitions
// Sent as part of EVENT_STATUS_CHANGED
string GLOBALS;
#define GLOBAL_ARMOR "1"         // Json Array Current Armor Status, see Combat constants
#define GLOBAL_HP "2"            // Int Current HP
#define GLOBAL_MANA "3"            // Int Current Mana
#define GLOBAL_BF "4"            // Int Global bitfield
   #define GBF_GAME_IN_PROGRESS 1       // Game currently in progress
   #define GBF_MY_TURN 2                // Currently my turn
   #define GBF_ABILITY_USED 4           // Has used special ability
   #define GBF_RLV_INITIALIZED 8        // RLV has been initialized
   #define GBF_HOSTING 16               // I am hosting so I randomize who starts
   #define GBF_GAME_ENDED 32            // Game has ended, waiting for punishment etc
   #define GBF_LOST 64                  // Player has lost
   #define GBF_HAS_BLOCKCARD 128        // Player has a block card set
   //#define GBF_MISSING_JASX 256         // Missing a JasX account
   #define GBF_HAS_CHARM 512            // Player has charm set
   #define GBF_HAS_COMEBACK 1024        // Player has comeback set
   #define GBF_BONUS_TURN 2048          // Player has bonus turn
   #define GBF_HAS_MANACARD 4096        // Player has a mana card on hand
#define GLOBAL_ENEMY_BF "9"
#define GLOBAL_ENEMY_ARMOR "5"      // Same as armor, but for enemy      
#define GLOBAL_ENEMY_MANA "6"      // Same as mana, but for enemy
#define GLOBAL_ENEMY_HP "7"         // Same as hp, but for enemy
#define GLOBAL_ENEMY "8"         // UUID of enemy you are fighting
#define GLOBAL_PBF "a"            // Player bitfield
   #define GPB_ADULT 1               // Adult content enabled
   #define GPB_PENIS 2               
   #define GPB_VAGINA 4
   #define GPB_TITS 8
   #define GPB_PG 16               // PG animations only
   #define GPB_NOBOTS 32            // No bots
   #define GPB_NOANIM 64
   #define GPB_128 128				//TODO: UNKNOWN
   #define GPB_STRAPON 256
#define GLOBAL_ENEMY_PBF "b"
#define GLOBAL_CLASS "c"         // Player class
#define GLOBAL_ENEMY_CLASS "d"      // Enemy class
#define GLOBAL_FX "e"            // Assoc array see useful values



//EVT_PUNISHMENT flags:
//Keep in mind that not all these flags are included, so make sure to check if llJsonValueType() != JSON_INVALID
//For all but objects, strings and arrays, default value is assumed. So if R_ATTACKER_POS is unset, it's assumed to be ZERO_VECTOR.

#define R_SPEED "n"               // float - Max speed to thrust
#define R_SOUND_GLOBAL "o"         // key - sound to play on thrust unless specified in anim
#define R_START_TIME "p"                 // float - Time to wait before presenting player with thrust
#define R_ABF_REQ "q"            // int - Attacker bitfield requirement
#define R_TBF_REQ "r"            // int - Target bitfield requirement
#define R_ARMOR_SLOTS "s"         // Array [0,1,0,1...] - enemy slots required to be stripped for this animation, -1 = doesn't matter, 0 = naked, 1 = worn
#define R_ANIM_IDLE "t"            // str - Idle anim, t and a will be appended at the end
#define R_ANIM_IDLE_A "x"         // str, Idle anim for attacker, if unset, it will use R_ANIM_IDLE instead, "a" is not appended
#define R_ANIM_ACTIVE "u"         // array - [{"a":anim1["_a":attackerAnim, "S":(float)anim_retrig_speed,  "s":cusomSound, "v":speed]}, {"a":anim2}...] If no custom sound is set, use R_SOUND_GLOBAL
#define R_GLOBAL_POS "a"         // vector - offset from target pos to move both players
#define R_ATTACKER_POS "0"         // vector - offset from target pos to move attacker
#define R_ATTACKER_ROT "1"         // rotation - offset from target rot
#define R_TARG_ATTACH "b"         // array [item1, item2...] - Items that will be attached on victim
#define R_ATTACKER_ATTACH "c"      // array [item1, item2...] - Items that will be attached on attacker
#define R_NAME "d"               // string - Name of punishment
#define R_SOUND_GLOBAL_SPEED "e"      // float - Time before global sound should be triggered
#define R_POST_ANIM "f"            // !! Deprecated !! obj {"a":anim[, "t":timeout, "h":hitTimesReq]} - Animation triggered on target when rape ends (ex. butt-rub).
#define R_STRIP_OWNER_SLOTS "g"      // array [1,0,0] - Slots that are stripped on owner. 1 = strip, 0 = disregard
#define R_EPBF_REQ "h"            // int - Enemy player config bitfield (see below)
#define R_MPBF_REQ "i"            // int - My player config bitfield (see below)
#define R_NON_ADULT "j"            // 1/0 - Not an adult animation, doesn't require JasX account
#define R_STYLES "k"               // array [style1...] - Combat styles that enables this animation
#define R_BITFLAGS "l"	// Custom binary flags
#define RBF_CLICKHOLD 1	// Click and hold rather than click once
#define RBF_NO_HITBUTTON 2 // Punish button will not show up, this is a purely idle punishment



// Tasks

/*COMMANDS
You can also command the HUD to change your preferences. This only works for scripts owned by the player.
Syntax: 
CODE: [SELECT ALL] [EXPAND/COLLAPSE] [DOWNLOAD] (UNTITLED)
      llRegionSayTo(llGetOwner(), playerChan(), llList2Json(JSON_OBJECT, [
         TASK_*, var,
         TASK_*, var
      ]));
*/

#define TASK_SET_CONFIG "0"         // ! Deprecated, use the JasX HUD. (int)bitfield - Bitfield combination of GPB_* flags except GPB_NOBOTS. See Config bitfield flags
#define TASK_SET_FOLDER "1"         // ! Deprecated, use the JasX HUD. (string)folder - Set RLV folder to this
#define TASK_SET_CLOTHES "2"      // ! Deprecated, use the JasX HUD. (bool)clothed - Only works out of combat. Does config->test naked/test clothed
#define TASK_DUEL_ACCEPT "3"      // (bool)accept - Accept or decline any standing duel request. If the person requesting has the no bot setting enabled, setting accept to TRUE will generate the ERR_DUEL_ACCEPT error
// Note: Emulate press does not work in a bot disabled game. These commands are re-enabled after a player wins, so you can still use automated punishments
#define TASK_EMULATE_PRESS "4"      // {"b":(str)BUTTON_*, "s":(bool)touch_start} - Emulates a button press on the HUD. if touch_start is false, it will instead parse as touch_end
   #define KEY_CARD "C_"            // Note: You'll have to follow it up with a card between 0-4 representing your cards on the HUD from left to right. Ex: KEY_CARD+"0" means card 0
   #define KEY_GO "GO"               // The GO button after selecting your cards
   #define KEY_END "END"            // The end punishment button
   #define KEY_PUNISH "PBTN"         // The punish button
   #define KEY_ABILITY "AB_"         // Note: You'll have to combine it with a number from 0-3 representing the abilities from top left horizontally. Ex: KEY_ABILITY+"0" for shuffle. Ability info is sent on game start.
#define TASK_QUIT_GAME "5"         // null - Same as Battle->Duel->Quit
#define TASK_SELECT_PUNISHMENT "6"   // (str)punishment - Pick a punishment from the punishment menu
// Note, the following server calls are limited to once every 5 sec, you can look for the ERR_QUERY_TOO_FAST
#define TASK_SET_ABILITIES "7"      // (array)abilities - Set current abilities. Just include the abilities you want to set. Ex: [ABILITY_ID_BLOCK, ABILITY_ID_WILDCARD] to set block and wildcard and leave rest unchanged
#define TASK_SET_STYLE "8"         // (int)style - Set current combat style if possible.  Keep in mind status change tied to this event is sent on combat end if in combat when called.
#define TASK_GET_STATUS "9"         // Fires the EVT_STATUS_CHANGE event with all globals in it
#define TASK_GET_ABILITIES "a"      // Fires the EVT_ABILITIES_CHANGED event

// Added 14-06-22
#define TASK_OVERRIDE_CAMERA "c"   // (bool)start - Starts and stops the game camera


// Game vars
#define HP_MAX 100
#define ARMOR_MAX 30
#define MANA_MAX 30
#define MANA_COST 15
#define STD_HIT 6
#define CHAIN_ADD 2
#define RAPE_MAX_TIME 30


// Abilities (sent on EVT_GAME_STARTED)
// Ability object
#define ABILITY_MANA_COST "a"
#define ABILITY_ID "b"
#define ABILITY_TEXTURE "c"
//Abilities
#define ABILITY_HEAL 0
#define ABILITY_SHUFFLE 1
#define ABILITY_BLOCK 2
#define ABILITY_WILDCARD 3
#define ABILITY_ID_COMEBACK 4
#define ABILITY_ID_OVERCHARGE 5
#define ABILITY_ID_CHARM 6
#define ABILITY_ID_CONDUCTION 7
#define ABILITY_ID_SACRIFICE 8
#define ABILITY_ID_ASSAULT 9
#define ABILITY_ID_TURNABOUT 10
#define ABILITY_ID_SIPHON 11
#define ABILITY_ID_CHARGE 12
#define ABILITY_ID_COUNTERATTACK 13
#define ABILITY_ID_POLYMORPH 14

// FX Types (sent in the GLOBAL_FX value of the EVT_STATUS_CHANGE)
#define FXTYPE_BLOCK "1"            // Int (blockcard), -1 for none
#define FXTYPE_WILDCARD "2"            // Bool true/false
#define FXTYPE_COMEBACK "3"            // float Bon Comeback passive enabled - if greater than 0, it's triggered and a float to add to multiplier, Bon = 1. is 100% more damage
#define FXTYPE_OVERCHARGE "4"         // Int overcharge_card
#define FXTYPE_CHARM "5"            // Int charm card
#define FXTYPE_BITWISE "6"               // Boolean abilities
   #define FXTB_CONDUCTION 1            // Conduction ability active
   #define FXTB_ASSAULT 2
   #define FXTB_SIPHON 4
   #define FXTB_COMEBACK 8               // Comeback enabled
   #define FXTB_CHARGE 16               // Do no damage
   #define FXTB_FREE_CHARGE 32            // Charge is free


#define FX_ARMORBREAK 1
#define FX_VICTORY 2
#define FX_DEFEAT 3



// Classvars
#define CLASS_DEFAULT 0
#define CLASS_TENTACLEMANCER 1
#define CLASS_TECHNOPHILE 8
#define CLASS_FIGHTER 9



// Combat CONSTANTS
#define HEAD 0
#define ARMS 1
#define CHEST 2
#define GROIN 3
#define BOOTS 4
#define MANA 5



// Useful Functions

// Turns a json value into a readable type name
string jsonTypeName(string value){
    string t = llJsonValueType(value,[]);
    if(t == JSON_INVALID)return "Invalid";
    if(t == JSON_OBJECT)return "Object";
    if(t == JSON_NULL)return "Null";
    if(t == JSON_ARRAY)return "Array";
    if(t == JSON_NUMBER)return "Number";
    if(t == JSON_STRING)return "String";
    if(t == JSON_TRUE)return "TRUE";
    return "FALSE";
}

// Merges 2 JSON objects, replaces mergeArray
string mergeJson(string input, string MERGE){
   integer i; list js = llJson2List(MERGE);
   for(i=0; i<llGetListLength(js); i+=2)input = llJsonSetValue(input, llList2List(js,i,i), llList2String(js,i+1));
   return input;
}

integer setOutfit(string outfitname)
{
    llRegionSayTo(llGetOwner(), pluginChan(), llList2Json(JSON_OBJECT, [
    TASK_SET_FOLDER, outfitname]));
    return 1;     
}

integer pickGender(string genname)
{
    if(genname == "Male")return GPB_PENIS;
    if(genname == "Female")return GPB_VAGINA + GPB_TITS;
    if(genname == "Herm")return GPB_VAGINA + GPB_TITS + GPB_PENIS;
    if(genname == "Shemale")return GPB_PENIS + GPB_TITS;
    if(genname == "Cuntboy")return GPB_VAGINA;
    return 0;
}
integer setGender(string genname)
{
    llRegionSayTo(llGetOwner(), pluginChan(), llList2Json(JSON_OBJECT, [
    TASK_SET_GENITALS, (string)pickGender(genname)]));    
}

integer setClothed(integer clothed)
{
    llRegionSayTo(llGetOwner(), pluginChan(), llList2Json(JSON_OBJECT, [
    TASK_SET_CLOTHES, (string)clothed]));
}

