var _retvar,_checkv;

_checkv = argument0;

if(is_string(_checkv))
{
    _retvar = ds_list_find_index(global.gunTypeList,_checkv);
}
else
{
    _retvar = ds_list_find_value(global.gunTypeList,_checkv);
}

return _retvar;
