/*
Returns the state searched for on success, or -1 on fail.

arg0 - state script id
*/

var state, i, node;
state = argument0;

for (i = 0; i < ds_list_size(AI_states_global); i += 1)
{
    node = ds_list_find_value(AI_states_global, i)
    if (ds_map_find_value(node, "script") == state)
    {
        return node;
    }
}

return NULL;
