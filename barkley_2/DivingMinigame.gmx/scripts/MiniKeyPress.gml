if (argument[0] == "up" && keyboard_check(ord("W"))) return 1;
if (argument[0] == "down" && keyboard_check(ord("S"))) return 1;
if (argument[0] == "left" && keyboard_check(ord("A"))) return 1;
if (argument[0] == "right" && keyboard_check(ord("D"))) return 1;
return 0;
