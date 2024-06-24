///scr_fx_explosion_spawn_on(target,exploType)

var _target = argument0;
var _type = argument1;

var _x = _target.x;
var _y = _target.y;
var _z = 0;

var _obj = scr_fx_explosion_createFromType(_x, _y, _z, _type);

if (object_is_ancestor(_target.object_index, Particle)) {
    _obj.z = _target.z;
}

_obj.followObj = _target;

