/// Shadow
if (argument[0] == "create")
{
    var obj = instance_create(x, y, oShadow);
    obj.dad = id;
    var shdRad = shadow_radius;
    if (argument_count > 1) shdRad = argument[1];
    obj.rad = shdRad;
    //if (shadow_visible == 0) obj.rad = 0;
    obj.alp = shadow_strength;
}
