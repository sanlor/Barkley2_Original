// == Keyboard+Mouse standard mapping ==
// Movement, Selection
scr_input_keymap_bind(KEYID_UP,           KEYINPUT_KEYBOARD_MOUSE, ord('W'))
scr_input_keymap_bind(KEYID_DOWN,         KEYINPUT_KEYBOARD_MOUSE, ord('S'))
scr_input_keymap_bind(KEYID_LEFT,         KEYINPUT_KEYBOARD_MOUSE, ord('A'))
scr_input_keymap_bind(KEYID_RIGHT,        KEYINPUT_KEYBOARD_MOUSE, ord('D'))

// Targetting
// None (Mouse aim)

// Actions
scr_input_keymap_bind(KEYID_RUN,          KEYINPUT_KEYBOARD_MOUSE, vk_space)
scr_input_keymap_bind(KEYID_ACTION,       KEYINPUT_KEYBOARD_MOUSE, KEY_MOUSE_LEFT)
scr_input_keymap_bind(KEYID_HOLSTER,      KEYINPUT_KEYBOARD_MOUSE, KEY_MOUSE_RIGHT)
scr_input_keymap_bind(KEYID_WEAPON_NEXT,  KEYINPUT_KEYBOARD_MOUSE, KEY_MOUSE_WHEELUP)
scr_input_keymap_bind(KEYID_WEAPON_PREV,  KEYINPUT_KEYBOARD_MOUSE, KEY_MOUSE_WHEELDOWN)
scr_input_keymap_bind(KEYID_DIALOGUE,     KEYINPUT_KEYBOARD_MOUSE, vk_enter)
scr_input_keymap_bind(KEYID_GUNBAG,       KEYINPUT_KEYBOARD_MOUSE, vk_shift)

// Menus
scr_input_keymap_bind(KEYID_PAUSE,        KEYINPUT_KEYBOARD_MOUSE, vk_escape)
scr_input_keymap_bind(KEYID_CONFIRM,      KEYINPUT_KEYBOARD_MOUSE, vk_space)

scr_input_keymap_bind(KEYID_QUICKMENU,    KEYINPUT_KEYBOARD_MOUSE, ord('Q'));
scr_input_keymap_bind(KEYID_ITEM_NEXT,    KEYINPUT_KEYBOARD_MOUSE, ord('F'));
scr_input_keymap_bind(KEYID_ITEM_USE,     KEYINPUT_KEYBOARD_MOUSE, ord('E'));
scr_input_keymap_bind(KEYID_ABILITY_NEXT, KEYINPUT_KEYBOARD_MOUSE, ord('G'));
scr_input_keymap_bind(KEYID_ABILITY_USE,  KEYINPUT_KEYBOARD_MOUSE, ord('R'));

// == Keyboard standard mapping ==
// Movement, Selection
scr_input_keymap_bind(KEYID_UP,          KEYINPUT_KEYBOARD, vk_up)
scr_input_keymap_bind(KEYID_DOWN,        KEYINPUT_KEYBOARD, vk_down)
scr_input_keymap_bind(KEYID_LEFT,        KEYINPUT_KEYBOARD, vk_left)
scr_input_keymap_bind(KEYID_RIGHT,       KEYINPUT_KEYBOARD, vk_right)

// Targetting
scr_input_keymap_bind(KEYID_LOOK_UP,     KEYINPUT_KEYBOARD, ord('W'))
scr_input_keymap_bind(KEYID_LOOK_DOWN,   KEYINPUT_KEYBOARD, ord('S'))
scr_input_keymap_bind(KEYID_LOOK_LEFT,   KEYINPUT_KEYBOARD, ord('A'))
scr_input_keymap_bind(KEYID_LOOK_RIGHT,  KEYINPUT_KEYBOARD, ord('D'))

// Actions
scr_input_keymap_bind(KEYID_RUN,         KEYINPUT_KEYBOARD, ord('Q'))
scr_input_keymap_bind(KEYID_ACTION,      KEYINPUT_KEYBOARD, vk_space)
scr_input_keymap_bind(KEYID_DIALOGUE,    KEYINPUT_KEYBOARD, vk_enter)
scr_input_keymap_bind(KEYID_HOLSTER,     KEYINPUT_KEYBOARD, ord('E'))
scr_input_keymap_bind(KEYID_WEAPON_NEXT, KEYINPUT_KEYBOARD, ord('R'))
scr_input_keymap_bind(KEYID_WEAPON_PREV, KEYINPUT_KEYBOARD, ord('F'))
scr_input_keymap_bind(KEYID_GUNBAG,      KEYINPUT_KEYBOARD, vk_shift)

// Menus
scr_input_keymap_bind(KEYID_PAUSE,       KEYINPUT_KEYBOARD, vk_escape)
scr_input_keymap_bind(KEYID_CONFIRM,     KEYINPUT_KEYBOARD, vk_space)



// == Gamepad standard mapping ==
//face1 = a, face2 = b, face3 = x, face4 = y
// Movement, Selection
scr_input_keymap_bind(KEYID_UP,               KEYINPUT_GAMEPAD, KEY_GAMEPAD_AXISL_UP)
scr_input_keymap_bind(KEYID_DOWN,             KEYINPUT_GAMEPAD, KEY_GAMEPAD_AXISL_DOWN)
scr_input_keymap_bind(KEYID_LEFT,             KEYINPUT_GAMEPAD, KEY_GAMEPAD_AXISL_LEFT)
scr_input_keymap_bind(KEYID_RIGHT,            KEYINPUT_GAMEPAD, KEY_GAMEPAD_AXISL_RIGHT)

// Targetting
scr_input_keymap_bind(KEYID_LOOK_UP,          KEYINPUT_GAMEPAD, KEY_GAMEPAD_AXISR_UP)
scr_input_keymap_bind(KEYID_LOOK_DOWN,        KEYINPUT_GAMEPAD, KEY_GAMEPAD_AXISR_DOWN)
scr_input_keymap_bind(KEYID_LOOK_LEFT,        KEYINPUT_GAMEPAD, KEY_GAMEPAD_AXISR_LEFT)
scr_input_keymap_bind(KEYID_LOOK_RIGHT,       KEYINPUT_GAMEPAD, KEY_GAMEPAD_AXISR_RIGHT)

// Actions
scr_input_keymap_bind(KEYID_RUN,              KEYINPUT_GAMEPAD, gp_shoulderl)
scr_input_keymap_bind(KEYID_ACTION,           KEYINPUT_GAMEPAD, gp_shoulderr)
scr_input_keymap_bind(KEYID_DIALOGUE,         KEYINPUT_GAMEPAD, gp_face1)
scr_input_keymap_bind(KEYID_HOLSTER,          KEYINPUT_GAMEPAD, gp_face2)
scr_input_keymap_bind(KEYID_GUNBAG,           KEYINPUT_GAMEPAD, gp_padu);

// Menus
scr_input_keymap_bind(KEYID_PAUSE,            KEYINPUT_GAMEPAD, gp_start)
scr_input_keymap_bind(KEYID_CONFIRM,          KEYINPUT_GAMEPAD, gp_face1)
scr_input_keymap_bind(KEYID_ITEM_NEXT,        KEYINPUT_GAMEPAD, gp_padd);
scr_input_keymap_bind(KEYID_ITEM_USE,         KEYINPUT_GAMEPAD, gp_face3);
scr_input_keymap_bind(KEYID_ABILITY_NEXT,     KEYINPUT_GAMEPAD, gp_padr);
scr_input_keymap_bind(KEYID_ABILITY_USE,      KEYINPUT_GAMEPAD, gp_shoulderrb);
scr_input_keymap_bind(KEYID_WEAPON_NEXT,      KEYINPUT_GAMEPAD, gp_padl);
scr_input_keymap_bind(KEYID_QUICKMENU,        KEYINPUT_GAMEPAD, gp_face4);
scr_input_keymap_bind(KEYID_QUICKMENU_UP,     KEYINPUT_GAMEPAD, gp_padu);
scr_input_keymap_bind(KEYID_QUICKMENU_DOWN,   KEYINPUT_GAMEPAD, gp_padd);
scr_input_keymap_bind(KEYID_QUICKMENU_LEFT,   KEYINPUT_GAMEPAD, gp_padl);
scr_input_keymap_bind(KEYID_QUICKMENU_RIGHT,  KEYINPUT_GAMEPAD, gp_padr);
