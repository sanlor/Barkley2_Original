/// scr_entity_animation_new(name)

var name = argument0;

var anim = 0;
anim[ENTITY_ANIMATION_NAME] = name;
anim[ENTITY_ANIMATION_SPEED] = 0;
anim[ENTITY_ANIMATION_SPEEDPERPIXEL] = 0;
anim[ENTITY_ANIMATION_FRAME] = 0;
anim[ENTITY_ANIMATION_FRAMEPREVIOUS] = 0;
anim[ENTITY_ANIMATION_IMAGEFIRST] = 0;
anim[ENTITY_ANIMATION_IMAGEOFFSET] = 1;
anim[ENTITY_ANIMATION_IMAGESHIFT] = 0;
anim[ENTITY_ANIMATION_RANGE] = NULL;
anim[ENTITY_ANIMATION_SPRITE_INDEX] = NULL;

__anims[? name] = anim;
if (ds_list_find_index(__anims_names, name) == -1) {
    ds_list_add(__anims_names, name);
}
