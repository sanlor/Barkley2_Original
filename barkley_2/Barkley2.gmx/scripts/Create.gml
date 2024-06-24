/// Create(object, x?, y?)
var obj = argument[0];
var xxx = 0;
var yyy = 0;
if (is_string(obj)) obj = asset_get_index(obj);
if (argument_count > 1) xxx = argument[1];
if (argument_count > 2) yyy = argument[2];
instance_create(xxx, yyy, obj);
