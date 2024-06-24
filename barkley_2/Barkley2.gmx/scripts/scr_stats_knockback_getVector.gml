/// scr_stats_knockback_getVector()
/// Returns a normalized knockback direction as a vector

if (knockback_vector_x == 0 && knockback_vector_y == 0) {
    // No vector? What the fuck? Panic!
    knockback_vector_x = 1;
    knockback_vector_y = 0;
} else {
    // Ensure knockback vector is normalized
    scr_math_normalizeVector(knockback_vector_x, knockback_vector_y);
    knockback_vector_x = __vx;
    knockback_vector_y = __vy;
}

var res = 0;
res[0] = knockback_vector_x;
res[1] = knockback_vector_y;
return res;
