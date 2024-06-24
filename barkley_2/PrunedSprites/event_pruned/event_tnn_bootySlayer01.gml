// script for DJ Bootyslayer
// usage: event_tnn_bootySlayer01

if (argument0 == SCRIPT_START)
{

}
if (argument0 == SCRIPT_INTERACT)
{
    var djname = scr_quest_get_state("djName");
    var djpref = scr_quest_get_state("djNamePrefix");

    // Build Event
    var bootyslayer = id;
    var event = scr_event_create_main();
    with (event)
    {
        //------------------------------------
        // Won or Lost Booty Bass
        //------------------------------------
        
        // Won Booty Bass Quest.
        if (scr_quest_get_state("bootyBassQuest") == 3)
        {
            Dialogue("DJ Booty Slayer", "Sonic Continuity Of Endless Booty Baronies. Booty Titles Extending Backwards And Forwards. Two Rump-Shaped Gems Embedded In The Foci Of A Helical Booty Ouroboros. Obeisance To The King of Keisters. An Immortal Crown Worn As Briefs. Pure  Booty Sahasrara.");
            Quest("bootySlayerState", 1);
        }
        // Lost Booty Bass contest.
        else if (scr_quest_get_state("bootyBassQuest") == 2)
        {
            Dialogue("DJ Booty Slayer", "Booty Apostate Proffers Rejection Of Infinite Booty Truths. Fallen Bootsketeer On The Left-Hand Booty Path. The Dark Night Of The Booty. Dormant Keister Kundalini Returns to Muladhara.");
        }
        
        //------------------------------------
        // After Curfew, Missed Out
        //------------------------------------
        else if (scr_tnn_curfew("after") == true) // formerly (scr_time_get() > 3)
        {
            Dialogue("DJ Booty Slayer", "Booty Initiate Turns From Sacral Truth. Impermanent Chain Of Booty Baronies Opened But Cannot Unlink. Samsara Sustains A Booty Substrate To Existence. Ass Ascension Postponed, Descend To Donk Dukkha.");
        }
        
        //------------------------------------
        // Before Booty Bass
        //------------------------------------
        
        // Refused the Booty Bass Quest
        else if (Quest("bootyBassQuest") == 1) && (Quest("bootySlayerChallenge") == 0)
        {
            Dialogue("DJ Booty Slayer", "Booty Initiate Witness Stentorian Trumpet Bleat. Obey The Herald Of The Booty Warlord-Harbinger. Fear Of Booty Suspended In Time And Space As Booty Apprentice Ascends To Mystic Decks. A Long-Imprisoned Ass Poltergeist Is Freed By Booty Novice On Faders. Sacred Truths Embedded In The Sacrum. Challenge Me And Shatter Booty Bass Perceptions.");
            // Won't repeat this dialogue, return to basic interaction
            Quest("bootySlayerChallenge", 1);
        }
        
        // Before Booty Bass Quest, or already challenged
        else
        {
            // Choose different dialogues
            switch (Quest("bootySlayerState"))
            {
                case 0:
                    Dialogue("DJ Booty Slayer", "Monolith Stereo On The Left, Booty-Based Waveform Emitted From An Ancient Subwoofer. Close Your Eyes And Transcend Your Mortal Booty. Loud Bumps, Loud Gumps, Illicit Booty Tones From A Secret Speaker. Spring Has Come. Shed Your Old Booty As The Snake Sheds Its Skin. Rise From The Ashes Of Your Discarded Booty Like The Immortal Phoenix. Never Ending Rhythms, Whistles That Can Only Be Heard By Dogs. This Is About More Than Just Butts. I Explain These Concepts In Greater Detail On My DVD.");
                    break;
                case 1:
                    Dialogue("DJ Booty Slayer", "50 Orchestra Hits Played From A Subwoofer In Rapid Succession. Catatonic Lifeforms Dissolve Into Booty Isotopes, Then Fade Into Various States Of Matter Or Anti-Matter, Heightening The Collective Sentience Of All Cosmic Booties. Rump Rumblin', Keister Crumpin' Booty Samples Played From A Jamaican Sound System. Forbidden Booties Playing Instruments You Were Not Aware Of. The Bootysattva Meditates On The Impermanence Of All Things.");
                    break;
                case 2:
                    Dialogue("DJ Booty Slayer", "All Known And Unknown Organisms Have A Booty. An Ancient, Secret Booty Covered In Bloodstained Hieroglyphics. Nobody Knows The Mystery. Certain Booty Waves Can Only Be Heard By The Trained Ear. An Austere, Titantic Booty, Shaped Like Two Perfect Pitcher's Mounds, Looms On The Sunset Horizon. If You Don't Understand What I'm Talking About, Meditate Under A Waterfall.");
                    break;
                case 3: 
                    Dialogue("DJ Booty Slayer", "Enter The Booty Lifestream, Become Part Of The Booty Anathema. Spiritual Ascendance Attained Through Temperance And Asceticism. A Child Learns Compassion From A Golden Booty On The Streets Of Decadent Rome. Circumambulate The Booty Stupa. 40 Booties Simultaneously Caterwauling Unrestrained Frequencies, A Long-Forgotten Hymn. My Tattoo Says /'Booty Chakra/' And My Shirt Says /'Booty Chakra/'. Do Not Fight Your Instincts. Modern Science Still Hasn't Unlocked Every Applebottom Secret.");
                    break;
                case 4:
                    Dialogue("DJ Booty Slayer", "You And I Will Meet Again.");
                    break;
            }
            // Increase State, end at 4
            if (Quest("bootySlayerState") != 4)
            {
                Quest("bootySlayerState", "+1");
            }
        }
    }
    scr_event_advance(event);
}
