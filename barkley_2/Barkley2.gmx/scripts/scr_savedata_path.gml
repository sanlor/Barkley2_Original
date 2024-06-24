var path;
if(global.currentSaveSlot == -1){
	if (file_exists(working_directory + "\save.override.b2")) path = working_directory + "\save.override.b2";
	else path = working_directory + "\save.b2";
} else {
	path = working_directory + "\save" + string(global.currentSaveSlot) + ".b2";
}
return path;
