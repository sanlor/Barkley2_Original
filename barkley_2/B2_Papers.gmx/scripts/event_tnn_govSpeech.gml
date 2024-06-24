// Event for the Governor's Speech.
//show_debug_message("event_tnn_govSpeech02() - Execute...");
script = "GOTO | SPEECH_SETUP

SPEECH_SETUP
QUEST  | govSpeechInitiate = 3
LOOK   | o_cts_hoopz | SOUTHWEST
LOOK   | o_lafferty01 | NORTHEAST
LOOK   | o_honus01 | NORTHEAST
LOOK   | o_jeltsje01 | NORTHEAST
LOOK   | o_vikingstad01 | NORTHEAST
QUEST  | govChoicesMade = 0
QUEST  | govMedicine = 1
QUEST  | govCandy = 1
QUEST  | govPolicyValue = 0
CREATE | o_crowdcontrol01 | 0 | 0
// global.eventFacing = 6;    
QUEST  | govPolicy = 0
QUEST  | govCrowdReaction = 0
Misc   | set | o_hoopz | 368 | 192
PEDESTRIAN | off
LOOK   | o_cts_hoopz | SOUTHWEST
WAIT   | 2.0
FRAME  | CAMERA_NORMAL | o_cts_hoopz
WAIT   | 0
WAIT   | 1
DIALOG | Governor Elagabalus | Hello! Hello good dwarfs of Tir na Nog. It has, uh, come to my attention, I believe, that I am your new governor. Uhh. And as your new governor, it is my duty to inform you that there are going to be some changes around here. Don't be alarmed, I come uh, highly recommended. The policies that I will hereby enact are for the benefit of all the good dwarfs of Tir na Nog and it is my hope that they will greatly improve the lives of our goodly folk. But before I get to them, there is one thing I'd like to do. I hereby declare that the brave and exceptionally noble youngster " + P_NAME + " has free passage from Tir na Nog. It is a rare privilege that one may leave Tir na Nog, but it must be done for the sake of our security and prosperity. Now, onto my new policies...           
WAIT   | 0.75
DIALOG | Governor Elagabalus | (I don't wanna be outed as an impostor... I should try and help the dwarfs as best I can but make sure I don't go overboard or the duergars might get suspicious of me. I wonder what I should say...)
WAIT   | 0.75 
GOTO   | POLICY_START  

POLICY_RESET
QUEST  | govChoicesMade = 0
QUEST  | govPolicyValue = 0
QUEST  | govPolicy = 0
QUEST  | govCrowdReaction = 0
IF govCow == 2      | QUEST | govCow == 1
IF govMedicine == 2 | QUEST | govMedicine == 1  
IF wilmerEvict == 6 | QUEST | wilmerEvict == @wilmerPrior@   
IF govChurch == 2   | QUEST | govChurch == 1
IF govCar == 2      | QUEST | govCar == 1
IF govKalevi == 2   | QUEST | govKalevi == 1
IF govBball == 2    | QUEST | govBball == 1
IF govCandy == 2    | QUEST | govCandy == 1
IF govZhang == 2    | QUEST | govZhang == 1
IF govKelpster == 2 | QUEST | govKelpster == 1

POLICY_START
IF govChoicesMade >= 5 | POLICY_LIMIT     
CHOICE | Institute a new policy:        
IF govCow == 1 | REPLY | POLICY_COW | Ranchers can take cows to outside pastures.
IF govMedicine == 1 | REPLY | POLICY_MEDS | Medicine for the elderly.   
IF wilmerEvict == 3 | REPLY | POLICY_WILM | Wilmer gets his house back.    
IF wilmerEvict == 8 | REPLY | POLICY_WILM | Wilmer gets his house back.   
IF govChurch == 1   | REPLY | POLICY_CHURCH | Support the local church.
IF govCar == 1      | REPLY | POLICY_CAR | Build a mechanic's workshop for Amalberga and Hildeburge.
IF govKalevi == 1   | REPLY | POLICY_KALEVI | Transfer Kalevi to the Mines.
IF govBball == 1    | REPLY | POLICY_BBALL | Repair the b-ball court.
IF govCandy == 1    | REPLY | POLICY_CANDY | Free candy for the poor.
IF govZhang == 1    | REPLY | POLICY_ZHANG | Outlaw all clowns and jugglers.
IF govKelpster == 1 | REPLY | POLICY_KELPSTER | Arrest Kelpster.
IF govChoicesMade >= 1 | REPLY | POLICY_RESET | Wait, I take it all back, let me say it again (Reset ALL policies)
REPLY | POLICY_END | I guess that wraps my speech up. Hope you liked.

POLICY_COW
QUEST  | govPolicy = 0 
QUEST  | govCrowdReaction = 1
QUEST  | govPolicyValue = 2
DIALOG | Governor Elagabalus | It has come to my attention that ranchers are unable to take their cattle to a more suitable location. As you know, food is an important part of a balanced diet, so I am designating an area outside of Tir na Nog as cattle pasture for our ranchers. Rancher Marina and others will be allowed to come and go as they please in order to provide the good dwarfs of Tir na Nog with the food we need.
QUEST  | govCow = 2
GOTO   | CROWD_RESPONSE
                   
POLICY_MEDS
QUEST  | govPolicy = 1
QUEST  | govCrowdReaction = 1 
QUEST  | govPolicyValue = 1          
DIALOG | Governor Elagabalus | For too long, the elderly of Tir na Nog have had to endure their gout and goiters, seizures and hemorrhoids in silence. I say no longer! No longer should the elderly of Tir na Nog bleed from open wounds quietly! From now on, our most senior of citizens will recieve the medicine, medical attention and colloidal silver that they need. After all, a living worker is a productive worker.
QUEST  | govMedicine = 2
GOTO   | CROWD_RESPONSE

POLICY_WILM
QUEST  | govPolicy = 2 
QUEST  | govCrowdReaction = 1 
QUEST  | govPolicyValue = 2    
DIALOG | Governor Elagabalus | A certain /'Mr. Wilmer/' has apparently lost his house due to the negligence of " + P_NAME + " (who is an otherwise very responsible and morally upright youngster) in renewing his mortgage. I wish to correct " + P_NAME + "'s unfortunate mistake by not only giving Mr. Wilmer back his house, but fully renewing his mortgage. Mr. Wilmer, an upstanding citizen and long-time member of the community, deserves nothing less than this small measure of kindness!
QUEST  | wilmerPrior = @wilmerEvict@
QUEST  | wilmerEvict = 6
GOTO   | CROWD_RESPONSE
   
POLICY_CHURCH
QUEST  | govPolicy = 3
QUEST  | govCrowdReaction = 1
QUEST  | govPolicyValue = 2
DIALOG | Governor Elagabalus | Although most all of the needs of our citizens are met by our benevolent overlord Cuchulainn, there is one need that remains conspicuously unmet. That is our spiritual need. I hereby allocate 1000 neuro-shekels from our budget to Father Giuseppe so that he may better answer our prayers. The gospel of Clispaeth must be extolled from the highest of mountains to the lowest of bogs!
QUEST  | govChurch = 2
GOTO   | CROWD_RESPONSE
  
POLICY_CAR        
QUEST  | govPolicy = 4
QUEST  | govCrowdReaction = 1 
QUEST  | govPolicyValue = 2    
DIALOG | Governor Elagabalus | Why are things always breaking down around here? Air conditioners, dishwashers, generators, cars? I say enough! I say we start fixing the place up, get it functional again! That's why I'm designating the garage near the bar as a mechanic's workshop where you can take your run down machinery to get fixed. Anything, even clunky old cars, can be fixed up there.
QUEST  | govCar = 2
GOTO   | CROWD_RESPONSE

POLICY_KALEVI
QUEST  | govPolicy = 5 
QUEST  | govCrowdReaction = -1 
QUEST  | govPolicyValue = 0
DIALOG | Governor Elagabalus | There is a notable absence of skilled blacksmiths in the Duergar Mines of Necron 7. Although the people of Tir na Nog have come to rely on Kalevi's dependable smithery, it is imperative for the future of our youth that he be transferred to the Mines, where he can better serve the greater good by making cool-looking gun's.
QUEST  | govKalevi = 2
GOTO   | CROWD_RESPONSE

POLICY_BBALL
QUEST  | govPolicy = 6 
QUEST  | govCrowdReaction = 1 
QUEST  | govPolicyValue = 2
DIALOG | Governor Elagabalus | The time for change is now.  For too long, ballers have been persecuted for their beliefs in harmless recreation. Basketball is currently en vogue around Necron 7 and if Tir na Nog is to produce the galaxy's greatest ballers, then we must open our hoops to slams, jams, picks and rolls! The locks on the hoops will be removed so that our ballers can jam in harmony and the streets of Tir na Nog ring with the sound of swishes and dribbling!
QUEST  | govBball = 2
GOTO   | CROWD_RESPONSE

POLICY_CANDY    
QUEST  | govPolicy = 7 
QUEST  | govCrowdReaction = 1 
QUEST  | govPolicyValue = 1     
DIALOG | Governor Elagabalus | Children pandhandle on the corners in hopes of a passerby's gumdrop. The stomachs of Tir na Nog's hungry growl in desperate unison. Our mission is clear: we must feed our poor. From this day forward, Mortimer will be providing the poor with free candy!
QUEST  | govCandy = 2
GOTO   | CROWD_RESPONSE
              
POLICY_GUITAR                
QUEST  | govPolicy = 8 
QUEST  | govCrowdReaction = 0 
QUEST  | govPolicyValue = 0
DIALOG | Governor Elagabalus | It has come to my attention that a wandering musician, a certain... /'Guillaume/' has been causing a racket with his discordant dirges and untuned guitar. From this day forward, Guillaume is banished to wander the wastes of the Necron 7 and leave the good people of Tir na Nog in peace. If Guillaume attempts to return to Tir na Nog, the Duergars will throw him right out! Begone, I say! Begone!
QUEST  | govGuillaume = 2
GOTO   | CROWD_RESPONSE
                  
POLICY_ZHANG
QUEST  | govPolicy = 9
QUEST  | govCrowdReaction = 2
QUEST  | govPolicyValue = -3
DIALOG | Governor Elagabalus | I have become sick and tired of clowns of all sorts. It is time to stop this plague before it hasa chance to spread. I hereby order the clown Zhang to be thrown into the hoosgow without further delay. There he will languish in anguish until his clownish ways are over.
QUEST  | govZhang = 2
GOTO   | CROWD_RESPONSE

POLICY_KELPSTER      
QUEST  | govPolicy = 10
QUEST  | govCrowdReaction = 0
QUEST  | govPolicyValue = 0         
DIALOG | Governor Elagabalus | Strange dwarfs giggle alone in the dark alleyways of Tir na Nog demanding you to purchase vidcons for exorbitant prices. This kind of behaviour is unacceptable and will no longer be tolerated. I hereby order the arrest of Kelpster. He is to be taken into custody and reformed at one of our many correctional facilities.
QUEST  | govKelpster = 2 
GOTO   | CROWD_RESPONSE 

POLICY_END
DIALOG | Governor Elagabalus | (Wait a sec, am I really done with the speech? Better make sure before I finish up and all my decrees go into effect...)
CHOICE | Am I really done with my speech?
REPLY  | SPEECH_END | Yeah, I think I'm done with this.    
REPLY  | RETHINK    | Nah, I should rethink my policies...   

POLICY_LIMIT
DIALOG | Governor Elagabalus | (Okay, I think that's as many new policies as I can get away with. Are these good policies though? Should I start over?)
CHOICE | Am I really done with my speech?
REPLY  | SPEECH_END | Yeah, I think I'm done with this.
REPLY  | RETHINK    | Nah, I should rethink my policies...  
   
RETHINK   
DIALOG | Governor Elagabalus | (Nah, I should rethink my policies...)
GOTO   | POLICY_START
     
CROWD_RESPONSE
FRAME  | CAMERA_NORMAL | o_cts_hoopz | o_govWatcher04
WAIT   | 0
QUEST  | govChoicesMade += @govPolicyValue@
IF govCrowdReaction == -1 | GOTO | CROWD_PRO_DUERGAR
IF govCrowdReaction == 0  | GOTO | CROWD_NEUTRAL
IF govCrowdReaction == +1 | GOTO | CROWD_PRO_DWARF
IF govCrowdReaction == +2 | GOTO | CROWD_ANTI_ZHANG

CROWD_PRO_DUERGAR
EVENT  | o_crowdcontrol01 | 2
EVENT  | o_crowdcontrol01 | 1
WAIT   | 4
FRAME  | CAMERA_FAST | o_cts_hoopz  
WAIT   | 0
DIALOG | Governor Elagabalus | (The duergars liked that... I bet they'll cut me some more slack now. But the dwarfs really hated it... what can ya do?)

CROWD_PRO_DWARF          
EVENT  | o_crowdcontrol01 = 3
EVENT  | o_crowdcontrol01 = 0
WAIT   | 4
FRAME  | CAMERA_FAST | o_cts_hoopz         
DIALOG | Governor Elagabalus | (The dwarfs really liked that policy, but boy did the duergars hate it. I can probably only get away with that a couple more times...)  
            
CROWD_NEUTRAL            
SOUND  | sn_dwarf_neutral01
SOUND  | sn_duergar_neutral01
WAIT   | 4
FRAME  | CAMERA_FAST | o_cts_hoopz  
WAIT   | 0
DIALOG | Governor Elagabalus | (Hmm, nobody seemed to mind that policy. Guess that was a freebie.)
            
CROWD_ANTI_ZHANG
EVENT  | o_crowdcontrol01 = 0
EVENT  | o_crowdcontrol01 = 2
EVENT  | o_crowdcontrol01 = 4
WAIT   | 4
FRAME  | CAMERA_FAST | o_cts_hoopz  
WAIT   | 0
DIALOG | Governor Elagabalus | (Holy flub... They all loved it! I bet I could get away with any kind of policy right now.)
            
SPEECH_END
DIALOG | Governor Elagabalus | Well, that was my speech. Hope you liked it. I thought real hard about all that stuff I just said and now you've all gotta do it, because I'm the real Governor. Well, I've got some sleep to catch up on, see you in an extremely long time.
WAIT   | 0.4
FRAME  | CAMERA_FAST | o_cts_hoopz  
WAIT   | 0
SOUND  | sn_dwarf_neutral01
SOUND  | sn_duergar_neutral01
WAIT   | 4                            
FRAME  | CAMERA_FAST | o_cts_hoopz  
WAIT   | 0
DIALOG | Governor Elagabalus | (Whew, well at least I'm done. Maybe this whole governor gig isn't so hard after all. Now I guess I'll slink back to the L.O.N.G.I.N.U.S. base before any of these Duergars notice I'm a big fraud... and then finally get my body back.)       
QUEST  | govFinishInitiate = 1
QUEST  | govTransfer = 0
QUEST  | govQuest = 6
EVENT  | o_onslow01 | 15
IF wilmerEvict = 2 | QUEST | wilmerEvict = 9
IF wilmerEvict = 3 | QUEST | wilmerEvict = 9
IF wilmerEvict = 8 | QUEST | wilmerEvict = 9
PEDESTRIAN | on
QUEST | ladderReached = 1
Teleport | r_tnn_rebelbase02 | 336 | 224                                      
";            
