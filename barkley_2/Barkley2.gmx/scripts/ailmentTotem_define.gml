/// ailmentTotem_define(actor, foot, core_y, core_x, head)
var actor = argument0;
if (instance_exists(actor) and isCombatActor(actor)) then
    {  
    actor.ailmentTotem_foot = argument1;   
    actor.ailmentTotem_core_y = argument2;
    actor.ailmentTotem_core_x = argument3;
    actor.ailmentTotem_head = argument4;
    actor.ailmentTotem_head_queue = 0;
    }
