// Event for Sviatoslav, a random unimportant character.
// usage: event_tnn_sviatoslav01();

if (argument0 == SCRIPT_START)
{
    if (scr_inside() == false)
    {
        scr_event_interactive_deactivate();
        scr_npc_mover(1, r_tnn_warehouseDistrict01, o_sviatoslav01, 864, 832);
        scr_npc_mover(2, r_tnn_warehouseDistrict01, o_sviatoslav01, 864, 832);
        scr_npc_mover(3, r_tnn_warehouseDistrict01, o_sviatoslav01, 864, 832);
        scr_npc_mover(4, r_tnn_warehouseDistrict01, o_sviatoslav01, 864, 832);
        scr_npc_mover(5, r_tnn_warehouseDistrict01, o_sviatoslav01, 864, 832);
    }
    
    // Activation & Deactivation for Curfew
    if (scr_tnn_curfew("during") && !scr_inside()) { scr_event_interactive_deactivate(); }
    if (!scr_tnn_curfew("during") && scr_inside()) { scr_event_interactive_deactivate(); }
}
else if (argument0 == SCRIPT_STEP)
{

}
else if (argument0 == SCRIPT_INTERACT)
{
    // Build Event
    var sviatoslav01 = id;
    var event = scr_event_create_main();
    
    with (event)
    {
        //if you're controlling Matthias/Dead Son.
        if (BodySwap() == "matthias")
        {
            Dialogue("Sviatoslav", "Drag, Matthias. You look like you just spiked your cranial neurodeck. Don't get brainburnt out there on the D-Net. I don't wanna see you get flatlined by some overclocked Bainshee frackware.");
        }
        //if you're controlling the Governor.
        else if (BodySwap() == "governor")
        {
            Dialogue("Sviatoslav", "Evening, sir. No subversive, anti-authoritarian neuroproselytizing going on here. I'll let you know if I see any.");
        }
        // Talked to him.
        else if (Quest("sviatoslavState") == 1)
        {
            Dialogue("Sviatoslav", "Welcome to the first day of the rest of your life, kid. If you're not jacked in, you're only seeing what Cuchulainn wants you to see. Open your eyes and read between the lines: this existence, this reality? It's a sham and these sheeple are buying it hook, line and sinker. The revolution is coming and it WILL be televised.");
            Dialogue(P_NAME, "(This guy is so cool...)");
        }
        // Never talked to him
        else
        {
            Dialogue("Sviatoslav", "Hey man, you jacked in?");
            Dialogue(P_NAME, "Jacked in?");
            Dialogue("Sviatoslav",  "Whooooa buddy, are you kidding me? Open your eyes, man. This is the 67th century and you're STILL in lockstep with Cuchulainn's tired song and dance? Let me tell you something: if you're not jacked in, you're not even getting HALF the story.");
            Dialogue(P_NAME, "Jacked in to what??");
            Dialogue("Sviatoslav", "DwarfNET, man. DwarfNET! This ain't reality. This is Cuchulainn's dumbed-down, hyper-commercialized, hyper-produced Hollywood spinoff. It's all a charade! This is an illusion, man - a delusion - and he's feeding it to you by the spoonful like the slack-jawed sheep he wants you to be. Reboot your mind, man. Jack into DwarfNET.");
            // Hoopz now knows about DwarfNET
            Quest("knowDwarfNET", 1);
            Dialogue(P_NAME, "Wow, this sounds really important. How do I jack in?");
            Dialogue("Sviatoslav", "It's simple. Find a utility station, then all you gotta do is plug into the station via your neural socket and log into DwarfNET. And don't worry - they're completely off the grid. Cuchulainn's got nothing on the L.O.N.G.I.N.U.S. cerebrojackers.");
            Dialogue(P_NAME, "L.O.N.G.I.N.U.S.? Who's that?");
            Dialogue("Sviatoslav", "Heh. I like you, kid. Let's just say your world is about to turn upside down.");
            Dialogue(P_NAME, "(Whoa...)");
            Quest("sviatoslavState", 1);
        }
    }
    scr_event_advance(event);
}
