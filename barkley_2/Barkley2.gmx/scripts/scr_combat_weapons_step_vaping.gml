/// scr_combat_weapons_step_vaping(actor, gun)
var actor = argument0;
var gun = argument1;

// Wading depth
var current = scr_statusEffect_getFromCombatActor(actor.id, statusEffect_wading);
var swimmove = 0;
if (current > 0) swimmove = ds_map_find_value(current, "wadingDepthCurrent");

// Dual
var gunCount = 1;
if (gun[? "pMaterial"] == "Dual") gunCount = 2;

// == Shoot bullets! ==
//actor.buckx = round(lengthdir_x(2,_aimdir+180));
//actor.bucky = round(lengthdir_y(2,_aimdir+180));

///shot anim
var _aimdirQuant = actor.aiming * (360 / actor.aFaceCount);

scr_player_getGunShifts(gun[? "pType"],gun[? "pMaterial"]=="Dual");
var dir = actor.aiming*22.5 
if (gun[? "pPrefix1"] == "Afterburner")
{
    dir -= 180;
    _aimdirQuant -= 180;
    _aimdir -= 180;
}
var distx = lengthdir_x(heldDist,dir);
var disty = lengthdir_y(heldDist,dir)*0.75;
if (gun[? "pMaterial"]=="Dual" && heldHShift<6) heldHShift = 8;
var xhshift = lengthdir_x(heldHShift,dir+90);
var yhshift = lengthdir_y(heldHShift,dir+90)*0.75;

if (gunCount == 2)
{
    xhshift = lengthdir_x(heldHShift,dir-90);
    yhshift = lengthdir_y(heldHShift,dir-90)*0.75;
}

var _barrel_x = lengthdir_x(heldBulletDist,_aimdirQuant) + distx + xhshift + actor.x;
var _barrel_y = lengthdir_y(heldBulletDist,_aimdirQuant) + disty + yhshift + actor.y;
var _barrel_z = actor.ARMS_HEIGHT + heldBullet_YShift + 1 - swimmove;


if (vapeHold > 0)
{
    vapeHold -= dt_sec();
}
else 
{
    vapeCount += dt_sec() * vapeSecond;
    if (vapeBoost > 0) 
    {
        vapeCount += dt_sec() * vapeSecond;
        vapeBoost -= dt_sec();
        if (vapeBoost <= 0) vapeSize = 0;
    }
}
while (vapeCount > 1)
{
    vapeCount -= 1;
    if (vapeSize == 0 && random(100) < 20)
    {
        vapeHold = 2 + random(3);
        vapeSize = vapeHold * 2;
        vapeBoost = vapeSize / (2 + random(1));
    }
    //Smoke("customcolor", smkCol[0], smkCol[1], smkCol[2]);
    smk = Smoke("puff keep", _barrel_x - 3 + random(6), _barrel_y - 3 + random(6), _barrel_z + 1, 10 + (vapeSize) + random(5 + (vapeSize / 2)));
    smk.move_x = move_x;
    smk.move_y = move_y - 12;
    smk.smoke_speed = 1; //3;
    with (smk) { event_user(0); instance_destroy(); }
    //Smoke("color", c_white);
}
