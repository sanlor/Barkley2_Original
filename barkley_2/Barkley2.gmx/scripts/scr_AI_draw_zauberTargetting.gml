/// scr_AI_draw_zauberTargetting()
// If top stance is a zaubercast stance, draws zaubertargetting banonzas

if (AI_stateTopScript == scr_AI_action_zauber) {

    scr_zauberGroup_drawTargettingInfo(AI_stateTop[? "zauberGroup"],
                                       I_atk_zauber_charge,
                                       id,
                                       I_atk_zauber_targetlist,
                                       x + I_atk_zauber_targetX,
                                       y + I_atk_zauber_targetY);
}
