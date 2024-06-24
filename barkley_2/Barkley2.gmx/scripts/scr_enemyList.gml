#define scr_enemyList
global.eTypeList = ds_list_create();
global.eTypeName = ds_list_create();
global.eTypeIcon = ds_list_create();

global.enemyIndex = ds_map_create();

////////////DESTRUCTIBLES OBJECTS
ds_list_add(global.eTypeName,"Destructibles");
ds_list_add(global.eTypeIcon,s_oilDrum);
_lst = ds_list_create(); ds_list_add(global.eTypeList,_lst); 
scr_enemyList_add(o_oilDrum);
scr_enemyList_add(o_mtnpassJar);
scr_enemyList_add(o_bustaBulb);
scr_enemyList_add(o_woodBarrel);
scr_enemyList_add(o_woodBarrelStack);
scr_enemyList_add(o_destructible_wastelandMound);

////////////CYBERGREMLINS
ds_list_add(global.eTypeName,"CyberGremlins");
ds_list_add(global.eTypeIcon,sCybergremlinMap);
_lst = ds_list_create(); ds_list_add(global.eTypeList,_lst); 
scr_enemyList_add(o_enemy_cGremlin_small_deg);
scr_enemyList_add(o_enemy_cGremlin_small);
scr_enemyList_add(o_enemy_cGremlin_brawler);
scr_enemyList_add(o_enemy_cGremlin_gunner);
scr_enemyList_add(o_enemy_cGremlin_jetpack);

////////////DUERGARS
ds_list_add(global.eTypeName,"Duergars");
ds_list_add(global.eTypeIcon,s_duergar_head);
_lst = ds_list_create(); ds_list_add(global.eTypeList,_lst); 
scr_enemyList_add(o_enemy_duergar_gunner);
scr_enemyList_add(o_enemy_duergar_shield);
scr_enemyList_add(o_enemy_duergar_wizard);

////////////SEWER CREATURES
ds_list_add(global.eTypeName,"Sewer Creatures");
ds_list_add(global.eTypeIcon,s_sewerBeast_young);
_lst = ds_list_create(); ds_list_add(global.eTypeList,_lst); 
scr_enemyList_add(o_enemy_sewerBeast_young);
scr_enemyList_add(o_enemy_sewerBeast_large);
scr_enemyList_add(o_enemy_explosiveRat);
scr_enemyList_add(o_enemy_darkRat);
scr_enemyList_add(o_enemy_cyberRat);

////////////FISH MEN
ds_list_add(global.eTypeName,"Fish Men");
ds_list_add(global.eTypeIcon,s_catfish_head);
_lst = ds_list_create(); ds_list_add(global.eTypeList,_lst); 
scr_enemyList_add(o_enemy_catfish_small);
scr_enemyList_add(o_enemy_catfish_small_poison);
scr_enemyList_add(o_enemy_catfish_shield);
scr_enemyList_add(o_enemy_catfish_mounted);
scr_enemyList_add(o_enemy_catfish_shell);

////////////WASTELAND BOTS
ds_list_add(global.eTypeName,"Wasteland");
ds_list_add(global.eTypeIcon,s_junkworm_head);
_lst = ds_list_create(); ds_list_add(global.eTypeList,_lst); 
scr_enemyList_add(o_enemy_junkworm);
scr_enemyList_add(o_enemy_junkworm_appearPoint);
scr_enemyList_add(o_seagull);

////////////JUNKBOTS
ds_list_add(global.eTypeName,"Junkbots");
ds_list_add(global.eTypeIcon,s_junkbot_head_frankie);
_lst = ds_list_create(); ds_list_add(global.eTypeList,_lst); 
scr_enemyList_add(o_enemy_junkbot);
scr_enemyList_add(o_wasteland_junk_enemypart_legs);
scr_enemyList_add(o_wasteland_junk_enemypart_body);
scr_enemyList_add(o_wasteland_junk_enemypart_head);
scr_enemyList_add(o_wasteland_junk_enemypart_larm);
scr_enemyList_add(o_wasteland_junk_enemypart_rarm);
scr_enemyList_add(o_wasteland_junk_enemypart_leg_threads);
scr_enemyList_add(o_wasteland_junk_enemypart_leg_tires);
scr_enemyList_add(o_wasteland_junk_enemypart_leg_washingmachine);
scr_enemyList_add(o_wasteland_junk_enemypart_head_singleLazer);
scr_enemyList_add(o_wasteland_junk_enemypart_head_dualLazer);
scr_enemyList_add(o_wasteland_junk_enemypart_head_can);
scr_enemyList_add(o_wasteland_junk_enemypart_head_gasmask);
scr_enemyList_add(o_wasteland_junk_enemypart_head_frankie);
scr_enemyList_add(o_wasteland_junk_enemypart_head_propeller);
scr_enemyList_add(o_wasteland_junk_enemypart_head_scifi);
scr_enemyList_add(o_wasteland_junk_enemypart_head_walle);
scr_enemyList_add(o_wasteland_junk_enemypart_body_regular);
scr_enemyList_add(o_wasteland_junk_enemypart_body_thin);
scr_enemyList_add(o_wasteland_junk_enemypart_body_armoured);
scr_enemyList_add(o_wasteland_junk_enemypart_body_barrel);
scr_enemyList_add(o_wasteland_junk_enemypart_body_engine);
scr_enemyList_add(o_wasteland_junk_enemypart_body_pipe);
scr_enemyList_add(o_wasteland_junk_enemypart_body_tv);
scr_enemyList_add(o_wasteland_junk_enemypart_larm_flamethrower);
scr_enemyList_add(o_wasteland_junk_enemypart_larm_chainsaw);
scr_enemyList_add(o_wasteland_junk_enemypart_larm_missilepod);
scr_enemyList_add(o_wasteland_junk_enemypart_larm_polluter);
scr_enemyList_add(o_wasteland_junk_enemypart_larm_shield);
scr_enemyList_add(o_wasteland_junk_enemypart_rarm_flamethrower);
scr_enemyList_add(o_wasteland_junk_enemypart_rarm_chainsaw);
scr_enemyList_add(o_wasteland_junk_enemypart_rarm_missilepod);
scr_enemyList_add(o_wasteland_junk_enemypart_rarm_polluter);
scr_enemyList_add(o_wasteland_junk_enemypart_rarm_shield);

////////////SWAMP MONSTERS
ds_list_add(global.eTypeName,"Swamp Monsters");
ds_list_add(global.eTypeIcon,s_koboldMedium_head);
_lst = ds_list_create(); ds_list_add(global.eTypeList,_lst); 
scr_enemyList_add(o_enemy_kobold_small)
scr_enemyList_add(o_enemy_kobold_medium)
scr_enemyList_add(o_enemy_kobold_large)
scr_enemyList_add(o_enemy_kobold_philosopher)
scr_enemyList_add(o_enemy_crabbold)
scr_enemyList_add(o_enemy_oozeMan)
scr_enemyList_add(o_enemy_weresnail_gunner)
scr_enemyList_add(o_enemy_werecroc)
scr_enemyList_add(o_mosquito_control)
scr_enemyList_add(o_enemy_bugflower_plant);
scr_enemyList_add(o_enemy_bugflower_mimic);
scr_enemyList_add(o_enemy_bugflower_nomimic);
scr_enemyList_add(o_enemy_vineMonster)

////////////MOUNTAIN PASS
ds_list_add(global.eTypeName,"Mountain Pass");
ds_list_add(global.eTypeIcon,s_tengu_diver);
_lst = ds_list_create(); ds_list_add(global.eTypeList,_lst); 
scr_enemyList_add(o_enemy_tengu_normal)
scr_enemyList_add(o_enemy_tengu_crossbow)
scr_enemyList_add(o_enemy_spirit_samurai)
scr_enemyList_add(o_enemy_skullpep)

////////////AI RUINS
ds_list_add(global.eTypeName,"AI RUINS");
ds_list_add(global.eTypeIcon,s_enemy_smCrabotron_head);
_lst = ds_list_create(); ds_list_add(global.eTypeList,_lst); 
scr_enemyList_add(o_enemy_ruinedDrone)
scr_enemyList_add(o_enemy_crabotron)
scr_enemyList_add(o_enemy_smCrabotron)
scr_enemyList_add(o_enemy_drone_egg)

////////////MINES

////////////BRIDGE ALIENS
ds_list_add(global.eTypeName,"The Power Plant");
ds_list_add(global.eTypeIcon,s_alienMenace_egg);
_lst = ds_list_create(); ds_list_add(global.eTypeList,_lst); 
scr_enemyList_add(o_enemy_alienMenace_medium);
scr_enemyList_add(o_enemy_braintree);
scr_enemyList_add(o_enemy_alienMenace_egg);
scr_enemyList_add(o_enemy_alienMenace_baby);

////////////BRAIN CITY

////////////CUCHU'S LAIR

////////////MISC OBJECTS
ds_list_add(global.eTypeName,"The Ice Fields");
ds_list_add(global.eTypeIcon,s_jalapenoStag_icon);
_lst = ds_list_create(); ds_list_add(global.eTypeList,_lst); 
scr_enemyList_add(o_enemy_jalapeno_stag)

////////////DISTRIBUTORS
ds_list_add(global.eTypeName,"Distributors");
ds_list_add(global.eTypeIcon,s_distributor);
_lst = ds_list_create(); ds_list_add(global.eTypeList,_lst); 
scr_enemyList_add(distributor_junkParts)
scr_enemyList_add(distributor_seagull)

////////////MISC OBJECTS
ds_list_add(global.eTypeName,"MISC");
ds_list_add(global.eTypeIcon,s_placeholder);
_lst = ds_list_create(); ds_list_add(global.eTypeList,_lst); 
//scr_enemyList_add(o_enemy_bossTest)
scr_enemyList_add(o_enemy_jalapeno_stag);
scr_enemyList_add(o_enemy_beetleborg);
scr_enemyList_add(o_enemy_virtual);

#define scr_enemyList_add
ds_list_add(_lst,argument0); ds_map_add(global.enemyIndex,object_get_name(argument0),argument0);