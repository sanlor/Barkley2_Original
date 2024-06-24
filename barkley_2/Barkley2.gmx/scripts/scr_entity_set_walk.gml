///scr_entity_set_walk(N, NE, E, SE, S, SW, W, NW)
scr_entity_animation_define(ANIMATION_NORTH,     argument[0], 0, sprite_get_number(argument[0]), ANIMATION_DEFAULT_SPEED);
scr_entity_animation_define(ANIMATION_NORTHEAST, argument[1], 0, sprite_get_number(argument[1]), ANIMATION_DEFAULT_SPEED);
scr_entity_animation_define(ANIMATION_EAST,      argument[2], 0, sprite_get_number(argument[2]), ANIMATION_DEFAULT_SPEED);
scr_entity_animation_define(ANIMATION_SOUTHEAST, argument[3], 0, sprite_get_number(argument[3]), ANIMATION_DEFAULT_SPEED);
scr_entity_animation_define(ANIMATION_SOUTH,     argument[4], 0, sprite_get_number(argument[4]), ANIMATION_DEFAULT_SPEED);
scr_entity_animation_define(ANIMATION_SOUTHWEST, argument[5], 0, sprite_get_number(argument[5]), ANIMATION_DEFAULT_SPEED);
scr_entity_animation_define(ANIMATION_WEST,      argument[6], 0, sprite_get_number(argument[6]), ANIMATION_DEFAULT_SPEED);
scr_entity_animation_define(ANIMATION_NORTHWEST, argument[7], 0, sprite_get_number(argument[7]), ANIMATION_DEFAULT_SPEED);
