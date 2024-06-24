/// Various tutorials in TNN
if argument0 = "greets" then
{
script  = "
IF body == governor | GOTO | GOVNA
GOTO | NORM

GOVNA
DIALOG | Cyber Scholar | This is NOT a classroom for the beginner. We don't answer your questions about the world. Do not think of us as your advisors...

NORM
DIALOG | Cyber Scholar | This is a classroom for the beginner. Here we answer your questions about the world. Think of us as your advisors...
";
}
if argument0 = "get_exp" then
{
script  = "
DIALOG | Cyber Scholar | Might want to go out and get some experience in the `kw`Necron 7`rt` before coming in here!
";
}
if argument0 = "wait" then
{
// TODO: what are the proper buttons for quick menu?
if global.keyinput_type == KEYINPUT_GAMEPAD then
    {
    buttoner = "Q key";
    }
else
    {
    buttoner = "GOOF button";
    }

script = "
DIALOG | Cyber Scholar | If you choose to browse a /'Menu/' during a battle by pressing the `kw`" +string(buttoner)+ "`rt`...
DIALOG | Cyber Scholar | You can take all the time you need to plan your next move without being attacked.
";
}
if argument0 = "water" then
{
script = "
DIALOG | Cyber Scholar    | This is water from a hot spring. It'll restore your vitals. Such a spring is located on `kw`Gilbert's Peak.`rt`
KNOW   | knowGilbertsPeak | 1
";
}
if argument0 = "respawn" then
{
script = "
DIALOG | Cyber Scholar | This is a `kw`Junk Pile.`rt`
DIALOG | Cyber Scholar | At Junk Piles is where you wake up after you fall in battle. You can use a /'Sleeping Bag/' or /'Tent/' to restore your vitals, but not in this game.
DIALOG | Cyber Scholar | Should you perish, you'll automatically wake up at the nearest Junk Pile, but there are some rare exceptions to this rule...
DIALOG | Cyber Scholar | Any GP, Gils, Gold, Goose Plampers, Neuro-Shekels etc. you found before your demise will remain in your pockets, same goes for your /'XP/', Gun's and Quest Progress.
DIALOG | Cyber Scholar | The game will save automatically when nothing dramatic is going on.
";
}
if argument0 = "trash" then
{
script = "
DIALOG | Cyber Scholar | Valuables are often hidden in `kw`Trash Cans`rt` like this one.
";
}
if argument0 = "vidcons" then
{
script = "
DIALOG | Cyber Scholar | Heard about `kw`Vidcons?`rt`
DIALOG | Cyber Scholar | Vidcons provide you with variety of entertainment. For example...
DIALOG | Cyber Scholar | All of them boost your /'XP/' when you unbox them.
";
}
if argument0 = "restoration" then
{
script = "
DIALOG | Cyber Scholar | Use `kw`Candies`rt` to restore your vitals. Staying inside an `kw`Utility Station`rt` will envigorate you in full.
";
}
if argument0 = "monster" then
{
script = "
DIALOG | Cyber Scholar | Ha!#Sometimes friends and foes lurk inside of trash cans!
";
}
if argument0 = "basic_buttons" then
{
// TODO: what are the proper buttons for this?
if global.keyinput_type == KEYINPUT_GAMEPAD then
    {
    buttoner_action = "Left Click";
    buttoner_cancel = "Right Click";
    buttoner_menu = "Q key";
    buttoner_pause = "Escape key";
    }
else
    {
    buttoner_action = "A button";
    buttoner_cancel = "B button";
    buttoner_menu = "C button";
    buttoner_pause = "D button";
    }
script = "
DIALOG | Cyber Scholar | Use the `kw` " +string(buttoner_action)+ "`rt` to Interact/Brast, and the `kw`" +string(buttoner_cancel)+ "`rt` to Holster/Skip. Check out the Quick Menu with the `kw`" +string(buttoner_menu)+ "`rt` and the Pause Menu with the `kw`" +string(buttoner_pause)+ ".`rt`
";
}
if argument0 = "chocobo" then
{
script = "
DIALOG | Cyber Scholar | Wanna know how to ride a Gwagladoodril?
DIALOG | Cyber Scholar | Me too...
";
}
if argument0 = "shops" then
{
script = "
DIALOG | Cyber Scholar | When buying jerkins and gun's you'll see some symbols and numbers next to them:
DIALOG | Cyber Scholar | Triangles pointing upwards indicate superiority.
DIALOG | Cyber Scholar | Triangles pointing downwards indicate inferiority.
DIALOG | Cyber Scholar | The /'=/' symbol indicates equality.
";
}
if argument0 = "dodge" then
{
script = "
DIALOG | Cyber Scholar | During a battle, use your dodge move to get out of harm's way.
";
}
if argument0 = "zauber" then
{
script = "
DIALOG | Cyber Scholar | When using a zauber, use your Gun's Aim to dictate the zaub's movement.
DIALOG | Cyber Scholar | Some zauber's don't require you to aim though.
";
}
if argument0 = "periodic" then
{
script = "
DIALOG | Cyber Scholar | A full meter near the center of your HUD means that a `kw`Periodic Shot`rt` is the next thing brasting out of your currently selected gun's.
DIALOG | Cyber Scholar | There are many, many different ways to increase the meter. Try to figure them out on your own!  
";
}
if argument0 = "run" then
{
script = "
DIALOG | Cyber Scholar | Run from some battles using your swift movements and acrobatic skills. You don't have to fight everything, you know.
DIALOG | Cyber Scholar | Some would go as far as to say that you don't have to fight anything, but I'm not so sure about that...
";
}
if argument0 = "damage" then
{
script = "
DIALOG | Cyber Scholar | Damage is more severe when your defenses are low! 
DIALOG | Cyber Scholar | Use a proper Jerkin and keep your Piety strong to increase your defenses.
";
}
if argument0 = "back_row" then
{
script = "
DIALOG | Cyber Scholar | In the back row, damage and attack power are halved. In some other games, that is.
";
}
if argument0 = "numbers" then
{
script = "
DIALOG | Cyber Scholar | White numbers appearing during a battle are damage indicators. Green numbers are recovery indicators.
DIALOG | Cyber Scholar | All elemental forces also have their own colors and damage indicators. 
";
}
if argument0 = "ailments" then
{
script = "
DIALOG | Cyber Scholar | Strange effects and icons and what have you appearing near a person indicate a status ailment.
DIALOG | Cyber Scholar | Status ailments pass over time and when visiting an Utility Station.
";
}
if argument0 = "utility" then
{
script = "
DIALOG | Cyber Scholar | Utility Stations like this one are all around Necron 7. Inside is where you can `sq`reload your gun's`rt`, or `sq`smelt the gun's you don't want.`rt`
DIALOG | Cyber Scholar | Also `sq`breed gun's`rt` and `sq`promote your gun's`rt` so you can use them in your `kw`Bandolier.`rt`
DIALOG | Cyber Scholar | Click around in there but don't say I didn't warn you.
";
}
if argument0 = "ailment_list" then
{
script = "
DIALOG | Cyber Scholar | Do you want to know about status ailments?
CHOICE | Learn about status ailments?
REPLY  | LEARN_YES | Yes.
REPLY  | LEARN_NAY | No.

LEARN_YES
DIALOG | Cyber Scholar | Which ailment would you like to learn about?
CHOICE | Ailments to learn about:
REPLY  | AIL_DEMISE   | Demise
REPLY  | AIL_STAGGER  | Stagger
REPLY  | AIL_BURN     | Burn
REPLY  | AIL_ADHESIVE | Adhesive
REPLY  | AIL_NARY     | Nary ye mind...

AIL_DEMISE
DIALOG | Cyber Scholar | When your body is overcome by grave injuries you will succumb into your demise. What this means is that you will lose control over your character until you are awakened once more.
DIALOG | Cyber Scholar | You typically wake up at the nearest `kw`Junk Pile,`rt` but I have heard that there are exceptions to this rule. If you constantly, repeatedly keep succumbing to your demise then your designated Junk Pile might be located in a less hostile area.
DIALOG | Cyber Scholar | They say there are other exceptions to this rule, and that a mysterious cabal known as the Junk Lords have some great plan for fallen youngsters.
DIALOG | Cyber Scholar | It is best to avoid your demise altogether.
GOTO   | LEARN_YES

AIL_STAGGER
DIALOG | Cyber Scholar | Sometimes you can become overwhelmed by damage or a strong blow to the face. This means that you've become staggered and can not perform actions for a second or so.
DIALOG | Cyber Scholar | Your foes can also become staggered.
GOTO   | LEARN_YES

AIL_BURN
DIALOG | Cyber Scholar | When coming into contact with fire you might start to burn. If that happens you will continously lose your hitpoints for a short amount of time.
GOTO   | LEARN_YES

AIL_ADHESIVE
DIALOG | Cyber Scholar | If you detect a red circle of triangles expanding from your feet then that means that you have Adhesive applied to your shoes. During this ailment your movement speed is demolished.
GOTO   | LEARN_YES

AIL_NARY
EXIT |

LEARN_NAY
EXIT |
";
}
if argument0 = "glamp" then
{
script = "
DIALOG | Cyber Scholar | Do you know about `sq`GLAMP?`rt`
DIALOG | Cyber Scholar | It stands for `kw`G`rt`uts, `kw`L`rt`uck, `kw`A`rt`crobatics, `kw`M`rt`ight and `kw`P`rt`iety.
DIALOG | Cyber Scholar | `kw`Guts`rt` governs the state of your vitals. The more Guts you have, the more beatings you can withstand.
DIALOG | Cyber Scholar | `kw`Luck`rt` governs the quality of your lucky breaks. The more Luck you have, the better chances you have of receiving something really good.
DIALOG | Cyber Scholar | `kw`Acrobatics`rt` governs the swiftness of your limbs. The more Acrobatics you have, the faster you can move and aim and dodge.
DIALOG | Cyber Scholar | `kw`Might`rt` governs the size of your muscles. The more Might you have, the heavier loads you can carry without a problem.
DIALOG | Cyber Scholar | `kw`Piety`rt` governs the strength of your convictions. The more Piety you have, the stronger are your Zaubers and your resistance to elemental forces.
";
}
