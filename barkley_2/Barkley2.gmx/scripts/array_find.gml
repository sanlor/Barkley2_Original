/// array_find(array, value)

var arr = argument0;
var val = argument1;

if (!is_array(arr)) { return NULL; } // Array empty

var arrlen = array_length_1d(arr);

if (is_array(val)) {
    for (var i = 0; i < arrlen; i++) {
        var v = arr[i];
        if (array_equals_b2(v, val)) {
            return i;
        }
    }
}
else {
    for (var i = 0; i < arrlen; i++) {
        var v = arr[i];
        if (v == val) {
            return i;
        }
    }
}
return NULL;
