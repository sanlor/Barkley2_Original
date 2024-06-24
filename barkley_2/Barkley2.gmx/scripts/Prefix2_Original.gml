if (argument[0] == "prefix2")
{
    // EMPTY
    scr_combat_weapons_fusion_affixhood("create prefix2", "empty", "empty", "empty", "empty", "", statusEffect_null);// Empty prefix must always be created
                                                    
    // BOTTOM
    scr_combat_weapons_fusion_affixhood("create prefix2", "Malnourishing",      "bottom", "bio", "capability",      "Lowers target GLAMP.", statusEffect_malnourished);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Tubercular",         "bottom", "bio", "weight",          "The Consumption lowers GUTS and WEIGHT.", statusEffect_tubercular);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Thorny",             "bottom", "bio", "hp",              "BIO thorns nestle and release from target.", statusEffect_thorny);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Withering",          "bottom", "bio", "properties",      "Lowers BIO RESIST, boosts LUCK and ACROBATICS.", statusEffect_withering);
    
    scr_combat_weapons_fusion_affixhood("create prefix2", "Fragmenting",        "bottom", "cyber", "capability",    "Lowers all RESIST, GLAMP increases.", statusEffect_fragmenting);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Compressing",        "bottom", "cyber", "weight",        "Decreases WEIGHT and DEFENSE.", statusEffect_compressing);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Overheating",        "bottom", "cyber", "hp",            "Deals CYBER damage after five hits.", statusEffect_overheating);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Uninstalling",       "bottom", "cyber", "properties",    "Decreases CYBER RESIST.", statusEffect_uninstalling);
    
    scr_combat_weapons_fusion_affixhood("create prefix2", "Homeopathic",        "bottom", "mental", "capability",   "Target can't gain hitpoints.", statusEffect_homeopathic);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Busting",            "bottom", "mental", "weight",       "Staggers target", statusEffect_busting);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Discriminating",     "bottom", "mental", "hp",           "Nearby foes increase damage received.", statusEffect_discriminating);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Stupefying",         "bottom", "mental", "properties",   "Lowers BRAIN POINTS.", statusEffect_stupefying);
    
    scr_combat_weapons_fusion_affixhood("create prefix2", "Godless",            "bottom", "zauber", "capability",   "Demolishes PIETY.", statusEffect_godless);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Narcotizing",        "bottom", "zauber", "weight",       "Puts target to sleep.", statusEffect_sleep);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Zaubric",            "bottom", "zauber", "hp",           "Deals ZAUBER damage.", statusEffect_zaubric);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Disenchanting",      "bottom", "zauber", "properties",   "Decreases ZAUBER RESIST.", statusEffect_dispelling);
    
    scr_combat_weapons_fusion_affixhood("create prefix2", "Adhesive",           "bottom", "cosmic", "capability",   "Demolishes speed.", statusEffect_adhesive);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Push-Over",          "bottom", "cosmic", "weight",       "Halves WEIGHT and KNOCKBACK RESIST.", statusEffect_pushover);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Decimating",         "bottom", "cosmic", "hp",           "Deals proportional KOSMIC damage.", statusEffect_decimating);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Ionizing",           "bottom", "cosmic", "properties",   "Decreases KOSMIC RESIST.", statusEffect_ionizing);
                                                    
    // TOP
    scr_combat_weapons_fusion_affixhood("create prefix2", "Gut-wrenching",      "top", "bio", "capability",         "Lowers GUTS", statusEffect_gutwrenching);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Calorizing",         "top", "bio", "weight",             "Increases WEIGHT and gives hitpoints.", statusEffect_calorizing);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Slurping",           "top", "bio", "hp",                 "Deals BIO damage and slurps hitpoints.", statusEffect_slurp);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Composting",         "top", "bio", "properties",         "Deals BIO damage and increases BIO VULN.", statusEffect_composting);
    
    scr_combat_weapons_fusion_affixhood("create prefix2", "Pariahing",          "top", "cyber", "capability",       "Lowers LUCK", statusEffect_pariahing);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Unzipping",          "top", "cyber", "weight",           "Gradually increases WEIGHT.", statusEffect_unzipping);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Boobytrapping",      "top", "cyber", "hp",               "Deals damage after a delay.", statusEffect_boobytrap);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Interfacing",        "top", "cyber", "properties",       "Deals CYBER damage and increases CYBER VULN.", statusEffect_interfacing);
    
    scr_combat_weapons_fusion_affixhood("create prefix2", "Aging",              "top", "mental", "capability",      "Lowers ACROBATICS.", statusEffect_aging);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Traumatic",          "top", "mental", "weight",          "Any damage increases WEIGHT.", statusEffect_traumatic);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Mindstraining",      "top", "mental", "hp",              "Deals MENTAL damage, lowers PIETY.", statusEffect_mindstraining);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Meditating",         "top", "mental", "properties",      "Deals MENTAL damage, increases MENTAL VULN.", statusEffect_meditating);
    
    scr_combat_weapons_fusion_affixhood("create prefix2", "Feebling",           "top", "zauber", "capability",      "Lowers MIGHT.", statusEffect_feebling);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Blinking",           "top", "zauber", "weight",          "Periodic teleports target to nearby location.", statusEffect_blinking);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Hexing",             "top", "zauber", "hp",              "Deals ZAUBER damage equal to health comparison.", statusEffect_hexing);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Wizardly",           "top", "zauber", "properties",      "Deals ZAUBER damage and increases ZAUBER VULN.", statusEffect_wizardly);
    
    scr_combat_weapons_fusion_affixhood("create prefix2", "Paganizing",         "top", "cosmic", "capability",      "Lowers PIETY.", statusEffect_paganizing);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Agonizing",          "top", "cosmic", "weight",          "Deals KOSMIC damage when moving.", statusEffect_agonizing);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Radiating",          "top", "cosmic", "hp",              "Radiates KOSMIC damage.", statusEffect_radiating);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Celestial",          "top", "cosmic", "properties",      "Deals KOSMIC damage and increases KOSMIC VULN.", statusEffect_celestial);
                                                    
    // CHARM
    scr_combat_weapons_fusion_affixhood("create prefix2", "Blighting",          "charm", "bio", "capability",       "Plagues with BIO damage.", statusEffect_blighting);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Hiccuping",          "charm", "bio", "weight",           "Demolishes speed periodically.", statusEffect_hiccuping);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Deathbound",         "charm", "bio", "hp",               "Deals BIO damage equal to DEATHS on file.", statusEffect_deathbound);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Bionic",             "charm", "bio", "properties",       "Increases BIO/CYBER RESIST, lowers other RESIST.", statusEffect_bionic);
    
    scr_combat_weapons_fusion_affixhood("create prefix2", "Shocking",           "charm", "cyber", "capability",     "Deals CYBER damage and staggers target.", statusEffect_shocking);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Hot-Swapping",       "charm", "cyber", "weight",         "Juggles GLAMP values around.", statusEffect_hotswapping);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Transhuman",         "charm", "cyber", "hp",             "Deals CYBER damage based on CYBER Transhumanism level.", statusEffect_transhuman);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Mindjacker",         "charm", "cyber", "properties",     "Increases CYBER/MENTAL RESIST, lowers other RESIST.", statusEffect_mindjacker);
    
    scr_combat_weapons_fusion_affixhood("create prefix2", "Anti-social",        "charm", "mental", "capability",    "Demolishes speed near combatants.", statusEffect_antisocial);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Anesthetic",         "charm", "mental", "weight",        "Narcotizing thorns nestle and release from target.", statusEffect_anesthetic);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Darwinic",           "charm", "mental", "hp",            "Deals MENTAL damage equal to strongest GLAMP value.", statusEffect_darwinic);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Psychomancer",       "charm", "mental", "properties",    "Increases MENTAL/ZAUBER RESIST, lowers other RESIST.", statusEffect_psychomancer);
    
    scr_combat_weapons_fusion_affixhood("create prefix2", "Dooming",            "charm", "zauber", "capability",    "Deals ZAUBER damage equal to total hitpoints.", statusEffect_dooming);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Eight Armed",        "charm", "zauber", "weight",        "Boosts GUTS at the expense of other GLAMP.", statusEffect_eightArmed);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Glamping",           "charm", "zauber", "hp",            "Deals ZAUBER damage equal to your total GLAMP.", statusEffect_glamping);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Vortex",             "charm", "zauber", "properties",    "Increases ZAUBER/KOSMIC RESIST, lowers other RESIST.", statusEffect_vortex);
    
    scr_combat_weapons_fusion_affixhood("create prefix2", "Crit",               "charm", "cosmic", "capability",    "Chance to deal 500% Cosmic Damage.", statusEffect_crit);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Equalizing",         "charm", "cosmic", "weight",        "Readjusts one GLAMP value to 100, another to 1.", statusEffect_equalizing);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Chronic",            "charm", "cosmic", "hp",            "Readjust health to 50% - 150%", statusEffect_chronic);
    scr_combat_weapons_fusion_affixhood("create prefix2", "Starbabby",          "charm", "cosmic", "properties",    "Increases KOSMIC/BIO RESIST, lowers other RESIST.", statusEffect_starbabby);
}