/// scr_combat_weapons_fusion_delimit(text,delmiting_char)
/// Common delimiting characters are | , ;
_how = argument0;
_del = argument1;
_c = 0;
while (string_pos(_del, _how) != 0) 
{
    art[_c] = string_copy(_how, 1, string_pos(_del, _how) - 1);
    _how = string_delete(_how, 1, string_pos(_del, _how) + (string_length(_del) - 1));
    _c += 1;
    if (_c > 999) break;
}
art[_c] = _how;
art[_c + 1] = "-999"; 
art[_c + 2] = "-999";
art[_c + 3] = "-999";
art[_c + 4] = "-999";
art[_c + 5] = "-999";
art[_c + 6] = "-999";
art[_c + 7] = "-999";
art[_c + 8] = "-999";
art[_c + 9] = "-999";
