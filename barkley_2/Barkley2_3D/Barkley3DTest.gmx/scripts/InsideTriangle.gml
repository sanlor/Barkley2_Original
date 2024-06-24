var x1, y1, x2, y2, x3, y3, x4, y4, a, b, c;
x1 = argument[0];
y1 = argument[1];
x2 = argument[2];
y2 = argument[3];
x3 = argument[4];
y3 = argument[5];
x4 = argument[6]; //test
y4 = argument[7];
a = (x1 - x4)*(y2 - y4) - (x2 - x4)*(y1 - y4);
b = (x2 - x4)*(y3 - y4) - (x3 - x4)*(y2 - y4);
c = (x3 - x4)*(y1 - y4) - (x1 - x4)*(y3 - y4);
return (a>=0 and b>=0 and c>=0) or (a<=0 and b<=0 and c<=0);
//return (sign(a) == sign(b) && sign(b) == sign(c));
