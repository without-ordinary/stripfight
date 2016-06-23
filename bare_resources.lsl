// General keys and color resources

// Classvars
#define CLASS_DEFAULT 0
#define CLASS_TENTACLEMANCER 1
#define CLASS_CHRISTMAS 2
#define CLASS_SLUMBERPARTY 3
#define CLASS_TECHNOPHILE 8
#define CLASS_FIGHTER 9
#define CLASS_SADOMASOCHIST 10
#define CLASS_DEMON 11
#define CLASS_DOGE 12


// Game vars
#define HP_MAX 100
#define ARMOR_MAX 30
#define MANA_MAX 30
#define STD_HIT 6
#define CHAIN_ADD 2
#define RAPE_MAX_TIME 30


// Combat CONSTANTS
#define HEAD 0
#define ARMS 1
#define CHEST 2
#define GROIN 3
#define BOOTS 4
#define MANA 5


list cardTextures = [
"b69930e2-290c-57b6-1e8b-4275efd29cf6",
"cc2e332b-af0a-4edf-d87f-919914f0687f",
"eb90883d-002e-4f1e-bbf0-6a6acb6c1588",
"41086d4c-b34a-f8eb-df6f-ce8e681581d8",
"b9f23410-9d39-3a4a-892c-5f616566d77d",
"49c5dfb8-3d66-e601-0794-e735aed1919b"
];

list cardColors = [<0.169, 0.722, 0.196>, <0.310, 0.353, 0.898>, <0.820, 0.255, 0.792>, <0.804, 0.196, 0.196>, <0.820, 0.804, 0.239>, <0.251, 0.667, 0.827>];

// Suggested emotions for animations
#define ANIM_PAIN ["bare_head_crit", "bare_groin_crit", "bare_arms_crit", "bare_chest_crit", "bare_legs_crit","bare_pinch_breasts", "bare_butt", "bare_butt_crit", "counterkick_t","groin_revenge_t","kneehead_t","punchspank_t","shinkick_t","sm_backjump_sp_t","sm_knee_t","sm_lsplit_t","sm_tbit_t"]

#define ANIM_AROUSE ["adminvic_t","bare_suck_hit1","bare_suck_hit2","bare_suck_hit3", "bare_wiggle_hit","bare_wiggle_hit2","bare_wiggle_hit3", "dseat", "titvib_1","titvib_2","bare_thrust1","bare_thrust2","bare_thrust3","dtentride_1","dtentride_2","dtentride_3","groin_pull","groin_tug1","groin_tug2","groin_tug3","groin_tug4","groinforce_a","kickgrope_t","motorboat_t","punchgrope_t","sm_backjump_dr_t","sm_backjump_dv_t","sm_dgroin_t","sm_dgrub_t","sm_dilt_t","sm_dtit_t","sm_stroke_t","sm_tmush_a","sm_tmush_t","telDildA_t","telDildV_t"]

// Current last of as BARE (16-02-12)
list allPunishments = [
	// PG Punishments
	"NONE",
	"Spank",
	"Cuddle",
	"Hug",
	
	// Usable by ALL
	"Dildo A",			// A vibrating piece of rubber.
	"Dildo V",			// A vibrating piece of rubber.
	"Doggy",			// 1 million canines can't be wrong.
	"Face Ride",		// Grind on their face.
	"Fireworks",		// Celebrate the 10 000 players milestone!
	"Forceride A",		// Force them to ride on you.
	"Forceride V",		// Force them to ride on you.
	"From Behind",		// Spread the legs and get to it (standing).
	"Get BJ",			// Because people who give blowjobs are fucked in the head.
	"Get P Footjob",	// Have them rub your member with their feet.
	"Get V Footjob",	// Have them rub your groin with their feet.
	"Give P Footjob",	// Rub their member with your feet.
	"Give V Footjob",	// Rub their groin with your feet.
	"Legs Up A",		// Lift their legs up and push away.
	"Lick V",			// Flip her forwards with her legs on your shoulders.
	"Missionary",		// Missionary position, for you sick fucks out there.
	"Ride Him A",		// Sit on his groin and hump away.
	"Ride Him V",		// Sit on his groin and hump away.
	"Stocks A Arrows",	// Give the victim some cupid arrows to the rear!
	"Stocks V Arrows",	// Give the victim some cupid arrows to the rear and/or vagina!
	"Suck P",			// "Lick his lollipop" if so to speak.
	"Tit Fuck",			// Sit on their belly and hump away.
	
	// Usable by Tentaclemancy
	"pTent A",			// Slam into the ground with tentacle arms, surrounding and molesting your victim.
	"pTent V",			// Slam into the ground with tentacle arms, surrounding and molesting your victim.
	"Tent A",			// Doing what a tentacle does best.
	"Tent V",			// Doing what a tentacle does best.
	"Tent-Grind",		// A polyp'd tentacle to grind against their groin.
	"Tent-Suck",		// Better than using your mouth. Comes with little wiggling sub-tentacles and leaves less of a mess (on you at least).
	
	// Usable by Christmas
	"Backtie V",		// Use a pretty ribbon to backtie your opponent and have your way with them.
	"Hogtie A",			// Hogtie your opponent and stick a candy cane in their rectum. Christmassy!
	"Mistletoe",		// Make out under the mistletoe.
	"Santaspank",		// Bend a naughty boy/girl over your knee and spank away with a candycane.
	"WrapBJ P",			// Use a pretty ribbon to backtie your opponent and have your way with them.
	
	// Usable by Slumber Party
	"Blanket",			// Wrap you and your opponent in a warm cuddly blanket. This is probably the softest and coziest "punishment".
	"Pouncesnuggle",	// Some times you just wanna pounce someone and snuggle up on top of them. Comes with a blanket too!
	"Spoon",			// Be the big spoon and gently caress your "victim". Comes with a snuggly blanket.
	
	// Usable by Technophiliac
	"ChainDildo A",		// This is what happens when you replace the blade of a chainsaw with a dildo. Your poor victim is not gonna be able to sit for a week.
	"ChainDildo V",		// This is what happens when you replace the blade of a chainsaw with a dildo. Your poor victim is not gonna be able to walk after you're done.
	"MechDild A",		// A robot dildo on a mechanical arm. What's not to like?
	"MechDild V",		// An automatic vibrating dildo on a mechanical arm. Programmed for pleasure.
	"Milker P",			// Something tells you this big "milker" doesn't go over udders.
	"Piston (A)",		// Hold your enemy down with robotic arms and use the included remote to crank up the speed of the fuel-powered dildo piston that's pushing inside your opponent.
	"Piston (V)",		// Hold your enemy down with robotic arms and use the included remote to crank up the speed of the fuel-powered dildo piston that's pushing inside your opponent.
	"Wall A",			// Comes with a collapsible wall for you to bang someone up against. Engineering: It solves practical problems!
	"Wall V",			// Comes with a collapsible wall for you to bang someone up against. Engineering: It solves practical problems!
	
	// Usable by Sadomasochist
	"Hangspank",		// Hang em up and whip their butt hard with a riding crop (also their groin, but not as hard).
	"Horse",			// A vibrating leather-clad plank to straddle your victim across.
	"Horse Double",		// Twice the fun! Suspends both YOU and your victim across a buzzing leather-clad plank. Does not have an active animation because to be fair, you'll be a bit too preoccupied for that.
	"Stocks A",			// Tried and true since medieval times.
	"Stocks V",			// Tried and true since medieval times.
	"StockSpank",		// Tried and true since medieval times, now with a paddle!
	"Tieup",			// Hang em up and tickle/rub/spank.
	
	// Usable by Demon
	"AltarRide A",		// Strap him to an altar and ride away!
	"AltarRide V",		// Strap him to an altar and ride away!
	"DeDil V",			// A more demonic way of dildoing someone.
	"Demon A",			// Lord Inglip commands it!
	"Demon DP",			// Lord Inglip commands it!
	"Demon V",			// Lord Inglip commands it!
	"DemonDil A",		// A more demonic way of dildoing someone.
	"DemonDoggy",		// Use skeletal hands to persuade your victim to hump you.
	"Endospinj A",		// Inject blasphemers, study algebra.
	"Flog Demonic",		// Punish the nonbelievers with a demonic whip!
	
	// Usable by Doge
	"Mine Doge",		// Mine some dogecoins!
	
	// Usable by Tentaclemancy, Christmas
	"Prestent A",		// Give your enemy a gift of tentacles.
	"Prestent V",		// Give your enemy a gift of tentacles.
	
	// Usable by Shroom
	"Shm A Strapon",	// Some times all you need is a shroom strapon.
	"Shm V Strapon"	// Some times all you need is a shroom strapon.
];



