var toLog = argument0;

if(global.logfile != "")
{
    if(toLog == global.lastLog)
    {
        global.logRepeatCount += 1;
    }
    else
    {
        file = file_text_open_append(global.logfile);
        
        if(global.logRepeatCount>0)
        {
            file_text_write_string(file,global.lastLog + "[repeats: "+string(global.logRepeatCount)+"]");
            file_text_writeln(file);
            global.logRepeatCount = 0;
        }
        file_text_write_string(file,toLog);
        global.lastLog = toLog;
        file_text_writeln(file);
        file_text_close(file);
    }
}
