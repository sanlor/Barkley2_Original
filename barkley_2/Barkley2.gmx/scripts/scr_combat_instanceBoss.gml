///scr_combat_instanceBoss(x,y,bossObject)
var bx,by,boss;

bx = argument0;
by = argument1;
bossObject = argument2;

// we're entering a boss battle, set battleflag and drop table variable
global.battleMode = 1;
Quest("dropTable", 1);

// create the boss instance and set clear flag
var bossInst = instance_create(bx,by,bossObject);
bossInst.battleClear = 1;

// set boss alignment
scr_stats_alignment_setGlobalModifiers(o_hoopz, bossInst);
