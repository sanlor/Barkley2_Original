/// BlueFace("begin" / "end")
if (argument[0] == "begin")
{
    if (Quest("playerBlueFace"))
    {
        shd = shader_hue_partial;
        shader_set(shd);
        shader_set_uniform_f(shader_get_uniform(shd, "argHue"), 200);
        shader_set_uniform_f(shader_get_uniform(shd, "argHueTarget"), 30);
        shader_set_uniform_f(shader_get_uniform(shd, "argHueTolerance"), 20);
    }
    if (Quest("draculaBlood") > 0)
    {
        var bst = Quest("draculaBlood") / 10;
        shd = shader_color_boost;
        shader_set(shd);
        shader_set_uniform_f(shader_get_uniform(shd, "argRed"), bst);
        shader_set_uniform_f(shader_get_uniform(shd, "argGreen"), -bst);
        shader_set_uniform_f(shader_get_uniform(shd, "argBlue"), -bst);
    }
}
else if (argument[0] == "end")
{
    if (Quest("playerBlueFace")) shader_reset();
    if (Quest("draculaBlood") > 0) shader_reset();
}
