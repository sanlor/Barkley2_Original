if (argument_count == 0) //Returns clock gate (integer)
{
    return global.clockGate;
}
else
{
    if (argument[0] == "init") //Call this every time you start a new game
    {
        ///Create
        global.clockSpeed = 0;
        global.clockTime = 60 * 60 * 24; //Current clock time
        ClockTime("update"); //Call every time after clock time is changed
        global.clockGate = 0;
        global.clockGateDestination = 1;
        global.clockSpeedMax = 2;
        pre = 0;
    }
    else if (argument[0] == "display") //Returns clock time as 12:30 / HH:MM
    {
        return NumberFormat(global.clockHours) + ":" + NumberFormat(global.clockMinutes);
    }
    else if (argument[0] == "step")
    {
        ///Get clock speed
        //gateDiff = floor(global.clockGateDestination) - floor(global.clockGate); //original
        gateDiff = global.clockGateDestination + max(0, floor(global.clockGateDestination - global.clockGate) - 1);
        gateDiff *= 4;
        if (keyboard_check(vk_control)) gateDiff *= 100;
        //gateDiff += 1;
        if (gateDiff == 0) spdMax = 0;
        else spdMax = dt() / (10 / gateDiff); //determines max seconds based on gates
        //Get percentage of gate to gate dest
        pre = abs(((((global.clockTime / 60) / 60))) - 24);
        pct = abs(1 - (pre / global.clockGateDestination));
        global.clockSpeed = spdMax * pct; //2 a second
        
        global.clockTime -= global.clockSpeed;
        ClockTime("update"); //Call every time after clock time is changed
    }
    else if (argument[0] == "update") ///Update key clock stuff
    {  
        global.clockSeconds = floor(global.clockTime mod 60);
        global.clockMinutes = global.clockTime div 60;
        global.clockHours = global.clockMinutes div 60;
        global.clockMinutes = global.clockMinutes mod 60;
        global.clockGate = abs(ceil(global.clockHours + 1) - 24); //
    }
    else if (argument[0] == "draw")
    {
        ///draw
        dx = view_xview[0] + 5; 
        dy = view_yview[0] + 5;
        draw_set_font(CourierNew24);
        draw_set_color(c_white);
        draw_text(dx, dy, NumberFormat(global.clockHours) + "h " + NumberFormat(global.clockMinutes) + "m " + NumberFormat(global.clockSeconds) + "s");
        dy += 24;
        //
        draw_set_font(CourierNew12b);
        draw_text(dx, dy, "Current clock speed (seconds): " + string(global.clockSpeed * 60));
        dy += 16;
        draw_text(dx, dy, "Current clock gate: " + string(global.clockGate) + " (" + string(pre) + ")");
        dy += 16;
        draw_text(dx, dy, "Current clock gate destination: " + string(global.clockGateDestination));
        dy += 16;
        draw_text(dx, dy, "Clock gate percent: " + string(pct));
        dy += 16;
        dy += 16;
        draw_text(dx, dy, "SPACE adds one to clock gate.");
        dy += 16;
        draw_text(dx, dy, "CONTROL speeds up (for testing times).");
        dy += 16;
        draw_text(dx, dy, "SHIFT restarts.");
        dy += 16;
    }
}
