///scr_entity_set_look_walk_mirror(standing_sprite, northeast_sprite, southeast_sprite);

scr_entity_set_look_mirror(argument[0], 1, 1, 0, 0, 0, 0, 0, 1);
scr_entity_set_walk_mirror(argument[1], argument[1],
                            argument[2], argument[2],
                            argument[2], argument[2],
                            argument[2], argument[1]);
