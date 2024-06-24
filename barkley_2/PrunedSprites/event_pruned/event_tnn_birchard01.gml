// Event for Birchard, a random dwarf.
// usage: event_tnn_birchard01();

if (argument0 == SCRIPT_START)
{
    if (scr_inside() == false)
    {
        scr_event_interactive_deactivate();
        scr_npc_mover(1, r_tnn_maingate02, o_birchard01, 120, 344);
        scr_npc_mover(2, r_tnn_warehouseDistrict01, o_birchard01, 1136, 128);
        scr_npc_mover(3, r_tnn_warehouseDistrict01, o_birchard01, 1136, 128);
        scr_npc_mover(4, r_tnn_residentialDistrict01, o_birchard01, 640, 152);
        scr_npc_mover(5, r_tnn_warehouseDistrict01, o_birchard01, 120, 344);
    }
    
    // Activation & Deactivation for Curfew
    if (scr_tnn_curfew("during") && !scr_inside()) { scr_event_interactive_deactivate(); }
    if (!scr_tnn_curfew("during") && scr_inside()) { scr_event_interactive_deactivate(); }
}
if (argument0 == SCRIPT_STEP)
{

}
else if (argument0 == SCRIPT_INTERACT)
{
    // Build Event
    var birchard = id;
    var event = scr_event_create_main();
    
    with (event)
    {
        //-----------------------------------------
        // Body Swap States
        //-----------------------------------------
        //if you're controlling Matthias/Dead Son.
        if (BodySwap() == "matthias")
        {
            scr_event_build_dialogue("Birchard", NULL, "G'day Matthias. I can't wait for Cuchulainn's prize. I can't wait to eat grapes. I can't wait for the next Booty Bass concert. I can't wait to get some gems.");
        } 
        //if you're controlling the Governor.
        else if (BodySwap() == "governor")
        {
            scr_event_build_dialogue("Birchard", NULL, "Are you the new Governor? I think I figured out what Cuchulainn's prize is going to be. It's going to be grapes. That's just my opinion. Don't tell me if I'm right.");
        }
        //-----------------------------------------
        // Indoors, during curfew
        //-----------------------------------------
        else if (scr_tnn_curfew("during") == true)
        {
            // Talked to him.
            if (scr_quest_get_state("birchardState") == 1)
            {
                scr_event_build_dialogue("Birchard", NULL, "I want Cuchulainn to give me grapes. I want Cuchulainn to give me trucks. I want Cuchulainn to give me toys. I also want Cuchulainn to give me gum.");
            }
            // Never talked to him.
            else
            {
                scr_event_build_dialogue("Birchard", NULL, "Hello. Do you know about Cuchulainn's prize? Cuchulainn's going to give us prizes soon. If it's grapes, I'll like the prize.");
                scr_event_build_quest_state("birchardState", 1);
            } 
        }
        //-----------------------------------------
        // Normal dialogue, before and after curfew
        //-----------------------------------------
        // Talked to him.
        else
        {
            if (scr_quest_get_state("birchardState") == 1)
            {
                scr_event_build_dialogue("Birchard", NULL, "I like grapes. I like prizes. I like fruit. I like my friends. I like sand. I like gems. I like fruit.");
                
            } 
            // Never talked to him.
            else
            {
                scr_event_build_dialogue("Birchard", NULL, "I'm sad because Cuchulainn is confining all the dwarfs into Tir na Nog but I'm happy because he's giving us all prizes but I'm sad because I don't have the prize yet.");
                scr_event_build_quest_state("birchardState", 1);
            }
        }
    }
    scr_event_advance(event);
}
