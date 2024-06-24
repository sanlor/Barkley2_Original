// event_chu_cuchulainn_oldman

if (argument0 == SCRIPT_START) {

} else if (argument0 == SCRIPT_STEP) {
    
}
else if (argument0 == SCRIPT_INTERACT) {
    var playerX1 = scr_quest_get_state("playerX1")
   
    if (scr_quest_get_state("playerX1") == 1) {
        var playerName = "X114JAM9"
    } else if (scr_quest_get_state("playerCC") == 1) {
        var playerName = "Dougray"
    } else if (scr_quest_get_state("playerHoopz") == 1) {
        var playerName = "Hoopz"
    }

    var cuchu_oldman = id;
    var event = scr_event_create_main()
    with (event) {
    
    } 
    scr_event_advance(event);
}