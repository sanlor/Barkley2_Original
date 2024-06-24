var rom = argument[0];
if(!is_string(rom)) rom = room_get_name(argument[0]);
whitelist1[0] = "test";

//Check full map name whitelist
for (var i = 0, iLen = array_length_1d(whitelist1); i < iLen; i++) {
   if (whitelist1[i] == rom) return true;
}

whitelist2[0] = "tnn";
whitelist2[1] = "pri";
whitelist2[2] = "sw1";
whitelist2[3] = "sw2";
whitelist2[4] = "fct";

//Check snippet whitelist
for (var i = 0, iLen = array_length_1d(whitelist2); i < iLen; i++) {
   if (string_pos(whitelist2[i], rom) != 0) return true;
}

return false;
