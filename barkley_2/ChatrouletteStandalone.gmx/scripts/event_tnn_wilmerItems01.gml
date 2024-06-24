script = "
IF body == matthias | GOTO | MATTHIAS
IF body == governor | GOTO | GOVERNOR
IF wilmerItemsTaken == 0 | GOTO | FIRST
IF wilmerItemsTaken == 1 | GOTO | SECOND

MATTHIAS
IF wilmerItemsTaken == 0 | DIALOG | Matthias | (It's Mr. Wilmer's possessions he wanted me to have... I want them but I don't think Matthias has the manual dexterity to get it... how did I even get in through the door?)
IF wilmerItemsTaken == 1 | DIALOG | Matthias | (This is where Mr. Wilmer used to keep his stuff...)

GOVERNOR
IF wilmerItemsTaken == 0 | DIALOG | Governor Elagabalus | (Mr. Wilmer's things... I should grab these later.)
IF wilmerItemsTaken == 1 | DIALOG | Governor Elagabalus | (This is where Mr. Wilmer used to keep his stuff...)

FIRST
DIALOG | P_NAME | (It's the stuff Mr. Wilmer wanted me to take. Let's see...)
NOTE   | take   | Wilmer's Amortization Schedule
NOTIFY | Got Wilmer's Amortization Schedule.
DIALOG | P_NAME | (This funny looking paper seems like Mr. Wilmer's bill.)
BREAKOUT | add  | money
DIALOG | P_NAME | (There's a bunch of neuro-shekels here...)
QUEST  | money += @money_wilmerMortgage@
DIALOG | P_NAME | (...@money_wilmerMortgage@ for the mortgage...)
QUEST  | money += @money_wilmerMortgageBonus@
DIALOG | P_NAME | (...@money_wilmerMortgageBonus@ for my allowance.)
BREAKOUT | CLEAR
EVENT  | o_obj_wilmergun01 | 0 // You get the recipe, guns, and candies here
NOTIFY | Got Wilmer's Gun (WILM)!
DIALOG | P_NAME | (I bet Mr. Wilmer brasted a lot in his day...)
NOTIFY | Filled pockets with Butterscotch!
DIALOG | P_NAME | (I'll need a lot of these candies if I get hungry later...)
NOTIFY | Got Butterscotch Recipe!
DIALOG | P_NAME | (Maybe I can use this recipe somewhere to make more candies...)
WAIT   | 1
DIALOG | P_NAME | (That's everything. I think I'm good to go.)
QUEST  | wilmerItemsTaken = 1

SECOND
DIALOG | P_NAME | (Looks like I looted this table good'n'proper. Nothing left to loot.)
";
