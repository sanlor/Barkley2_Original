/// scr_stats_alignment_setGlobalModifiers(CombatActor a, CombatActor b)
// Sets the global boss alignment modifier values on the beginning of a boss encounter
var actor_a, actor_b;

actor_a = argument0;
actor_b = argument1;

if( !global.battleMode )
{
    // these should always be 1 except during boss fights
    global.alignmentDamageDealt = 1;
    global.alignmentDamageTaken = 1;
}
else if 
    ( is_undefined(actor_a.alignment_ethical) ||
    is_undefined(actor_b.alignment_ethical) ||
    is_undefined(actor_a.alignment_moral) ||
    is_undefined(actor_b.alignment_moral) )
{
    // if any alignment value is undefined, throw a warning
    show_debug_message("Warning in scr_stats_alignment_setGlobalModifiers: " +
        "one or more alignment values undefined!");
    global.alignmentDamageDealt = 1;
    global.alignmentDamageTaken = 1;
} 
else
{
    // negative absolute value of ( player value - boss value )
    var moral_modifier = -abs ( actor_a.alignment_moral - actor_b.alignment_moral );
    var ethical_modifier = -abs ( actor_a.alignment_ethical - actor_b.alignment_ethical );
    
    // if either modifier is >= zero, add 1, not to exceed 1 (this is the buff)
    moral_modifier += min(sign(moral_modifier)+1,1);
    ethical_modifier += min(sign(ethical_modifier)+1,1);
    
    // invert the ethical modifier (if you increase damage taken, that's the same as decreasing
    // resistance to enemy damage given)
    ethical_modifier *= -1;

    // make the actual modification
    global.alignmentDamageDealt = 1 + (moral_modifier * global.alignmentModifier);
    global.alignmentDamageTaken = 1 + (ethical_modifier * global.alignmentModifier);
    
    show_debug_message("scr_stats_alignment_setGlobalModifiers: damage to boss modifier is " +
        string(global.alignmentDamageDealt));
    show_debug_message("scr_stats_alignment_setGlobalModifiers: damage to player modifier is " +
        string(global.alignmentDamageTaken));
}
