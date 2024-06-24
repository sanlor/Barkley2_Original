#define scr_player_step_preProcessing
// Switch weapon
if (global.keyinput_type == KEYINPUT_GAMEPAD) //cuased error
{
    if scr_input_check_pressed(KEYID_GUNBAG, PLAYER1) {
        scr_player_equip("gunbag");
        global.gunsacrifice_affix = false;
    }
    if scr_input_check_pressed(KEYID_WEAPON_NEXT, PLAYER1) {
        scr_player_equip("prev");
        global.gunsacrifice_affix = false;
    }
}
else
{
    if (scr_input_check_pressed(KEYID_GUNBAG, PLAYER1)) scr_player_equip("gunbag");
    if (scr_input_check_pressed(KEYID_WEAPON_NEXT, PLAYER1)) scr_player_equip("next");
    if (scr_input_check_pressed(KEYID_WEAPON_PREV, PLAYER1)) scr_player_equip("prev");
    // Map
    var did = 1;
    if (global.event) did = 0;
    if (instance_exists(o_hoopz) == 0) did = 0;
    if (instance_exists(o_hud) == 0) did = 0;
    if (paused() && quickmenu2() == 0) did = 0;
    if (Quest("hudVisible") == 0) did = 0;
    if (instance_exists(oMap)) did = 0;
    if (keyboard_check_pressed(ord("M")) && did) Map("invoke");
    if (keyboard_check_pressed(ord("N")) && did) Note("viewer");
}

// Calculate base vulnerabilities from humanism
var humBio = scr_savedata_get("player.humanism.bio");
var humCyber = scr_savedata_get("player.humanism.cyber");
var humCosmic = scr_savedata_get("player.humanism.cosmic");
var humZauber = scr_savedata_get("player.humanism.zauber");

scr_stats_setBaseStat(self.id, STAT_BASE_VULN_BIO, humanismToVuln(humBio));
scr_stats_setBaseStat(self.id, STAT_BASE_VULN_CYBER, humanismToVuln(humCyber));
scr_stats_setBaseStat(self.id, STAT_BASE_VULN_COSMIC, humanismToVuln(humCosmic));
scr_stats_setBaseStat(self.id, STAT_BASE_VULN_ZAUBER, humanismToVuln(humZauber));

#define humanismToVuln

var hum = argument0;

if (hum >= 100) return 6;
if (hum >= 83) return 5;
if (hum >= 66) return 4;
if (hum >= 50) return 3;
if (hum >= 33) return 2;
if (hum >= 17) return 1;
return 0;