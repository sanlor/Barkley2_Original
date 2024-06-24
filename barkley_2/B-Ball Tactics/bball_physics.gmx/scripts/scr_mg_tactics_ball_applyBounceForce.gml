var ball, zforce, dir;

ball = argument[0];
zforce = argument[1];

if(zforce != 0)
{
    ball.vz += zforce / ball.mass;
}
