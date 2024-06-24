/*
Returns the state searched for on success, or NULL on fail.

arg0 - state script id
*/

var state, ret;
state = argument0;

ret = scr_AI_findAction(state);
if ret != NULL return ret;

ret = scr_AI_findActiveState(state);
if ret != NULL return ret;

ret = scr_AI_findPassiveState(state);
if ret != NULL return ret;

ret = scr_AI_findGlobalState(state);
if ret != NULL return ret;

return NULL;
