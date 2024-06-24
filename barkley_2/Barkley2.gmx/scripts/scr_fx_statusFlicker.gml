/// scr_fx_statusFlicker(conf, imagemin loop, animation speed)
// Visual //
var conf = argument0;
if conf[? "effectImage"] < conf[? "effectImageMax"] conf[? "effectImage"] += argument2 * dt();
else 
    {
    conf[? "effectImageMin"] = argument1;
    conf[? "effectImage"] = conf[? "effectImageMin"];
    }        

// Rise slowly //
conf[? "effectY"] = conf[? "effectY"] - 0.1;
    
// Flicker //
if conf[? "effectFlickerTimer"] > 0 conf[? "effectFlickerTimer"] -= dt() 
else {
    
    // Toggle between fully visible and half visible //
    if conf[? "effectFlickerToggle"] = 1 {
        
        if conf[? "timer"] > conf[? "timerTotal"] * 0.3 and conf[? "timer"] <= conf[? "timerTotal"] * 0.5 {
            
            conf[? "effectFlickerToggle"] = 0.4;
            conf[? "effectFlickerTimerReset"] = 3; 
            }
        else if conf[? "timer"] > conf[? "timerTotal"] * 0.15 and conf[? "timer"] <= conf[? "timerTotal"] * 0.3 {
            
            conf[? "effectFlickerToggle"] = 0.3;
            conf[? "effectFlickerTimerReset"] = 2; 
            }
        else if conf[? "timer"] > conf[? "timerTotal"] * 0 and conf[? "timer"] <= conf[? "timerTotal"] * 0.15 {
            
            conf[? "effectFlickerToggle"] = 0.2;
            conf[? "effectFlickerTimerReset"] = 1; 
            }
            
        conf[? "effectFlickerTimer"] = conf[? "effectFlickerTimerReset"];
        }
    else {
    
        conf[? "effectFlickerToggle"] = 1;
        conf[? "effectFlickerTimer"] = conf[? "effectFlickerTimerReset"]; 
        }
    }
