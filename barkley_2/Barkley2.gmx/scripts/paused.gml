/// paused(true / false [optional])
if (argument_count == 0)
{
    return global.pause;
}
else
{
    global.pause = argument[0];
}
