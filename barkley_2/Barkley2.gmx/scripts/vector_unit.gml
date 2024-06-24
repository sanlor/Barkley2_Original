/// vector_unit(x1, y1)

var magn = vector_magnitude(argument0, argument1)

if (magn != 0) {
    var v = 0;
    v[0] = argument0 / magn;
    v[1] = argument1 / magn;
    return v;
}
else {
    // Some default case for vectors of no length..
    var v = 0;
    v[0] = 1;
    v[1] = 0;
    return v;
}
