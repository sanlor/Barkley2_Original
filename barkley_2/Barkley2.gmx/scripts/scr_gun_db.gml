/// scr_gun_db(string, 1=give?)
// By calling this script with an argument, you will give the player that gun

var gun;
var luck = scr_savedata_get("player.stats.effective." + STAT_BASE_LUCK);
switch (argument[0])
{
    case "wilmerGun": // You get this for free from Wilmer
        gun = Drop("generate", luck, "wilmers gun", "WILM");
        break;
    
    case "estherGun": // You get this for free from Wilmer
        gun = Drop("generate", luck, "esthers gun", "ESTR");
        break;
            
    case "wilmerPax1": // PAX2015 - Get this from Wilmer also
        gun = Drop("generate", luck, "generic pistol", "URGH");
        break;
        
    case "wilmerPax2": // PAX2015 - Get this from Wilmer also
        gun = Drop("generate", luck, "generic automatic", "ZOAL");
        break;
        
    case "cornrowGun": // Get this after completing the first task for Cornrow
        gun = Drop("generate", luck, "bio shotgun", "CORN");
        break;
        
    case "juiceboxGun": // Get this after completing all of Cornrow's tasks
        gun = Drop("generate", luck, "bio rifle", "JUCE");
        break;
        
    case "kaleviGun1": // Get for free after talking to Kalevi for first time
        gun = Drop("generate", luck, "cyber pistol", "NANC");
        break;
        
    case "kaleviGun2": // Get from Kalevi after visiting rebel base and learning he supplies the rebels
        gun = Drop("generate", luck, "cyber projectile", "BIGZ");
        break;

    case "bombHut": // Get from bomb hut (where joad is)
        gun = Drop("generate", luck, "mental rifle", "DOUG");
        break;
        
    case "gunsalesmanGun1": // 1st gun of his bad batch
        gun = Drop("generate", luck, "kosmic pistol", "FUND");
        break;
        
    case "gunsalesmanGun2": // 2nd gun of his bad batch
        gun = Drop("generate", luck, "kosmic rifle", "GIRF");
        break;
        
    case "gunsalesmanGun3": // 3rd gun of his bad batch
        gun = Drop("generate", luck, "kosmic shotgun", "SGUN");
        break;
        
    case "gunsalesmanGun4": // 1st gun of his good batch
        gun = Drop("generate", luck, "zauber pistol", "HELL");
        break;
        
    case "gunsalesmanGun5": // 2nd gun of his good batch
        gun = Drop("generate", luck, "zauber rifle", "NIFF");
        break;
        
    case "gunsalesmanGun6": // 3rd gun of his good batch
        gun = Drop("generate", luck, "zauber shotgun", "GOOP");
        break;
        
    case "gilbertGun": // Gun in a chest at Gilbert's Peek
        gun = Drop("generate", luck, "zauber pistol", "GILB");
        break;
    
    // TURALD
    // o_turald_fish create has the 4 turald gun drop names 
    // it uses a slightly different system because it generates an actual drop item
    // So check the Drop script for turalds drop data
}

if (argument_count == 1)
{
    if (scr_equipment_guns_bandolier_getSlotsUsed() < 5)
        scr_equipment_guns_bandolier_addGun(gun);
    else
        scr_equipment_guns_bag_addGun(gun);
}
return gun;
