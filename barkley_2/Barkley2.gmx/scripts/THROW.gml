/// THROW(0=sprite, 1=startObj, 2=endObj, 3=arcHeight, 4=startZ, 5=endZ, 6=timeInSecs, 7=disappear)
// THROW | s_bball01 | o_cinema10 | o_cinema11 | 64 | 16 | 0 | 2 | 0
// disappear == 1 would kill it when it lands, if you use 0, then use Destroy | oThrow later
var objSta = argument[1];
if (asset_get_index(string(objSta)) > -1) objSta = asset_get_index(objSta);
objSta = real(objSta);
var objEnd = argument[2];
if (asset_get_index(string(objEnd)) > -1) objEnd = asset_get_index(objEnd);
objEnd = real(objEnd);
var obj = instance_create(objSta.x, objSta.y, oThrow);
obj.sprite_index = asset_get_index(string(argument[0]));
obj.endObj = objEnd;
obj.arc = argument[3];
obj.zSta = argument[4];
obj.zEnd = argument[5];
obj.tim = real(argument[6]);
obj.dis = real(argument[7]);
with (obj) event_user(0);
