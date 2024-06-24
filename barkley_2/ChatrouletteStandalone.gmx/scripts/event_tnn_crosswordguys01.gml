script = "
IF body == matthias    | GOTO | MATTHIAS
IF body == governor    | GOTO | GOVERNOR
IF crosswordQuest == 0 | GOTO | CROSSWORD0
IF crosswordQuest == 1 | GOTO | CROSSWORD1
IF crosswordQuest == 2 | GOTO | CROSSWORD2
GOTO | CROSSWORD3

MATTHIAS
DIALOG | Ernstig Van De Drol | Oh, Matthias!!! G'day!! That is the expression of greeting you are always saying!!
DIALOG | Altijd Poepen       | G'day good friend Matthias!! We are saying it too!!
DIALOG | Matthias            | You hit the nail right on the head all right! You found me, good old Matthias!!
DIALOG | Ernstig Van De Drol | Please, Matthias!!! We are stuck on the uitwerpselening!!! Only you can save us!!!
DIALOG | Altijd Poepen       | You are the only savior Matthias!!! Please help with the puzzle!!!!
DIALOG | Matthias            | Oh, uh.....let me have a look here._._._._uh, I can't really see too good.....
DIALOG | Matthias            | Hey, I know!!! Why not try my name in the puzzle! Matthias!!! I bet my name is in the puzzle somewhere!! You guys just found me, I bet you can find me in the puzzle too!! I bet as long as you remember the name Matthias you'll solve the puzzle in no time.
DIALOG | Ernstig Van De Drol | Oh, Matthias!!! Hello!!
DIALOG | Altijd Poepen       | Oh, Matthias!!! Hello!!
DIALOG | Ernstig Van De Drol | .......
DIALOG | Altijd Poepen       | .......
DIALOG | Ernstig Van De Drol | This is the worst advice for uitwerpselening.
DIALOG | Altijd Poepen       | Of all advice for uitwerpselening, this is the worst.
DIALOG | Ernstig Van De Drol | That's our Matthias!!! You always know how to cheer us up!!! Of all players of uitwerpselening you are almost as bad as we are!!!!
DIALOG | Altijd Poepen       | Three cheers for Matthias!! Almost worst uitwerpselening player ever!! Master at cheering up uitwerpselening players Altijd and Ernstig.
DIALOG | Matthias            | Thank you. All in a day's work for good friend Matthias.
DIALOG | Ernstig Van De Drol | That Matthias is some guy....
DIALOG | Altijd Poepen       | Yes. Some guy, that Matthias....

GOVERNOR
DIALOG | Ernstig Van De Drol | The governor!!! Please, Governor!! Do not arrest us for our uitwerpselening!!! We love to play the uitwerpselening more than money or life!!!
DIALOG | Altijd Poepen       | Please, Governor, do not imprison us for the game we love more than most!!! Do not make uitwerpselening the thing you arrest us for!!!
DIALOG | Governor Elagabalus | Hello! I am the Governor. I have decided that today is official uit...___werp...___day... Uh._._._tell all your family and friends that I am the Governor and that I have said all these things. Thank you.   

CROSSWORD0
DIALOG | P_NAME              | What's wrong with you guys, you look pretty sad.
DIALOG | Altijd Poepen       | Hi! We are uitwerpselening. Dwarfs love uitwerpselening.
DIALOG | Ernstig Van De Drol | Yes, that's right! Dwarves love uitwerpselening.
DIALOG | P_NAME              | What's that? I don't know what that is.
DIALOG | Ernstig Van De Drol | Uitwerpselening.
DIALOG | Altijd Poepen       | Uitwerpselening. It's a game we play. You have to find the words from the other words.
DIALOG | Ernstig Van De Drol | It is very difficult.
DIALOG | Altijd Poepen       | The one weakness of Dwarves is Uitwerpselening.
DIALOG | Ernstig Van De Drol | We are not good at Uitwerpselening.
DIALOG | P_NAME              | Is it like B-Ball? That's my favorite game.
DIALOG | Altijd Poepen       | I do not know. I have never tried Uitwerpselening with a basketball hoop.
DIALOG | Ernstig Van De Drol | I want to uitwerpselening with a basketball hoop.
DIALOG | P_NAME              | So how do you play it? Can I try?
DIALOG | Ernstig Van De Drol | It is very difficult. We have spent months on this Uitwerpselening. You will spend many more months on this.
DIALOG | Altijd Poepen       | Yes, it is very difficult. You take the words, and find the hidden secret word, and need to fit it into the boxes of words.
DIALOG | Ernstig Van De Drol | I cannot find the secret word. I am not good at Uitwerpselening.
DIALOG | Altijd Poepen       | He cannot find the secret word. He will never find the secret word.
DIALOG | P_NAME              | What, is it like a Crossword puzzle?
DIALOG | Ernstig Van De Drol | Cross-word?
DIALOG | Altijd Poepen       | Yes, Crossword Puzzle is the other word for Uitwerpselening.
DIALOG | Ernstig Van De Drol | I would like to Uitwerpselening on a Crossword Puzzle.
DIALOG | P_NAME              | I like puzzles. Can I help?
DIALOG | Ernstig Van De Drol | You will not find the secret word. It is a hidden secret.
DIALOG | Altijd Poepen       | We have spent many weeks on this hidden word. We would like you to try to find it!
DIALOG | Ernstig Van De Drol | I challenge you to find the hidden word you will not find.
DIALOG | Altijd Poepen       | Yes! We propose to you the Uitwerpselening you will not find.
QUEST  | crosswordQuest = 1
GOTO   | GAME

GAME
CHOICE | Should I play?
REPLY  | YES | Let's do this.
REPLY  | NO  | Not now.

YES
DIALOG | P_NAME              | I was born ready for this. Game time.
DIALOG | Ernstig Van De Drol | He is very serious at Uitwerpselening.
DIALOG | Altijd Poepen       | I like people who are serious about Uitwerpselening.
DIALOG | P_NAME              | Lay it on me.
DIALOG | Ernstig Van De Drol | Ok!
DIALOG | Altijd Poepen       | Yes! It is a four-letter word.
DIALOG | Ernstig Van De Drol | This is the mystery question. This is not the answer. We do not know the answer.
DIALOG | Altijd Poepen       | Yes, this is the question. We do not know the answer.
DIALOG | Ernstig Van De Drol | The answer is hidden.
DIALOG | Altijd Poepen       | Yes, it is a secret. We cannot find it.
DIALOG | Ernstig Van De Drol | Dwarfs are not skilled in Uitwerpselening.
DIALOG | Altijd Poepen       | A four letter word. It is a gemstone.
DIALOG | Ernstig Van De Drol | It says pretty gemstone.
DIALOG | Altijd Poepen       | It is the pretty red gemstone.
DIALOG | Ernstig Van De Drol | We have located the three secret letters.
DIALOG | Altijd Poepen       | Yes, three have been discovered. They are no longer hidden.
DIALOG | Ernstig Van De Drol | We can give them to you.
DIALOG | Altijd Poepen       | It is written down here.
DIALOG | P_NAME              | OK, let me take a look.
WAIT   | 2
DIALOG | P_NAME              | R\U\-\Y
DIALOG | Altijd Poepen       | RU-Y
DIALOG | Ernstig Van De Drol | The blank does not count as letter. It means hidden.
DIALOG | Altijd Poepen       | Yes, it is still hidden. Please find the letter.
DIALOG | Ernstig Van De Drol | Can you find the letter?
DIALOG | P_NAME              | Let's see.....Pretty Red Gemstone.....Four letters.....R...U...blank...Y...
CHOICE | What do I choose?
REPLY  | WRONG | RUZY
REPLY  | WRONG | RUFY
REPLY  | WRONG | RUNY
REPLY  | WRONG | RURY
REPLY  | RIGHT | RUBY
REPLY  | WRONG | RU[Y
REPLY  | WRONG | RU%Y
REPLY  | WRONG | RU*Y
REPLY  | WRONG | RUXY
REPLY  | WRONG | RU?Y

WRONG
DIALOG | Ernstig Van De Drol | I do not think he has solved the Uitwerpselening.
DIALOG | Altijd Poepen       | No, the Uitwerpselening is still hidden. I tried this letter.
DIALOG | Ernstig Van De Drol | The word was still hidden.
DIALOG | Ernstig Van De Drol | He tried it before.
DIALOG | Ernstig Van De Drol | You didn't find it.
DIALOG | P_NAME              | Aw, shucks.
DIALOG | Altijd Poepen       | Do not be sad! It was fun Uitwerpselening with you.
DIALOG | Ernstig Van De Drol | I would have enjoyed more the good Uitwerpselening though.
DIALOG | Altijd Poepen       | Yes, you are forever cursed as bad Uitwerpselening too.
DIALOG | Ernstig Van De Drol | Cursed forever.
DIALOG | Altijd Poepen       | This puzzle will never be solved.
DIALOG | Ernstig Van De Drol | Come play bad Uitwerpselening with us again!
DIALOG | Altijd Poepen       | Yes, play Uitwerpselening again one day. We love bad Uitwerpselening players.
QUEST  | crosswordQuest = 2

RIGHT
DIALOG | Ernstig Van De Drol | What...
DIALOG | Altijd Poepen       | How...
DIALOG | Ernstig Van De Drol | You...
DIALOG | P_NAME              | Did I get it right?
DIALOG | Ernstig Van De Drol | He....solved......
DIALOG | Altijd Poepen       | You solved the Uitwerpselening!!!
DIALOG | P_NAME              | Hey, cool! I'm not so bad at this.
DIALOG | Ernstig Van De Drol | You are the best at Uitwerpselening.
DIALOG | Altijd Poepen       | I am the 18-time Dwarf Uitwerpselening champion. I was called /'Grandmaster of Uitwerpselening Altijd Poepen/'. It said /'Grandmaster of Uitwerpselening Altijd Poepen/' on my Uitwerpselening trophy. Now I am not the Grandmaster.
DIALOG | Ernstig Van De Drol | P_NAME  is the new Grandmaster.
DIALOG | Altijd Poepen       | I miss being the Grandmaster.
DIALOG | Ernstig Van De Drol | Here is your prize for being Grandmaster of Uitwerpselening!!!
QUEST  | money += @money_crosswordMaster@
NOTIFY | Got @money_crosswordMaster@ neuro-shekels!
DIALOG | P_NAME              | Thanks!
DIALOG | Ernstig Van De Drol | I want to be serious Cross Word Puzzles player like P_NAME.
DIALOG | Altijd Poepen       | No. Dwarves can never be serious Crossword Puzzles player. It is our weakness. It is our curse. Forever bad at Crossword Puzzles.
DIALOG | Ernstig Van De Drol | Doomed to bad Cross Word Puzzles playing.
DIALOG | Altijd Poepen       | Maybe P_NAME can show us good Crossword Puzzles playing?
DIALOG | Ernstig Van De Drol | Yes! Please Uitwerpselening again one day!!
DIALOG | Altijd Poepen       | You must Uitwerpselening again! Always be the Uitwerpselening Grandmaster P_NAME!!!
DIALOG | P_NAME              | This was fun. I'll play with you guys again sometime.
QUEST  | crosswordQuest = 3

NO
DIALOG | P_NAME              | I think I need to practice my skills a little more before I try this. I don't want to fail my first time out.
DIALOG | Ernstig Van De Drol | Do not be sad, Uitwerpselening is very difficult.
DIALOG | Altijd Poepen       | Very difficult. Maybe you can uitwerpselening with us another time?
DIALOG | P_NAME              | Sure.

CROSSWORD1
DIALOG | Altijd Poepen       | Do you wish to Uitwerpselening?
DIALOG | Ernstig Van De Drol | You will not find the hidden word.
GOTO   | GAME

CROSSWORD2
DIALOG | Altijd Poepen       | We will never solve the Uitwerpselening.
DIALOG | Ernstig Van De Drol | Yes, the Uitwerpselening will never be solved.

CROSSWORD3
DIALOG | Altijd Poepen       | There are many mysteries left in this Uitwerpselening to be found. We will never find them all.
DIALOG | Ernstig Van De Drol | Yes. They will remain invisible for all time. There are too many mysteries to be found.
";
