/// scr_math_mod(value1,value2);
/// Positive Modulo

if (argument1 == 0) return 0; // Prevent divide by zero crash

if (argument0 >= 0) return argument0 mod argument1
    else if ( -argument0 mod argument1 == 0) return 0
        else return argument1 - (( -argument0) mod argument1);
