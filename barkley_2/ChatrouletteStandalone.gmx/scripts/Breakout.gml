//global.chtStt = "dialog";
arg[0] = "Breakout";
arg[1] = "";
for (var i = 0; i < argument_count; i += 1)
{
    arg[1] += argument[i] + " > ";
}
show_debug_message("Breakout() - " + arg[0] + " = " + arg[1]);
