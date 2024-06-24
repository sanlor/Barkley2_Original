show_debug_message("AssertEqual: " + 
    string(argument0) + " == " + string(argument1) + " ?")
    
if(argument0 == argument1)  show_debug_message("PASSED");
else                        show_debug_message("FAILED");
