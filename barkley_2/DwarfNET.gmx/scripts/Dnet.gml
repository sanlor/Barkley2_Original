/// Dnet()
// Colors and things
if (argument[0] == "forum")
{
    if (argument[1] == "Salutations")
    {
        Dnet("title", subforum_name[0]);
        Dnet("thread", "greet nonsense");
        Dnet("thread", "greet compson");
    }
    if (argument[1] == "Gemstones")
    {
        Dnet("title", subforum_name[1]);
        Dnet("thread", "gemstones rules", 1); // sticky
        Dnet("thread", "gemstones raincoat");
        Dnet("thread", "gemstones rubyfever");
        Dnet("thread", "gemstones song");
    }
    if (argument[1] == "Fruits")
    {
        Dnet("title", subforum_name[2]);
        Dnet("thread", "fruit apple");
        Dnet("thread", "fruit grapes");
        Dnet("thread", "fruit orange");
        Dnet("thread", "fruit cherry");
        Dnet("thread", "fruit banana");
        Dnet("thread", "fruit banana double");
    }
    if (argument[1] == "Religion")
    {
        Dnet("title", subforum_name[3]);
        Dnet("thread", "religion dwarfism");
        Dnet("thread", "religion poem");
        Dnet("thread", "religion bootybass");
    }
    if (argument[1] == "Politics")
    {
        Dnet("title", subforum_name[4]);
        Dnet("thread", "politix saveswamps");
    }
    if (argument[1] == "Webcomics")
    {
        Dnet("title", subforum_name[5]);
        Dnet("thread", "webcomix quack");
        Dnet("thread", "webcomix help");
    }
    if (argument[1] == "Vidcons")
    {
        Dnet("title", subforum_name[6]);
        Dnet("thread", "vidcons imdone");
        Dnet("thread", "vidcons lore");
        Dnet("thread", "vidcons patchnotes");
        Dnet("thread", "vidcons jones boom");
    }
    if (argument[1] == "Dating")
    {
        Dnet("title", subforum_name[7]);
        Dnet("thread", "dating eric");
        Dnet("thread", "dating mojitos");
        Dnet("thread", "dating sanicstory");
        Dnet("thread", "dating anyone");
    }
    if (argument[1] == "Ads")
    {
        Dnet("title", subforum_name[8]);
        Dnet("thread", "ads zauber");
        Dnet("thread", "ads vidcon collection");
    }
    if (argument[1] == "Sports")
    {
        Dnet("title", subforum_name[9]);
        Dnet("thread", "sports kyphosis");
        Dnet("thread", "sports adventure");
        Dnet("thread", "sports garfunkel0");
    }
}
else if (argument[0] == "init")
{
    // Color of the post body
    global.dnetColorPostMod = c_green;
    global.dnetColorPostReg = merge_color(c_aqua, c_gray, 0.66);
    global.dnetColorPostPre = c_orange;
    global.dnetColorPostBan = c_gray;
    
    // Color of the poster's name
    global.dnetColorNameMod = c_lime;
    global.dnetColorNameReg = merge_color(c_aqua, c_gray, 0.33);; //c_aqua;
    global.dnetColorNamePre = c_yellow; //primo member
    global.dnetColorNameBan = c_dkgray;
    
    // Thread colors
    global.dentColorThreadLocked = c_gray;
    global.dentColorThreadNormal = c_white;
    global.dentColorThreadSticky = c_yellow;
    
    // Pip colors
    global.dnetColorPip[0] = c_green; // Regular user
    global.dnetColorPip[1] = c_white; // Primo  - DOES NOT HAVE PIP COLOR, says text PRIMO
    global.dnetColorPip[2] = c_red;   // Moderator
    global.dnetColorPip[3] = c_white; // Banned - DOES NOT HAVE PIP COLOR, says text BANNED
}
else if (argument[0] == "pointer")
{
    if (instance_exists(o_dnet_control))
    {
        var pnx = o_dnet_control.pointer_x;
        var pny = o_dnet_control.pointer_y;
        if (pnx >= argument[1] && pnx <= argument[3] && pny >= argument[2] && pny <= argument[4]) return true;
    }
    return false;
}
else if (argument[0] == "title") // 1 = Title
{
    o_dnet_control.dnet_title_previous = o_dnet_control.dnet_title_current
    o_dnet_control.dnet_title_current = argument[1];
}
else if (argument[0] == "purge") // 1 = Object
{
    with (argument[1]) instance_destroy();
}
else if (argument[0] == "timestamp") // 1 = Time
{
    var hours = real(string_copy(argument[1], 0, 2));
    var minutes = real(string_copy(argument[1], 4, 2));
    // Posted before today //
    if (hours == 24) { if minutes > 0 then post.post_timestamp = "Posted 1 day ago"; }
    else if hours > 96 then post.post_timestamp = "Posted 4 days ago";
    else if hours > 72 then post.post_timestamp = "Posted 3 days ago";
    else if hours > 48 then post.post_timestamp = "Posted 2 days ago";
    else if hours > 24 then post.post_timestamp = "Posted 1 day ago";
    else 
    {
        hours_2 = 24 - hours;
        minutes_2 = abs(0 - minutes);
        if hours_2 < 10 then hours_2 = "0" + string(hours_2);
        if minutes_2 < 10 then minutes_2 = "0" + string(minutes_2);
        post.post_timestamp = "Posted today at " + string(hours_2) + ":" + string(minutes_2);
    }
}

///// CLOCK /////
else if (argument[0] == "clock below") // NOT USED CURRENTLY
{
    // Check the clock //
    var hours_wanted = string_copy(argument[1], 0, 2);
    var minutes_wanted = string_copy(argument[1], 4, 2);
    var total_time = real(hours_wanted) * 60 + real(minutes_wanted);
    var comparison_time = global.clockHours * 60 + global.clockMinutes;
    
    // Comparison //
    if (comparison_time <= total_time) return 1; else return 0;
}
else if (argument[0] == "clock above") // NOT USED CURRENTLY
{
    // Check the clock //
    var hours_wanted = string_copy(argument[1], 0, 2);
    var minutes_wanted = string_copy(argument[1], 4, 2);
    var total_time = real(hours_wanted) * 60 + real(minutes_wanted);
    var comparison_time = global.clockHours * 60 + global.clockMinutes;

    // Comparison //
    if (comparison_time >= total_time) return 1; else return 0;
}
else if (argument[0] == "clock between") // 1 = Low Time, 2 = High Time
{
    // Check the clock //
    var hours_wanted = string_copy(argument[1], 0, 2);
    var minutes_wanted = string_copy(argument[1], 4, 2);
    var hours_wanted2 = string_copy(argument[2], 0, 2);
    var minutes_wanted2 = string_copy(argument[2], 4, 2);
    var total_time = real(hours_wanted) * 60 + real(minutes_wanted);
    var total_time2 = real(hours_wanted2) * 60 + real(minutes_wanted2);
    var comparison_time = global.clockHours * 60 + global.clockMinutes;

    // Comparison //
    if (comparison_time >= total_time) 
    {
        if (comparison_time <= total_time2) return 1; else return 0;
    }
    else return 0;
}
///// CLOCK /////

else if (argument[0] == "image") // time1, time2, image, image_text
{
    if Dnet("clock between", argument[1], argument[2])
    {
        image = instance_create(view_xview + 10, view_yview + o_dnet_control.top_height + o_dnet_control.scrolling_position - 2, o_dnet_image);
        image.sprite_index = argument[3];
        image.image_name = argument[4];
    }
}

else if (argument[0] == "banner")
{
    var ele = instance_create(view_xview + 10, view_yview + o_dnet_control.top_height + o_dnet_control.scrolling_position - 2, oDnetElement);
    ele.sub = argument[1];
    ele.sprite_index = sDNETBanner;
}

else if (argument[0] == "thread") // 1 = scriptThread, 2 = sticky?
{
    // default
    threadSprite = sDNETThreadIcon;
    threadLocked = 0; 
    threadPoll = 0;
    script_execute(DnetThreads, argument[1]);
    if Dnet("clock between", "00:00", threadTime) then 
    {
        thread = instance_create(-1000, -1000, o_dnet_thread);
        thread.thread_author = threadAuthor;
        thread.thread_title = threadTitle;
        thread.sprite_index = threadSprite;
        thread.image_index = threadSub;
        thread.image_speed = 0;
        thread.thread_poll = threadPoll;
        thread.thread_link = argument[1];
        thread.locked = threadLocked;
        thread.index = string(argument[1]); // Is this used?
        if (argument_count > 2) thread.sticky = argument[2];
    }
}

else if (argument[0] == "poll") // 1 = time1, 2 = time2, 3 = poll variable, 4 = poll title
{
    if Dnet("clock between", argument[1], argument[2])
    {
        // Create poll object //
        poll = instance_create(view_xview[0] + 5, view_yview[0] + 40 + o_dnet_control.scrolling_position, o_dnet_poll);
        
        // Quest variable //
        poll.poll_variable = argument[3];
        poll.poll_variable_2 = argument[3] + string("_check");
        poll.poll_choice = scr_quest_get_state(argument[3]);
        
        // Title of the poll //
        poll.poll_title = argument[4];    
    }
}

else if (argument[0] == "poll option") // 1 = option text, 2 = option votes
{
    with (o_dnet_poll)
    {
        poll_option_text[number_of_options] = argument[1];
        poll_votes[number_of_options] = argument[2];
        number_of_options += 1;
    }
}

else if (argument[0] == "poll finalize")
{
    with (o_dnet_poll) event_user(0);
}
