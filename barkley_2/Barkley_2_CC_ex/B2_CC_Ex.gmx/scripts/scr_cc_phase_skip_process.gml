// Skip to a phase //
if phase_skip > 0 then
    {
    // Tick down //
    phase_skip -= dt();
    
    // Skipped //
    if phase_skip <= 0 then
        {
        phase[0] = phase_skip_time;
        phase[1] = phase_skip_to;
        }
    }
