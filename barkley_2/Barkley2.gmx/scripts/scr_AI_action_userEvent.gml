////action tied to a user event of the object. Use this to plug actions into an AI Switch logic despite being unique to the enemy.
////Actions that could be used by other enemies should definitely be made into their own scripts howevever, so think twice about using this.

var _action = argument0;
var _retvar = false;

if(_action=="config")
{
    var conf = ds_map_create();
    conf[? "attackName"] = "debug";
    conf[? "userEvent"] = 0;
    return conf;
}

if(_action=="reset")
{
    var conf = argument1;
    a_UserEvent = conf[? "userEvent"];
    a_attackState = "reset";
    a_attackAnim = 0;
    return 0;
}

if(_action = "execute")
{
    var conf = argument1;
    a_attackName = conf[? "attackName"];
    
    // Call user event
    event_user(a_UserEvent);
    
    return AI_STATERESULT_CONTINUE;
}
