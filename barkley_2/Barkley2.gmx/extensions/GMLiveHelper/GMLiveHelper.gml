#define live_restart_if_necessary
/// (): 
if (live_enabled) {
	if (os_type != os_windows) return false;
	var l_path = parameter_string(0);
	var l_args = "";
	var l_argc = parameter_count();
	for (var l_argi = 1; l_argi < l_argc; l_argi++) {
		var l_argv = parameter_string(l_argi);
		if (l_argv == "--live") break;
		if (l_argi > 1) l_args += " ";
		if (string_pos(" ", l_argv)) {
			l_args += '"' + l_argv + '"';
		} else l_args += l_argv;
	}
	if (l_argi < l_argc) return false;
	l_args += " --live";
	if (!execute_program_windows(l_path, l_args, false)) return false;
	game_end();
	return true;
} else return false;
