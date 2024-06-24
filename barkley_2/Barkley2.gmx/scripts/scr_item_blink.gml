/// scr_item_blink(item_disappearing_timer,flash)
/// code for items blinking out. return true if item is to be displayed, false if not.

var _timer = argument0;
var _flash = argument1;
var _vis;

//show_debug_message(string(_timer));
if(_timer>15){_vis = true;}
else if(_timer>12){if(_flash mod 6==0){_vis = false;}else{_vis = true;}}
else if(_timer>9){if(_flash mod 6<=1){_vis = false;}else{_vis = true;}}
else if(_timer>6){if(_flash mod 6<=2){_vis = false;}else{_vis = true;}}
else if(_timer>3){if(_flash mod 6<=3){_vis = false;}else{_vis = true;}}
else{if(round(_timer) mod 6<=4){_vis = false;}else{_vis = true;}}

return _vis;
