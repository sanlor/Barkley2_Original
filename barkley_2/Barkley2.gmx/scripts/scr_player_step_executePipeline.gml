
/*
This script performs the STEP PIPELINE.

The steps in the Step Pipeline are (WIP):

2) Input
  - Parse player input if player has control of character.
  - Calculate look vector
4) Pre-processing
  - Weapon switching
  - ... TBD
5) Stance
  - Execute player stance
6) Step Post-processing
  - Perform animation of player sprite
  - Reduction of timers
  - Set render depth
  - ... TBD

After this, movement is performed by the Entity movement code.  
*/

// 2) Input
scr_player_step_processInput();

// 4) Pre-processing
scr_player_step_preProcessing();

if !paused() && !global.enemyPlacementMode {
    // 5) Stance
    /* The step script is REQUIRED to export the following variables:
    - (move_x, move_y)
    */
    script_execute(stance);
}
    
// 7) Step Post-processing
scr_player_step_postProcessing();
