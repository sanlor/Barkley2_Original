/// scr_statusEffect_applyFromScriptToCombatActor(script, actor)

var statusEffectScript = argument0;
var actor = argument1;

if (!statusEffect_immunity_isImmune(actor, statusEffectScript)) {
    var conf = ds_map_create();
    script_execute(statusEffectScript, conf, NULL, "generate", NULL);
    script_execute(statusEffectScript, conf, actor, "apply");
    ds_map_destroy(conf);
} else {
    return NULL;
}
