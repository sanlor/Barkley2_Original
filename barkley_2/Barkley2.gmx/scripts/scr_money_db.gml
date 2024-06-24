// scr_money_db("string");

// shekels
var s = 99999;

switch (argument0)
{
    //--------------------------------------------------------------------
    //  TIR NA NOG ~ the HomeTown of the Dwarfs ~
    //--------------------------------------------------------------------
    
    // Dubre's Map
    case "dubreMap01": // the cost of the Tir na nOg map on first offer
        s = 10;
        break;
    case "dubreMap02": //the random cost of the map the second time and beyond that you ask
        s = irandom(20) + 1;
        break;
    
    // Wilmer Mortgage
    case "wilmerMortgage": // base cost of wilmer's mortgage
        s = 100; 
        break; 
    case "wilmerMortgageBonus": // bonus money included for hoopz
        s = 30; 
        break; 
    case "wilmerMortgageTotal":  // total money given to hoopz
        s = scr_money_db("wilmerMortgage") + scr_money_db("wilmerMortgageBonus");
        break;
    case "wilmerSurcharge": // Vikingstad's Surcharge
        s = 20;
        break;
    case "vikingstadDemand1": // demand of vikingstad
        s = scr_money_db("wilmerMortgage") + scr_money_db("wilmerSurcharge");
        break;
    case "vikingstadTease": // Vikingstads math for how much you'll be getting after rent
        s = scr_money_db("wilmerMortgageTotal") - scr_money_db("vikingstadDemand1");
        break;
        
    // Kelpster - TnN Business District House - event_tnn_kelpster01
    case "kelpsterArtifact": //Sells you "Creppy Ghoulie IV diskette" for this amount
        s = 50;
        break;
    
    // Cuthbert - Pet Shop
    case "cuthbertFee": // As the Governor, you have the option to get this fee from Cuthbert
        s = 120;
        break;
           
    // Jacques - TnN (Is he placed?) - event_tnn_jacques01 - 500 was default
    case "jacquesRent": // As the Governor, Jacques asks if you can pay his rent for him as he was late
        s = 100;
        break;
    
    // Slag - TnN - 7 was default per dwarf head
    case "slagDwarfPrice": // The amount you get per dwarf head
        s = 7;
        break;
        
    // Guillaume - TnN Residential - event_tnn_guillaume01 - 5 was default tip
    case "guillaumeTip": //You can tip him. Should be at least 2, as it says "tip x neuro-shekels?" as plural
        s = 5;
        break;
        
    // Ooze Fee for playing bball
    case "oozeBallFee":
        s = 20;
        break;
    
    // Benedict sells fishing Pole
    case "benedictPole":
        s = 35;
        break;
            
    // Fadima - TnN Housing - event_tnn_fadima01
    // If you plan on editing the value from 25
    // TODO: edit the other values that Fadima notes
    case "fadimaCharity": s = 8; break; // You can buy a "chair"
    case "fadimaMatt": s = 50; break; // Matthias price
    case "fadimaGov": s = 60; break; // Governor price
    case "fadimaOrig": s = 40; break; // First conversation price
    case "fadimaOne": s = 25; break; // Post-Castor offer
    case "fadimaTwo": s = 20; break; // Post-Castor offer 2
        
    // Gutterhound - TnN
    case "gutterhoundTheft":  // How much you get from Gutterhound (your cut)
        s = 115;
        break; 
        
    ////////// Gelasio Quest //////////
    // Jindrich - TnN Market - event_tnn_jindrich01
    case "apricotPrice": //You can buy Jindrich an apricot, which gives you information about the turncoat Gelasio
        s = 37;
        break;
    
    // Abdul Gafur - TnN Market District - event_tnn_abdulGafur01
    case "abdulBigOffer": // full price of the item
        s = 200; break;
    case "abdulLilOffer": // bartered value that goes a little lower (be sure to change Half as well!)
        s = 150; break;
    case "abdulHalfOffer": // half now half later price
        s = 75; break;
    
    ////////// Cornrow / Juicebox - Community Service //////////
    // Cornrow - TnN Market - event_tnn_cornrow01
    case "cornrowCornucopia": // How much you get for giving him the fruit basket
        s = 8; break;
    // Mortimer - TnN Market - event_tnn_mortimer01
    case "mortimerCandyCorn": // Can buy this, or get it for free if you rob Mortimer first
        s = 15; break;
    case "mortimerJawbreaker": // Can buy this, or get it for free if you rob Mortimer first
        s = 25; break;
    case "mortimerNonpareil": // Can buy this, or get it for free if you rob Mortimer first
        s = 40; break;
    case "mortimerRobbery": // How much you get for robbing him during Community Service
        s = 63; break;
    case "mortimerRobberyCut": // How much you get for talking to Cornrow
        s = 12; break;
        
    // Milagros - TnN Market - event_tnn_milagros01
    // Milagros also gives you vidcons and chips. Edit her stuff to make more sense.
    case "milagrosSuicide": // What she gives you for turning in the suicide note.
        s = 10; break;
    case "milagrosEric": // What she gives you for turning in Eric's Manifesto
        s = 10; break;
        
    // Gunsalesman - TnN Market Roof - event_tnn_gunsalesman
    // Refer to scr_gun_db to see which guns he is selling
    case "gunsalesmanMap": //Price of Sewers Floor 1 Map
        s = 10; break;
    case "gunsalesmanGun1": //Price of Gun 1 from bad list
        s = 15; break;
    case "gunsalesmanGun2": //Price of Gun 2 from bad list
        s = 12; break;
    case "gunsalesmanGun3": //Price of Gun 3 from bad list
        s = 10; break;
    case "gunsalesmanGun4": //Price of Gun 1 from good list
        s = 150; break;
    case "gunsalesmanGun5": //Price of Gun 2 from good list
        s = 75; break;
    case "gunsalesmanGun6": //Price of Gun 3 from good list
        s = 70; break;
        
    // Aelfleda - TnN Residential District - event_tnn_aelfleda01
    case "aelfledaFull": // Total cost of Aelfleda's Bill
        s = scr_money_db("aelfledaRent") + scr_money_db("vikingstadAelfleda"); break;
    case "aelfledaRent": // How much Aelfleda Owes
        s = 87; break;
    case "vikingstadAelfleda": //Extortion from Vikingstad
        s = 20; break;
    
    // Egidius - TnN Residential District
    // Prices of jerkins, deposit for "try-before-you-buy"
    case "egidiusJerkin1": // Price of Jerkin 1 - Bottlecap Jerkin
        s = 50; break;
    case "egidiusJerkin2": // Price of Jerkin 2 - Eggcrate Jerkin
        s = 50; break;
    case "egidiusJerkin3": // Price of Jerkin 3 - Monofilament Jerkin
        s = 50; break;
    case "egidiusJerkin4": // Price of Jerkin 4 - Vestal Jerkin
        s = 50; break;
    case "egidiusDeposit": // Deposit to try out a jerkin
        s = 25; break;
    
    // Zola - sells the "Pravda Tir na nOg"
    case "tnnPravda":
        s = 7; break;
    case "zolaSpear":
        s = 250; break;
    case "zolaSpearLoss":
        s = 150; break;
           
    // Clinic // Cyberization cost //
    case "tatijana20":
        s = 60; break;
        
    //--------------------------------------------------------------------
    //  BRAIN CITY ~ mega City in the Swamps ~
    //--------------------------------------------------------------------
    
    //Protesters    
    case "oozeProtesters": // Payoff to remove the Protesters from Guilderbergs in bct_ooze01
        s = 50; break;
    
    // Wedding Quest Bandmates
    case "garciaChange":
        s = 5; break;
    case "cccc": s = 0; break;
    case "dddd": s = 0; break;
    case "eeee": s = 0; break;
    case "ffff": s = 0; break;
    case "gggg": s = 0; break;
    case "hhhh": s = 0; break;
    case "iiii": s = 0; break;
    case "jjjj": s = 0; break;
    case "kkkk": s = 0; break;
    case "llll": s = 0; break;
    case "mmmm": s = 0; break;
    case "nnnn": s = 0; break;
    case "oooo": s = 0; break;
    case "pppp": s = 0; break;
    case "qqqq": s = 0; break;
    case "rrrr": s = 0; break;
    case "ssss": s = 0; break;
    case "tttt": s = 0; break;
    case "uuuu": s = 0; break;
    case "vvvv": s = 0; break;
    case "wwww": s = 0; break;
    case "xxxx": s = 0; break;
    case "yyyy": s = 0; break;
    case "zzzz": s = 0; break;
    
    //Oligarchy Online
    case "ooUnlimited":
        s = 99; break;
    case "ooHourly":
        s = 39; break;
    case "ooPayp_Reup":
        s = 9; break;
    
    // VRW Nene's milk and tab
    // You must pay for two different milks, then Nene's tab to get LONGINUS knock
    case "neneMilk1": s = 3; break;
    case "neneMilk2": s = 10; break;
    case "neneTab": s = 50; break;
    
    // Oliver Twists Organ trade //
    case "organPrice": s = 8; break;
    
    // Hans Katzenjammers protection money to Dracula //
    case "hansTribute": s = 124; break;

    //--------------------------------------------------------------------
    //  Industrial Park
    //--------------------------------------------------------------------    
    
    //The Tontine Kunigunde has entered into
    case "tontineFull":
        s = 250; break;
    
    //Your cut of the Tontine (half of 
    case "tontineCut":
        s = scr_money_db("tontineFull") * 0.5; break;
        
    // Chup sales //
    case "brimbleChupNote": s = 10; break;
    case "sureshChupShekel": s = 26; break;
    case "chupTop": s = 40; break;
    case "chupMid": s = 30; break;
    case "chupLow": s = 20; break;  
            
    // Filips train ticket //
    case "filipTicket": s = 75; break;
    
    // Grieg train ticket //
    case "griegTicket": s = 50; break;
    
    //--------------------------------------------------------------------
    //  MINES ~ a shiuthole ~
    //--------------------------------------------------------------------
    
    // Biscuits gift //
    case "biscuitGift": s = 89; break;
    
    // Treasure at Gilbert's Peak //
    case "gilbert": s = 300; break;
    
    //---------------------
    //  WASTELANDS
    // --------------------
    
    // Money making game // Upper limit is the maximum you can ever squeeze out of the guy in total, then there is the cost to play, and the four prices //
    case "moneyMakingGameUpperLimit": s = 500; break;
    case "moneyMakingGameCost": s = 10; break;
    case "moneyMakingResult01": s = -40; break;
    case "moneyMakingResult02": s = -10; break;
    case "moneyMakingResult03": s = +20; break;
    case "moneyMakingResult04": s = +50; break;
    
    // Colloidal Silver from old man Jedidiah
    case "oldmanColloidal": s = 75; break;
    
    // Fortune teller prices //
    case "fortuneTeller": s = 12; break;
    
    //---------------------
    //  DOJO / ICELANDS
    // --------------------
    
    // Treasure chest in the wilderness //
    case "money_iceland": s = 350; break;
    
    // Dojo meditation prices //
    case "dojoMeditation_1st": s = 50; break; 
    case "dojoMeditation_2nd": s = 100; break; 
    case "dojoMeditation_3rd": s = 200; break;  
}

return s;
