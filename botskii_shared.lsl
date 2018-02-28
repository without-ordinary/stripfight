
#define bTASK_CONFIG 1	// (obj)config - 
#define bTASK_ABILITY 2	// (int)abil_id - Ability used
#define bTASK_GAME_ENDED 4
#define bTASK_GAME_STARTED 3
#define bTASK_REFRESH_TEXTS 5
#define bTASK_TEXT_INIT 6	// {(str)topicName:(array)topic_triggers} only puts chat topics
#define bTASK_SEND_LINE 8	// (str)topicName
#define bTASK_SET_PERCENTVAR 9	// {VAR_*:(str)val}
#define bTASK_ABILNAMES 10		// (array)abilnames
#define bTASK_MESSAGE_SUCCESS 11
#define bTASK_WEAR_OUTFIT 12

#define LINK_DATABASE 2
#define SIDE_CONFIG 0

#define abilNames ["shuffle", "block", "heal", "wildcard", "comeback", "overcharge", "charm","conduction", "sacrifice", "assault", "turnabout", "siphon", "charge", "counterattack", "polymorph"]
#define cnames "{\"0\":\"Default\",\"1\":\"Tentaclemancer\",\"8\":\"Technophiliac\",\"9\":\"Fighter\",\"10\":\"Sadomasochist\",\"2\":\"Christmas\",\"3\":\"Slumber Party\",\"11\":\"Demon\",\"12\":\"Doge\"}"

#define CFG_ON "a"
#define CFG_NO_ABILITIES "b"
#define CFG_NO_SOCIAL "c"
#define CFG_DEFAULTPOS "d"
    #define DP_POS "a"
    #define DP_LOOKAT "b"
	#define DP_REGIONNAME "c"
	
	
	
// Percentvars
// Name of person who spoke to
#define VAR_NAME "%N"
// Name of this object
#define VAR_OBJNAME "%O"
// My displayname
#define VAR_MYNAME "%M"
// List of abilities
#define VAR_ABILITIES "%A"
// Classname
#define VAR_CLASSNAME "%C"
// Available outfits
#define VAR_OUTFITS "%W"

