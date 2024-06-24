/// scr_time_change(time_increase)
/// Change Time

var time = scr_savedata_get("quest.timeDestination"); //scr_time_get();
scr_time_set(time + real(argument0));
