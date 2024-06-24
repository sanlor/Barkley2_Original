// event_zzz_ITEM_TEST()
script = "
GOTO | MAIN

MAIN
CHOICE | What do you want?
REPLY  | FRUIT  | Give me one Fruit Basket.
REPLY  | CHECK  | Tell me how many Fruit Basket's I have.
REPLY  | DOUBLE | See if I have 2 Fruit Baskets.
REPLY  | LEAVE  | Leave.

FRUIT
ITEM   | Fruit Basket | 1
DIALOG | P_NAME | I gained 1 Fruit Basket! 
GOTO | MAIN

DOUBLE
IF @Fruit Basket@ >= 2 | GOTO | TAKE
DIALOG | P_NAME | I don't have 2 Fruit Basket's...
GOTO | MAIN

TAKE
ITEM   | Fruit Basket | -2
DIALOG | P_NAME | I gave 2 Fruit Basket's.
GOTO | MAIN

CHECK
DIALOG | P_NAME | I have @item_Fruit Basket@ Fruit Basket(s).
GOTO | MAIN

LEAVE
EXIT |
";

exit;

script =
"
DIALOG | P_NAME = s_port_sadface | Hello.
NOTE | select | milagros
IF note == Pet Manifesto | DIALOG | Test | Yes, this is it...
IF note != Pet Manifesto | DIALOG | Test | I only want the Pet Manifesto.
";

exit;
script = "
ITEM   | Bomb  | 1
NOTIFY | Got a bomb!
";

script = "
DIALOG | @duergar_burglecut@ | Hello.
";

script = "
DIALOG | P_NAME | Hello.
CHOICE | Give Babo @money_wilmerMortgageBonus@ shekels?
REPLY  | YES | Yes.
REPLY  | NO  | No.

YES
QUEST  | money -= @money_wilmerMortgageBonus@

NO
DIALOG | P_NAME | Go to hell...
";
