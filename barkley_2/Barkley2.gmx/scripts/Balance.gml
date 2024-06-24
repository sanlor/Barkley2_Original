#define Balance
// ZAUBERS //
// Press F12 on scripts for subsections
global.zauberDribbleTime = 0.33;
global.zauberCastTime = 0.25;
global.zauberCastAuto = 1; // When 1, hoopz does 1 dribble then casts right away

// Boss Alignment
global.alignmentModifier = 0.03;    // boss alignment base modifier percentage - 0.03
global.alignmentDamageDealt = 1;    // this should always be 1 except during boss fights
global.alignmentDamageTaken = 1;    // this should always be 1 except during boss fights

// Status effect and Prefix 2 balancing
StatusEffects();

// Single zaubers
BalanceZauberPozzosPrison();
BalanceZauberStarlight();
BalanceZauberBolt();
BalanceZauberBallSucker();
DropDestructible("init"); // <-- Press F12

// Gun balance
global.windupModifier = 2; // 1 = 100% speed, 1.5 = 150% speed, etc

#define BalanceZauberStarlight
////////// STAR LIGHT //////////

// RANGE in pixels with PIETY 0
global.zauberStarlightRangeMinimum = 60;
// RANGE in pixels with PIETY 99
global.zauberStarlightRangeMaximum = 200;
// AMOUNT based on PIETY 0
global.zauberStarlightAmountMinimum = 4;
// AMOUNT based on PIETY 99
global.zauberStarlightAmountMaximum = 20;
// FIRE SPEED based on PIETY 99 (REVERSED as lower fire speed is better)
global.zauberStarlightIntervalMinimum = 0.33; // a second
// FIRE SPEED based on PIETY 0 (REVERSED as lower fire speed is better)
global.zauberStarlightIntervalMaximum = 1; // a second
// DAMAGE based on PIETY 0
global.zauberStarlightDamageMinimum = 1;
// DAMAGE based on PIETY 99
global.zauberStarlightDamageMaximum = 10;
// KNOCKBACK based on PIETY 0
global.zauberStarlightKnockbackMinimum = 1;
// KNOCKBACK based on PIETY 99
global.zauberStarlightKnockbackMaximum = 5;
// STAGGER value of starlight hits - SOFT, MEDIUM, HARD
global.zauberStarlightStagger = STAGGER_HARDNESS_HARD;
// Ability to target destructables?
global.zauberStarlightTargetDestructible = 1;
// EXPIRY based on piety, remove all existing on new cast
// Animation for them coming out? some kind of visual thing
// better gfx than dots
// dont allow it to attack hidden enemy (fishmen in water)

#define BalanceZauberPozzosPrison
////////// POZZO'S PRISON //////////

// The minimum amount of Jello's thrown, if you had PIETY 0
global.zauberPozzoJelloMinimum = 2;
// The maximum amount of Jello's thrown, if you had PIETY 99
global.zauberPozzoJelloMaximum = 5;
// Minimum direction in degrees a Jello will be thrown at PIETY 0
global.zauberPozzoJelloDirectionMinimum = 55;
// Maximum direction in degrees a Jello will be thrown at PIETY 99
global.zauberPozzoJelloDirectionMaximum = 125;
// Speed at which Jelly moves in air (faster means hits the ground quicker)
global.zauberPozzoJelloSpeed = 2;
// Time in seconds a Jello will remain on the ground at PIETY 0
global.zauberPozzoJelloTrapMinimum = 3;
// Time in seconds a Jello will remain on the ground at PIETY 99
global.zauberPozzoJelloTrapMaximum = 10;
// Time in seconds a Prison will hold an enemy at PIETY 0
global.zauberPozzoJelloPrisonMinimum = 3;
// Time in seconds a Prison will hold an enemy at PIETY 99
global.zauberPozzoJelloPrisonMaximum = 10;
// Minimum distance in pixels a Jello will be thrown
global.zauberPozzoJelloDistanceMinimum = 30;
// Maximum distance in pixels a Jello will be thrown
global.zauberPozzoJelloDistanceMaximum = 120;
// Jellos must be this many pixels away from each other (to prevent clumping)
global.zauberPozzoJelloSpacing = 24;
// Enemies must be this close in pixels to get stuck
global.zauberPozzoJelloEnemy = 24;
// Hoopz must be this close in pixels to get stuck
global.zauberPozzoJelloHoopz = 12;
// Minimum visual width of Jello
global.zauberPozzoJelloVisualMinimum = 40;
// Maximum visual width of Jello
global.zauberPozzoJelloVisualMaximum = 48;

#define BalanceZauberBolt
////////// CYBER BOLT //////////
// Zauber Name
global.zauberBoltName = "Cyber Bolt";
// Sprite to use when casting
global.zauberBoltSprite = sHoopzFishShow;
#define BalanceZauberBallSucker
////////// BALLSUCKER //////////

// Distance in pixels that ball moves away from Hoopz
global.zauberBallSuckerDistanceMinimum = 40; // PIETY 0
global.zauberBallSuckerDistanceMaximum = 60; // PIETY 99
// Pixel movement per second to reach distance
global.zauberBallSuckerSpeedMinimum = 80; // PIETY 0
global.zauberBallSuckerSpeedMaximum = 180; // PIETY 99
// Starting pixel radius of gravity well
global.zauberBallSuckerRadiusStartMinimum = 24; // PIETY 0
global.zauberBallSuckerRadiusStartMaximum = 32; // PIETY 99
// Ending pixel radius of gravity well
global.zauberBallSuckerRadiusEndMinimum = 80; // PIETY 0
global.zauberBallSuckerRadiusEndMaximum = 96; // PIETY 99
// Growth of radius in pixels per second to get to ending radius
global.zauberBallSuckerRadiusGrowthMinimum = 56; // PIETY 0
global.zauberBallSuckerRadiusGrowthMaximum = 64; // PIETY 99
// Duration the ball sucker exists for
global.zauberBallSuckerDurationMinimum = 5; // PIETY 0
global.zauberBallSuckerDurationMaximum = 8; // PIETY 99

// Maximum pixels to pull per second assuming you were in center of vortex
// So someone at the mid point of the vortex has 50% of the value
// And with 50 weight has 50% value (100 weight cannot be pulled)
// So 60 = 30 = 15 pixels per second
global.zauberBallSuckerPullMinimum = 80; // PIETY 0
global.zauberBallSuckerPullMaximum = 160; // PIETY 99
// Factor to pull in bullets
// NOTE: Since bullets are so fast this is a bit hard to explain
// But a value of 0 disables bullet pull, and higher values suck in bullets more
global.zauberBallSuckerBulletPull = 3;
#define StatusEffects
/// All info on status effects and prefix 2's go here

// In seconds how long a status effect lasts UNLESS specified otherwise
global.statusDuration = 20; 

// NOTES
// All below numbers are done based on GUN AFFIX value which ranges 0 - 50
// So a gun affix value of 25 would be half of the value you specify
// IE. global.statusResistLowerAll = 0.4 would really be 0.2 at GUN AFFIX 25

// Resist Boost One, Lower Rest (5 affix use this)
global.statusResistBoostOne = 2;
global.statusResistLowerRest = 0.5;
// Resist Lower One (5 affix use this)
global.statusResistLowerOne = 1;
// Resist Lower All (1 affix uses this)
global.statusResistLowerAll = 0.4;

// Glamp Boost One, Lower Rest (5 affix use this)
global.statusGlampBoostOne = 2;
global.statusGlampLowerRest = 0.5;
// Glamp Lower One (5 affix use this)
global.statusGlampLowerOne = 1;
// Glamp Lower All (1 affix uses this)
global.statusGlampLowerAll = 0.4;