///scr_entity_set_pedestrian(sprite sheet, sprite set)
var sprite_sheet = argument[0];
var sprite_set = argument[1];
scr_entity_animation_define(ANIMATION_NORTH,     sprite_sheet, 4 + sprite_set * 12, 4, ANIMATION_DEFAULT_SPEED);
scr_entity_animation_define(ANIMATION_NORTHEAST, sprite_sheet, 4 + sprite_set * 12, 4, ANIMATION_DEFAULT_SPEED);
scr_entity_animation_define(ANIMATION_EAST,      sprite_sheet, 8 + sprite_set * 12, 4, ANIMATION_DEFAULT_SPEED);
scr_entity_animation_define(ANIMATION_SOUTHEAST, sprite_sheet, 8 + sprite_set * 12, 4, ANIMATION_DEFAULT_SPEED);
scr_entity_animation_define(ANIMATION_SOUTH,     sprite_sheet, 0 + sprite_set * 12, 4, ANIMATION_DEFAULT_SPEED);
scr_entity_animation_define(ANIMATION_SOUTHWEST, sprite_sheet, 0 + sprite_set * 12, 4, ANIMATION_DEFAULT_SPEED);
scr_entity_animation_define(ANIMATION_WEST,      sprite_sheet, 8 + sprite_set * 12, 4, ANIMATION_DEFAULT_SPEED);
scr_entity_animation_define(ANIMATION_NORTHWEST, sprite_sheet, 8 + sprite_set * 12, 4, ANIMATION_DEFAULT_SPEED);

///This sets the facing direction for the Pedestrian while idling
//scr_entity_animation_setRange("default", 0, 1);
scr_entity_animation_define("default", sprite_sheet, 0 + sprite_set * 12, 1, 0);

scr_entity_animation_define(ANIMATION_IDLE_NORTH,     sprite_sheet, 4 + sprite_set * 12, 1, ANIMATION_DEFAULT_SPEED);
scr_entity_animation_define(ANIMATION_IDLE_NORTHEAST, sprite_sheet, 4 + sprite_set * 12, 1, ANIMATION_DEFAULT_SPEED);
scr_entity_animation_define(ANIMATION_IDLE_EAST,      sprite_sheet, 8 + sprite_set * 12, 1, ANIMATION_DEFAULT_SPEED);
scr_entity_animation_define(ANIMATION_IDLE_SOUTHEAST, sprite_sheet, 8 + sprite_set * 12, 1, ANIMATION_DEFAULT_SPEED);
scr_entity_animation_define(ANIMATION_IDLE_SOUTH,     sprite_sheet, 0 + sprite_set * 12, 1, ANIMATION_DEFAULT_SPEED);
scr_entity_animation_define(ANIMATION_IDLE_SOUTHWEST, sprite_sheet, 0 + sprite_set * 12, 1, ANIMATION_DEFAULT_SPEED);

scr_entity_animation_define(ANIMATION_IDLE_UP,        sprite_sheet, 4 + sprite_set * 12, 1, ANIMATION_DEFAULT_SPEED);
scr_entity_animation_define(ANIMATION_IDLE_RIGHT,     sprite_sheet, 8 + sprite_set * 12, 1, ANIMATION_DEFAULT_SPEED);
scr_entity_animation_define(ANIMATION_IDLE_DOWN,      sprite_sheet, 0 + sprite_set * 12, 1, ANIMATION_DEFAULT_SPEED);
scr_entity_animation_define(ANIMATION_IDLE_LEFT,      sprite_sheet, 0 + sprite_set * 12, 1, ANIMATION_DEFAULT_SPEED);
