/// ZauberPozzosPrison(command, caster, aim_x, aim_y, aim_z)

// ----- Input arguments -----
var command = argument0;
var caster = argument1;
var aim_x = argument2;
var aim_y = argument3;
var aim_z = argument4;

// ----- Commands -----
if (command == "name") return global.zauberPozzoJelloName;
if (command == "sprite") return global.zauberPozzoJelloSprite;
if (command == "element") return "BIO";
if (command == "color") return c_bio;

if (command == "aim_decals")
{
    scr_fx_decal_transient(s_zauberCasting_circle, 1, aim_x, aim_y, aim_z,
                           0.25, 0.25 * 0.7,
                           0, c_white, 0.5);
    scr_fx_decal_transient(s_zauberCasting_target, 1, aim_x, aim_y + 8, aim_z, 1, 1, 0, c_white, 1)
}

if (command == "cast")
{
    if (isCombatActor(caster))
    {
        var dir = caster.zauber_dir; //caster.aiming * 22.5;
        Zauber("effect", c_bio, dir);
                
        var piety = scr_stats_getEffectiveStat(caster, STAT_BASE_PIETY);
        var jelly = global.zauberPozzoJelloMinimum;
        jelly += ((global.zauberPozzoJelloMaximum - global.zauberPozzoJelloMinimum) / 99) * piety;
        jelly = round(jelly);
        var tries = 0;
        while (jelly > 0 && tries < 50)
        {
            tries += 1;
            len = global.zauberPozzoJelloDistanceMinimum;
            len += random(global.zauberPozzoJelloDistanceMaximum - global.zauberPozzoJelloDistanceMinimum);
            var dirPie = (global.zauberPozzoJelloDirectionMaximum - global.zauberPozzoJelloDirectionMinimum) / 99;
            dir -= (global.zauberPozzoJelloDirectionMinimum / 2) + ((dirPie * piety) / 2);
            dir += random(global.zauberPozzoJelloDirectionMinimum) + random(dirPie * piety);
            global.tex = caster.x + lengthdir_x(len, dir);
            global.tey = caster.y + lengthdir_y(len, dir);
            
            global.tlc = 999;
            with (o_zauber_jello_prison)
            {
                global.tlc = min(global.tlc, point_distance(x, y, global.tex, global.tey));
            }
            if (global.tlc < global.zauberPozzoJelloSpacing) continue; // distance to nearest jello
            else
            {
                jelly -= 1;
                var csx = caster.x + lengthdir_x(24, dir);
                var csy = caster.y + lengthdir_y(24, dir);
                obj = instance_create(csx, csy, o_zauber_jello_air);
                obj.xDes = global.tex;
                obj.yDes = global.tey;
                obj.kid = instance_create(global.tex, global.tey, o_zauber_jello_prison);
                with (obj) event_user(1);
                with (obj.kid)
                {
                    trapTime = global.zauberPozzoJelloTrapMinimum;
                    trapTime += ((global.zauberPozzoJelloTrapMaximum - global.zauberPozzoJelloTrapMinimum) / 99) * piety;
                    prisonTime = global.zauberPozzoJelloPrisonMinimum;
                    prisonTime += ((global.zauberPozzoJelloPrisonMaximum - global.zauberPozzoJelloPrisonMinimum) / 99) * piety;
                }
            }
        }
    }
}
