/// array_find_in_list(list, array)

var list = argument0;
var val = argument1;

if (!(list > 0)) { return NULL; } // No list

var listlen = ds_list_size(list);

if (is_array(val)) {
    for (var i = 0; i < listlen; i++) {
        var v = list[| i];
        if (array_equals_b2(v, val)) {
            return i;
        }
    }
}
else {
    for (var i = 0; i < listlen; i++) {
        var v = list[| i];
        if (v == val) {
            return i;
        }
    }
}
return NULL;
