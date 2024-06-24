/// scr_vrw_message()
/// Generates a message for VRW
ali = choose("Holy", "DoGood", "Vengeful", "Wicked");
cla = choose("Croupier", "Jobber", "Cobbler", "Roofer");
tea = ali + " " + cla;
it0 = choose("pop cream", "dig juice", "bark", "glue");
it1 = choose("mud boot", "wap bap", "leather", "tin can");
loc = choose("Tomb of Gorfald", "Popper's Burrow", "Mud Mountain", "Easy Street", "The Grapevine");
num = string(ceil(random(50)));
var msg = choose(
choose("Hi", "Hey", "Hello", "Sup", "Selam", "Greets", "Meets", "Salutations", "hell;o[", "ho", "hep", "hep ho"),
choose("argh popper ruin my score", "i slayed " + num + " popper", "I kill Popper's with great ease.", "popper dead", "popper down", "bap popper now", "Time to Bap some Popper's..."),
choose("where " + string_lower(loc), "how to goto " + string_lower(loc), "Where is " + loc + "?", "I found " + loc + "!"),
choose("i hat u", "i hate you", "gor to hell", "get out of here", "Go away!", "Scram you whelp!", "I dislike you strongly."),
choose("tx", "thx", "thnks", "thanx", "thanks", "Thanks.", "Thank you!", "Wow, thanks so much!"),
choose("mub boot?", "ne1 hav mud boot?", "Anyone have mud boots?"),
choose("bonus time?", "where is does bonus", "When does the bonus start?"),
choose("trade " + it0 + " for " + it1 + "?", "where to get " + choose(it0, it1) + "?", "Anyone have " + it0 + "?"),
choose("team up " + string_lower(tea) + "?", "any " + string_lower(tea) + " to raid?", "Looking for a " + tea + "."),
choose("milk bar = scam", "wow!!! milk bar rip me off!!!", "The Milk Bar is a rip-off!"),
choose("GO TO ******.** AND SIGN UP", "visit my page *****.***.**", "Here's my page: ******.***"),
choose("WHERE IS " + scr_vrw_username() + "!", "where did " + scr_vrw_username() + " go", "Hey, does anyone know " + scr_vrw_username() + "?"),
choose("suiwrb", "4378bhfnk", "4r58hfbh2", "7ajhhagdjh", "asdfasfsagd", "wqerwerwwe", "tu8jgn a as", "bn nr089h", "gjg4jgnnb", "3tj3jgjnkjr", "gorhjito", "gjugi84h", "sdfsadfoj")
);
return choose(string_lower(msg), msg, string_upper(msg));
