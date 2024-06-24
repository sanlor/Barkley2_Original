///global test vars

var fn_settings_ini;

fn_settings_ini = working_directory + "\settings.ini"
ini_open(fn_settings_ini);

ini_write_string('ADVANCED','scanlines',scr_string_bool(global.scanlines));
ini_write_string('DISPLAY','fullscreen',scr_string_bool(global.fullscreen));
ini_write_string('LANGUAGE','albhed',scr_string_bool(global.AlBhed));
ini_write_string('DISPLAY','window_border',scr_string_bool(global.border));
ini_write_real('DISPLAY','screen_scale',global.screen_scale);
ini_write_real('DISPLAY','fullscreen_scale',global.fullscreen_scale);
ini_write_string('DISPLAY','vsync',scr_string_bool(global.vsync));
ini_write_real('AUDIO','music',global.music);
ini_write_real('AUDIO','sounds',global.sounds);
    
ini_close();
