//Everything
if (argument_count == 0)
{
    return global.miniPlaying;
}
else 
{
    if (argument[0] == "init") //Needs to be reset every time you play a new game
    {
        global.miniPlaying = 0;
        global.miniEventSet = 0;
        global.miniX = view_xview[0];
        global.miniY = view_yview[0];
        
        //Return values
        global.miniReturn = 0;
        
        //Elegiac 0rd, Elegiac 2st
        global.miniDanmakuBest[0] = 0;
        global.miniDanmakuBest[1] = 0;
        
        //10 in 1
        global.miniLast = 0;
        for (i = 0; i < 11; i += 1) global.miniPlayed[i] = 0;
        
        global.fn_danmaku = font_add_sprite(sMiniDanmakuFont, 48, 0, 1);
        global.fn_babby = font_add_sprite(sMiniBabbyFont, 48, 0, 1);
        
        return 1;
    }
    else if (argument[0] == "play")
    {
        if (global.miniPlaying) exit;
        _obj = -1;
        
        _str = string_lower(argument[1]);
        if (_str == "elegiac 0rd") { _obj = oMiniDanmakuTitle; }
        if (_str == "elegiac 2st") { _obj = oMiniDanmakuTitle2; }
        if (_str == "10 in 1") { _obj = oMini10Select; }
        if (_str == "mech game") { _obj = oMiniMech; }
        if (_str == "swordbane online") { _obj = oMiniSwordbane; }
        if (_str == "hungry horse") { _obj = oMiniHorse; }
        if (_str == "hungry horse spectator") { _obj = oMiniHorse2; }
        if (_str == "grab babby") { _obj = oMiniBabbyBG; }
        
        if (_obj != -1)
        {
            //supply object id
            o_curs.toggleCursor = false;
            global.miniPlaying = 1;
            if (global.event == false) { global.event = true; global.miniEventSet = 1; }
            else global.miniEventSet = 0;
            global.miniMusic = audio_bgm_get_current();
            audio_set_bgm("mus_blankTEMP");
            
            //GZ STUFF
            global.miniX = view_xview[0];
            global.miniY = view_yview[0];
            global.miniScale = 1;//global.screen_scale; //3;
            global.miniWidth = 384;
            global.miniHeight = 240;
            global.miniWidthS = global.miniWidth * global.miniScale;
            global.miniHeightS = global.miniHeight * global.miniScale;
            
            _objj = instance_create(0, 0, _obj);
            
            return _objj;
        }
        
    }
    else if (argument[0] = "stop")
    {
        if (global.miniPlaying == 0) exit;
        o_curs.toggleCursor = true;
        global.miniPlaying = 0;
        if (global.miniEventSet == 1) global.event = false;
        o_hoopz.dodgeCooldown = 2.5;
        audio_set_bgm("mus_blankTEMP"); //from null set seems to not go back to org music
        audio_set_bgm(global.miniMusic);
        
        //Sometimes line breaks were added to dialog, I think the below fixes it
        draw_set_font(global.fn_2);
        
        return 1;
    }
}
return -1;
