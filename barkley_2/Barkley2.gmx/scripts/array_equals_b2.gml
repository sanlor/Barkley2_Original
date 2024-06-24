/// array_equals_b2(array1, array2)

var arr1 = argument0;
var arr2 = argument1;

if (!is_array(arr1)) { return false; } // Array empty
if (!is_array(arr2)) { return false; } // Array empty

var arr1len = array_length_1d(arr1);
var arr2len = array_length_1d(arr2);
if (arr1len != arr2len) { return false; }

var v1, v2;
for (var i = 0; i < arr1len; i++) {
    v1 = arr1[i];
    v2 = arr2[i];
    if (is_array(v1) || is_array(v2)) {
        if (is_array(v2) && is_array(v2)) {
            if (!array_equals_b2(v1, v2)) {
                return false;
            }
        }
        else {
            return false;
        }
    }
    else if (v1 != v2) {
        return false;
    }
}
return true;
