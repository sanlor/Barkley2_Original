/// Text(x, y, string, sep?, wid?)
var txt; 
if (global.alBhed) txt = AlBhed(string(argument[2]));
else txt = argument[2];
if (argument_count == 3)
{
    draw_text(argument[0], argument[1], txt);
}
else
{
    draw_text_ext(argument[0], argument[1], txt, argument[3], argument[4]);
}
