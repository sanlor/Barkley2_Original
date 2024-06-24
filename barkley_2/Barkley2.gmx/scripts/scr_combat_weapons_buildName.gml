/// scr_combat_weapons_buildName(gun)

var gun = argument0;

gun[? "pModel"] = "";
gun[? "pModelPrefix"] = "";
gun[? "pModelInfix"] = "";
gun[? "pModelSuffix"] = "";
gun[? "affixCount"] = 0;

// Generate prefix
if(gun[? "pPrefix1"]!="empty"){gun[? "pModelPrefix"]+=gun[? "pPrefix1"]+" "; gun[? "affixCount"]+=1;}
if(gun[? "pPrefix2"]!="empty"){gun[? "pModelPrefix"]+=gun[? "pPrefix2"]+" "; gun[? "affixCount"]+=1;}
gun[? "pModel"] += gun[? "pModelPrefix"];
gun[? "pModelPrefix"] = string_copy(gun[? "pModelPrefix"], 0, string_length(gun[? "pModelPrefix"])-1);

// Generate main name
if(gun[? "pMaterial"] != "steel"){gun[? "pModelInfix"]+=gun[? "pMaterial"]+" ";}
gun[? "pModelInfix"]+= gun[? "pType"];
gun[? "pModel"] += gun[? "pModelInfix"];

// Generate suffix
if(gun[? "pSuffix"]!="empty"){gun[? "pModelSuffix"]+= " " + gun[? "pSuffix"]; gun[? "affixCount"]+=1;}
gun[? "pModel"] += gun[? "pModelSuffix"];
gun[? "pModelSuffix"] = string_copy(gun[? "pModelSuffix"], 1, string_length(gun[? "pModelSuffix"]));

// Generate pickup name
gun[? "pickupName"] = "";
if(gun[? "pMaterial"] != "steel"){gun[? "pickupName"]+=gun[? "pMaterial"]+" ";}
gun[? "pickupName"] += gun[? "pType"];

var _tx = "";
switch(gun[? "affixCount"])
{
    case 1: _tx = choose("bizarre ","eerie ","odd ","weird "); gun[? "pickCol"] = c_aqua; break;
    case 2: _tx = choose("rare ","special ","strange ","glowing "); gun[? "pickCol"] = c_yellow; break;
    case 3: _tx = choose("mystical ","ancient ", "mythical ","impossible ","grotesque "); gun[? "pickCol"] = make_colour_rgb(213,114,177); break;
}
gun[? "pickupName"] = _tx + gun[? "pickupName"];
