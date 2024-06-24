/// scr_combat_weapons_Prefix1(affix,action,gunOrNull)
/// TODO: Make these actions constant variables.
/// actions:
/// "applyStats": apply weapon stat-related affix effect. Applied before the special pattern effects.
/// "apply": set up the weapon special effects to have this affix
/// "checkval": check the point value of that affix, for gun's generation and for weighing in fusing

var _affix = argument0;
var _action = argument1;
var gun = argument2;

switch(_affix)
{
    case "Dotline":
        return scr_combat_weapons_prefix1_dotline(_action, gun);
    case "Polarized":
        return scr_combat_weapons_prefix1_polarized(_action, gun);
    case "Fetching":
        return scr_combat_weapons_prefix1_fetching(_action, gun);
    case "Surfing":
        return scr_combat_weapons_prefix1_surfing(_action, gun);
    case "Lobbing":
        return scr_combat_weapons_prefix1_lobbing(_action, gun);
    case "Pensioner's":
        return scr_combat_weapons_prefix1_pensioners(_action, gun);
    case "Magician's":
        return scr_combat_weapons_prefix1_magicians(_action, gun);
    case "Gravitational":
        return scr_combat_weapons_prefix1_gravitational(_action, gun);
    case "Ricocheting":
        return scr_combat_weapons_prefix1_ricocheting(_action, gun);
    case "Orbiting":
        return scr_combat_weapons_prefix1_orbiting(_action, gun);
    case "Flooding":
        return scr_combat_weapons_prefix1_flooding(_action, gun);
    case "Ghostic":
        return scr_combat_weapons_prefix1_ghost(_action, gun);
    case "Goofed":
        return scr_combat_weapons_prefix1_goofed(_action, gun);
    case "NoScope360":
        return scr_combat_weapons_prefix1_noscope360(_action, gun);
    case "Chaining":
        return scr_combat_weapons_prefix1_chaining(_action, gun);
    case "Berzerk'd":
        return scr_combat_weapons_prefix1_berzerkd(_action, gun);
    case "Afterburner":
        return scr_combat_weapons_prefix1_afterburner(_action, gun);
    case "Proximity":
        return scr_combat_weapons_prefix1_proximity(_action, gun);
}

return 0;
