/// scr_AI_hearing_makeSound(sourceActor, x, y, soundDist, aggro)

var source_actor = argument0
var soundx = argument1
var soundy = argument2
var sound_dist = argument3
var sound_aggro = argument4

with (EnemyCombatActor) {
    // Check distance
    var dist = point_distance(x, y, soundx, soundy)
    var modified_hearing = sound_dist * AI_hearing_distmod
    if (modified_hearing > 0 and dist <= modified_hearing) {
        // Check target_list for object
        if (scr_AI_targetList_hasTarget(source_actor)) {
            // Heard Actor!
            var hasAggro = scr_AI_aggro_hasAggroTowardsTarget(source_actor)
            
            // IF NEW: Aggro increased by full value
            if (not hasAggro) {
                scr_AI_aggro_addAggro(source_actor, sound_aggro)
            }
            
            // IF EXISTING: Does nothing
            
            // Trigger hooks
            if (AI_hearing_hook_script != NULL) {
                script_execute(AI_hearing_hook_script, source_actor);
            }
            if (AI_hearing_hook_event != NULL) {
                AI_hearing_source_actor = source_actor; // Exported for use in hook
                event_user(AI_hearing_hook_event);
            }
        }
    }
}
