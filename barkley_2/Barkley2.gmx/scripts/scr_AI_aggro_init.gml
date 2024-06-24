/// scr_AI_aggro_reset()

// Map pairing targets with their aggro values
I_aggro_map = ds_map_create()

// Aggro configurations
I_aggro_range_increase = 100
I_aggro_range_nochange = 150
I_aggro_range_decrease = 250
// Note: At ranges larger than I_aggro_range_decrease, aggro is removed instantly.

// Caps on aggro
I_aggro_maxincrease = 100
I_aggro_cap = 300
