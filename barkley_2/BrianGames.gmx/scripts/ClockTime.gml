//This sets hoopz experience for now, can be shifted to a more suitable script later
//ClockTime() - Returns clock gate (0 - 24 integer)
//ClockTime("init") - Call this every time you start a new game
//ClockTime("display" / "time") - Returns string value of time in HH:MM
//ClockTime("step") - Needs to be called once per game step
//ClockTime("update") - INTERNAL function that updates key clock values
//ClockTime("draw") - Draws debug clock info
if (argument_count == 0) //Returns clock gate (integer)
{
    return global.clockGate;
}
else
{
    if (argument[0] == "init") //Call this every time you start a new game
    {
        global.clockMax = 60 * 60 * 24;
        //Experience
        global.hoopzExperience = 0;
        global.experienceMin = 0.5;
        global.experienceMax = 1.5;
        global.experienceTime = global.clockMax div 60;
        _exp = 0;
        ///Clock
        global.clockSpeed = 4; //EDITABLE: If you are 1 gate away, it will start at 4 seconds and taper down
        global.clockFrequency = 0;
        
        global.clockTime = global.clockMax;
        ClockTime("update");
        global.clockGate = 0;
        global.clockGateDestination = 1;
        _pre = 0;
        
    }
    else if (argument[0] == "display" || argument[0] == "time") //Returns clock time as 12:30 / HH:MM
    {
        return NumberFormat(global.clockHours) + ":" + NumberFormat(global.clockMinutes);
    }
    else if (argument[0] == "step")
    {
        ///Get clock speed
        //gateDiff = floor(global.clockGateDestination) - floor(global.clockGate); //original
        gateDiff = global.clockGateDestination + max(0, floor(global.clockGateDestination - global.clockGate) - 1);
        gateDiff *= global.clockSpeed;
        if (keyboard_check(vk_control)) gateDiff *= 100; //DEBUG
        //gateDiff += 1;
        if (gateDiff == 0) spdMax = 0;
        else spdMax = dt() / (10 / gateDiff); //determines max seconds based on gates
        //Get percentage of gate to gate dest
        _pre = abs(((((global.clockTime / 60) / 60))) - 24);
        pct = abs(1 - (_pre / global.clockGateDestination));
        global.clockFrequency = spdMax * pct; //2 a second
        
        global.clockTime -= global.clockFrequency;
        ClockTime("update"); //Call every time after clock time is changed
    }
    else if (argument[0] == "update") //Call every time after clock time is changed
    {  
        global.clockSeconds = floor(global.clockTime mod 60);
        global.clockMinutes = global.clockTime div 60;
        global.clockHours = global.clockMinutes div 60;
        global.clockMinutes = global.clockMinutes mod 60;
        global.clockGate = abs(ceil(global.clockHours + 1) - 24); //
        
        //Update experience
        _dif = global.experienceTime - (global.clockTime div 60);
        _rev = abs(global.experienceTime - (60 * 24)) + 1;
        for (_p = 0; _p < _dif; _p += 1)
        {
            _expPct = (_rev / (global.clockMax div 60));
            _exp = global.experienceMin + ((global.experienceMax - global.experienceMin) * _expPct);
            global.hoopzExperience += _exp;
            _rev += 1;
        }
        global.experienceTime = global.clockTime div 60;
    }
    else if (argument[0] == "draw")
    {
        ///draw
        dx = view_xview[0] + 5; 
        dy = view_yview[0] + 5;
        draw_set_font(CourierNew24);
        draw_set_color(c_white);
        draw_text(dx, dy, NumberFormat(global.clockHours) + "h " + NumberFormat(global.clockMinutes) + "m " + NumberFormat(global.clockSeconds) + "s");
        dy += 24 + 4;
        //
        draw_set_font(CourierNew12b);
        draw_text(dx, dy, "Current clock speed (seconds): " + string(global.clockFrequency * 60));
        dy += 16;
        draw_text(dx, dy, "Current clock gate: " + string(global.clockGate) + " (" + string(_pre) + ")");
        dy += 16;
        draw_text(dx, dy, "Current clock gate destination: " + string(global.clockGateDestination));
        dy += 16;
        draw_text(dx, dy, "Clock gate percent: " + string(pct));
        dy += 16;
        dy += 16;
        draw_text(dx, dy, "Hoopz EXP: " + string(global.hoopzExperience));
        dy += 16;
        draw_text(dx, dy, "Last EXP boost: " + string(_exp));
        dy += 16;
        draw_text(dx, dy, "_dif: " + string(_dif));
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
