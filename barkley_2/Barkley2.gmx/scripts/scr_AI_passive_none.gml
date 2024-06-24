////no passive AI: always active
var action, conf;
action = argument0;

if (action = "config") {
    return ds_map_create();
}

if (action = "reset") {}

if (action = "execute") {
    return AI_STATERESULT_CONTINUE;
}
