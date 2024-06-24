
repeat (20) //Until there are "gibs" made, use a bunch of blood splatter for killing
{
    _dx = x - 8 + floor(random(16));
    _dy = y - z - floor(random(32));
    _obj = instance_create(_dx, _dy, o_FX);
    _obj.sprite_index = s_fx_bloodBurst;
    _obj.image_speed = 0.3 - random(0.2);
    _obj.image_angle = choose(0,90,180,270);
}

visible = false;
