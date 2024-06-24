/*
**  Usage:
**      point_in_triangle(x1,y1,x2,y2,x3,y3,x4,y4)
**
**  Arguments:
**      x1,y1       1st point of triangle
**      x2,y2       2nd point of triangle
**      x3,y3       3rd point of trianlge
**      x4,y4       test point
**
**  Returns:
**      TRUE when the given test point is inside the given triangle,
**      FALSE otherwise
**
**  GMLscripts.com
*/
{
    var x1, y1, x2, y2, x3, y3, x4, y4, a, b, c;
    x1 = argument[0];
    y1 = argument[1];
    x2 = argument[2];
    y2 = argument[3];
    x3 = argument[4];
    y3 = argument[5];
    x4 = argument[6];
    y4 = argument[7];
    a = (x1 - x4)*(y2 - y4) - (x2 - x4)*(y1 - y4);
    b = (x2 - x4)*(y3 - y4) - (x3 - x4)*(y2 - y4);
    c = (x3 - x4)*(y1 - y4) - (x1 - x4)*(y3 - y4);
    return (sign(a) == sign(b) && sign(b) == sign(c));
}
