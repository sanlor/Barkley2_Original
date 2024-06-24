/// scr_combat_weapons_applyMaterial(gun, material)

var gun = argument0;
var material = argument1;

var _pow,_pmx,_spd,_acc,_rng,_amm,_wgt,_afx,_kbc,_stn,_pattern,_col;

_pow = 1; // Power Modifier
_pmx = 1; // Power Max Modifier
_spd = 1; // Speed Modifier
_acc = 1; // Accuracy Modifier
_rng = 1; // Range Modifier
_amm = 1; // Ammo Modifier
_afx = 1; // Affix Modifier

_wgt = 1; // Weight Modifier

_kbc = 1; // Knockback Modifier
_stn = 1; // Stagger Modifier

_pattern = "";
col = c_white;
gunheldcol = c_white;

switch(material)
{
case "Candy":  
  _pow = 0.700;
  _pmx = 0.760;
  _spd = 0.881;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 0.520;
  _afx = 2.200;
  _wgt = 1.700;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 0;
  col = c_white;  
  break;  
    
    
case "3D Printed":  
  _pow = 0.700;
  _pmx = 0.730;
  _spd = 0.880;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 0.760;
  _afx = 0.670;
  _wgt = 1.050;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 1;
  col = c_white;  
  break;  
    
    
case "Soiled":  
  _pow = 0.712;
  _pmx = 0.742;
  _spd = 0.887;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 0.712;
  _afx = 0.712;
  _wgt = 1.031;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 2;
  col = c_white;  
  break;  
    
    
case "Rotten":  
  _pow = 0.720;
  _pmx = 0.724;
  _spd = 0.890;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 0.720;
  _afx = 0.720;
  _wgt = 1.040;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 3;
  col = c_white;  
  break;  
    
    
case "Broken":  
  _pow = 0.718;
  _pmx = 0.742;
  _spd = 0.892;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 0.728;
  _afx = 0.728;
  _wgt = 1.048;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 4;
  col = c_white;  
  break;  
    
    
case "Carbon":  
  _pow = 0.718;
  _pmx = 0.745;
  _spd = 0.893;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 0.730;
  _afx = 0.732;
  _wgt = 1.100;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 5;
  col = c_white;  
  break;  
    
    
case "Mythril":  
  _pow = 0.640;
  _pmx = 0.743;
  _spd = 0.850;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 0.740;
  _afx = 0.740;
  _wgt = 1.500;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 6;
  col = c_white;  
  break;  
    
    
case "Rusty":  
  _pow = 0.748;
  _pmx = 0.748;
  _spd = 0.897;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 0.748;
  _afx = 0.748;
  _wgt = 1.070;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 7;
  col = c_white;  
  break;  
    
    
case "Junk":  
  _pow = 0.759;
  _pmx = 0.940;
  _spd = 0.850;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 0.759;
  _afx = 0.759;
  _wgt = 1.084;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 8;
  col = c_white;  
  break;  
    
    
case "Neon":  
  _pow = 0.700;
  _pmx = 0.700;
  _spd = 0.901;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 0.778;
  _afx = 0.700;
  _wgt = 0.890;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 9;
  col = c_white;  
  break;  
    
    
case "Salt":  
  _pow = 0.766;
  _pmx = 0.784;
  _spd = 0.904;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 0.775;
  _afx = 0.775;
  _wgt = 1.101;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 10;
  col = c_white;  
  break;  
    
    
case "Wood":  
  _pow = 0.868;
  _pmx = 0.946;
  _spd = 0.946;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 0.820;
  _afx = 0.580;
  _wgt = 1.400;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 11;
  col = c_white;  
  break;  
    
    
case "Aluminum":  
  _pow = 0.791;
  _pmx = 0.791;
  _spd = 0.909;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 0.791;
  _afx = 0.791;
  _wgt = 1.119;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 12;
  col = c_white;  
  break;  
    
    
case "Glass":  
  _pow = 0.795;
  _pmx = 0.795;
  _spd = 0.910;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 0.795;
  _afx = 0.795;
  _wgt = 1.123;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 13;
  col = c_white;  
  break;  
    
    
case "Plastic":  
  _pow = 0.700;
  _pmx = 0.760;
  _spd = 0.913;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 0.844;
  _afx = 0.706;
  _wgt = 1.000;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 14;
  col = c_white;  
  break;  
    
    
case "Leather":  
  _pow = 0.811;
  _pmx = 0.811;
  _spd = 0.914;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 0.811;
  _afx = 0.811;
  _wgt = 1.141;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 15;
  col = c_white;  
  break;  
    
    
case "Studded":  
  _pow = 0.998;
  _pmx = 0.998;
  _spd = 0.917;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 0.836;
  _afx = 0.790;
  _wgt = 1.390;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 16;
  col = c_white;  
  break;  
    
    
case "Dual":  
  _pow = 0.843;
  _pmx = 0.843;
  _spd = 0.922;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 0.843;
  _afx = 0.843;
  _wgt = 1.176;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 17;
  col = c_white;  
  break;  
    
    
case "Plantain":  
  _pow = 0.839;
  _pmx = 0.839;
  _spd = 0.921;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 0.820;
  _afx = 0.892;
  _wgt = 1.172;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 18;
  col = c_white;  
  break;  
    
    
case "Bone":  
  _pow = 0.958;
  _pmx = 0.958;
  _spd = 0.922;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 0.580;
  _afx = 0.616;
  _wgt = 1.100;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 19;
  col = c_white;  
  break;  
    
    
case "Aluminium":  
  _pow = 0.760;
  _pmx = 0.760;
  _spd = 0.928;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 0.736;
  _afx = 0.820;
  _wgt = 1.000;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 20;
  col = c_white;  
  break;  
    
    
case "Titanium":  
  _pow = 1.360;
  _pmx = 1.360;
  _spd = 0.931;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 0.976;
  _afx = 0.622;
  _wgt = 1.211;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 21;
  col = c_white;  
  break;  
    
    
case "Stone":  
  _pow = 0.826;
  _pmx = 0.826;
  _spd = 0.934;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 0.790;
  _afx = 1.150;
  _wgt = 1.330;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 22;
  col = c_white;  
  break;  
    
    
case "Chrome":  
  _pow = 0.940;
  _pmx = 0.940;
  _spd = 0.935;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 0.850;
  _afx = 0.850;
  _wgt = 1.230;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 23;
  col = c_white;  
  break;  
    
    
case "Frankincense":  
  _pow = 0.902;
  _pmx = 0.902;
  _spd = 0.938;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 0.902;
  _afx = 0.902;
  _wgt = 1.242;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 24;
  col = c_white;  
  break;  
    
    
case "Iron":  
  _pow = 0.906;
  _pmx = 0.906;
  _spd = 0.939;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 0.906;
  _afx = 0.906;
  _wgt = 1.247;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 25;
  col = c_white;  
  break;  
    
    
case "Cobalt":  
  _pow = 0.918;
  _pmx = 0.918;
  _spd = 0.942;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 0.918;
  _afx = 0.918;
  _wgt = 1.260;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 26;
  col = c_white;  
  break;  
    
    
case "Nickel":  
  _pow = 0.918;
  _pmx = 0.918;
  _spd = 0.942;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 0.918;
  _afx = 0.918;
  _wgt = 1.260;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 27;
  col = c_white;  
  break;  
    
    
case "Copper":  
  _pow = 0.938;
  _pmx = 0.938;
  _spd = 0.948;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 0.938;
  _afx = 0.938;
  _wgt = 1.282;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 28;
  col = c_white;  
  break;  
    
    
case "Zinc":  
  _pow = 0.942;
  _pmx = 0.942;
  _spd = 0.949;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 0.942;
  _afx = 0.942;
  _wgt = 1.286;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 29;
  col = c_white;  
  break;  
    
    
case "Fiberglass":  
  _pow = 0.962;
  _pmx = 0.962;
  _spd = 0.954;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 0.962;
  _afx = 0.962;
  _wgt = 1.308;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 30;
  col = c_white;  
  break;  
    
    
case "Grass":  
  _pow = 0.974;
  _pmx = 0.974;
  _spd = 0.957;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 0.974;
  _afx = 0.974;
  _wgt = 1.322;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 31;
  col = c_white;  
  break;  
    
    
case "Soy":  
  _pow = 0.981;
  _pmx = 0.981;
  _spd = 0.959;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 0.981;
  _afx = 0.981;
  _wgt = 1.330;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 32;
  col = c_white;  
  break;  
    
    
case "Steel":  
  _pow = 1.000;
  _pmx = 1.000;
  _spd = 1.000;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.000;
  _afx = 1.000;
  _wgt = 1.350;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 33;
  col = c_white;  
  break;  
    
    
case "Brass":  
  _pow = 1.001;
  _pmx = 1.001;
  _spd = 0.965;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.001;
  _afx = 1.001;
  _wgt = 1.352;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 34;
  col = c_white;  
  break;  
    
    
case "Orichalcum":  
  _pow = 1.017;
  _pmx = 1.017;
  _spd = 1.060;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 0.850;
  _afx = 1.180;
  _wgt = 1.200;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 35;
  col = c_white;  
  break;  
    
    
case "Napalm":  
  _pow = 1.021;
  _pmx = 1.021;
  _spd = 0.970;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.021;
  _afx = 1.021;
  _wgt = 1.374;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 36;
  col = c_white;  
  break;  
    
    
case "Origami":  
  _pow = 0.880;
  _pmx = 0.880;
  _spd = 0.973;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 0.880;
  _afx = 0.580;
  _wgt = 0.500;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 37;
  col = c_white;  
  break;  
    
    
case "Offal":  
  _pow = 1.037;
  _pmx = 1.037;
  _spd = 0.974;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.037;
  _afx = 1.037;
  _wgt = 1.392;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 38;
  col = c_white;  
  break;  
    
    
case "Crystal":  
  _pow = 1.045;
  _pmx = 1.045;
  _spd = 0.976;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.045;
  _afx = 1.045;
  _wgt = 1.401;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 39;
  col = c_white;  
  break;  
    
    
case "Adamantium":  
  _pow = 1.053;
  _pmx = 1.053;
  _spd = 0.978;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.053;
  _afx = 1.053;
  _wgt = 1.410;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 40;
  col = c_white;  
  break;  
    
    
case "Silk":  
  _pow = 1.065;
  _pmx = 1.065;
  _spd = 0.981;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.065;
  _afx = 1.065;
  _wgt = 1.423;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 41;
  col = c_white;  
  break;  
    
    
case "Marble":  
  _pow = 1.073;
  _pmx = 1.073;
  _spd = 0.984;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.073;
  _afx = 1.073;
  _wgt = 1.432;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 42;
  col = c_white;  
  break;  
    
    
case "Rubber":  
  _pow = 1.085;
  _pmx = 1.085;
  _spd = 0.987;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.085;
  _afx = 1.085;
  _wgt = 1.445;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 43;
  col = c_white;  
  break;  
    
    
case "Foil":  
  _pow = 1.093;
  _pmx = 1.093;
  _spd = 0.989;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.093;
  _afx = 1.093;
  _wgt = 1.454;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 44;
  col = c_white;  
  break;  
    
    
case "Blood":  
  _pow = 1.104;
  _pmx = 1.104;
  _spd = 0.992;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.104;
  _afx = 1.104;
  _wgt = 1.467;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 45;
  col = c_white;  
  break;  
    
    
case "Silver":  
  _pow = 1.112;
  _pmx = 1.112;
  _spd = 0.994;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.112;
  _afx = 1.112;
  _wgt = 1.476;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 46;
  col = c_white;  
  break;  
    
    
case "Chitin":  
  _pow = 1.128;
  _pmx = 1.128;
  _spd = 0.998;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.128;
  _afx = 1.128;
  _wgt = 1.493;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 47;
  col = c_white;  
  break;  
    
    
case "Sinew":  
  _pow = 1.140;
  _pmx = 1.140;
  _spd = 1.002;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.140;
  _afx = 1.140;
  _wgt = 1.507;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 48;
  col = c_white;  
  break;  
    
    
case "Tin":  
  _pow = 1.156;
  _pmx = 1.156;
  _spd = 1.006;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.156;
  _afx = 1.156;
  _wgt = 1.524;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 49;
  col = c_white;  
  break;  
    
    
case "Obsidian":  
  _pow = 1.168;
  _pmx = 1.168;
  _spd = 1.009;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.168;
  _afx = 1.168;
  _wgt = 1.537;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 50;
  col = c_white;  
  break;  
    
    
case "Fungus":  
  _pow = 1.192;
  _pmx = 1.192;
  _spd = 1.015;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.192;
  _afx = 1.192;
  _wgt = 1.564;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 51;
  col = c_white;  
  break;  
    
    
case "Damascus":  
  _pow = 1.188;
  _pmx = 1.188;
  _spd = 1.014;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.188;
  _afx = 1.188;
  _wgt = 1.559;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 52;
  col = c_white;  
  break;  
    
    
case "Analog":  
  _pow = 1.204;
  _pmx = 1.204;
  _spd = 1.019;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.204;
  _afx = 1.204;
  _wgt = 1.577;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 53;
  col = c_white;  
  break;  
    
    
case "Digital":  
  _pow = 1.211;
  _pmx = 1.211;
  _spd = 1.021;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.211;
  _afx = 1.211;
  _wgt = 1.586;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 54;
  col = c_white;  
  break;  
    
    
case "Brain":  
  _pow = 1.227;
  _pmx = 1.227;
  _spd = 1.025;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.227;
  _afx = 1.227;
  _wgt = 1.604;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 55;
  col = c_white;  
  break;  
    
    
case "Chobham":  
  _pow = 1.235;
  _pmx = 1.235;
  _spd = 1.027;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.235;
  _afx = 1.235;
  _wgt = 1.612;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 56;
  col = c_white;  
  break;  
    
    
case "Bronze":  
  _pow = 1.390;
  _pmx = 1.390;
  _spd = 1.068;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.390;
  _afx = 1.390;
  _wgt = 1.784;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 57;
  col = c_white;  
  break;  
    
    
case "Blaster":  
  _pow = 1.402;
  _pmx = 1.402;
  _spd = 1.071;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.402;
  _afx = 1.402;
  _wgt = 1.797;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 58;
  col = c_white;  
  break;  
    
    
case "Tungsten":  
  _pow = 1.414;
  _pmx = 1.414;
  _spd = 1.075;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.414;
  _afx = 1.414;
  _wgt = 1.811;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 59;
  col = c_white;  
  break;  
    
    
case "Itano":  
  _pow = 1.422;
  _pmx = 1.422;
  _spd = 1.077;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.422;
  _afx = 1.422;
  _wgt = 1.819;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 60;
  col = c_white;  
  break;  
    
    
case "Pearl":  
  _pow = 1.420;
  _pmx = 1.540;
  _spd = 1.081;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.540;
  _afx = 1.300;
  _wgt = 1.837;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 61;
  col = c_white;  
  break;  
    
    
case "Myrrh":  
  _pow = 1.445;
  _pmx = 1.445;
  _spd = 1.083;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.445;
  _afx = 1.445;
  _wgt = 1.846;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 62;
  col = c_white;  
  break;  
    
    
case "Platinum":  
  _pow = 1.457;
  _pmx = 1.457;
  _spd = 1.086;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.457;
  _afx = 1.457;
  _wgt = 1.859;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 63;
  col = c_white;  
  break;  
    
    
case "Gold":  
  _pow = 1.465;
  _pmx = 1.465;
  _spd = 1.088;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.465;
  _afx = 1.465;
  _wgt = 1.868;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 64;
  col = c_white;  
  break;  
    
    
case "Mercury":  
  _pow = 1.477;
  _pmx = 1.477;
  _spd = 1.091;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.477;
  _afx = 1.477;
  _wgt = 1.881;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 65;
  col = c_white;  
  break;  
    
    
case "Imaginary":  
  _pow = 1.493;
  _pmx = 1.493;
  _spd = 1.096;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.493;
  _afx = 1.493;
  _wgt = 1.899;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 66;
  col = c_white;  
  break;  
    
    
case "Lead":  
  _pow = 1.505;
  _pmx = 1.505;
  _spd = 1.099;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.505;
  _afx = 1.505;
  _wgt = 1.912;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 67;
  col = c_white;  
  break;  
    
    
case "Diamond":  
  _pow = 1.513;
  _pmx = 1.513;
  _spd = 1.101;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.513;
  _afx = 1.513;
  _wgt = 1.921;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 68;
  col = c_white;  
  break;  
    
    
case "Polenta":  
  _pow = 1.513;
  _pmx = 1.513;
  _spd = 1.101;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.513;
  _afx = 1.513;
  _wgt = 1.921;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 69;
  col = c_white;  
  break;  
    
    
case "Yggdrasil":  
  _pow = 1.517;
  _pmx = 1.517;
  _spd = 1.102;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.517;
  _afx = 1.517;
  _wgt = 1.925;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 70;
  col = c_white;  
  break;  
    
    
case "Pinata":  
  _pow = 1.564;
  _pmx = 1.564;
  _spd = 1.115;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.564;
  _afx = 1.564;
  _wgt = 1.978;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 71;
  col = c_white;  
  break;  
    
    
case "Francium":  
  _pow = 1.568;
  _pmx = 1.568;
  _spd = 1.116;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.568;
  _afx = 1.568;
  _wgt = 1.982;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 72;
  col = c_white;  
  break;  
    
    
case "Orb":  
  _pow = 1.580;
  _pmx = 1.660;
  _spd = 1.000;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.510;
  _afx = 1.810;
  _wgt = 1.996;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 73;
  col = c_white;  
  break;  
    
    
case "Nanotube":  
  _pow = 1.540;
  _pmx = 1.660;
  _spd = 1.120;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.584;
  _afx = 1.584;
  _wgt = 2.000;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 74;
  col = c_white;  
  break;  
    
    
case "Taxidermy":  
  _pow = 1.000;
  _pmx = 1.000;
  _spd = 1.000;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.000;
  _afx = 1.000;
  _wgt = 1.000;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 75;
  col = c_white;  
  break;  
    
    
case "Porcelain":  
  _pow = 1.000;
  _pmx = 1.000;
  _spd = 1.000;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.000;
  _afx = 1.000;
  _wgt = 1.000;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 76;
  col = c_white;  
  break;  
    
    
case "Anti-Matter":  
  _pow = 1.000;
  _pmx = 1.000;
  _spd = 1.000;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.000;
  _afx = 1.000;
  _wgt = 1.000;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 77;
  col = c_white;  
  break;  
    
    
case "Aerogel":  
  _pow = 1.000;
  _pmx = 1.000;
  _spd = 1.000;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.000;
  _afx = 1.000;
  _wgt = 1.000;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 78;
  col = c_white;  
  break;  
    
    
case "Denim":  
  _pow = 1.000;
  _pmx = 1.000;
  _spd = 1.000;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.000;
  _afx = 1.000;
  _wgt = 1.000;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 79;
  col = c_white;  
  break;  
    
    
case "Untamonium":  
  _pow = 1.000;
  _pmx = 1.000;
  _spd = 1.000;
  _acc = 1.000;
  _rng = 1.000;
  _amm = 1.000;
  _afx = 1.000;
  _wgt = 1.000;
  col = make_color_rgb(190,200,190);  
  gunheldcol = col;  
  gun[?"hudIconFrame"] = 80;
  col = c_white;  
  break;  
}

gun[? "pMaterial"] = material;

if(_pattern != "")
{
    scr_combat_weapons_setPattern(gun, _pattern);
}

gun[? "pPowerMod"] = gun[? "pPowerMod"]*_pow;
gun[? "pPowerMaxMod"] = gun[? "pPowerMaxMod"]*_pmx;
gun[? "pSpeedMod"] = gun[? "pSpeedMod"]*_spd;

//gun[? "pAccMod"] = gun[? "pAccMod"]*_acc;

gun[? "pRangeMod"] = _rng;
gun[? "pAmmoMod"] = gun[? "pAmmoMod"]*_amm;
gun[? "pAffixMod"] = gun[? "pAffixMod"]*_afx;

gun[? "pWeightMod"] = gun[? "pWeightMod"]*_wgt;

gun[? "pKnockback"] = gun[? "pKnockback"]*_kbc;
gun[? "pStagger"] = gun[? "pStagger"]*_stn;
