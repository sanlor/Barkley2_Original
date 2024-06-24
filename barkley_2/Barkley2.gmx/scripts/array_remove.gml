/// array_remove(array, pos)

var arr = argument0
var pos = argument1

if (!is_array(arr)) { return 0; } // Array empty

var arrlen = array_length_1d(arr);
var i = 0;
var j = 0;
var arr2 = 0;
while (i < arrlen) {
    if (i == pos) {
        // Skip entry
        i++
    }
    else {
        // Copy entry
        arr2[j++] = arr[i++]
    }
}

return arr2
