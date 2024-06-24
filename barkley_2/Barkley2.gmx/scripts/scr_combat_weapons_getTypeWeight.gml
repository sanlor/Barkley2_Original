/// scr_combat_weapons_getTypeWeight(type)

var type = argument0;

if (type==GUN_TYPE_FLINTLOCK)       return 0.750;
if (type==GUN_TYPE_PISTOL)          return 0.781;
if (type==GUN_TYPE_MUSKET)          return 0.813;
if (type==GUN_TYPE_FLAREGUN)        return 0.844;
if (type==GUN_TYPE_MACHINEPISTOL)   return 0.875;
if (type==GUN_TYPE_REVOLVER)        return 0.906;
if (type==GUN_TYPE_SUBMACHINEGUN)   return 0.938;
if (type==GUN_TYPE_CROSSBOW)        return 0.969;
if (type==GUN_TYPE_RIFLE)           return 1.000;
if (type==GUN_TYPE_ASSAULTRIFLE)    return 1.063;
if (type==GUN_TYPE_TRANQRIFLE)      return 1.125;
if (type==GUN_TYPE_HEAVYMACHINEGUN) return 1.188;
if (type==GUN_TYPE_SHOTGUN)         return 1.250;
if (type==GUN_TYPE_HUNTINGRIFLE)    return 1.313;
if (type==GUN_TYPE_SNIPERRIFLE)     return 1.375;
if (type==GUN_TYPE_MAGNUM)          return 1.438;
if (type==GUN_TYPE_ELEPHANTGUN)     return 1.500;
if (type==GUN_TYPE_DOUBLESHOTGUN)   return 1.563;
if (type==GUN_TYPE_FLAMETHROWER)    return 1.625;
if (type==GUN_TYPE_REVOLVERSHOTGUN) return 1.688;
if (type==GUN_TYPE_ROCKET)          return 1.750;
if (type==GUN_TYPE_GATLINGGUN)      return 1.813;
if (type==GUN_TYPE_MINIGUN)         return 1.875;
if (type==GUN_TYPE_MITRAILLEUSE)    return 1.938;
if (type==GUN_TYPE_BFG)             return 2.000;

return 1;

