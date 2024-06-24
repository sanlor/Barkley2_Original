/// Game()
// Game("new")
// Game("new from wilmer")
// Game("load")
if (argument[0] == "new")
{
    scr_savedata_delete();
    scr_savedata_reset();
    scr_player_newPlayerIdentity();
    Quest("saveDisabled", 1);
    Quest("sceneBrandingStart", 1);
    Quest("gameStart", 1);
    Quest("elevatorFloor", 665);
    Quest("elevatorFloorGoal", 665);
    Quest("ccCompleted", 1);
    paused(0);
    scr_savedata_put("map.room", "r_fct_eggRooms01");
    scr_savedata_put("map.x", 0);
    scr_savedata_put("map.y", 0);
    scr_savedata_save();
    Teleport(r_fct_eggRooms01, 0, 0, 1);
}
if (argument[0] == "new from cc")
{
    //This is the game start from Character Creation, the "canon start"
    with(o_pointer) instance_destroy();
    Quest("saveDisabled", 1);
    Quest("sceneBrandingStart", 1);
    Quest("gameStart", 1);
    Quest("elevatorFloor", 665);
    Quest("elevatorFloorGoal", 665);
    Quest("ccCompleted", 1);
    paused(0);
    scr_savedata_put("map.room", "r_fct_eggRooms01");
    scr_savedata_put("map.x", 0);
    scr_savedata_put("map.y", 0);
    scr_savedata_save();
    Teleport(r_fct_eggRooms01, 0, 0, 1);
}
else if (argument[0] == "new from wilmer")
{
    // Plays as if you did the tutorial, woke up, and grabbed Wilmers stuff
    scr_savedata_delete();
    scr_savedata_reset();
    scr_player_newPlayerIdentity();
    Quest("gameStart", 2);
    Quest("sceneBrandingStart", 4);
    Quest("wilmerEvict", 1);
    Quest("wilmerHandler", 0);
    Quest("wilmerSleepCount", 0);
    Quest("wilmerSleep", 1);
    Quest("wilmerItemsTaken", 1);
    Quest("wilmerMeeting", 1);
    Quest("tutorialProgress", 100);
    Quest("elevatorFloor", 665);
    Quest("elevatorFloorGoal", 665);
    scr_gun_db("wilmerGun");
    scr_gun_db("estherGun");
    Candy("recipe add", "Butterscotch");
    repeat (10) scr_items_add(scr_items_db_getCopyOfItem("Butterscotch"));
    Note("take", "Wilmer's Amortization Schedule");
    scr_money_set(scr_money_db("wilmerMortgageTotal"));
    paused(0);
    global.DELTA_TIME_MOD = 1;
    Teleport(r_tnn_wilmer01, 240, 350, 1);
}
else if (argument[0] == "load")
{
    scr_savedata_load();
    paused(false);
    var save_roomname = scr_savedata_get("map.room");
    var save_room = asset_get_index(save_roomname);
    var save_roomx = scr_savedata_get("map.x");
    var save_roomy = scr_savedata_get("map.y");
    audio_set_bgm("");
    var room_target;

    with (o_world) { room_target = scr_map_initialise_load_room(save_room, save_roomx, save_roomy); }
    // Below was cut out and added to phase part so that it can be done when it fades
    if (scr_savedata_get("player.respawn.do") == true) {
        instance_create(0, 0, o_hoopz);
        with (o_hoopz) scr_player_respawn();
    }
    else room_goto(room_target);
}
