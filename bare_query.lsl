/*
    
    If you are unfamiliar with JSON, scroll down to the actual script part.
    Otherwise, here's a scripting reference and constants used:
    
*/

// Request Syntax: [{TASK_ID:QTASK_*, TASK_VAL:(var)data}..,]
// Return Syntax: [{TASK_ID:QTASK_*, TASK_VAL:(var)data}...]
#define TASK_ID "a"
#define TASK_VAL "b"


// NOTE: Any task_ids set that don't match the names below will be returned like they were sent.
// Ex: {TASK_ID:(string)taskname, TASK_VAL:sent_val} - You can use this to add a callback or a few.

// Task to Get info about a player
#define QTASK_PLAYER_DATA "a"   // Returns an object with fields and values
    #define QTASK_PD_KEY "a"        // key Character key
    #define QTASK_PD_DATA "b"       // array Data fields you want
/*
    If key is not found and formatted properly, TASK_VAL will be the uuid.
    Otherwise TASK_VAL will be a list containing 'charkey' and other fields you entered properly.
    Allowed fields:
        id - int BARE id, not sure why you'd want this
        charname - string Character name (not displayname)
        bitfield - int Contains GPB_* flags
        battleswon - int Nr battles won
        lastactivity - timestamp Last activity (finishing a game, updating settings etc)
        recordstreak - int Longest winning streak
        current_style - int Current fighting style
        abilities - array Abilities currently used
        abilities_unlocked - array - Abilities unlocked
*/

// Task to Get info about a specific or all abilities:
#define QTASK_ABILITY_DATA "b"  // Returns an array of objects with fields and values
    #define QTASK_AD_IDS "a"        // array or "*" - Ability IDs you want info about. Use * if you want info about all abilities in the database
    #define QTASK_AD_FLAGS "b"      // int Bitflags about what data you want returned. ID is always returned
        #define QAD_FLAG_DESCRIPTION 1
        #define QAD_FLAG_NAME 2
        #define QAD_FLAG_MANA 4
        #define QAD_FLAG_TEXTURE 8
        #define QAD_FLAG_TYPE 16
/*
    Returns an array of objects containing the following key value pairs depending on the flags you set:
        "id":(int)id - Always returned
        "description":(string)description - Ability description
        "name":(string)name - Name of the ability
        "manacost":(int)mana_cost - Ability Mana cost
        "texture":(key)uuid - Ability button texture
        "type":(int)ability_slot - The slot of the ability, 0 = shuffle-replacer, 1 = block-replacer, 2 = heal replacer, 3 = heal replacer
*/


        

// Task to Get info about one or multiple combat styles:
#define QTASK_GET_STYLES "c"    // Returns an array of objects with fields and values
    #define QTASK_GS_ID "a"         // int or "*" Combat style ID you want info about. Use * if you want info about all styles
    #define QTASK_GS_FLAGS "b"      // int Bitflags specifying what data you want returned. ID is always returned
        #define QGS_FLAG_NAME 1
        #define QGS_FLAG_DESCRIPTION 2
/*
    Returns an array of objects with the following fields:
        "id":(int)id - Always returned
        "name":(string)name
        "desc":(string)description
*/

// Not really a task, but is returned if something goes wrong:
#define QTASK_ERROR "d"         // Returns an array of strings if there are errors. The strings are human readable text about what went wrong.



// Task to get info about events, returns [] if not found
/*
Returns an array of event objects in the form of: 
[
	{
		"i":(int)id, 
		"c":(str)creator_name, 
		"k":(key)creator_key, 
		"t":(str)title, 
		"u":(string)slurl, 
		"d":(string)description, 
		"e":(string)timestamp, 
		"s":(int)users_signed_up, 
		"n":(int)unix_time
	}
]

*/
#define QTASK_GET_EVENTS "e"		
	#define QTASK_GE_IDS "a"			// Array (IDs), default "*"
	#define QTASK_GE_FLAGS "b"			// (int) Bitmask containing the info you want about the event
		#define QGE_FLAG_TITLE 1			// (str) Title of the event
		#define QGE_FLAG_SLURL 2			// (str) SLURL of the event
		#define QGE_FLAG_DESC 4				// (str) Description of the event (warning, descriptions can be very long
		#define QGE_FLAG_TIMESTAMP 8		// (str) Returns (in SLT) a string like "Sat 12th - 12:00"
		#define QGE_FLAG_UNIX 16			// (int) Unix time of the event
		#define QGE_FLAG_SIGNEDUP 32		// (int) Nr players who signed up
		#define QGE_FLAG_CREATOR_N 64		// (str) Creator name
		#define QGE_FLAG_CREATOR_K 128		// (key) Creator key
	#define QTASK_GE_LIMIT "c"			// (int) Nr of results you want, default 10, always sorted in ascending order in chronological order starting with the nearest event. Min 1, max 10	
	#define QTASK_GE_OWNER_LIMIT "d"	// (array)[(key)uuid...] Limits the search to specific event-creators by character key 
	#define QTASK_GE_STARTFROM "e"		// (int) Which event nr do you want to start from, default 0
	#define QTASK_GE_LIMIT_SIGNUP "f"	// (bool) When set and TRUE, it will only list events that you have signed up to
	

	
#define QTASK_GET_VERSION "f"			// Doesn't accept any arguments, just returns teh current version number
	
	
// Demo call:
/*
	
	list query =  [
        llList2Json(JSON_OBJECT, [
            TASK_ID, QTASK_GET_EVENTS,
            TASK_VAL, llList2Json(JSON_OBJECT, [
                QTASK_GE_FLAGS, QGE_FLAG_TITLE|QGE_FLAG_SLURL|QGE_FLAG_TIMESTAMP|QGE_FLAG_UNIX|QGE_FLAG_SIGNEDUP|QGE_FLAG_CREATOR_N|QGE_FLAG_CREATOR_K,
                QTASK_GE_LIMIT, 1,
                QTASK_GE_STARTFROM, 1,
                QTASK_GE_OWNER_LIMIT, llGetOwner()
            ])   
        ])
    ];
	llHTTPRequest("http://jasx.org/lsl/BARE/bare_query.php?tasks="+llList2Json(JSON_ARRAY, query), [], "");
	
	
	http_response(key id, integer status, list meta, string body){
        list temp = llJson2List(body);
        integer i;
        for(i=0; i<llGetListLength(temp); i++){
            string d = llList2String(temp, i);
            if(llJsonGetValue(d, [TASK_ID]) == QTASK_GET_EVENTS){
                d = llJsonGetValue(d, [TASK_VAL]);
                list events = llJson2List(d);
				// Events is now a list of event objects
            }
        }
    }
	
	
	
	
	
*/




