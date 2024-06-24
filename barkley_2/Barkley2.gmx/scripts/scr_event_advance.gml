/// scr_event_advance(event)
/// Runs the next action of the specified event.
if (argument0._type == EVENT_BACKGROUND) exit; // Fade background fix
if (global.cinObj != -999) //== id) 
{
    global.cinObj = -999;
    with (oCinema) 
    {
        if (global.cinCho != -1)
        {
            chx = global.cinCho;
            global.cinCho = -1;
            global.chtRep = 0;
            Cinema("goto", global.dslCinRepGot[| chx]);
        }
        else if (global.cinAct)
        {
            Cinema("next");
            Cinema("process");
        }
    }
}
