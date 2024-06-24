/// scr_AI_statePop(depth)

var depth_ = argument0;

if (AI_stateCount > depth_)
{
    // Remove top state
    ds_list_delete(AI_statestack, AI_stateCount - 1 - depth_);
    
    // Clear paths
    scr_path_delete();
    
    // Prepare the underlying state for execution
    AI_stateCount = ds_list_size(AI_statestack);
    if (AI_stateCount > 0)
    {
        AI_stateTop = ds_list_find_value(AI_statestack, AI_stateCount-1);
        AI_stateTopScript = ds_map_find_value(AI_stateTop, "script");
        AI_stateTopType = scr_AI_checkStateType(AI_stateTop);
    }
    else
    {
        AI_stateTop = NULL;
        AI_stateTopScript = NULL;
        AI_stateTopType = 0;
    }
}
