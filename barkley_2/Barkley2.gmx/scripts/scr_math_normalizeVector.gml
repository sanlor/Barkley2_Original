/// scr_math_normalizeVector(vx,vy)
/// Sets __vx and __vy to the normalized vector.

var __vlen;

__vx = argument0
__vy = argument1

__vlen = sqrt((__vx*__vx) + (__vy*__vy))

if (__vlen == 0) {
    return 0; // Cannot normalize this vector
}

__vx /= __vlen
__vy /= __vlen
