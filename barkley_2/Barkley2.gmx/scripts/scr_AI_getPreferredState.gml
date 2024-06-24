/*
So this function, lets you pick a state base on preference.
Give as argument the list of states to scan, and a queue of
states that you would prefer with the most preferable one
on top. The function will return the topmost one it could
find.

If none of the preferred states are found, the function can
return either -1, or a random state from the list.

The function will automagically delete the queue to prevent
memory leaks.

arg0 - State queue
*/

var queue;
queue = argument0;

var next, found;
while (ds_queue_size(queue) > 0)
{   
    next = ds_queue_dequeue(queue);
    found = scr_AI_findState(next)
    if (found != NULL)
    {
        ds_queue_destroy(queue);
        return found;
    }
}

ds_queue_destroy(queue);
return NULL;
