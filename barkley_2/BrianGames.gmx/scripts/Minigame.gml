//Everything
if (argument[0] == "play")
{
    //supply object id
    global.event = true;
    //global.miniMusic = o_world.currentBGM;
    audio_set_bgm(noone);
    
    _str = string_lower(argument[1]);
    if (_str == "elegiac 0rd") instance_create(0, 0, oMiniDanmaku);
    if (_str == "10 in 1") instance_create(0, 0, oMiniSelect);
    if (_str == "mech game") instance_create(0, 0, oMiniMech);
    if (_str == "swordbane online") instance_create(0, 0, oMiniSwordbane);
}
else if (argument[0] = "stop")
{
    global.event = false;
    audio_set_bgm(noone); //from null set seems to not go back to org music
    //audio_set_bgm(global.miniMusic);
}
