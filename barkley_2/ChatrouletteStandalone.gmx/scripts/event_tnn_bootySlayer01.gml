script = "
IF bootyBassQuest == 3 | GOTO | BOOTY3
IF bootyBassQuest == 2 | GOTO | BOOTY2
IF curfew == after     | GOTO | CURFEW_AFTER
IF bootyBassQuest == 1 | IF bootySlayerChallenge == 0 | GOTO | BOOTY1
GOTO | BOOTY0

BOOTY3
DIALOG | DJ Booty Slayer | Sonic Continuity Of Endless Booty Baronies. Booty Titles Extending Backwards And Forwards. Two Rump-Shaped Gems Embedded In The Foci Of A Helical Booty Ouroboros. Obeisance To The King of Keisters. An Immortal Crown Worn As Briefs. Pure Booty Sahasrara.
QUEST | bootySlayerState = 1

BOOTY2
DIALOG | DJ Booty Slayer | Booty Apostate Proffers Rejection Of Infinite Booty Truths. Fallen Bootsketeer On The Left-Hand Booty Path. The Dark Night Of The Booty. Dormant Keister Kundalini Returns to Muladhara.

BOOTY1
DIALOG | DJ Booty Slayer | Booty Initiate Witness Stentorian Trumpet Bleat. Obey The Herald Of The Booty Warlord-Harbinger. Fear Of Booty Suspended In Time And Space As Booty Apprentice Ascends To Mystic Decks. A Long-Imprisoned Ass Poltergeist Is Freed By Booty Novice On Faders. Sacred Truths Embedded In The Sacrum. Challenge Me And Shatter Booty Bass Perceptions.
QUEST  | bootySlayerChallenge = 1

BOOTY0
IF bootySlayerState == 0 | DIALOG | DJ Booty Slayer | Monolith Stereo On The Left, Booty-Based Waveform Emitted From An Ancient Subwoofer. Close Your Eyes And Transcend Your Mortal Booty. Loud Bumps, Loud Gumps, Illicit Booty Tones From A Secret Speaker. Spring Has Come. Shed Your Old Booty As The Snake Sheds Its Skin. Rise From The Ashes Of Your Discarded Booty Like The Immortal Phoenix. Never Ending Rhythms, Whistles That Can Only Be Heard By Dogs. This Is About More Than Just Butts. I Explain These Concepts In Greater Detail On My DVD.
IF bootySlayerState == 1 | DIALOG | DJ Booty Slayer | 50 Orchestra Hits Played From A Subwoofer In Rapid Succession. Catatonic Lifeforms Dissolve Into Booty Isotopes, Then Fade Into Various States Of Matter Or Anti-Matter, Heightening The Collective Sentience Of All Cosmic Booties. Rump Rumblin', Keister Crumpin' Booty Samples Played From A Jamaican Sound System. Forbidden Booties Playing Instruments You Were Not Aware Of. The Bootysattva Meditates On The Impermanence Of All Things.
IF bootySlayerState == 2 | DIALOG | DJ Booty Slayer | All Known And Unknown Organisms Have A Booty. An Ancient, Secret Booty Covered In Bloodstained Hieroglyphics. Nobody Knows The Mystery. Certain Booty Waves Can Only Be Heard By The Trained Ear. An Austere, Titantic Booty, Shaped Like Two Perfect Pitcher's Mounds, Looms On The Sunset Horizon. If You Don't Understand What I'm Talking About, Meditate Under A Waterfall.
IF bootySlayerState == 3 | DIALOG | DJ Booty Slayer | Enter The Booty Lifestream, Become Part Of The Booty Anathema. Spiritual Ascendance Attained Through Temperance And Asceticism. A Child Learns Compassion From A Golden Booty On The Streets Of Decadent Rome. Circumambulate The Booty Stupa. 40 Booties Simultaneously Caterwauling Unrestrained Frequencies, A Long-Forgotten Hymn. My Tattoo Says /'Booty Chakra/' And My Shirt Says /'Booty Chakra/'. Do Not Fight Your Instincts. Modern Science Still Hasn't Unlocked Every Applebottom Secret.
IF bootySlayerState == 4 | DIALOG | DJ Booty Slayer | You And I Will Meet Again.
IF bootySlayerState < 4  | QUEST | bootySlayerState += 1
";
