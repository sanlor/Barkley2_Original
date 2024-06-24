//This sets hoopz experience for now, can be shifted to a more suitable script later
//ClockTime() - Returns clock gate (0 - 24 integer)
//ClockTime("get") - Returns clock time (0.0 - 24.0 real)
//ClockTime("init") - Call this every time you start a new game
//ClockTime("display" / "time") - Returns string value of time in HH:MM
//ClockTime("step") - Needs to be called once per game step
//ClockTime("update") - INTERNAL function that updates key clock values
//ClockTime("draw") - Draws debug clock info

// Constants
var EXPERIENCE_MIN = 0.5;
var EXPERIENCE_MAX = 1.5;
var CLOCK_MAX = 60 * 60 * 24;
var CLOCK_SPEED = 4; //EDITABLE: If you are 1 gate away, it will start at 4 seconds and taper down

if (argument_count == 0) //Returns clock gate (integer)
{
    return scr_savedata_get("clock.gate");
}
else
{
    //-------------------
    // "init"
    //-------------------
    if (argument[0] == "init") //Call this every time you start a new game
    {
        //Clock
        scr_savedata_put("clock.time", CLOCK_MAX);
        scr_savedata_put("clock.gate", 0);
        //scr_savedata_put("clock.dest", 1);
        
        scr_savedata_put_list("clock.event.timer", ds_list_create());
        scr_savedata_put_list("clock.event.quest", ds_list_create());
        scr_savedata_put_list("clock.event.value", ds_list_create());
        
        // Debug shite 
        _exp = 0;
        _pre = 0;
        _freq = 0;
        
        ClockTime("update");
    }
    //-------------------
    // "get"
    //-------------------
    else if (argument[0] == "get")
    {
        return (24 - (scr_savedata_get("clock.time") / 3600)); // 60 * 60
    }
    //-------------------
    // "display" or "time"
    //-------------------
    else if (argument[0] == "display" || argument[0] == "time") //Returns clock time as 12:30 / HH:MM
    {
        //Added because load wouldn't run update first
        var clockTime = scr_savedata_get("clock.time");
        if (argument_count > 1) clockTime = argument[1];
        global.clockSeconds = floor(clockTime mod 60);
        global.clockMinutes = clockTime div 60;
        global.clockHours = global.clockMinutes div 60;
        global.clockMinutes = global.clockMinutes mod 60;
        return NumberFormat(global.clockHours) + ":" + NumberFormat(global.clockMinutes);
    }
    //-------------------
    // "step"
    //-------------------
    else if (argument[0] == "step")
    {
        
        if (paused()) exit;
        if (ClockTime("get") >= scr_time_get()) // Safe guard
        {
            show_debug_message("ClockTime(): ClockTime over quest time, increasing quest time.");
            scr_time_set(min(floor(ClockTime("get")) + 1, 24));
        }
        // Death Clock updates along with Clocktime //
        global.deathClock += dt_sec();
        
        if (ClockTime("get") >= 3 and ClockTime("get") < 4 and Quest("curfewAnnouncement") == 0) exit;
        if (ClockTime("get") >= 4 and ClockTime("get") < 5 and Quest("curfewAnnouncement") == 1) exit;
        if (Quest("gutterEscape") == 1) exit;
        
        ///Get clock speed
        var clockDest = scr_savedata_get("quest.time"); //scr_savedata_get("clock.dest");
        if (clockDest == 0) exit; //Safeguard
        var clockGate = scr_savedata_get("clock.gate");
        gateDiff = clockDest + max(0, floor(clockDest - clockGate) - 1);
        gateDiff *= CLOCK_SPEED;
        if (gateDiff == 0) spdMax = 0;
        else spdMax = dt() / (10 / gateDiff); //determines max seconds based on gates
        //Get percentage of gate to gate dest
        var clockTime = scr_savedata_get("clock.time");
        _pre = abs(((((clockTime / 60) / 60))) - 24);
        pct = abs(1 - (_pre / clockDest));
        _freq = spdMax * pct; //2 a second
        ClockTime("process", _freq);
        
        
    }
    //-------------------
    // "process"
    //-------------------
    else if (argument[0] == "process")
    {
        var clockTime = scr_savedata_get("clock.time");
        _freq = real(argument[1]);
        clockTime -= _freq;
        scr_savedata_put("clock.time", clockTime);
        
        // Go through quest timers
        for (var i = 0; i < ds_list_size(scr_savedata_get("clock.event.timer")); i += 1)
        {
            var tim = ds_list_find_value(scr_savedata_get("clock.event.timer"), i);
            ds_list_replace(scr_savedata_get("clock.event.timer"), i, tim - _freq);
            if (tim - _freq <= 0)
            {
                //Do the will of the event
                var qst = ds_list_find_value(scr_savedata_get("clock.event.quest"), i);
                var stt = ds_list_find_value(scr_savedata_get("clock.event.value"), i);
                Quest(qst, stt);
                
                //Erase the event
                ds_list_delete(scr_savedata_get("clock.event.timer"), i);
                ds_list_delete(scr_savedata_get("clock.event.quest"), i);
                ds_list_delete(scr_savedata_get("clock.event.value"), i);
                
                //So that the for loop works
                i -= 1; 
            }
        }
        
        ClockTime("update"); //Call every time after clock time is changed
    }
    //-------------------
    // "update"
    //-------------------
    else if (argument[0] == "update") //Call every time after clock time is changed
    {  
        var clockTime = scr_savedata_get("clock.time");
        global.clockSeconds = floor(clockTime mod 60);
        global.clockMinutes = clockTime div 60;
        global.clockHours = global.clockMinutes div 60;
        global.clockMinutes = global.clockMinutes mod 60;
        var clockGate = abs(ceil(global.clockHours + 1) - 24);
        scr_savedata_put("clock.gate", clockGate)
    }
    //-------------------
    // "event"
    //-------------------
    else if (argument[0] == "event")
    {
        if (argument_count == 1) //No additional arguments returns number of events
        {
            return ds_list_size(scr_savedata_get("clock.event.timer"));
        }
        else if (argument_count == 2) //Arg1 = Integer, returns three vars
        {
            clockQuest = ds_list_find_value(scr_savedata_get("clock.event.quest"), argument[1]);
            clockTimer = ds_list_find_value(scr_savedata_get("clock.event.timer"), argument[1]);
            clockValue = ds_list_find_value(scr_savedata_get("clock.event.value"), argument[1]);
        }
        else //Arg1 = Quest, Arg2 = Value, Arg3 = Timer (seconds)
        {
            ds_list_add(scr_savedata_get("clock.event.quest"), argument[1]);
            ds_list_add(scr_savedata_get("clock.event.value"), argument[2]);
            ds_list_add(scr_savedata_get("clock.event.timer"), argument[3] * 60); //we multiply by 60 to get minutes!
            var clkStr = "NOTE: ClockTime queue set for " + argument[1] + " to change to state " + string(argument[2]) + " in " + string(round(argument[3])) + " minutes, NULL";
            show_debug_message(clkStr);
            QuestTracker("note", "NOTE: ClockTime queue set for " + argument[1] + " to change to state " + string(argument[2]) + " in " + string(round(argument[3])) + " minutes, NULL");
        }
    }
    //-------------------
    // "draw"
    //-------------------
    else if (argument[0] == "draw")
    {
        ///draw
        if (argument_count > 1) dx = argument[1]; else dx = view_xview[0] + 5;
        if (argument_count > 2) dy = argument[2]; else dy = view_yview[0] + 5;
        draw_set_font(CourierNew24);
        draw_set_color(c_white);
        draw_text(dx, dy, NumberFormat(global.clockHours) + "h " + NumberFormat(global.clockMinutes) + "m " + NumberFormat(global.clockSeconds) + "s");
        dy += 24 + 4;
        
        //
        var clockDest = scr_savedata_get("quest.time"); //scr_savedata_get("clock.dest");
        var clockGate = scr_savedata_get("clock.gate");
        var clockTime = scr_savedata_get("clock.time");
        _freq = clockTime;
        _pre = abs(((((clockTime / 60) / 60))) - 24);
        pct = abs(1 - (_pre / clockDest));
        
        //
        draw_set_font(CourierNew12b);
        draw_text(dx, dy, "Speed (seconds): " + string(_freq * 60));
        dy += 16;
        draw_text(dx, dy, "Clock gate: " + string(scr_savedata_get("clock.time")) + " (" + string(_pre) + ")");
        dy += 16;
        draw_text(dx, dy, "Clock gate dest: " + string(scr_savedata_get("quest.time"))); //string(scr_savedata_get("clock.dest")));
        dy += 16;
        draw_text(dx, dy, "Clock gate %: " + string(pct));
        dy += 16;
        dy += 16;
        draw_text(dx, dy, "ClockTime() = " + string(ClockTime()));
        dy += 16;
        draw_text(dx, dy, "ClockTime('get') = " + string(ClockTime("get")));
        dy += 16;
        draw_text(dx, dy, "quest.time = " + string(scr_savedata_get("quest.time")));
        dy += 16;
        draw_text(dx, dy, "clock.gate = " + string(scr_savedata_get("clock.gate")));
        dy += 16;
        draw_set_color(c_red);
        draw_text(dx, dy, "NOTE: On times 3 through 5 the time stops#unless certain variables exists, this#is because of the curfew announcement.");
        dy += 16;
        //draw_text(dx, dy, "_dif: " + string(_dif));
        dy += 16;
        dy += 16;
        //draw_text(dx, dy, "SPACE adds one to clock gate.");
        dy += 16;
        //draw_text(dx, dy, "CONTROL speeds up (for testing times).");
        dy += 16;
        //draw_text(dx, dy, "SHIFT restarts.");
        dy += 16;
    }
}
