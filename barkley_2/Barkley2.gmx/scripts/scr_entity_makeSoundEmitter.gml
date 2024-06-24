/// scr_entity_makeSoundEmitter()
/// Adds a sound emitter to the entity

sound_emitter = audio_emitter_create();
audio_emitter_falloff(sound_emitter,
        AUDIO_FALLOFF_REF,
        AUDIO_FALLOFF_MAX,
        AUDIO_FALLOFF_FACTOR);
audio_emitter_gain(sound_emitter, global.sfx_gain_master);
audio_emitter_position(sound_emitter, x, y, z);
//audio_emitter_velocity(sound_emitter, move_x, move_y, move_z);
