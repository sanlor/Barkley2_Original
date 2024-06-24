// Make a PAX code //
/* 
0 = Z Day
1 = Z Month
2 = Z Year 1000
3 = Z Year 100
4 = Z Year 10
5 = Z Year 1
6 = Zodiac Sign
7 = Era
8 = Blood
9 = Gender (Sum of genders, 0-1 0-2 0-4 0-8 0-16)
10 = Alignment
11 - 20 = Hand Scanner
21 = Lottery, Happened or not 
22 = Multiple Choice Q ID
23 = Multiple Choice A ID
They go in QA pairs all the way to 29
30 = Gumball
31 = Tarot Card1
32 = Tarot Card2
33 = Tarot Card3
34 = Tarot Card4
*/

// NOTE //
// There was an oversight qith Zodiac Day and Month where they start from 0 - 11 in CC but display as 1 - 12 //
// Use this info when converting data back into characters //
// Wontfix just to keep our paxdoce tickets consistent //

/*pax[0] = string(character_zodiac_day) 
pax[1] = string(character_zodiac_month) 
pax[2] = string(character_zodiac_year1000)
pax[3] = string(character_zodiac_year100) 
pax[4] = string(character_zodiac_year10)
pax[5] = string(character_zodiac_year1)
pax[6] = string(character_zodiac_index) 
pax[7] = string(character_zodiac_era) 
pax[8] = string(character_blood) 
pax[9] = string(character_genders)
pax[10] = string(character_alignment) 
pax[11] = string(character_scanner[0]) 
pax[12] = string(character_scanner[1])
pax[13] = string(character_scanner[2]) 
pax[14] = string(character_scanner[3]) 
pax[15] = string(character_scanner[4]) 
pax[16] = string(character_scanner[5])
pax[17] = string(character_scanner[6])
pax[18] = string(character_scanner[7])
pax[19] = string(character_scanner[8])
pax[20] = string(character_scanner[9])
pax[21] = string(character_lottery)
pax[22] = string(character_multiple_QID[0])
pax[23] = string(character_multiple_AID[0])
pax[24] = string(character_multiple_QID[0])
pax[25] = string(character_multiple_AID[0])
pax[26] = string(character_multiple_QID[0])
pax[27] = string(character_multiple_AID[0])
pax[28] = string(character_multiple_QID[0])
pax[29] = string(character_multiple_AID[0])
pax[30] = string(character_gumball)
pax[31] = string(character_tarot[0])
pax[32] = string(character_tarot[1])
pax[33] = string(character_tarot[2])
pax[34] = string(character_tarot[3]);
*/

pax_code =
pax[0] + 
pax[1] + 
pax[2] + 
pax[3] + 
pax[4] + 
pax[5] + 
pax[6] + 
pax[7] + 
pax[8] + 
pax[9] + 
pax[10] +
pax[11] + 
pax[12] + 
pax[13] + 
pax[14] + 
pax[15] + 
pax[16] + 
string(checksum);

pax_code2 = 
pax[17] + 
pax[18] +
pax[19] +
pax[20] +
pax[21] +
pax[22] +
pax[23] +
pax[24] +
pax[25] +
pax[26] +
pax[27] +
pax[28] +
pax[29] +
pax[30] +
pax[31] +
pax[32] +
pax[33] +
pax[34];

// Checksum //
// This only exists for cheaters and is a really poor/mediocre way to defend against them because I really don't give a flying flub if someone cheats
// Counts up all given answers as1 EXCEPT when it is one of these characters: 0, 2, 3, A, C, F. Capitalization matters. Now we have a sum, a checksum.
// Can be used to verify that the code hasn't been altered // If a specific code gives out a checksum of 30 for example and you tinker with the code, //
// the checksum might not be 30 anymore and you get booted out of the game //
checksum = 0;
for (i=0; i<35; i+=1;)
    {
    if string(pax[i]) != "0" and string(pax[i]) != "2" and string(pax[i]) != "3" and string(pax[i]) != "A" and string(pax[i]) != "C" and string(pax[i]) != "F" then checksum += 1;
    }
checksum = scr_cc_paxcode_convert(checksum);
