// scr_money_db("string");

// shekels
var s = 99999;

switch (argument0)
{
    //--------------------------------------------------------------------
    //  TIR NA NOG ~ the HomeTown of the Dwarfs ~
    //--------------------------------------------------------------------
    
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
    case "vikingstadDemand1": // first demand of vikingstad
        s = 120;
        break;
    case "vikingstadDemand2": // second demand of vikingstad
        s = -1 + scr_money_db("wilmerMortgageTotal");
        break;
    case "vikingstadDemand3": // third demand of vikingstad
        s = 200;
        break; 
        
    // Kelpster - TnN Business District House - event_tnn_kelpster01
    case "kelpsterArtifact": //Sells you "Creppy Ghoulie IV diskette" for this amount
        s = 50;
        break;
    
    // Cuthbert - Pet Shop - event_tnn_cuthbert01 - 300 was default
    case "cuthbertFee": // As the Governor, you have the option to get this fee from Cuthbert
        s = 120;
        break;
    case "petGoldfish":
        s = 10;
        break;
    case "petHermit":
        s = 20;
        break;
    case "petBob":
        s = 30;
        break;
    case "petMuskrat":
        s = 40;
        break;
    case "petFerret":
        s = 55
        break;
    
    //TODO: bhroom - not sure what this is used for
    case "caseSewer":
        s = 110;
        break;
        
    // Jacques - TnN (Is he placed?) - event_tnn_jacques01 - 500 was default
    case "jacquesRent": // As the Governor, Jacques asks if you can pay his rent for him as he was late
        s = 100;
        break;
    
    // Slag - TnN - event_tnn_slag01 - 7 was default per dwarf head
    case "slagDwarfPrice": // The amount you get per dwarf head
        s = 7;
        break;
        
    // Guillaume - TnN Residential - event_tnn_guillaume01 - 5 was default tip
    case "guillaumeTip": //You can tip him. Should be at least 2, as it says "tip x neuro-shekels?" as plural
        s = 5;
        break;
        
    // Crossword Guys - TnN - event_tnn_crosswordguys01 - 100 was default
    case "crosswordMaster": // The amount you get for solving the crossword puzzle
        s = 5;
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
        
    // Gutterhound - TnN - event_tnn_gutterhound01
    // Missing
        
    ////////// Gelasio Quest //////////
    // Jindrich - TnN Market - event_tnn_jindrich01
    case "apricotPrice": //You can buy Jindrich an apricot, which gives you information about the turncoat Gelasio
        s = 39;
        break;
    // Missing, needs to be added
    
    // Abdul Gafur - TnN Market District - event_tnn_abdulGafur01
    case "abdulGafurBig": // full price of the item
        s = 50; break;
    case "abdulGafurLil": // down payment of the item (currently half, can change)
        s = 0.5 * scr_money_db("abdulGafurBig"); break;
    
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
    case "aelfledaAug": // How much she let Augustine borrow
        s = 20; break;
    case "aelfledaFee": // The overdraft fee from her bank
        s = 250; break;
    case "aelfledaRent": // The overdraft fee from her bank
        s = 87; break;
    
    // Egidius - TnN Residential District - event_tnn_egidius01
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
    
    // VRW Nene's milk and tab - o_nene01 - event_bct_nene01
    // You must pay for two different milks, then Nene's tab to get the LONGINUS knock
    case "neneMilk1": s = 3; break;
    case "neneMilk2": s = 10; break;
    case "neneTab": s = 50; break;
}

return s;
