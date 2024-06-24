///Goto(variable, destination, speed)
// Auto converts speed to ABS to prevent errors
_int0 = argument0;
if (_int0 > argument1) 
{
    _int0 -= abs(argument2);
    if (_int0 < argument1) _int0 = argument1;
} 
else 
{
    _int0 += abs(argument2);
    if (_int0 > argument1) _int0 = argument1;
}
return _int0;
