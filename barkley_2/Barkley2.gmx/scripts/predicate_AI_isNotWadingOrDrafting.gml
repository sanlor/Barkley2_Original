var actor = argument0;
var truth = true;
if (scr_actor_isWading(actor)) truth = false;
if (drafting) truth = false;
return truth;
