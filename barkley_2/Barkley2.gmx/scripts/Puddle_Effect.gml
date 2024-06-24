/// Puddle_Effect(x, y, z, 0 - 8, color)
var _amount = argument3;
var _col = argument4;

donk = instance_create(argument0, argument1, o_effect_puddle);
with donk
    {
    z = argument2;
    color = _col;
    for (i=0; i<_amount; i+=1;) puddle_visible[i] = true;
    }
    
return donk;
