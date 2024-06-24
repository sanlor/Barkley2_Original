/// dsl_ppdt_zigomar01()
/// The plot thickens
script = "IF zigomarState == 4 | GOTO | AFTERMATH
IF zigomarState == 3 | IF room == r_pdt_eelThrone01 | GOTO | ZIGO_DETECTIVES_GONE

ZIGO_DETECTIVES_GONE
FRAME  | CAMERA_NORMAL | o_cinema0
WAIT   | 0
MOVETO | o_cts_hoopz | o_cinema1 | MOVE_NORMAL
WAIT   | 1
DIALOG | Zigomar the Eelskin | Ah, yes. The mysteriouse youngster. I was hoping you'd pay a visit. You have done me a great service.
WAIT   | 0
DIALOG | P_NAME              | Huh? What are you talking about? 
DIALOG | Zigomar the Eelskin | `w1`Bwahahaha...`w0` Let's just say that when `kw`The Fox`rt` is away the eels dance on the table. `sq`The Unholy Alliance`rt` between `kw`The Eel,`rt` `sq`The Wolf`rt` and `mq`The Doctor`rt` has succeeded.
DIALOG | P_NAME              | What? That didn't make a lick of sense. Just exactly who are you?
DIALOG | Zigomar the Eelskin | Who? I am Zigomar the Eelskin. Do you not see what is clearly in front of your eyes? Look, youngster! The `kw`Throne of Eels`rt` is here, and it is now all mine! For many moons I have subtly influenced these foolish dwarfs to dig this ancient throne out of the earth where it was sealed away so long ago. It will act as the seat of power for my `kw`Crime Syndicate.`rt` `w1`Bwahahahaha...`w0`
DIALOG | P_NAME              | Crime syndicate?
DIALOG | Zigomar the Eelskin | Yes. The `kw`Z Crime Syndicate.`rt` All these `kw`mindless goons`rt` are now my loyal subjects. I will use them and many others to expand my influence throughout the galaxy. The deepstate sent it's operatives, but thanks to you and my secret agent their plans have been thwarted! Even the members of the fabled `sq`Q.U.A.N.T.U.M. A.T.W.O.O.D.Y.`rt` are no match for me now.
KNOW   | knowAtwoody | 1
SURPRISEAT | o_pdt_zigomar01
WAIT   | 0.4
DIALOG | P_NAME = s_port_hoopzShock | Wait a minute! Are you saying you are a bad guy? 
DIALOG | Zigomar the Eelskin | `w1`Hah!`w0` I do not dable in such shallow concepts as good and evil, and neither should you. 
LOOKAT | o_cts_hoopz | o_pdt_zigomar01
CHOICE | B-but...
REPLY  | BUT_TREASURE | What about the treasure?
REPLY  | BUT_AGENT    | Who is this secret agent?

BUT_TREASURE
DIALOG | P_NAME              | But what about the treasure? The symbols on the walls? Was that all just a load of bologna?
DIALOG | Zigomar the Eelskin | Oh you poor fool... Did you really think El Zorro made all those carvings? His initials are `kw`EZ,`rT` not `sq`Z.`rt` Z stands for Zigomar! `w1`Bwahahaha!`w0` That is the brilliance of it, my little elver. The answer was hidden in plain sight all this time.
DIALOG | P_NAME              | W-what do you mean? What was the point of any of this?
DIALOG | Zigomar the Eelskin | `w1`Hahaha...`w0` There is no reason to discuss this with you any further. I can already see that `kw`my brilliance`rt` is lost on you. But as for the treasure, you shall have your reward for a job well done.
GOTO   | PLOT_CONCLUDED

BUT_AGENT
DIALOG | P_NAME              | Who is this secret agent you mentioned?
DIALOG | Zigomar the Eelskin | `w1`Bwahahaha...`w0` There were two agents, young elver. You, the unwitting agent... and `sq`Pocahontas,`rt` the secret agent.
DIALOG | P_NAME              | What...? I don't understand any of this.
DIALOG | Zigomar the Eelskin | `w1`Hahaha...`w0` Plans within plans, my friend. But there is no reason to discuss this with you any further. I can already see that `kw`my brilliance`rt` is lost on you. But as for the treasure, you shall have your reward for a job well done.
GOTO   | PLOT_CONCLUDED

PLOT_CONCLUDED
DIALOG | Zigomar the Eelskin | Here, take this. I believe this will more than make up for any... inconveniences you had to suffer.
WAIT   | 0.25
USEAT  | o_pdt_zigomar01
WAIT   | 0.4
// TODO reward here
DIALOG | P_NAME              | Uhh... Okay...
DIALOG | Zigomar the Eelskin | Use it wisely... Now then, I think we are done here. My loyal servants will show you the way out.
QUEST  | zigomarState = 4
FADE   | 1 | 1
WAIT   | 1
LOOK   | o_cts_hoopz | SOUTH
Teleport | r_pdt_katzenKave01 | 320 | 272 | 1 

AFTERMATH
FADE   | 0 | 1
WAIT   | 2
DIALOG | P_NAME | I... I'm so confused.
WAIT   | 0.75
DIALOG | P_NAME | Zigomar the Eelskin, Pocahontas the secret agent, deepstate operatives, crime syndicates and the treasure of El Zorro. It's all just... too much. I don't get it.
QUEST  | zigomarState = 5
";
