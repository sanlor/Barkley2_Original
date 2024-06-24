/// scr_music_init()
// get duplicate sounds

_tim = get_timer();
show_debug_message("scr_sound_init(): Begin...");
global.dsmSound = ds_map_create();
global.dslSoundRecent = ds_list_create(); // debug
global.dsmSoundLength = ds_map_create();
global.dsmSoundOrphan = ds_map_create();
global.dsmSoundStream = ds_map_create();
global.dsmSoundVolume = ds_map_create();
global.dsmSoundMemory = ds_map_create();
var souCou, musCou, filNam, dirNam, pthNam, sndNam, sizTot;
souCou = 0;
musCou = 0;
sizTot = 0;
var dirQue = ds_queue_create();
ds_queue_enqueue(dirQue, "_audio");
while (!ds_queue_empty(dirQue)) 
{  
    dirNam = ds_queue_dequeue(dirQue);    // Search all files and subdirectories under the directory.    
    filNam = file_find_first(dirNam + '\*', fa_directory);    
    while (filNam != "") 
    {        
        pthNam = dirNam + "\" + filNam;
        //show_debug_message("scr_sound_init(): Searching " + pthNam);
        //show_debug_message("scr_sound_init(): isDirectory = " + string(file_attributes(pthNam, fa_directory)));
        //filename_ext(filNam) == "")
        if (directory_exists(pthNam)) //file_attributes(pthNam, fa_directory))
        {
            if (filNam != "." && filNam != "..")
            {
                ds_queue_enqueue(dirQue, pthNam);
                //show_debug_message("scr_sound_init(): Added " + pthNam + " to search queue..."); 
            }
        }        
        else if (filename_ext(filNam) == ".ogg") // Streamed sound
        {       
            sndNam = string_replace(filename_name(filNam), ".ogg", "");
            ds_map_add(global.dsmSound, sndNam, audio_create_stream(pthNam));
            ds_map_add(global.dsmSoundLength, sndNam, 0); // Cannot calulate length for music files
            ds_map_add(global.dsmSoundOrphan, sndNam, 1);
            ds_map_add(global.dsmSoundStream, sndNam, 1);
            ds_map_add(global.dsmSoundVolume, sndNam, 1);
            ds_map_add(global.dsmSoundMemory, sndNam, 0);
            musCou += 1;
            //show_debug_message("scr_sound_init(): Music from " + pthNam + " as " + filNam);       
        }
        else if (filename_ext(filNam) == ".wav") // Streamed sound
        {
            off = 44;
            buf = buffer_load(pthNam);
            siz = buffer_get_size(buf) - off;
            sizTot += siz;
            sndBuf = audio_create_buffer_sound(buf, buffer_s16, 44100, off, siz, audio_mono);
            sndNam = string_replace(filename_name(filNam), ".wav", "");
            ds_map_add(global.dsmSound, sndNam, sndBuf);
            ds_map_add(global.dsmSoundLength, sndNam, siz / (44100 * 2));
            ds_map_add(global.dsmSoundOrphan, sndNam, 1);
            ds_map_add(global.dsmSoundStream, sndNam, 0);
            ds_map_add(global.dsmSoundVolume, sndNam, 1);
            ds_map_add(global.dsmSoundMemory, sndNam, siz / 1024);
            souCou += 1;
            //show_debug_message("scr_sound_init(): Sound from " + pthNam + " as " + filNam); 
        }
        else // Unrecognized
        {
            //show_debug_message("scr_sound_init(): Unrecognized file " + pthNam + " in Audio folder."); 
        }
        filNam = file_find_next();    
    }    
    file_find_close();
}
ds_queue_destroy(dirQue);
show_debug_message("scr_sound_init(): End. " + string(musCou) + " streamed files, " + string(souCou) + " loaded files, " + string(musCou + souCou) + " total files. Took " + string((get_timer() - _tim) / 1000) + "ms. Occupying " + string(sizTot / 1024 / 1024) + "Mb of memory.");

/// Load volume from sound.json
scr_sound_load();
