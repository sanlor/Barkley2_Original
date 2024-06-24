ds_list_clear(AI_statestack);

// Clear paths
scr_path_delete();

// Save to variables (for performance reasons)
AI_stateTop = NULL;
AI_stateTopScript = NULL;
AI_stateTopType = 0;
AI_stateCount = 0;
