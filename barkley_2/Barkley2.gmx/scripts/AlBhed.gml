/// scr_event_etc_albhed(text)
/// Converts a normal string into an Al Bhed string.

var text = argument0;

/*
if (global.victorian) {
    text=string_replace_all(text, "Charles", "Sir");
    text=string_replace_all(text, "Michael", "Maester");
    text=string_replace_all(text, "Balthios", "Balthane");
    text=string_replace_all(text, "Barkley", "Bakley");
    text=string_replace_all(text, "Hoopz", "Hooprick");
    text=string_replace_all(text, "Ultimate Hellbane", "Supreme Cogblight");
    //text=string_replace_all(text, "Larry", "Cleric"); //conflict in catacombs larry bball shard
    text=string_replace_all(text, "Lebron", "Lebronus");
    text=string_replace_all(text, "Chin", "Chinley");
    text=string_replace_all(text, "Ivory", "Miss");
    text=string_replace_all(text, "Vinceborg", "Clock Carter");
    text=string_replace_all(text, "Vinceborg 2050", "Clock Carter");
    text=string_replace_all(text, "Cyberdwarf", "Geardwarf");
    text=string_replace_all(text, "Cyber Dwarf", "Gear Dwarf");
    text=string_replace_all(text, "Zalatar", "Zalbrose");
    text=string_replace_all(text, "Wildman", "Wildchap");
    text=string_replace_all(text, "Juwanna", "Juwina");
    text=string_replace_all(text, "Hundley", "Hughley");
}
*/

var out_text = "";
var length = string_length(text);
// Go through each character and change it if need be.
for (var i = 1; i <= length; i++) {
    // Grab the current char.
    var char = string_char_at(text, i);
    // The character to output to the string, default as just the char.
    var out_char = char;
    // Check to see if we should capitalize at the end.
    var capitalize = char != string_lower(char);
    char = string_lower(char);
    // Change the character depending on what letter it is.
    switch(char) {
        case "a":
            out_char = "y";
            break;
        case "b":
            out_char = "p";
            break;
        case "c":
            out_char = "l";
            break;
        case "d":
            out_char = "t";
            break;
        case "e":
            out_char = "a";
            break;
        case "f":
            out_char = "v";
            break;
        case "g":
            out_char = "k";
            break;
        case "h":
            out_char = "r";
            break;
        case "i":
            out_char = "e";
            break;
        case "j":
            out_char = "z";
            break;
        case "k":
            out_char = "g";
            break;
        case "l":
            out_char = "m";
            break;
        case "m":
            out_char = "s";
            break;
        case "n":
            out_char = "h";
            break;
        case "o":
            out_char = "u";
            break;
        case "p":
            out_char = "b";
            break;
        case "q":
            out_char = "x";
            break;
        case "r":
            out_char = "n";
            break;
        case "s":
            out_char = "c";
            break;
        case "t":
            out_char = "d";
            break;
        case "u":
            out_char = "i";
            break;
        case "v":
            out_char = "j";
            break;
        case "w":
            out_char = "f";
            break;
        case "x":
            out_char = "q";
            break;
        case "y":
            out_char = "o";
            break;
        case "z":
            out_char = "w";
            break;
    }
    
    // Recapitalize if need be.
    if (capitalize and out_char != char) {
        out_char = string_upper(out_char);
    }
    
    // Add the character to the out string.
    out_text += out_char;
}

return (out_text);
