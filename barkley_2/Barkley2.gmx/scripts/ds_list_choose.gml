/// ds_list_choose(list)

var list = argument0;

if (ds_list_empty(list))
    return NULL;
else {
    var p = irandom(ds_list_size(list)-1);
    return list[| p];
}
