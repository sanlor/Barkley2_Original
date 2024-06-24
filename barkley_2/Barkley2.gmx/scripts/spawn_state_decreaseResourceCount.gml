/// spawn_state_decreaseResourceCount(state)

var state = argument0;

state[? "resources"] = max(0, state[? "resources"] - 1);
