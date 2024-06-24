/// vector_min(list)
/// Finds shortest vector (x,y) in list. Returns position, or NULL if list empty

var list = argument0;

if (ds_list_empty(list)) return NULL;

var size = ds_list_size(list);
var i = 0;

var vx = list[| i++];
var vy = list[| i++];
var smallest = vector_magnitude_squared(vx, vy);
var res = 0;

while (i < size) {
    vx = list[| i++];
    vy = list[| i++];
    var vlen = vector_magnitude_squared(vx, vy);
    if (vlen < smallest) {
        res = i-2;
        smallest = vlen;
    }
}

return res;
