/// combat_gunwield_unequip(actor, gun)
// This must be called when a gun is unequipped

var actor = argument0;
var gun = argument1;

if (gun != NULL) 
{
    if (gun[? "constantSound"] != NULL_STRING) {
        audio_stop_sound_ext(gun[? "constantSound"]);
    }
    if (gun[? "windupSound"] != NULL_STRING) {
        audio_stop_sound_ext(gun[? "windupSound"]);
    }
    if (gun[? "sustainSound"] != NULL_STRING) {
        audio_stop_sound_ext(gun[? "sustainSound"]);
    }
    if (gun[? "winddownSound"] != NULL_STRING) {
        audio_stop_sound_ext(gun[? "winddownSound"]);
    }
    // Musket Nov 1 2017
    with (o_flash) { if (dad == PlayerCombatActor.id) { rem = 0; dad = -1; instance_destroy(); } }
    gun[? "pFireTimer"] = 300;
    gun[? "pFireTimerTarget"] = 300;
    gun[? "pFireDelay"] = 0;
    
    // Minigun Nov 1 2017
    gun[? "reloaded"] = false;
    gun[? "pWindUp"] = 0;
}

if (instance_exists(actor)) {
    actor.gunBursting = 0;
    actor.gunBurstTimer = 0;
    actor.initiateShoot = 0; // added Nov 01 2017
}
