/// combat_gunwield_equip(actor, gun)
// Must be called when actor equips a gun

var actor = argument0;
var gun = argument1;

if (gun != NULL and instance_exists(actor)) {
    gun[? "pChargeAccum"] = 1;
    var swapSound = soundOrNullstring(gun[? "swapSound"])
    if (swapSound != NULL_STRING) {
        audio_play_sound_on_actor(actor, swapSound, false, 90)
    }
    with (argument0)
    {
        if (scr_player_getGunHolstered() == false)
        {
            scr_player_setStance(scr_player_stance_drawing);
            script_execute(stance);
        }
    }
}
