/// scr_statusEffect_clearStatusEffects(actor)

var actor = argument0;

var i;
for (i=0; i<ds_list_size(actor.list_status_effect); i+=1) {    
    ds_map_destroy( ds_list_find_value(actor.list_status_effect, i)); 
}
ds_list_clear(actor.list_status_effect) 
