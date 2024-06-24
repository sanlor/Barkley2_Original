script = "
IF body == matthias | GOTO | MATTHIAS
IF body == governor | GOTO | GOVERNOR
IF ludwigState == 0 | GOTO | LUDWIG0
IF ludwigState == 1 | GOTO | LUDWIG1
IF ludwigState == 2 | GOTO | LUDWIG2
IF ludwigState == 3 | GOTO | LUDWIG3
GOTO | LUDWIG4

MATTHIAS
DIALOG | Ludwig | ...

GOVERNOR
DIALOG | Ludwig | ...

LUDWIG0
DIALOG | Ludwig | I'm surprised you aren't tired of talking with me yet.
DIALOG | Ludwig | Not that I have anything against you, I really like talking with you. I'm fortunate you're even talking to me. It's just...
DIALOG | P_NAME | Excuse me, have we met before?
DIALOG | Ludwig | Yeah... yeah, we met before. You really don't remember me?
DIALOG | P_NAME | ... no.
DIALOG | Ludwig | Just as well. I'd hate to mess up your life any more than I already have...
DIALOG | Ludwig | Thanks for talking with me as long as you have. It means a lot that you tried.
QUEST  | ludwigState = 1

LUDWIG1
DIALOG | P_NAME | What do you mean we've met before? I don't think I know you.
DIALOG | Ludwig | I... that's unfortunate to hear. I was really hoping you'd remember me.
DIALOG | P_NAME | What?
DIALOG | Ludwig | Nevermind.
DIALOG | P_NAME | So have we met before?
DIALOG | Ludwig | Does it matter? It's probably clear by now that we aren't capable of having a meaningful conversation.
DIALOG | P_NAME = s_port_hoopzSad | Um, I guess so.
QUEST  | ludwigState = 2

LUDWIG2
DIALOG | Ludwig | I'm pretty sure I've never seen you before. I know it's not terribly pertinent, but I thought you should know. I don't want you thinking that I'm just some old friend who doesn't really care. I don't really know what I am, but I know I wouldn't do that.
DIALOG | P_NAME | Yeah that's what I was saying! We've never met before!
DIALOG | Ludwig | What? No you didn't.
DIALOG | P_NAME | That's what I've been saying all along.
DIALOG | Ludwig | I... No, you're just trying to trick me.
DIALOG | P_NAME | Why would I trick you?
DIALOG | Ludwig | I'm an Eintag Dwarf. I'm very valuable. Supposedly, anyway... I don't know if that's still the case...
DIALOG | P_NAME | What does that mean?
DIALOG | Ludwig | I'm not sure how to say this. You're the only person I've ever spoken to...
DIALOG | Ludwig | Eintag Dwarfs either live for one day or for an infinite amount of days. There's no in between. We begin existing, and our life belongs to the first person we speak to. Most people are cruel and just use us for servitude, sometimes worse. Others are more benevolent, give us permission to live our own lives.
DIALOG | P_NAME | I don't really understand.
DIALOG | Ludwig | It's difficult to describe. We have many traits, most of which we aren't aware of until we're a little older, if we even get that far. The parameters of every Eintag Dwarf's life is different from the next.
DIALOG | P_NAME | But you said one day or an infinite amount of days. What does that mean?
DIALOG | Ludwig | Most of us just pass by the people to whom we belong. We don't have very much time to find the person, and we need to establish some sort of bond with them, or our time will be up, and our existence will be forfeit.
DIALOG | P_NAME = s_port_hoopzHappy | Oh! So that's me? I can help you?
DIALOG | Ludwig | I don't know if you can help me. Eintag Dwarfs have a different perception of spatial reality than other people, even other Dwarfs. We're born knowing quite a few things, but aren't always on the proper spatial trajectory to do anything about it. Most of us just fade away.
DIALOG | P_NAME | How can I help you, then? We're friends! I don't want to make you a slave, I just want to see you live your own life. I'd hate to see you just fade away.
DIALOG | Ludwig = s_port_ludwig_happy | Really?
DIALOG | P_NAME = s_port_hoopzHappy | Definitely!
DIALOG | Ludwig | Thanks... I'm not sure if our lives share the same trajectory. The things you've said to me thus far suggest this. You may not be able to help me, even if you want to.
DIALOG | P_NAME | What do I need to do?
DIALOG | Ludwig | Ask me to come with you.
DIALOG | P_NAME | Where?
DIALOG | Ludwig | Anywhere. Away. Not here. I'll die if I stay here. If I can hear you ask me this again I'll know it is possible, if we're going in the same direction.
DIALOG | P_NAME | Okay then...
QUEST  | ludwigState = 3
GOTO   | LUDWIG3

LUDWIG3
CHOICE | Invite Ludwig to accompany you?
REPLY  | YES | Sure! Join my party!
REPLY  | NO  | Not right now, sorry.

YES         
DIALOG | P_NAME | Please, I need you to come with me.
DIALOG | Ludwig | What?
DIALOG | P_NAME | Come on, let's go. I want to help you.
DIALOG | Ludwig | I don't understand. Go where?
DIALOG | P_NAME | Anywhere. Away. Not here. You told me this is what you wanted.
DIALOG | Ludwig | I told you, I don't know who you are! I didn't say these things!
DIALOG | P_NAME | Yes, you do. We just talked! You told me all about you!
DIALOG | Ludwig | No, I've only just seen you! I don't understand this!
DIALOG | P_NAME = s_port_hoopzSurprise | Please, let me help you!
DIALOG | Ludwig | I don't understand! What's going on?!
DIALOG | P_NAME = s_port_hoopzSad | ...
QUEST  | ludwigState = 4

NO
DIALOG | P_NAME | I'm sorry I don't think you can come with me right now.  I have a Cyberdwarf AND a destiny to discover.
DIALOG | Ludwig | What?
DIALOG | P_NAME | I feel bad though, because want to help you.
DIALOG | Ludwig | Help me how?
DIALOG | P_NAME | You just said you wanted to get out of here.
DIALOG | Ludwig | Um, not sure what you are talking about but if you could please give me some space.
DIALOG | P_NAME = s_port_hoopzSurprise | You know me! We just talked! You told me all about you!
DIALOG | Ludwig | No, I've only just seen you! I don't understand this!
DIALOG | P_NAME = s_port_hoopzSurprise | Please, let me help you!
DIALOG | Ludwig | I don't understand! What's going on?!
DIALOG | P_NAME = s_port_hoopzSad | ...
QUEST  | ludwigState = 4

LUDWIG4
DIALOG | Ludwig = s_port_ludwig_happy | Hi, I'm Ludwig! I was just born.
DIALOG | P_NAME | You... You don't remember me?
DIALOG | Ludwig = s_port_ludwig_happy | How can I remember you when I was just born?
DIALOG | P_NAME | We were just talking. You told me to ask you to come with me.
DIALOG | Ludwig = s_port_ludwig_happy | I'm pretty sure I didn't do that! I was just born this very minute!
DIALOG | Ludwig = s_port_ludwig_happy | It's pretty exciting to be alive. I know a lot of things. I'm just starting to be aware of it all.
DIALOG | P_NAME | Isn't there anything I can do to make you come with me?
DIALOG | Ludwig = s_port_ludwig_happy | What? That's a curious thing to say.
DIALOG | P_NAME | You don't remember speaking to me?
DIALOG | Ludwig | I'm sorry, I don't. Are you all right?
DIALOG | P_NAME = s_port_hoopzSad | I don't think so...
DIALOG | Ludwig | I'm sorry.
DIALOG | P_NAME | I...
DIALOG | Ludwig | What?
DIALOG | P_NAME | ... I don't know. Ludwig, I...
PLAYSET| o_ludwig01 | disappear | gone
WAIT   | 2
EVENT  | o_ludwig01 | 0
DIALOG | P_NAME = s_port_hoopzSad | ...
QUEST  | ludwigState = 5
";
