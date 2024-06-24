/// scr_AI_util_newSwitchAttack()

var attack = ds_map_create();

// The scr_AI_action_ script to be executed
attack[? "action"] = NULL;

// The name of the attack
attack[? "name"] = NULL;

// You can disable attacks
attack[? "disabled"] = false;

// Minimum and maximum distance from target
attack[? "distMin"] = 0;
attack[? "distMax"] = 100;

// Minimum and maximum difference, in degrees, between facing direction and direction to target
attack[? "coneAngleMin"] = 0;
attack[? "coneAngleMax"] = 10;

// Cooldown time for this specific action
attack[? "cooldownTime"] = 15; // 10
attack[? "cooldownTimeRnd"] = 10; // 10

// Current cooldown time (Do not modify)
attack[? "cooldownCurrent"] = 0;

// Cooldown time when AI starts
attack[? "cooldownStart"] = 0;

// Recharge time for the enemy after this attack, during which it can take no action
// 'Recharge' only recharges while enemy is not in an Action state!
attack[? "rechargeTime"] = 5;
attack[? "rechargeTimeRnd"] = 5;

// Predicate script that returns true if attack can be performed
attack[? "predicate"] = NULL;

// Name of ammo type
attack[? "ammoType"] = NULL_STRING;

return attack;
