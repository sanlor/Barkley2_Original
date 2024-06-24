/* Updates the global delta time value (call once per step).
The delta time value counts in 1/10's of a second.
I.e. 10 dt = 1 second*/

var dtprev = global.__dt
global.__dt = get_timer()
var _dt = (global.__dt - dtprev) * 0.00001;

// Cap to Min value
_dt = min(_dt, 1);

global.DELTA_TIME = _dt;
