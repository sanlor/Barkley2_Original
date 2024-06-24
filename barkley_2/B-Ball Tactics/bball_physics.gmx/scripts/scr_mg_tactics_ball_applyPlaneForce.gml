var ball, pforce, dir;

ball = argument[0];
pforce = argument[1];
dir = degtorad(argument[2]);    //clamp this

if(pforce != 0)
{
    ball.vx += cos(dir) * (pforce / ball.mass);
    ball.vy += -sin(dir) * (pforce / ball.mass);
}
