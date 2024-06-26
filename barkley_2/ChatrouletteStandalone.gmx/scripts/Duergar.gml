/// Duergar("getname" / "checkpulse" / "kill", "name")
var command = argument0;
var name = argument1;

// Get full name and title //
if command = "getname" then
    {
    switch (name)
        {
        case "archambeau":
            return "Archambeau"; //"Captain Archambeau of the Dark Brigade";
        break;
        
        case "astyages":
            return "Astyages"; //"Soldat Astyages of the Baka Haram";
        break;
        
        case "burglecut":
            return "Burglecut"; //"Private Burglecut of the Gurkha Squad";
        break;
    
        case "constantine":
            return "Constantine"; //"Soldat Constantine of the Dungarees";
        break;
    
        case "dane-dufresne":
            return "Dane-Dufresne"; //"Private Dane-Dufresne of the Baka Haram";
        break;
    
        case "deveraux":
            return "Deveraux"; //"Corporal Deveraux of the Dark Brigade";
        break;
    
        case "dozier":
            return "Dozier"; //"Corporal Dozier of the Prize Patrol";
        break;
    
        case "garth":
            return "Garth"; //"Private Garth of the Prize Patrol";
        break;
    
        case "gottler":
            return "Gottler"; //"Soldat Gottler of the Prize Patrol";
        break;
    
        case "guildenstern":
            return "Guildenstern";
        break;
    
        case "haile":
            return "Haile"; //"Private Haile of the Dungarees";
        break;
    
        case "hasdrubal":
            return "Hasdrubal"; //"Private Hasdrubal of the Dark Brigade";
        break;
    
        case "honus":
            return "Honus";
        break;
    
        case "iptehar":
            return "Iptehar"; //"Sergeant Iptehar of the Gurkha Squad";;
        break;
    
        case "janos":
            return "Janos";
        break;
    
        case "jeanmarc":
           return "Jean-Marc"; //"Corporal Jean-Marc Pierre of the Dungarees";
        break;
    
        case "jeltsje":
            return "Jeltsje"; //"Sergeant Jeltsje of the Dungarees";
        break;
    
        case "kim":
            return "Kim"; //"Corporal Kim of the Kingsguard";
        break;
        
        case "lafferty":
            return "Lafferty"; //"Soldat Lafferty of the Kingsguard";
        break;
    
        case "lucretia":
            return "Lucretia"; //"Sergeant Lucretia of the Kingsguard";
        break;
    
        case "lugner":
            return "Lugner";
        break;
    
        case "lumis":
            return "Lumis"; //"Captain Lumis of the Dungarees";
        break;
    
        case "melqart":
            return "Melqart"; //"Corporal Melqart of the Gurkha Squad";
        break;
    
        case "ng":
            return "Ng";
        break;
        
        case "onslow":
            return "Onslow"; //"Captain Onslow of the Kingsguard";
        break;
        
        case "oolon":
            return "Ooolon"; //"Soldat Oolon of the Dark Brigade";
        break;
        
        case "osiris":
            return "Osiris";
        break;
    
        case "ox":
            return "Ox"; //"Private Ox of the Kingsguard";
        break;
    
        case "perry":
            return "Perry"
        break;
    
        case "puannum":
            return "Puannum"; //"Captain Puannum of the Gurkha Squad";
        break;
    
        case "roethlisbuergar":
            return "Roethlisbuergar"; //"Captain Roethlisbuergar of the Baka Haram";
        break;
    
        case "rosencrantz":
            return "Rosencrantz";
        break;
    
        case "schatzeder":
            return "Schatzeder"; //"Sergeant Schatzeder of the Baka Haram";
        break;
    
        case "socrates":
            return "Socrates"; //"Sergeant Socrates of the Dark Brigade";
        break;
    
        case "thrax":
            return "Thrax";//"Captain Thrax of the Prize Patrol";
        break;
        
        case "typhoidlarry":
            return "Typhoid Larry"; //"Corporal Typhoid Larry of the Baka Haram";
        break;
    
        case "vancleef":
            return "Van Cleef";
        break;
    
        case "wendela":
            return "Wendela"; //"Sergeant Wendela of the Prize Patrol";
        break;
        
        case "vikingstad":
            return "Vikingstad";
        break;
    
        case "yordano":
            return "Yordano"; //"Soldat Yordano of the Gurkha Squad";
        break;
        }
    }
    
// CHECK IF DEAD OR ALIVE //
else if command = "checkpulse" then
    {
    switch (name)
        {
        case "archambeau":
            if scr_quest_get_state("duergar_dead_archambeau") == 1 then return true;
        break;
        
        case "burglecut":
            if scr_quest_get_state("duergar_dead_burglecut") == 1 then return true;
        break;
    
        case "constantine":
            if scr_quest_get_state("duergar_dead_constantine") == 1 then return true;
        break;
    
        case "deveraux":
            if scr_quest_get_state("duergar_dead_deveraux") == 1 then return true;
        break;
    
        case "dozier":
            if scr_quest_get_state("duergar_dead_dozier") == 1 then return true;
        break;
    
        case "garth":
            if scr_quest_get_state("duergar_dead_garth") == 1 then return true;
        break;
    
        case "gottler":
            if scr_quest_get_state("duergar_dead_gottler") == 1 then return true;
        break;
    
        case "guildenstern":
            if scr_quest_get_state("duergar_dead_guildenstern") == 1 then return true;
        break;
    
        case "haile":
            if scr_quest_get_state("duergar_dead_haile") == 1 then return true;
        break;
    
        case "hasdrubal":
            if scr_quest_get_state("duergar_dead_hasdrubal") == 1 then return true;
        break;
    
        case "honus":
            if scr_quest_get_state("duergar_dead_honus") == 1 then return true;
        break;
    
        case "iptehar":
            if scr_quest_get_state("duergar_dead_iptehar") == 1 then return true;
        break;
    
        case "janos":
            if scr_quest_get_state("duergar_dead_janos") == 1 then return true;
        break;
    
        case "jeanmarc":
            if scr_quest_get_state("duergar_dead_jeanmarc") == 1 then return true;
        break;
    
        case "jeltsje":
            if scr_quest_get_state("duergar_dead_jeltsje") == 1 then return true;
        break;
    
        case "kim":
            if scr_quest_get_state("duergar_dead_kim") == 1 then return true;
        break;
        
        case "lafferty":
            if scr_quest_get_state("duergar_dead_lafferty") == 1 then return true;
        break;
    
        case "lucretia":
            if scr_quest_get_state("duergar_dead_lucretia") == 1 then return true;
        break;
    
        case "lugner":
            if scr_quest_get_state("duergar_dead_lugner") == 1 then return true;
        break;
    
        case "lumis":
            if scr_quest_get_state("duergar_dead_lumis") == 1 then return true;
        break;
    
        case "melqart":
            if scr_quest_get_state("duergar_dead_melqart") == 1 then return true;
        break;
    
        case "ng":
            if scr_quest_get_state("duergar_dead_ng") == 1 then return true;
        break;
        
        case "onslow":
            if scr_quest_get_state("duergar_dead_onslow") == 1 then return true;
        break;
        
        case "oolon":
            if scr_quest_get_state("duergar_dead_oolon") == 1 then return true;
        break;
        
        case "osiris":
            if scr_quest_get_state("duergar_dead_osiris") == 1 then return true;
        break;
    
        case "ox":
            if scr_quest_get_state("duergar_dead_ox") == 1 then return true;
        break;
    
        case "perry":
            if scr_quest_get_state("duergar_dead_perry") == 1 then return true;
        break;
    
        case "puannum":
            if scr_quest_get_state("duergar_dead_puannum") == 1 then return true;
        break;
    
        case "roethlisbuergar":
            if scr_quest_get_state("duergar_dead_roethlisbuergar") == 1 then return true;
        break;
    
        case "rosencrantz":
            if scr_quest_get_state("duergar_dead_rosencrantz") == 1 then return true;
        break;
    
        case "schatzeder":
            if scr_quest_get_state("duergar_dead_schatzeder") == 1 then return true;
        break;
    
        case "socrates":
            if scr_quest_get_state("duergar_dead_socrates") == 1 then return true;
        break;
    
        case "typhoidlarry":
            if scr_quest_get_state("duergar_dead_typhoidlarry") == 1 then return true;
        break;
    
        case "vancleef":
            if scr_quest_get_state("duergar_dead_vancleef") == 1 then return true;
        break;
    
        case "vikingstad":
            if scr_quest_get_state("duergar_dead_vikingstad") == 1 then return true;
        break;
    
        case "yordano":
            if scr_quest_get_state("duergar_dead_yordano") == 1 then return true;
        break;
        }
    }
    
// MURDER THEM //
if command = "kill" then
    {
    switch (name)
        {
        case "archambeau":
            scr_quest_set_state("duergar_dead_archambeau", 1);
        break;
        
        case "burglecut":                                                
            scr_quest_set_state("duergar_dead_burglecut", 1);
        break;
    
        case "constantine":
            scr_quest_set_state("duergar_dead_constantine", 1);
        break;
    
        case "deveraux":
            scr_quest_set_state("duergar_dead_deveraux", 1);
        break;
    
        case "dozier":
            scr_quest_set_state("duergar_dead_dozier", 1);
        break;
    
        case "garth":
            scr_quest_set_state("duergar_dead_garth", 1);
        break;
    
        case "gottler":
            scr_quest_set_state("duergar_dead_gottler", 1);
        break;
    
        case "guildenstern":
            scr_quest_set_state("duergar_dead_guildenstern", 1);
        break;
    
        case "haile":
            scr_quest_set_state("duergar_dead_haile", 1);
        break;
    
        case "hasdrubal":
            scr_quest_set_state("duergar_dead_hasdrubal", 1);
        break;
    
        case "honus":
            scr_quest_set_state("duergar_dead_honus", 1);
        break;
    
        case "iptehar":
            scr_quest_set_state("duergar_dead_iptehar", 1);
        break;
    
        case "janos":
            scr_quest_set_state("duergar_dead_janos", 1);
        break;
    
        case "jeanmarc":
            scr_quest_set_state("duergar_dead_jeanmarc", 1);
        break;
    
        case "jeltsje":
            scr_quest_set_state("duergar_dead_jeltsje", 1);
        break;
    
        case "kim":
            scr_quest_set_state("duergar_dead_kim", 1);
        break;
        
        case "lafferty":
            scr_quest_set_state("duergar_dead_lafferty", 1);
        break;
    
        case "lucretia":
            scr_quest_set_state("duergar_dead_lucretia", 1);
        break;
    
        case "lugner":
            scr_quest_set_state("duergar_dead_lugner", 1);
        break;
    
        case "lumis":
            scr_quest_set_state("duergar_dead_lumis", 1);
        break;
    
        case "melqart":
            scr_quest_set_state("duergar_dead_melqart", 1);
        break;
    
        case "ng":
            scr_quest_set_state("duergar_dead_ng", 1);
        break;
        
        case "onslow":
            scr_quest_set_state("duergar_dead_onslow", 1);
        break;
        
        case "oolon":
            scr_quest_set_state("duergar_dead_oolon", 1);
        break;
        
        case "osiris":
            scr_quest_set_state("duergar_dead_osiris", 1);
        break;
    
        case "ox":
            scr_quest_set_state("duergar_dead_ox", 1);
        break;
    
        case "perry":
            scr_quest_set_state("duergar_dead_perry", 1);
        break;
    
        case "puannum":
            scr_quest_set_state("duergar_dead_puannum", 1);
        break;
    
        case "roethlisbuergar":
            scr_quest_set_state("duergar_dead_roethlisbuergar", 1);
        break;
    
        case "rosencrantz":
            scr_quest_set_state("duergar_dead_rosencrantz", 1);
        break;
    
        case "schatzeder":
            scr_quest_set_state("duergar_dead_schatzeder", 1);
        break;
    
        case "socrates":
            scr_quest_set_state("duergar_dead_socrates", 1);
        break;
    
        case "typhoidlarry":
            scr_quest_set_state("duergar_dead_typhoidlarry", 1);
        break;
    
        case "vancleef":
            scr_quest_set_state("duergar_dead_vancleef", 1);
        break;
    
        case "vikingstad":
            scr_quest_set_state("duergar_dead_vikingstad", 1);
        break;
    
        case "yordano":
            scr_quest_set_state("duergar_dead_yordano", 1);
        break;
        }
    }
