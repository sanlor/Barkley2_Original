// scr_math_normalDist(standard deviation, bounds);
// Generates a random number that follows a normal distribution
// Use 0-1 for both!

return argument0 * sqrt(-2 * ln(1 - random(argument1))) * cos(random(2 * pi));
