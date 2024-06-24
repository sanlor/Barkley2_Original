///scr_shootShrapnel(baseShot,x,y,z,sprite,dir,speed,lobAngle,reachMod,damageMod)
var _baseShot = argument0;
var _x = argument1;
var _y = argument2;
var _z = argument3;

var _sprite = argument4;
var _dir = argument5;
var _spd = argument6;
var _lob = argument7;
var _reach = argument8;
var _dmgMod = argument9;

var shard = scr_combat_cloneBullet(id);
shard.x = _x; shard.y = _y; shard.z = _z;
scr_combat_bulletDmgmod(shard,0,_dmgMod);

shard.initDir = _dir;

with(shard)
{
    sprite_index = _sprite;
    rangeEndGrav = 10;
    lobGravity = 1;
    move_z = move_z - lengthdir_y(_spd, _lob);
    scr_entity_setDirSpd(_dir,_spd);
}

shard.distlife = max(100,(distcount/2+distlife)*_reach);
shard.timelife = max(100,(count/2+timelife)*_reach);

return shard;
