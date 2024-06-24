/// DnetPost(time, user, text, quote1, text2, quote2, "warning") 
var postTime = DnetAddTime(threadTime,argument[0]);
if Dnet("clock between", "00:00", postTime) then ///argument[0]) then 
{
    // Create post object //
    post = instance_create(view_xview + 10, view_yview + o_dnet_control.top_height + o_dnet_control.scrolling_position, o_dnet_post);
    
    // Fill in the post data //
    //DnetUser(false, argument[1]);
    post.post_text = argument[2];
    
    // FILL UP POST WITH USER DATA //
    
    post.post_name = argument[1];
    post.post_signature = DnetUsers("signature", argument[1]);
    post.post_avatar = DnetUsers("sprite", argument[1]);
    post.post_avatar_image = DnetUsers("sub", argument[1]);
    post.post_avatar_min = DnetUsers("sub", argument[1]);
    post.post_avatar_max = DnetUsers("sub", argument[1]);
    post.post_postcount = DnetUsers("posts", argument[1]);
    post.post_pips = DnetUsers("pips", argument[1]);
    var status = DnetUsers("status", argument[1]);
    if (status == 2) post.moderator = 1;
    if (status == 3) post.banned = 1;
    if (status == 1) post.post_primo = 1;
    post.user_status = status;
    
    // Optional parts //
    if argument_count >= 4 then post.post_quote = argument[3];
    if argument_count >= 5 then post.post_text_2 = argument[4];
    if argument_count >= 6 then post.post_quote_2 = argument[5];
    if argument_count >= 7 then post.post_warning = argument[6];
    
    // Timestamp //
    Dnet("timestamp", postTime);
    
    // Calculate height of post //
    with post event_user(0);
    
    // Tone changer //
    if global.dnet_color_variation = true then global.dnet_color_variation = false;
    else global.dnet_color_variation = true;
}
